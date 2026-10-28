-- Gold Roundtables — schedule changes with an effective date and kept history (RF-23), and
-- single-session reschedule / cancel / extraordinary session (RF-30), issue #6.
--
-- Model
--   * table_schedule_versions is the schedule history of a table: every change carries the date
--     it takes effect (effective_from, a local date in the version's timezone) and is kept.
--     round_tables.weekday/start_time/timezone/duration_minutes mirror the version in force today;
--     app.apply_due_schedule() (api.table_update, hourly cron) keeps the mirror current. Session
--     slots are always computed from the versions (app.next_slot_versioned), so a future-dated
--     change never moves a session that happens before it.
--   * sessions.kind / original_scheduled_at: 'extraordinary' marks an extra meeting;
--     original_scheduled_at remembers the regular slot a rescheduled session moved from.
--   * The pending-session invariant (exactly one scheduled/open session per active table, enforced
--     by sessions_one_pending_key) is preserved: reschedule moves the pending row, cancel lets the
--     existing trigger schedule the next slot, and an extraordinary session takes the pending row's
--     place until it is held — the regular cadence resumes right after it (the next regular
--     session is created when it closes or is cancelled).
--   * A cancelled session does NOT advance the value: only closed sessions do, so the table's next
--     session carries the same value.
--   * Reminders dedupe on session + person + slot (20261026100000), so a moved session re-fires.

-- ---------------------------------------------------------------------------------------------
-- 1. Sessions: kind and original slot
-- ---------------------------------------------------------------------------------------------
alter table public.sessions
  add column kind text not null default 'regular' check (kind in ('regular', 'extraordinary')),
  add column original_scheduled_at timestamptz;

-- ---------------------------------------------------------------------------------------------
-- 2. Schedule history
-- ---------------------------------------------------------------------------------------------
create table public.table_schedule_versions (
  id uuid primary key default gen_random_uuid(),
  organization_id uuid not null references public.organizations (id),
  round_table_id uuid not null,
  weekday smallint not null check (weekday between 1 and 7),
  start_time time not null,
  timezone text not null,
  duration_minutes smallint not null check (duration_minutes between 10 and 120),
  effective_from date not null,
  changed_by_person_id uuid references public.people (id),
  created_at timestamptz not null default now(),
  constraint table_schedule_versions_table_org_fkey foreign key (round_table_id, organization_id)
    references public.round_tables (id, organization_id),
  -- A second change for the same date replaces the first (the audit trail keeps both).
  unique (round_table_id, effective_from)
);
create index table_schedule_versions_org_idx on public.table_schedule_versions (organization_id);

alter table public.table_schedule_versions enable row level security;
revoke all on public.table_schedule_versions from anon, authenticated;
grant select on public.table_schedule_versions to authenticated;
grant all on public.table_schedule_versions to service_role;
create policy table_schedule_versions_read on public.table_schedule_versions
  for select to authenticated using (
    (select app.is_platform_admin())
    or organization_id in (select app.coordinator_orgs())
  );

-- Existing tables start with one version holding their current schedule.
insert into public.table_schedule_versions (organization_id, round_table_id, weekday, start_time,
                                            timezone, duration_minutes, effective_from)
select organization_id, id, weekday, start_time, timezone, duration_minutes,
       (created_at at time zone timezone)::date
from public.round_tables;

create or replace function app.round_tables_record_schedule()
returns trigger
language plpgsql
security definer
set search_path = ''
as $$
begin
  insert into public.table_schedule_versions (organization_id, round_table_id, weekday, start_time,
                                              timezone, duration_minutes, effective_from)
  values (new.organization_id, new.id, new.weekday, new.start_time, new.timezone,
          new.duration_minutes, (new.created_at at time zone new.timezone)::date)
  on conflict (round_table_id, effective_from) do nothing;
  return null;
end;
$$;

create trigger t20_round_tables_record_schedule after insert on public.round_tables
  for each row execute function app.round_tables_record_schedule();

-- The schedule in force on a local date: the latest version effective on or before it, the
-- earliest one for dates before the table existed, the table's own columns if it has no versions.
create or replace function app.schedule_in_force(p_round_table_id uuid, p_on date)
returns public.table_schedule_versions
language plpgsql
stable
security definer
set search_path = ''
as $$
declare
  v public.table_schedule_versions;
  rt public.round_tables;
begin
  select * into v from public.table_schedule_versions
  where round_table_id = p_round_table_id and effective_from <= p_on
  order by effective_from desc limit 1;
  if found then
    return v;
  end if;
  select * into v from public.table_schedule_versions
  where round_table_id = p_round_table_id
  order by effective_from limit 1;
  if found then
    return v;
  end if;
  select * into rt from public.round_tables where id = p_round_table_id;
  if found then
    v.round_table_id := rt.id;
    v.organization_id := rt.organization_id;
    v.weekday := rt.weekday;
    v.start_time := rt.start_time;
    v.timezone := rt.timezone;
    v.duration_minutes := rt.duration_minutes;
    v.effective_from := (rt.created_at at time zone rt.timezone)::date;
  end if;
  return v;
end;
$$;

-- Next weekly slot strictly after p_after under the versioned schedule, skipping slots used by
-- another session of the table (p_exclude_session lets a session re-slot itself).
create or replace function app.next_slot_versioned(
  p_round_table_id uuid, p_after timestamptz, p_exclude_session uuid default null)
returns timestamptz
language plpgsql
stable
security definer
set search_path = ''
as $$
declare
  v_first date := (p_after at time zone 'UTC')::date - 1;
  v_day date;
  v public.table_schedule_versions;
  v_slot timestamptz;
begin
  for i in 0..70 loop
    v_day := v_first + i;
    v := app.schedule_in_force(p_round_table_id, v_day);
    if v.weekday is not null and extract(isodow from v_day) = v.weekday then
      v_slot := (v_day + v.start_time) at time zone v.timezone;
      if v_slot > p_after and not exists (
        select 1 from public.sessions
        where round_table_id = p_round_table_id and scheduled_at = v_slot
          and id is distinct from p_exclude_session) then
        return v_slot;
      end if;
    end if;
  end loop;
  return null;
end;
$$;

-- Mirrors the version in force today onto round_tables (p_round_table_id NULL = every table).
create or replace function app.apply_due_schedule(p_round_table_id uuid default null)
returns integer
language plpgsql
security definer
set search_path = ''
as $$
declare
  r public.round_tables;
  v public.table_schedule_versions;
  v_count integer := 0;
begin
  for r in select * from public.round_tables where p_round_table_id is null or id = p_round_table_id
  loop
    select sv.* into v from public.table_schedule_versions sv
    where sv.round_table_id = r.id and sv.effective_from <= (now() at time zone sv.timezone)::date
    order by sv.effective_from desc limit 1;
    if found and (v.weekday, v.start_time, v.timezone, v.duration_minutes)
         is distinct from (r.weekday, r.start_time, r.timezone, r.duration_minutes) then
      update public.round_tables set weekday = v.weekday, start_time = v.start_time,
        timezone = v.timezone, duration_minutes = v.duration_minutes
      where id = r.id;
      v_count := v_count + 1;
    end if;
  end loop;
  return v_count;
end;
$$;

-- New sessions use the versioned schedule.
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

  v_slot := app.next_slot_versioned(v_table.id, p_after);

  insert into public.sessions (organization_id, round_table_id, value_id, follow_up_value_id,
                               scheduled_at)
  values (v_table.organization_id, v_table.id, v_table.current_value_id,
          nullif(v_follow_up, v_table.current_value_id), v_slot)
  returning id into v_id;
  return v_id;
end;
$$;

-- Closing advances the value; cancelling does not. The next session is scheduled after the
-- regular slot this one held (a session moved earlier keeps the weekly cadence).
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

  perform app.schedule_next_session(new.round_table_id,
    greatest(now(), new.scheduled_at, coalesce(new.original_scheduled_at, new.scheduled_at)));
  perform kpi.mark_dirty();
  return null;
end;
$$;

-- ---------------------------------------------------------------------------------------------
-- 3. Read shapes: table_json and the admin_tables view expose the pending session's kind
-- ---------------------------------------------------------------------------------------------
create or replace function app.table_json(p_round_table_id uuid)
returns jsonb
language sql
stable
security definer
set search_path = ''
as $$
  select to_jsonb(rt) || jsonb_build_object(
    'location_name', l.name,
    'active_people', (select count(*) from public.table_members tm
                      where tm.round_table_id = rt.id and tm.status = 'active'),
    'facilitator', (select jsonb_build_object('table_member_id', tm.id, 'person_id', tm.person_id,
                                              'first_name', tm.first_name, 'last_name', tm.last_name,
                                              'linked', tm.auth_user_id is not null)
                    from public.table_members tm
                    where tm.round_table_id = rt.id and tm.role = 'facilitator'
                      and tm.status = 'active'),
    'pending_session', (select jsonb_build_object('id', s.id, 'status', s.status,
                                                  'scheduled_at', s.scheduled_at,
                                                  'kind', s.kind,
                                                  'original_scheduled_at', s.original_scheduled_at,
                                                  'value_id', s.value_id,
                                                  'follow_up_value_id', s.follow_up_value_id)
                        from public.sessions s
                        where s.round_table_id = rt.id and s.status in ('scheduled', 'open')))
  from public.round_tables rt
  join public.locations l on l.id = rt.location_id
  where rt.id = p_round_table_id;
$$;

create or replace view public.admin_tables with (security_invoker = true) as
select
  rt.id, rt.organization_id, o.name as organization_name, rt.location_id,
  l.name as location_name, rt.name, rt.code, rt.weekday, rt.start_time, rt.timezone,
  rt.duration_minutes, rt.status, rt.current_value_id,
  cv.sequence as current_value_sequence, cv.name as current_value_name,
  fac.person_id as facilitator_person_id,
  nullif(btrim(coalesce(fac.first_name, '') || ' ' || coalesce(fac.last_name, '')), '') as facilitator_name,
  (select count(*) from public.table_members tm
   where tm.round_table_id = rt.id and tm.status = 'active') as active_people,
  9 as max_people,
  pending.id as pending_session_id, pending.status as pending_session_status,
  pending.scheduled_at as pending_session_at,
  rt.created_at, rt.updated_at,
  greatest(9 - (select count(*) from public.table_members tm
                where tm.round_table_id = rt.id and tm.status = 'active'), 0) as seats_free,
  (select count(*) from public.invites i
   where i.round_table_id = rt.id and i.status = 'pending' and i.expires_at >= now()) as pending_invites,
  pending.kind as pending_session_kind,
  pending.original_scheduled_at as pending_session_original_at,
  -- The same instants as wall-clock time in the table's timezone ('YYYY-MM-DDTHH:MM'), so clients
  -- can show and prefill them without a timezone database.
  to_char(pending.scheduled_at at time zone rt.timezone, 'YYYY-MM-DD"T"HH24:MI') as pending_session_local,
  to_char(pending.original_scheduled_at at time zone rt.timezone, 'YYYY-MM-DD"T"HH24:MI')
    as pending_session_original_local
from public.round_tables rt
join public.organizations o on o.id = rt.organization_id
join public.locations l on l.id = rt.location_id
left join public.curriculum_values cv on cv.id = rt.current_value_id
left join public.table_members fac on fac.round_table_id = rt.id
  and fac.role = 'facilitator' and fac.status = 'active'
left join lateral (
  select s.id, s.status, s.scheduled_at, s.kind, s.original_scheduled_at from public.sessions s
  where s.round_table_id = rt.id and s.status in ('scheduled', 'open') limit 1
) pending on true;

-- ---------------------------------------------------------------------------------------------
-- 4. api.table_update: schedule changes carry an effective-from date (RF-23)
--    p_input.schedule_effective_from (YYYY-MM-DD, default today in the table's timezone; the past
--    is refused). Today or earlier → applied now; later → stored and applied on that date.
--    The pending session moves only if it falls on or after the effective date.
-- ---------------------------------------------------------------------------------------------
create or replace function api.table_update(p_uid uuid, p_input jsonb)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_before public.round_tables;
  v_after public.round_tables;
  v_pending public.sessions;
  v_value_set boolean := p_input ? 'current_value_id';
  v_new_value uuid := (p_input->>'current_value_id')::uuid;
  v_from_seq smallint;
  v_to_seq smallint;
  v_rewind boolean := false;
  v_confirmed boolean := coalesce((p_input->>'confirm_rewind')::boolean, false);
  v_tz text;
  v_today date;
  v_effective date;
  v_base public.table_schedule_versions;
  v_weekday smallint;
  v_start time;
  v_duration smallint;
  v_schedule_changed boolean := false;
  v_slot_changed boolean := false;
  v_effective_start timestamptz;
begin
  select * into v_before from public.round_tables
  where id = (p_input->>'round_table_id')::uuid for update;
  if not found then
    perform app.fail('not_found', 'La mesa no existe.');
  end if;
  perform app.require_manages_org(p_uid, v_before.organization_id);

  -- Program position (RF-28).
  if v_value_set and v_new_value is distinct from v_before.current_value_id then
    select sequence into v_to_seq from public.curriculum_values
    where id = v_new_value and status = 'active';
    if v_to_seq is null then
      perform app.fail('validation_failed', 'Elige un valor del programa (1 a 48).');
    end if;
    select sequence into v_from_seq from public.curriculum_values where id = v_before.current_value_id;
    -- A finished program (no current value) counts as past the last value.
    if coalesce(v_from_seq, 32767) > v_to_seq then
      -- Rewinding re-opens values that already have a closed session on this table.
      v_rewind := exists (
        select 1 from public.sessions s
        join public.curriculum_values cv on cv.id = s.value_id
        where s.round_table_id = v_before.id and s.status = 'closed' and cv.sequence >= v_to_seq);
      if v_rewind and not v_confirmed then
        perform app.fail('value_rewind_confirmation_required',
          'Esta mesa ya completó sesiones de ese valor o de los siguientes. Confirma para retroceder; el historial cerrado no se modifica.');
      end if;
    end if;
  end if;

  -- Schedule (RF-23): recorded as a version effective from a date; round_tables mirrors the
  -- version in force today.
  v_tz := coalesce(p_input->>'timezone', v_before.timezone);
  if not app.is_valid_timezone(v_tz) then
    perform app.fail('invalid_timezone', 'La zona horaria de la mesa no es válida.');
  end if;
  v_today := (now() at time zone v_tz)::date;
  v_effective := coalesce((p_input->>'schedule_effective_from')::date, v_today);
  v_base := app.schedule_in_force(v_before.id, v_effective);
  v_weekday := coalesce((p_input->>'weekday')::smallint, v_base.weekday);
  v_start := coalesce((p_input->>'start_time')::time, v_base.start_time);
  v_duration := coalesce((p_input->>'duration_minutes')::smallint, v_base.duration_minutes);
  v_schedule_changed := (v_weekday, v_start, v_tz, v_duration)
    is distinct from (v_base.weekday, v_base.start_time, v_base.timezone, v_base.duration_minutes);
  v_slot_changed := (v_weekday, v_start, v_tz) is distinct from (v_base.weekday, v_base.start_time, v_base.timezone);
  if v_schedule_changed then
    if v_effective < v_today then
      perform app.fail('schedule_effective_in_past',
        'El nuevo horario no puede empezar en una fecha pasada.');
    end if;
    insert into public.table_schedule_versions (organization_id, round_table_id, weekday, start_time,
      timezone, duration_minutes, effective_from, changed_by_person_id)
    values (v_before.organization_id, v_before.id, v_weekday, v_start, v_tz, v_duration, v_effective,
            app.actor_person(p_uid, v_before.organization_id))
    on conflict (round_table_id, effective_from) do update set
      weekday = excluded.weekday, start_time = excluded.start_time, timezone = excluded.timezone,
      duration_minutes = excluded.duration_minutes,
      changed_by_person_id = excluded.changed_by_person_id, created_at = now();
    perform app.apply_due_schedule(v_before.id);
  end if;

  update public.round_tables set
    name = coalesce(nullif(btrim(p_input->>'name'), ''), name),
    code = coalesce(p_input->>'code', code),
    location_id = coalesce((p_input->>'location_id')::uuid, location_id),
    status = coalesce((p_input->>'status')::public.round_table_status,
                      -- Moving a finished table back into the program reactivates it.
                      case when v_before.status = 'completed' and v_new_value is not null
                                and v_new_value is distinct from v_before.current_value_id
                           then 'active'::public.round_table_status end,
                      status),
    current_value_id = case when v_value_set then v_new_value else current_value_id end
  where id = v_before.id
  returning * into v_after;

  select * into v_pending from public.sessions
  where round_table_id = v_after.id and status in ('scheduled', 'open') for update;

  -- Program position changed (RF-28): the pending, untouched session follows it.
  if v_after.current_value_id is distinct from v_before.current_value_id and v_pending.id is not null then
    if v_pending.status = 'open' or exists (
         select 1 from public.member_assessments where session_id = v_pending.id
         union all select 1 from public.member_answers where session_id = v_pending.id
         union all select 1 from public.member_commitments where session_id = v_pending.id) then
      perform app.fail('value_change_blocked',
        'La sesión pendiente ya tiene respuestas; ciérrala antes de cambiar el valor.');
    end if;
    if v_after.current_value_id is null then
      perform app.fail('validation_failed', 'Elige el valor en el que va la mesa.');
    end if;
    update public.sessions set value_id = v_after.current_value_id,
      follow_up_value_id = nullif(follow_up_value_id, v_after.current_value_id)
    where id = v_pending.id;
  end if;

  -- The pending, not yet opened session moves to the new slot when it falls on or after the
  -- effective date. A session the admin already moved by hand keeps its date.
  if v_schedule_changed and v_slot_changed and v_pending.status = 'scheduled'
     and v_pending.kind = 'regular' and v_pending.original_scheduled_at is null then
    v_effective_start := v_effective::timestamp at time zone v_tz;
    if v_pending.scheduled_at >= v_effective_start then
      update public.sessions set scheduled_at = app.next_slot_versioned(v_after.id,
        greatest(now(), v_effective_start - interval '1 second'), v_pending.id)
      where id = v_pending.id;
    end if;
  end if;

  -- Pausing/closing cancels the pending scheduled session; reactivating schedules one.
  if v_after.status <> v_before.status then
    if v_after.status <> 'active' and v_pending.status = 'scheduled' then
      update public.sessions set status = 'cancelled', cancelled_reason = 'table_' || v_after.status
      where id = v_pending.id;
    elsif v_after.status = 'active' then
      perform app.schedule_next_session(v_after.id, now());
    end if;
  end if;

  perform app.audit(p_uid, app.actor_person(p_uid, v_after.organization_id), v_after.organization_id,
    'table.updated', 'round_table', v_after.id, p_input - 'round_table_id' - 'confirm_rewind');
  if v_schedule_changed then
    perform app.audit(p_uid, app.actor_person(p_uid, v_after.organization_id), v_after.organization_id,
      'table.schedule_changed', 'round_table', v_after.id, jsonb_build_object(
        'effective_from', v_effective, 'applied', v_effective <= v_today,
        'from', jsonb_build_object('weekday', v_base.weekday, 'start_time', v_base.start_time,
                                   'timezone', v_base.timezone, 'duration_minutes', v_base.duration_minutes),
        'to', jsonb_build_object('weekday', v_weekday, 'start_time', v_start,
                                 'timezone', v_tz, 'duration_minutes', v_duration)));
  end if;
  if v_after.current_value_id is distinct from v_before.current_value_id then
    perform app.audit(p_uid, app.actor_person(p_uid, v_after.organization_id), v_after.organization_id,
      'table.value_changed', 'round_table', v_after.id, jsonb_build_object(
        'from_value_id', v_before.current_value_id, 'to_value_id', v_after.current_value_id,
        'from_sequence', v_from_seq, 'to_sequence', v_to_seq,
        'rewind', v_rewind, 'confirmed', v_rewind and v_confirmed));
  end if;
  perform kpi.mark_dirty();
  return app.table_json(v_after.id);
end;
$$;

-- ---------------------------------------------------------------------------------------------
-- 5. Single-session changes (RF-30): reschedule, cancel, extraordinary session
-- ---------------------------------------------------------------------------------------------

-- Locks a session that can still be edited (scheduled) and checks the caller manages its org.
create or replace function app.lock_editable_session(p_uid uuid, p_session_id uuid)
returns public.sessions
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_session public.sessions;
begin
  select * into v_session from public.sessions where id = p_session_id for update;
  if not found then
    perform app.fail('session_not_found', 'La sesión no existe.');
  end if;
  perform app.require_manages_org(p_uid, v_session.organization_id);
  perform app.require_active_org(v_session.organization_id);
  if v_session.status = 'open' then
    perform app.fail('session_in_progress', 'La sesión ya empezó; no se puede cambiar.');
  elsif v_session.status <> 'scheduled' then
    perform app.fail('session_finalized', 'La sesión ya está cerrada o cancelada y no se puede modificar.');
  end if;
  return v_session;
end;
$$;

-- A date for a session: in the future and not taken by another session of the table.
create or replace function app.require_free_future_slot(
  p_round_table_id uuid, p_at timestamptz, p_session_id uuid default null)
returns void
language plpgsql
stable
security definer
set search_path = ''
as $$
begin
  if p_at is null then
    perform app.fail('validation_failed', 'Elige la fecha y la hora de la sesión.');
  end if;
  if p_at <= now() then
    perform app.fail('schedule_in_past', 'La fecha de la sesión debe ser futura.');
  end if;
  if exists (select 1 from public.sessions
             where round_table_id = p_round_table_id and scheduled_at = p_at
               and id is distinct from p_session_id) then
    perform app.fail('slot_taken', 'La mesa ya tiene una sesión en esa fecha y hora.');
  end if;
end;
$$;

-- The date of a session in p_input: scheduled_at (an instant) or scheduled_local ('YYYY-MM-DDTHH:MM'
-- wall-clock time in the table's timezone, so clients need no timezone database).
create or replace function app.input_slot(p_input jsonb, p_round_table_id uuid)
returns timestamptz
language sql
stable
security definer
set search_path = ''
as $$
  select case
    when nullif(p_input->>'scheduled_local', '') is not null
      then (p_input->>'scheduled_local')::timestamp
             at time zone (select timezone from public.round_tables where id = p_round_table_id)
    else (p_input->>'scheduled_at')::timestamptz end;
$$;

-- p_input: {session_id, scheduled_at | scheduled_local, reason?}
-- Moves one scheduled session. The weekly cadence is unchanged: the next session is still
-- scheduled after the regular slot the session held.
create or replace function api.session_reschedule(p_uid uuid, p_input jsonb)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_before public.sessions;
  v_after public.sessions;
  v_at timestamptz;
  v_origin timestamptz;
begin
  v_before := app.lock_editable_session(p_uid, (p_input->>'session_id')::uuid);
  v_at := app.input_slot(p_input, v_before.round_table_id);
  perform app.require_free_future_slot(v_before.round_table_id, v_at, v_before.id);
  if v_at = v_before.scheduled_at then
    perform app.fail('validation_failed', 'Elige una fecha distinta a la actual.');
  end if;

  v_origin := case when v_before.kind = 'regular'
                   then coalesce(v_before.original_scheduled_at, v_before.scheduled_at) end;
  update public.sessions set scheduled_at = v_at,
    original_scheduled_at = case when v_origin is not distinct from v_at then null else v_origin end
  where id = v_before.id
  returning * into v_after;

  perform app.audit(p_uid, app.actor_person(p_uid, v_after.organization_id), v_after.organization_id,
    'session.rescheduled', 'session', v_after.id, jsonb_build_object(
      'round_table_id', v_after.round_table_id, 'value_id', v_after.value_id,
      'from', v_before.scheduled_at, 'to', v_after.scheduled_at,
      'reason', nullif(btrim(p_input->>'reason'), '')));
  perform kpi.mark_dirty();
  return jsonb_build_object('session', to_jsonb(v_after), 'table', app.table_json(v_after.round_table_id));
end;
$$;

-- p_input: {session_id, reason: holiday | force_majeure | other, note?}
-- Cancels one scheduled session. The value does not advance; the trigger schedules the table's
-- next session at the next regular slot, which carries the same value.
create or replace function api.session_cancel(p_uid uuid, p_input jsonb)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_before public.sessions;
  v_after public.sessions;
  v_reason text := p_input->>'reason';
  v_next public.sessions;
begin
  if v_reason is null or v_reason not in ('holiday', 'force_majeure', 'other') then
    perform app.fail('validation_failed', 'Elige el motivo de la cancelación.');
  end if;
  v_before := app.lock_editable_session(p_uid, (p_input->>'session_id')::uuid);

  update public.sessions set status = 'cancelled', cancelled_reason = v_reason
  where id = v_before.id
  returning * into v_after;

  select * into v_next from public.sessions
  where round_table_id = v_after.round_table_id and status in ('scheduled', 'open');

  perform app.audit(p_uid, app.actor_person(p_uid, v_after.organization_id), v_after.organization_id,
    'session.cancelled', 'session', v_after.id, jsonb_build_object(
      'round_table_id', v_after.round_table_id, 'value_id', v_after.value_id,
      'from', v_before.status, 'to', v_after.status, 'scheduled_at', v_before.scheduled_at,
      'reason', v_reason, 'note', nullif(btrim(p_input->>'note'), ''),
      'value_advances', false,
      'next_session_id', v_next.id, 'next_scheduled_at', v_next.scheduled_at));
  perform kpi.mark_dirty();
  return jsonb_build_object('session', to_jsonb(v_after), 'table', app.table_json(v_after.round_table_id));
end;
$$;

-- p_input: {round_table_id, scheduled_at | scheduled_local, reason?}
-- Adds an extra meeting before the table's next regular one. It takes the pending session's
-- place (one pending session per table); the regular cadence resumes after it is held or
-- cancelled. It works the table's current value, so holding it advances the program.
create or replace function api.session_extra_create(p_uid uuid, p_input jsonb)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_table public.round_tables;
  v_pending public.sessions;
  v_after public.sessions;
  v_at timestamptz;
begin
  select * into v_table from public.round_tables
  where id = (p_input->>'round_table_id')::uuid for update;
  if not found then
    perform app.fail('not_found', 'La mesa no existe.');
  end if;
  perform app.require_manages_org(p_uid, v_table.organization_id);
  perform app.require_active_org(v_table.organization_id);
  if v_table.status <> 'active' then
    perform app.fail('table_not_active', 'La mesa está pausada, cerrada o completó el programa.');
  end if;

  v_pending := app.lock_editable_session(p_uid,
    app.schedule_next_session(v_table.id, now()));
  if v_pending.kind = 'extraordinary' then
    perform app.fail('extra_session_exists',
      'Ya hay una sesión extraordinaria pendiente; reprográmala o cancélala.');
  end if;
  v_at := app.input_slot(p_input, v_table.id);
  perform app.require_free_future_slot(v_table.id, v_at, v_pending.id);
  if v_at >= v_pending.scheduled_at then
    perform app.fail('extra_session_not_before_next',
      'La sesión extraordinaria debe ser antes de la próxima sesión de la mesa.');
  end if;

  update public.sessions set kind = 'extraordinary', scheduled_at = v_at, original_scheduled_at = null
  where id = v_pending.id
  returning * into v_after;

  perform app.audit(p_uid, app.actor_person(p_uid, v_table.organization_id), v_table.organization_id,
    'session.extraordinary_added', 'session', v_after.id, jsonb_build_object(
      'round_table_id', v_table.id, 'value_id', v_after.value_id,
      'scheduled_at', v_after.scheduled_at, 'next_regular_after', v_pending.scheduled_at,
      'reason', nullif(btrim(p_input->>'reason'), '')));
  perform kpi.mark_dirty();
  return jsonb_build_object('session', to_jsonb(v_after), 'table', app.table_json(v_table.id));
end;
$$;

-- ---------------------------------------------------------------------------------------------
-- 6. Hardening and cron
-- ---------------------------------------------------------------------------------------------
revoke execute on function
  app.round_tables_record_schedule(), app.schedule_in_force(uuid, date),
  app.next_slot_versioned(uuid, timestamptz, uuid), app.apply_due_schedule(uuid),
  app.input_slot(jsonb, uuid),
  app.lock_editable_session(uuid, uuid), app.require_free_future_slot(uuid, timestamptz, uuid)
  from public, anon, authenticated;

do $cron$
begin
  perform cron.schedule('gr-apply-schedule', '5 * * * *', 'select app.apply_due_schedule()');
exception when others then
  raise notice 'pg_cron unavailable (%); app.apply_due_schedule() must be triggered externally', sqlerrm;
end;
$cron$;
