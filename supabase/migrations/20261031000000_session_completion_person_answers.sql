-- Gold Roundtables — incomplete sessions (RF-50, P-72) and "person" answers (RF-54).
--
-- 1. sessions.completion / incomplete_reason: set by the server when a session closes. A session is
--    complete when the facilitator reached the answers stage (value) before closing it; closing
--    from the lobby, attendance or follow-up leaves the answers stage unvisited and the session
--    is closed as 'incomplete' / 'closed_early'. The value still advances and the follow-up is
--    still held once, in the next session (nothing else about closing changes). Clients cannot
--    write these columns.
-- 2. member_answers.answer_person_id: the person picked for a response_type = 'person' question.
--    answer_text keeps the person's name (a snapshot, so every summary works from the answer
--    alone); a free-text "other person" answer leaves answer_person_id empty.
-- ---------------------------------------------------------------------------------------------

-- 1. Completion ---------------------------------------------------------------------------------
create type public.session_completion as enum ('complete', 'incomplete');

alter table public.sessions
  add column completion public.session_completion,
  add column incomplete_reason text,
  add constraint sessions_incomplete_reason_check check (
    incomplete_reason is null or (completion = 'incomplete' and incomplete_reason in ('closed_early')));

-- Sessions closed before this migration have no stage history to judge: they count as complete.
-- The prepare trigger would reset the column, so the backfill runs with the row triggers off.
alter table public.sessions disable trigger user;
update public.sessions set completion = 'complete' where status = 'closed';
alter table public.sessions enable trigger user;

alter table public.sessions add constraint sessions_completion_check
  check ((status = 'closed') = (completion is not null));

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
    new.completion := case when new.status = 'closed' then 'complete' end;
    new.incomplete_reason := null;
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

  -- Completion is derived below, never taken from the client.
  new.completion := old.completion;
  new.incomplete_reason := old.incomplete_reason;

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
    -- The answers stage (value/commitment) is where reflections and commitments are captured.
    if old.stage in ('value', 'commitment') then
      new.completion := 'complete';
    else
      new.completion := 'incomplete';
      new.incomplete_reason := 'closed_early';
    end if;
  end if;
  return new;
end;
$$;

-- The close is audited with its completion so the audit log tells an early close apart.
create or replace function api.session_change(p_uid uuid, p_session_id uuid, p_changes jsonb)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_before public.sessions;
  v_after public.sessions;
  v_facilitator uuid;
  v_status public.session_status;
  v_stage public.session_stage;
begin
  if p_uid is null then
    perform app.fail('unauthenticated', 'Inicia sesión para continuar.');
  end if;
  select * into v_before from public.sessions where id = p_session_id for update;
  if not found then
    perform app.fail('not_found', 'La sesión no existe.');
  end if;

  v_status := coalesce((p_changes->>'status')::public.session_status, v_before.status);
  v_stage := coalesce((p_changes->>'stage')::public.session_stage, v_before.stage);
  -- Moving a scheduled session past the lobby opens it.
  if v_before.status = 'scheduled' and v_status = 'scheduled' and v_stage <> 'lobby' then
    v_status := case when v_stage = 'closed' then 'closed' else 'open' end;
  end if;

  v_facilitator := app.facilitator_person_for(p_uid, v_before.round_table_id);
  if v_facilitator is null
     and not (v_status = 'cancelled' and app.manages_org_for(p_uid, v_before.organization_id)) then
    perform app.fail('forbidden', 'Solo el facilitador de la mesa puede dirigir la sesión.');
  end if;

  update public.sessions set
    status = v_status,
    stage = v_stage,
    started_at = coalesce((p_changes->>'started_at')::timestamptz, started_at),
    ended_at = coalesce((p_changes->>'ended_at')::timestamptz, ended_at),
    answers_closed_at = coalesce((p_changes->>'answers_closed_at')::timestamptz, answers_closed_at),
    cancelled_reason = coalesce(p_changes->>'cancelled_reason', cancelled_reason),
    device_modified_at = coalesce(app.clamp_device_time(
                           (p_changes->>'device_modified_at')::timestamptz), device_modified_at),
    facilitator_person_id = case when v_status in ('open', 'closed')
                                 then coalesce(facilitator_person_id, v_facilitator)
                                 else facilitator_person_id end
  where id = p_session_id
  returning * into v_after;

  if v_after.status <> v_before.status then
    perform app.audit(p_uid, coalesce(v_facilitator, app.actor_person(p_uid, v_after.organization_id)),
      v_after.organization_id, 'session.' || case v_after.status
        when 'open' then 'opened' when 'closed' then 'closed' when 'cancelled' then 'cancelled'
        else v_after.status::text end,
      'session', v_after.id,
      jsonb_build_object('round_table_id', v_after.round_table_id, 'value_id', v_after.value_id,
                         'from', v_before.status, 'to', v_after.status)
      || case when v_after.status = 'closed'
           then jsonb_build_object('completion', v_after.completion,
                                   'incomplete_reason', v_after.incomplete_reason)
           else '{}'::jsonb end);
  end if;

  return to_jsonb(v_after) || jsonb_build_object(
    'previous_status', v_before.status, 'previous_stage', v_before.stage,
    'stage_changed', v_after.stage <> v_before.stage);
end;
$$;

-- KPI headline: how many of the closed sessions in scope were closed incomplete.
create or replace function kpi.summary_impl(
  p_from date default null, p_to date default null, p_country text default null,
  p_organization_id uuid default null, p_location_id uuid default null,
  p_round_table_id uuid default null, p_facilitator_person_id uuid default null,
  p_module_id uuid default null, p_value_id uuid default null)
returns jsonb
language sql
stable
security definer
set search_path = ''
as $$
  with sf as (
    select * from kpi.session_facts_scoped(p_from, p_to, p_country, p_organization_id,
      p_location_id, p_round_table_id, p_facilitator_person_id, p_module_id, p_value_id)
  ), mf as (
    select * from kpi.member_facts_scoped(p_from, p_to, p_country, p_organization_id,
      p_location_id, p_round_table_id, p_facilitator_person_id, p_module_id, p_value_id)
  ), ts as (
    select * from kpi.table_status_scoped(p_country, p_organization_id, p_location_id,
      p_round_table_id, p_facilitator_person_id)
  )
  select jsonb_build_object(
    'sessions_closed', (select count(*) from sf),
    'sessions_incomplete', (select count(*) from sf
        join public.sessions s on s.id = sf.session_id where s.completion = 'incomplete'),
    'values_completed', (select count(distinct (round_table_id, value_id)) from sf),
    'member_values_completed', (select count(*) from mf),
    'attendance_pct', (select round(100.0 * sum(present_count) / nullif(sum(expected_count), 0), 1) from sf),
    'initial_avg', (select round(avg(initial_score), 2) from mf),
    'follow_up_avg', (select round(avg(follow_up_score), 2) from mf where follow_up_score is not null),
    'improvement_avg', (select round(avg(delta), 2) from mf where delta is not null),
    'improvement_pairs', (select count(*) from mf where delta is not null),
    'synced_late_rows', (select coalesce(sum(synced_late_rows), 0) from sf),
    'synced_late_sessions', (select count(*) from sf where synced_late_rows > 0),
    'tables', (select jsonb_build_object(
        'total', count(*),
        'active', count(*) filter (where health = 'active'),
        'delayed', count(*) filter (where health = 'delayed'),
        'inactive', count(*) filter (where health = 'inactive'),
        'completed', count(*) filter (where health = 'completed')) from ts),
    'people_active', (select coalesce(sum(active_people), 0) from ts),
    'program_progress_pct', (select round(100.0 * avg(values_completed) /
        nullif((select count(*) from public.curriculum_values where status = 'active'), 0), 1) from ts),
    'computed_at', (select refreshed_at from kpi.refresh_state where id));
$$;

-- 2. Person answers -----------------------------------------------------------------------------
alter table public.member_answers
  add column answer_person_id uuid,
  add constraint member_answers_person_pick_fkey foreign key (answer_person_id, organization_id)
    references public.people (id, organization_id);

-- Answers: the question must belong to the session's value; a picked person must sit at the
-- table, and only a 'person' question takes one.
create or replace function app.answer_rules()
returns trigger
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_value uuid;
  v_question public.value_questions;
begin
  select value_id into v_value from public.sessions where id = new.session_id;
  select * into v_question from public.value_questions where id = new.question_id;
  if v_question.value_id is distinct from v_value then
    perform app.fail('question_mismatch', 'La pregunta no corresponde al valor de esta sesión.');
  end if;
  new.value_id := v_value;
  if new.answer_person_id is not null then
    if v_question.response_type <> 'person' or not exists (
         select 1 from public.table_members tm
         where tm.round_table_id = new.round_table_id and tm.person_id = new.answer_person_id
           and tm.status = 'active') then
      perform app.fail('answer_person_not_at_table',
        'Elige a una persona de tu mesa o escribe otro nombre.');
    end if;
  end if;
  return new;
end;
$$;

create or replace function app.sync_answer(p_uid uuid, p_op text, p_id uuid, p_data jsonb)
returns void
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_row public.member_answers;
begin
  select * into v_row from public.member_answers where id = p_id for update;
  if not found and p_op = 'PUT' then
    -- Natural key (session, person, question) already answered from another row: merge.
    select * into v_row from public.member_answers
    where session_id = (p_data->>'session_id')::uuid and person_id = (p_data->>'person_id')::uuid
      and question_id = (p_data->>'question_id')::uuid
    for update;
  end if;
  if v_row.id is not null then
    perform app.require_own_person(p_uid, v_row.person_id);
    update public.member_answers set
      session_id = coalesce((p_data->>'session_id')::uuid, session_id),
      person_id = coalesce((p_data->>'person_id')::uuid, person_id),
      question_id = coalesce((p_data->>'question_id')::uuid, question_id),
      answer_text = coalesce(p_data->>'answer_text', answer_text),
      -- Present as null/'' when the person switched from a picked person to free text.
      answer_person_id = case when p_data ? 'answer_person_id'
                              then nullif(p_data->>'answer_person_id', '')::uuid
                              else answer_person_id end,
      device_modified_at = coalesce(app.jtime(p_data, 'device_modified_at'), now())
    where id = v_row.id;
  elsif p_op = 'PATCH' then
    perform app.fail('not_found', 'El registro no existe en el servidor.');
  else
    perform app.require_own_person(p_uid, (p_data->>'person_id')::uuid);
    insert into public.member_answers (id, session_id, person_id, question_id, answer_text,
      answer_person_id, device_created_at, device_modified_at)
    values (p_id, (p_data->>'session_id')::uuid, (p_data->>'person_id')::uuid,
            (p_data->>'question_id')::uuid, coalesce(p_data->>'answer_text', ''),
            nullif(p_data->>'answer_person_id', '')::uuid,
            coalesce(app.jtime(p_data, 'device_created_at'), now()),
            app.jtime(p_data, 'device_modified_at'));
  end if;
end;
$$;
