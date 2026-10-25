-- Gold Roundtables — business invariants enforced in the database (ADR 0002, 0005, 0014).
-- Edge Functions repeat the cheap checks for early, friendly errors; these triggers are the
-- authority. Every violation raises app.fail(code, spanish_detail).

-- ---------------------------------------------------------------------------------------------
-- Small helpers
-- ---------------------------------------------------------------------------------------------

-- Answers captured on a device up to this long after the facilitator's close are still
-- accepted (device clocks drift; the close itself may come from another offline device).
create or replace function app.late_grace()
returns interval
language sql
immutable
set search_path = ''
as $$ select interval '15 minutes' $$;

-- Device timestamps are trusted for ordering but never allowed in the future.
create or replace function app.clamp_device_time(p_at timestamptz)
returns timestamptz
language sql
stable
set search_path = ''
as $$ select case when p_at is null then null when p_at > now() then now() else p_at end $$;

create or replace function app.is_valid_timezone(p_tz text)
returns boolean
language sql
stable
set search_path = ''
as $$ select exists (select 1 from pg_catalog.pg_timezone_names where name = p_tz) $$;

-- Next value in the global program order, or NULL when the program is finished.
create or replace function app.next_value_id(p_value_id uuid)
returns uuid
language sql
stable
set search_path = ''
as $$
  select nv.id
  from public.curriculum_values cv
  join public.curriculum_values nv on nv.sequence > cv.sequence and nv.status = 'active'
  where cv.id = p_value_id
  order by nv.sequence
  limit 1;
$$;

create or replace function app.first_value_id()
returns uuid
language sql
stable
set search_path = ''
as $$
  select id from public.curriculum_values where status = 'active' order by sequence limit 1;
$$;

-- KPI refresh bookkeeping (see the KPI migration). Live writes mark the rollups dirty; pg_cron
-- refreshes dirty rollups every few minutes.
create table kpi.refresh_state (
  id boolean primary key default true check (id),
  dirty boolean not null default true,
  refreshed_at timestamptz
);
insert into kpi.refresh_state (id, dirty) values (true, true);

create or replace function kpi.mark_dirty()
returns void
language sql
security definer
set search_path = ''
as $$ update kpi.refresh_state set dirty = true where id and not dirty; $$;

-- ---------------------------------------------------------------------------------------------
-- Round tables
-- ---------------------------------------------------------------------------------------------
create or replace function app.round_tables_prepare()
returns trigger
language plpgsql
set search_path = ''
as $$
begin
  new.code := upper(btrim(new.code));
  if not app.is_valid_timezone(new.timezone) then
    perform app.fail('invalid_timezone', 'La zona horaria de la mesa no es válida.');
  end if;
  if tg_op = 'INSERT' and new.current_value_id is null then
    new.current_value_id := app.first_value_id();
  end if;
  if tg_op = 'UPDATE' and new.organization_id <> old.organization_id then
    perform app.fail('immutable_field', 'Una mesa no puede cambiar de organización.');
  end if;
  return new;
end;
$$;

create trigger t10_round_tables_prepare before insert or update on public.round_tables
  for each row execute function app.round_tables_prepare();

-- ---------------------------------------------------------------------------------------------
-- Table members: denormalized roster fields, seat limit (≤ 9 incl. facilitator), history.
-- ---------------------------------------------------------------------------------------------
create or replace function app.table_members_prepare()
returns trigger
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_person public.people;
  v_table public.round_tables;
  v_active integer;
begin
  if tg_op = 'UPDATE' then
    if new.round_table_id <> old.round_table_id or new.person_id <> old.person_id then
      perform app.fail('immutable_field',
        'Para mover a una persona de mesa se crea una nueva membresía.');
    end if;
    if old.status = 'inactive' and new.status = 'active' then
      perform app.fail('membership_inactive',
        'Esta membresía ya terminó. Agrega a la persona de nuevo a la mesa.');
    end if;
  end if;

  select * into v_person from public.people where id = new.person_id;
  new.first_name := v_person.first_name;
  new.last_name := v_person.last_name;
  new.auth_user_id := v_person.auth_user_id;

  if new.status = 'inactive' then
    new.left_at := coalesce(new.left_at, now());
  end if;

  if new.status = 'active' and (tg_op = 'INSERT' or old.status <> 'active') then
    if v_person.status = 'inactive' then
      perform app.fail('person_inactive', 'La persona está desactivada.');
    end if;
    -- Serialize seat changes per table so concurrent inserts cannot exceed the limit.
    select * into v_table from public.round_tables where id = new.round_table_id for update;
    if v_table.status in ('completed', 'closed') then
      perform app.fail('table_not_active', 'La mesa está cerrada o completó el programa.');
    end if;
    select count(*) into v_active
    from public.table_members
    where round_table_id = new.round_table_id and status = 'active' and id <> new.id;
    if v_active >= 9 then
      perform app.fail('table_full',
        'La mesa ya tiene 9 personas (incluido el facilitador). No se puede agregar otra.');
    end if;
  end if;
  return new;
end;
$$;

create trigger t10_table_members_prepare before insert or update on public.table_members
  for each row execute function app.table_members_prepare();

-- Keep the denormalized roster copy in sync when a person is renamed or binds a sign-in.
create or replace function app.people_sync_roster()
returns trigger
language plpgsql
security definer
set search_path = ''
as $$
begin
  if new.first_name is distinct from old.first_name
     or new.last_name is distinct from old.last_name
     or new.auth_user_id is distinct from old.auth_user_id then
    update public.table_members
    set first_name = new.first_name, last_name = new.last_name, auth_user_id = new.auth_user_id
    where person_id = new.id;
  end if;
  return new;
end;
$$;

create trigger t20_people_sync_roster after update on public.people
  for each row execute function app.people_sync_roster();

create or replace function app.invites_prepare()
returns trigger
language plpgsql
set search_path = ''
as $$
begin
  new.code := upper(btrim(new.code));
  return new;
end;
$$;

create trigger t10_invites_prepare before insert or update on public.invites
  for each row execute function app.invites_prepare();

-- ---------------------------------------------------------------------------------------------
-- Session state machine
--
--   scheduled ──open──▶ open (stage: lobby | attendance | follow_up | value | commitment)
--       │                 │  stages may move in either direction while open
--       │                 └──close──▶ closed (stage = closed)        [terminal]
--       ├──close──▶ closed   (an offline facilitator's open + close may arrive together)
--       └──cancel─▶ cancelled                                        [terminal]
-- ---------------------------------------------------------------------------------------------
create or replace function app.session_transition_error(
  p_old_status public.session_status,
  p_old_stage public.session_stage,
  p_new_status public.session_status,
  p_new_stage public.session_stage
)
returns text
language plpgsql
immutable
set search_path = ''
as $$
begin
  if p_old_status = p_new_status and p_old_stage = p_new_stage then
    return null;
  end if;
  if p_old_status in ('closed', 'cancelled') then
    return 'session_finalized';
  end if;
  if p_new_status = 'scheduled' then
    return case when p_old_status = 'scheduled' and p_new_stage = 'lobby'
      then null else 'invalid_session_transition' end;
  end if;
  if p_new_status = 'open' then
    return case when p_new_stage <> 'closed' then null else 'invalid_session_transition' end;
  end if;
  if p_new_status = 'closed' then
    return case when p_new_stage = 'closed' then null else 'invalid_session_transition' end;
  end if;
  if p_new_status = 'cancelled' then
    return case when p_old_status = 'scheduled' then null else 'invalid_session_transition' end;
  end if;
  return 'invalid_session_transition';
end;
$$;

-- Next weekly slot strictly after p_after: the table's weekday and local start time in its
-- timezone, skipping slots already used by another session of the table.
create or replace function app.next_slot(
  p_round_table_id uuid, p_weekday smallint, p_start_time time, p_timezone text,
  p_after timestamptz)
returns timestamptz
language plpgsql
stable
security definer
set search_path = ''
as $$
declare
  v_local_date date := (p_after at time zone p_timezone)::date;
  v_slot timestamptz;
begin
  for i in 0..21 loop
    if extract(isodow from v_local_date + i) = p_weekday then
      v_slot := ((v_local_date + i) + p_start_time) at time zone p_timezone;
      if v_slot > p_after and not exists (
        select 1 from public.sessions
        where round_table_id = p_round_table_id and scheduled_at = v_slot) then
        return v_slot;
      end if;
    end if;
  end loop;
  return null;
end;
$$;

-- Creates the table's next pending session at the next weekly slot after p_after (in the table's
-- timezone), working the table's current value. Returns the pending session id, or NULL when the
-- table is not active or finished the program.
create or replace function app.schedule_next_session(p_round_table_id uuid, p_after timestamptz)
returns uuid
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_table public.round_tables;
  v_pending uuid;
  v_follow_up uuid;
  v_slot timestamptz;
  v_id uuid;
begin
  select * into v_table from public.round_tables where id = p_round_table_id;
  if not found or v_table.status <> 'active' then
    return null;
  end if;

  select id into v_pending from public.sessions
  where round_table_id = p_round_table_id and status in ('scheduled', 'open');
  if v_pending is not null then
    return v_pending;
  end if;

  if v_table.current_value_id is null then
    update public.round_tables set status = 'completed' where id = p_round_table_id;
    return null;
  end if;

  select value_id into v_follow_up from public.sessions
  where round_table_id = p_round_table_id and status = 'closed'
  order by ended_at desc
  limit 1;

  v_slot := app.next_slot(v_table.id, v_table.weekday, v_table.start_time, v_table.timezone,
                          p_after);

  insert into public.sessions (organization_id, round_table_id, value_id, follow_up_value_id,
                               scheduled_at)
  values (v_table.organization_id, v_table.id, v_table.current_value_id,
          nullif(v_follow_up, v_table.current_value_id), v_slot)
  returning id into v_id;
  return v_id;
end;
$$;

create or replace function app.sessions_prepare()
returns trigger
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_error text;
begin
  if tg_op = 'INSERT' then
    if new.value_id is null then
      select current_value_id into new.value_id from public.round_tables
      where id = new.round_table_id;
    end if;
    return new;
  end if;

  if new.round_table_id <> old.round_table_id or new.organization_id <> old.organization_id then
    perform app.fail('immutable_field', 'La sesión no puede cambiar de mesa.');
  end if;

  if old.status in ('closed', 'cancelled') and (
       new.status, new.stage, new.started_at, new.ended_at, new.answers_closed_at,
       new.value_id, new.follow_up_value_id, new.scheduled_at
     ) is distinct from (
       old.status, old.stage, old.started_at, old.ended_at, old.answers_closed_at,
       old.value_id, old.follow_up_value_id, old.scheduled_at
     ) then
    perform app.fail('session_finalized', 'La sesión ya está cerrada y no se puede modificar.');
  end if;

  -- Closing is expressed either through status or stage; normalize to both.
  if new.status = 'closed' or new.stage = 'closed' then
    new.status := 'closed';
    new.stage := 'closed';
  end if;

  v_error := app.session_transition_error(old.status, old.stage, new.status, new.stage);
  if v_error is not null then
    perform app.fail(v_error, 'Ese cambio de etapa no está permitido para esta sesión.');
  end if;

  if new.status = 'open' and old.status = 'scheduled' then
    new.started_at := coalesce(app.clamp_device_time(new.started_at), now());
  end if;

  if new.status = 'closed' and old.status <> 'closed' then
    new.ended_at := coalesce(app.clamp_device_time(new.ended_at), now());
    new.started_at := coalesce(app.clamp_device_time(new.started_at), old.started_at,
                               new.ended_at);
    new.ended_at := greatest(new.ended_at, new.started_at);
    new.answers_closed_at := coalesce(app.clamp_device_time(new.answers_closed_at), new.ended_at);
  end if;
  return new;
end;
$$;

create trigger t10_sessions_prepare before insert or update on public.sessions
  for each row execute function app.sessions_prepare();

-- When a session closes: rows the server received after the (device) close time become
-- synced_late, the table advances to the next value, and the next session is scheduled.
-- When a session is cancelled the value does not advance; the next slot is scheduled.
create or replace function app.sessions_after_finalize()
returns trigger
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_next uuid;
begin
  if app.is_seeding() or old.status = new.status or new.status not in ('closed', 'cancelled') then
    return null;
  end if;

  if new.status = 'closed' then
    update public.session_attendance set synced_late = true
      where session_id = new.id and received_at > new.ended_at and not synced_late;
    update public.member_assessments set synced_late = true
      where session_id = new.id and received_at > new.ended_at and not synced_late;
    update public.member_answers set synced_late = true
      where session_id = new.id and received_at > new.ended_at and not synced_late;
    update public.member_commitments set synced_late = true
      where session_id = new.id and received_at > new.ended_at and not synced_late;
    update public.member_commitments set follow_up_synced_late = true
      where follow_up_session_id = new.id and follow_up_received_at > new.ended_at
        and not follow_up_synced_late;

    v_next := app.next_value_id(new.value_id);
    update public.round_tables
      set current_value_id = v_next,
          status = case when v_next is null then 'completed'::public.round_table_status
                        else status end
      where id = new.round_table_id and current_value_id is not distinct from new.value_id;
  end if;

  perform app.schedule_next_session(new.round_table_id, greatest(now(), new.scheduled_at));
  perform kpi.mark_dirty();
  return null;
end;
$$;

create trigger t20_sessions_after_finalize after update on public.sessions
  for each row execute function app.sessions_after_finalize();

-- ---------------------------------------------------------------------------------------------
-- Session-domain rows (attendance, assessments, answers, commitments): shared preparation.
-- ---------------------------------------------------------------------------------------------

-- Whether the person belonged to the session's table when the session took place.
create or replace function app.is_session_participant(p_person_id uuid, p_session public.sessions)
returns boolean
language sql
stable
security definer
set search_path = ''
as $$
  select exists (
    select 1 from public.table_members tm
    where tm.round_table_id = p_session.round_table_id
      and tm.person_id = p_person_id
      and tm.joined_at <= coalesce(p_session.ended_at, now()) + app.late_grace()
      and (tm.status = 'active'
           or tm.left_at >= coalesce(p_session.started_at, p_session.scheduled_at))
  );
$$;

-- Columns that system maintenance may change without it counting as a new upload.
create or replace function app.session_row_system_columns()
returns text[]
language sql
immutable
set search_path = ''
as $$
  select array['updated_at', 'received_at', 'synced_late', 'archived_at', 'organization_id',
               'round_table_id', 'follow_up_received_at', 'follow_up_synced_late']
$$;

create or replace function app.session_row_prepare()
returns trigger
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_session public.sessions;
  v_device_at timestamptz;
  v_new jsonb;
  v_old jsonb;
begin
  if tg_op = 'UPDATE' then
    if new.session_id <> old.session_id or new.person_id <> old.person_id then
      perform app.fail('immutable_field', 'No se puede cambiar la sesión ni la persona.');
    end if;
    v_new := to_jsonb(new) - app.session_row_system_columns();
    v_old := to_jsonb(old) - app.session_row_system_columns();
    if v_new = v_old then
      return new; -- maintenance only (late flag, archive)
    end if;
    -- A commitment's follow-up is reported in the next session; its rules live in
    -- app.commitment_rules and are measured against that session, not the original one.
    if tg_table_name = 'member_commitments'
       and (v_new - array['follow_up_session_id', 'follow_up_status', 'follow_up_note',
                          'follow_up_device_at', 'device_modified_at'])
         = (v_old - array['follow_up_session_id', 'follow_up_status', 'follow_up_note',
                          'follow_up_device_at', 'device_modified_at']) then
      return new;
    end if;
  end if;

  select * into v_session from public.sessions where id = new.session_id;
  if not found then
    perform app.fail('session_not_found', 'La sesión no existe.');
  end if;
  new.organization_id := v_session.organization_id;
  new.round_table_id := v_session.round_table_id;

  new.device_created_at := coalesce(app.clamp_device_time(new.device_created_at), now());
  new.device_modified_at := app.clamp_device_time(new.device_modified_at);
  v_device_at := coalesce(new.device_modified_at, new.device_created_at);

  if v_session.status = 'cancelled' then
    perform app.fail('session_cancelled', 'La sesión fue cancelada.');
  end if;
  -- Late sync (ADR 0005): captured before the close (plus grace) is accepted, otherwise rejected.
  if v_session.status = 'closed' and v_device_at > v_session.ended_at + app.late_grace() then
    perform app.fail('session_closed',
      'La sesión ya se cerró; no se pueden registrar respuestas nuevas.');
  end if;
  if not app.is_session_participant(new.person_id, v_session) then
    perform app.fail('not_table_participant', 'La persona no participa en esta mesa.');
  end if;

  if app.is_seeding() and tg_op = 'INSERT' then
    return new; -- seed rows carry their historical received_at / synced_late
  end if;

  new.received_at := now();
  new.synced_late := (v_session.status = 'closed')
                     or (tg_op = 'UPDATE' and old.synced_late);
  return new;
end;
$$;

create trigger t10_session_row_prepare before insert or update on public.session_attendance
  for each row execute function app.session_row_prepare();
create trigger t10_session_row_prepare before insert or update on public.member_assessments
  for each row execute function app.session_row_prepare();
create trigger t10_session_row_prepare before insert or update on public.member_answers
  for each row execute function app.session_row_prepare();
create trigger t10_session_row_prepare before insert or update on public.member_commitments
  for each row execute function app.session_row_prepare();

-- Assessments: score rule and value consistency.
create or replace function app.assessment_rules()
returns trigger
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_session public.sessions;
begin
  if new.score is null or new.score < 1 or new.score > 10 then
    perform app.fail('score_out_of_range', 'El puntaje debe ser un número entero del 1 al 10.');
  end if;
  if new.score = 5 then
    perform app.fail('score_five_not_allowed',
      'El 5 no está permitido: elige si estás más cerca del 4 o del 6.');
  end if;
  if tg_op = 'UPDATE' and new.kind <> old.kind then
    perform app.fail('immutable_field', 'No se puede cambiar el tipo de evaluación.');
  end if;

  select * into v_session from public.sessions where id = new.session_id;
  if new.kind = 'initial' then
    new.value_id := v_session.value_id;
  else
    if v_session.follow_up_value_id is null then
      perform app.fail('follow_up_not_available',
        'Esta sesión no tiene seguimiento: es la primera de la mesa.');
    end if;
    new.value_id := v_session.follow_up_value_id;
  end if;

  if tg_op = 'INSERT' and exists (
    select 1 from public.member_assessments
    where session_id = new.session_id and person_id = new.person_id and kind = new.kind
      and id <> new.id
  ) then
    if new.kind = 'follow_up' then
      perform app.fail('duplicate_follow_up',
        'El seguimiento de este valor ya se registró. Solo se hace una vez.');
    else
      perform app.fail('duplicate_assessment', 'Ya registraste tu puntaje para este valor.');
    end if;
  end if;
  return new;
end;
$$;

create trigger t20_assessment_rules before insert or update on public.member_assessments
  for each row execute function app.assessment_rules();

-- Answers: the question must belong to the session's value.
create or replace function app.answer_rules()
returns trigger
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_value uuid;
  v_question_value uuid;
begin
  select value_id into v_value from public.sessions where id = new.session_id;
  select value_id into v_question_value from public.value_questions where id = new.question_id;
  if v_question_value is distinct from v_value then
    perform app.fail('question_mismatch', 'La pregunta no corresponde al valor de esta sesión.');
  end if;
  new.value_id := v_value;
  return new;
end;
$$;

create trigger t20_answer_rules before insert or update on public.member_answers
  for each row execute function app.answer_rules();

-- Commitments: value consistency and the once-only follow-up in the next session.
create or replace function app.commitment_rules()
returns trigger
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_follow public.sessions;
  v_device_at timestamptz;
begin
  select value_id into new.value_id from public.sessions where id = new.session_id;

  if new.follow_up_session_id is null and new.follow_up_status is null then
    return new;
  end if;
  if tg_op = 'UPDATE'
     and (new.follow_up_session_id, new.follow_up_status, new.follow_up_note)
         is not distinct from (old.follow_up_session_id, old.follow_up_status, old.follow_up_note)
  then
    return new;
  end if;
  if tg_op = 'UPDATE' and old.follow_up_session_id is not null
     and new.follow_up_session_id is distinct from old.follow_up_session_id then
    perform app.fail('follow_up_already_recorded',
      'El seguimiento de este compromiso ya se registró en otra sesión.');
  end if;

  select * into v_follow from public.sessions where id = new.follow_up_session_id;
  if not found or v_follow.round_table_id <> new.round_table_id
     or v_follow.follow_up_value_id is distinct from new.value_id then
    perform app.fail('follow_up_session_mismatch',
      'El seguimiento se registra en la sesión siguiente de la misma mesa.');
  end if;
  v_device_at := coalesce(app.clamp_device_time(new.follow_up_device_at), now());
  if v_follow.status = 'cancelled' then
    perform app.fail('session_cancelled', 'La sesión fue cancelada.');
  end if;
  if v_follow.status = 'closed' and v_device_at > v_follow.ended_at + app.late_grace() then
    perform app.fail('session_closed', 'La sesión ya se cerró; el seguimiento no se puede registrar.');
  end if;
  if not app.is_session_participant(new.person_id, v_follow) then
    perform app.fail('not_table_participant', 'La persona no participa en esta mesa.');
  end if;

  new.follow_up_device_at := v_device_at;
  if not app.is_seeding() then
    new.follow_up_received_at := now();
    new.follow_up_synced_late := (v_follow.status = 'closed')
                                 or (tg_op = 'UPDATE' and old.follow_up_synced_late);
  end if;
  return new;
end;
$$;

create trigger t20_commitment_rules before insert or update on public.member_commitments
  for each row execute function app.commitment_rules();

-- ---------------------------------------------------------------------------------------------
-- Auto-attendance (ADR 0005): a person who submits anything for a session is present there;
-- a submission wins over "absent" (and over "excused", which contradicts a submission).
-- ---------------------------------------------------------------------------------------------
create or replace function app.has_session_submission(p_session_id uuid, p_person_id uuid)
returns boolean
language sql
stable
security definer
set search_path = ''
as $$
  select exists (select 1 from public.member_assessments
                 where session_id = p_session_id and person_id = p_person_id)
      or exists (select 1 from public.member_answers
                 where session_id = p_session_id and person_id = p_person_id)
      or exists (select 1 from public.member_commitments
                 where person_id = p_person_id
                   and (session_id = p_session_id or follow_up_session_id = p_session_id));
$$;

create or replace function app.mark_present(
  p_session_id uuid, p_person_id uuid, p_device_at timestamptz)
returns void
language sql
security definer
set search_path = ''
as $$
  insert into public.session_attendance
    (session_id, person_id, status, source, device_created_at,
     organization_id, round_table_id)
  select s.id, p_person_id, 'present', 'auto_submission', coalesce(p_device_at, now()),
         s.organization_id, s.round_table_id
  from public.sessions s where s.id = p_session_id
  on conflict (session_id, person_id) do update
    set status = 'present', source = 'auto_submission',
        device_modified_at = excluded.device_created_at
    where public.session_attendance.status in ('absent', 'excused');
$$;

create or replace function app.attendance_rules()
returns trigger
language plpgsql
security definer
set search_path = ''
as $$
begin
  if new.status in ('absent', 'excused')
     and app.has_session_submission(new.session_id, new.person_id) then
    new.status := 'present';
    new.source := 'auto_submission';
  end if;
  return new;
end;
$$;

create trigger t20_attendance_rules before insert or update on public.session_attendance
  for each row execute function app.attendance_rules();

create or replace function app.submission_marks_present()
returns trigger
language plpgsql
security definer
set search_path = ''
as $$
begin
  -- received_at only moves when an upload changed the row (see app.session_row_prepare).
  if tg_op = 'INSERT' or new.received_at <> old.received_at then
    perform app.mark_present(new.session_id, new.person_id,
                             coalesce(new.device_modified_at, new.device_created_at));
  end if;
  -- A commitment follow-up is a submission for the follow-up (next) session. (Nested IF: the
  -- follow_up_* fields only exist on member_commitments.)
  if tg_table_name = 'member_commitments' then
    if new.follow_up_session_id is not null
       and (tg_op = 'INSERT'
            or new.follow_up_received_at is distinct from old.follow_up_received_at) then
      perform app.mark_present(new.follow_up_session_id, new.person_id, new.follow_up_device_at);
    end if;
  end if;
  return null;
end;
$$;

create trigger t30_submission_marks_present after insert or update on public.member_assessments
  for each row execute function app.submission_marks_present();
create trigger t30_submission_marks_present after insert or update on public.member_answers
  for each row execute function app.submission_marks_present();
create trigger t30_submission_marks_present after insert or update on public.member_commitments
  for each row execute function app.submission_marks_present();
