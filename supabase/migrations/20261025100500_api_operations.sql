-- Gold Roundtables — api layer: business operations executed by Edge Functions as service_role.
--
-- Each api.* function takes the caller's auth user id (verified by the Edge Function from the
-- JWT) and a jsonb input, authorizes with the same app.*_for helpers that back RLS, runs in a
-- single transaction, writes audit events and returns jsonb. Failures raise app.fail(code, ...).

grant execute on function app.person_ids_for(uuid), app.is_platform_admin_for(uuid),
  app.coordinator_orgs_for(uuid), app.facilitator_tables_for(uuid), app.member_tables_for(uuid),
  app.orgs_for(uuid), app.manages_org_for(uuid, uuid), app.contexts_for(uuid)
  to service_role;

-- ---------------------------------------------------------------------------------------------
-- Internal helpers
-- ---------------------------------------------------------------------------------------------
create or replace function app.audit(
  p_uid uuid, p_actor_person uuid, p_org uuid, p_event text, p_entity_type text,
  p_entity_id uuid, p_payload jsonb default '{}'::jsonb)
returns void
language sql
security definer
set search_path = ''
as $$
  insert into public.audit_events (organization_id, actor_auth_user_id, actor_person_id,
                                   event_type, entity_type, entity_id, payload)
  values (p_org, p_uid, p_actor_person, p_event, p_entity_type, p_entity_id,
          coalesce(p_payload, '{}'::jsonb));
$$;

-- The caller's person used as actor in an organization: their person in that organization, or
-- their platform-staff person (organization_id NULL) for church administrators.
create or replace function app.actor_person(p_uid uuid, p_org uuid)
returns uuid
language sql
stable
security definer
set search_path = ''
as $$
  select id from public.people
  where auth_user_id = p_uid and status <> 'inactive'
    and (organization_id = p_org or organization_id is null)
  order by (organization_id is null)
  limit 1;
$$;

create or replace function app.require_manages_org(p_uid uuid, p_org uuid)
returns void
language plpgsql
stable
security definer
set search_path = ''
as $$
begin
  if p_uid is null then
    perform app.fail('unauthenticated', 'Inicia sesión para continuar.');
  end if;
  if not app.manages_org_for(p_uid, p_org) then
    perform app.fail('forbidden', 'No tienes permiso para administrar esta organización.');
  end if;
end;
$$;

create or replace function app.require_platform_admin(p_uid uuid)
returns void
language plpgsql
stable
security definer
set search_path = ''
as $$
begin
  if p_uid is null or not app.is_platform_admin_for(p_uid) then
    perform app.fail('forbidden', 'Solo la administración de la plataforma puede hacer esto.');
  end if;
end;
$$;

create or replace function app.require_active_org(p_org uuid)
returns void
language plpgsql
stable
security definer
set search_path = ''
as $$
begin
  if not exists (select 1 from public.organizations where id = p_org and status = 'active') then
    perform app.fail('organization_inactive', 'La organización está pausada o desactivada.');
  end if;
end;
$$;

-- Facilitator person id of the caller for a table (NULL when not its active facilitator).
create or replace function app.facilitator_person_for(p_uid uuid, p_round_table_id uuid)
returns uuid
language sql
stable
security definer
set search_path = ''
as $$
  select person_id from public.table_members
  where round_table_id = p_round_table_id and auth_user_id = p_uid
    and role = 'facilitator' and status = 'active';
$$;

create or replace function app.new_invite_code()
returns char(6)
language plpgsql
volatile
security definer
set search_path = ''
as $$
declare
  v_alphabet constant text := 'ABCDEFGHJKLMNPQRSTUVWXYZ23456789'; -- 32 symbols, no 0/O/1/I
  v_bytes bytea;
  v_code text;
begin
  loop
    v_bytes := extensions.gen_random_bytes(6);
    v_code := '';
    for i in 0..5 loop
      v_code := v_code || substr(v_alphabet, (get_byte(v_bytes, i) % 32) + 1, 1);
    end loop;
    exit when not exists (select 1 from public.invites where code = v_code);
  end loop;
  return v_code;
end;
$$;

-- Normalizes a typed code: uppercase, without spaces or dashes.
create or replace function app.normalize_invite_code(p_code text)
returns text
language sql
immutable
set search_path = ''
as $$ select upper(regexp_replace(coalesce(p_code, ''), '[\s-]', '', 'g')) $$;

create or replace function app.invite_effective_status(p_invite public.invites)
returns public.invite_status
language sql
stable
set search_path = ''
as $$
  select case when p_invite.status = 'pending' and p_invite.expires_at < now()
              then 'expired'::public.invite_status else p_invite.status end;
$$;

create or replace function app.person_json(p_person public.people)
returns jsonb
language sql
stable
set search_path = ''
as $$
  select jsonb_build_object(
    'id', p_person.id, 'organization_id', p_person.organization_id,
    'first_name', p_person.first_name, 'last_name', p_person.last_name,
    'position', p_person.position, 'email', p_person.email, 'phone', p_person.phone,
    'status', p_person.status, 'linked', p_person.auth_user_id is not null);
$$;

create or replace function app.invite_json(p_invite_id uuid)
returns jsonb
language sql
stable
security definer
set search_path = ''
as $$
  select jsonb_build_object(
    'id', i.id, 'code', i.code, 'role_kind', i.role_kind,
    'status', app.invite_effective_status(i),
    'organization_id', i.organization_id, 'organization_name', o.name,
    'round_table_id', i.round_table_id, 'round_table_name', rt.name,
    'round_table_code', rt.code,
    'person', app.person_json(p),
    'invited_by_person_id', i.invited_by_person_id,
    'invited_by_name', nullif(btrim(coalesce(ib.first_name, '') || ' ' || coalesce(ib.last_name, '')), ''),
    'expires_at', i.expires_at, 'accepted_at', i.accepted_at, 'revoked_at', i.revoked_at,
    'created_at', i.created_at)
  from public.invites i
  join public.organizations o on o.id = i.organization_id
  join public.people p on p.id = i.person_id
  left join public.round_tables rt on rt.id = i.round_table_id
  left join public.people ib on ib.id = i.invited_by_person_id
  where i.id = p_invite_id;
$$;

-- Creates a person in an organization from {first_name, last_name, position, email, phone}.
create or replace function app.create_person(p_org uuid, p_input jsonb)
returns public.people
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_person public.people;
begin
  if coalesce(btrim(p_input->>'first_name'), '') = ''
     or coalesce(btrim(p_input->>'last_name'), '') = '' then
    perform app.fail('validation_failed', 'Escribe el nombre y el apellido de la persona.');
  end if;
  insert into public.people (organization_id, first_name, last_name, position, email, phone, status)
  values (p_org, btrim(p_input->>'first_name'), btrim(p_input->>'last_name'),
          nullif(btrim(p_input->>'position'), ''), nullif(lower(btrim(p_input->>'email')), ''),
          nullif(btrim(p_input->>'phone'), ''), 'invited')
  returning * into v_person;
  return v_person;
end;
$$;

-- Creates an invite (and the role or seat it grants) for an unlinked person. Shared by
-- api.invite_create, api.table_create and api.table_set_facilitator.
create or replace function app.create_invite(
  p_uid uuid, p_org uuid, p_person public.people, p_role public.invite_role_kind,
  p_round_table_id uuid, p_expires_in_days integer default 14)
returns uuid
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_actor uuid := app.actor_person(p_uid, p_org);
  v_invite_id uuid;
begin
  if p_person.auth_user_id is not null then
    perform app.fail('person_already_linked',
      'Esta persona ya tiene una cuenta vinculada. Agrégala directamente a la mesa.');
  end if;
  if p_person.status = 'inactive' then
    perform app.fail('person_inactive', 'La persona está desactivada.');
  end if;
  if exists (select 1 from public.invites i
             where i.person_id = p_person.id and i.role_kind = p_role
               and i.round_table_id is not distinct from p_round_table_id
               and i.status = 'pending' and i.expires_at >= now()) then
    perform app.fail('invite_pending_exists',
      'Ya hay una invitación pendiente para esta persona. Reenvíala o revócala.');
  end if;

  if p_role = 'coordinator' then
    if not exists (select 1 from public.role_assignments
                   where person_id = p_person.id and role = 'coordinator'
                     and organization_id = p_org and status = 'active') then
      insert into public.role_assignments (person_id, role, organization_id, granted_by_person_id)
      values (p_person.id, 'coordinator', p_org, v_actor);
    end if;
  elsif p_role = 'facilitator' then
    if exists (select 1 from public.table_members
               where round_table_id = p_round_table_id and role = 'facilitator'
                 and status = 'active' and person_id <> p_person.id) then
      perform app.fail('table_has_facilitator',
        'La mesa ya tiene facilitador. Usa "Cambiar facilitador".');
    end if;
    update public.table_members set status = 'inactive', left_reason = 'facilitator_changed'
      where round_table_id = p_round_table_id and person_id = p_person.id
        and status = 'active' and role = 'member';
    if not exists (select 1 from public.table_members
                   where round_table_id = p_round_table_id and person_id = p_person.id
                     and status = 'active') then
      insert into public.table_members (organization_id, round_table_id, person_id, role)
      values (p_org, p_round_table_id, p_person.id, 'facilitator');
    end if;
  else
    if not exists (select 1 from public.table_members
                   where round_table_id = p_round_table_id and person_id = p_person.id
                     and status = 'active') then
      insert into public.table_members (organization_id, round_table_id, person_id, role)
      values (p_org, p_round_table_id, p_person.id, 'member');
    end if;
  end if;

  insert into public.invites (organization_id, person_id, code, role_kind, round_table_id,
                              invited_by_person_id, expires_at)
  values (p_org, p_person.id, app.new_invite_code(), p_role, p_round_table_id, v_actor,
          now() + make_interval(days => greatest(1, least(coalesce(p_expires_in_days, 14), 60))))
  returning id into v_invite_id;

  perform app.audit(p_uid, v_actor, p_org, 'invite.created', 'invite', v_invite_id,
    jsonb_build_object('person_id', p_person.id, 'role_kind', p_role,
                       'round_table_id', p_round_table_id));
  return v_invite_id;
end;
$$;

-- ---------------------------------------------------------------------------------------------
-- Sessions (facilitator controls) — shared by the sessions Edge Function and sync-upload.
-- p_changes: {status?, stage?, started_at?, ended_at?, answers_closed_at?, cancelled_reason?,
--             device_modified_at?}
-- ---------------------------------------------------------------------------------------------
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
                         'from', v_before.status, 'to', v_after.status));
  end if;

  return to_jsonb(v_after) || jsonb_build_object(
    'previous_status', v_before.status, 'previous_stage', v_before.stage,
    'stage_changed', v_after.stage <> v_before.stage);
end;
$$;

-- ---------------------------------------------------------------------------------------------
-- sync-upload: applies a PowerSync CRUD batch. Each op is applied in its own subtransaction;
-- the result lists every op as applied or rejected (with a stable code). Rejected ops are
-- permanent: the client completes the batch and the server copy re-syncs down.
-- ---------------------------------------------------------------------------------------------
create or replace function app.require_own_person(p_uid uuid, p_person_id uuid)
returns void
language plpgsql
stable
security definer
set search_path = ''
as $$
begin
  if p_person_id is null or p_person_id not in (select app.person_ids_for(p_uid)) then
    perform app.fail('forbidden', 'Solo puedes guardar tus propias respuestas.');
  end if;
end;
$$;

create or replace function app.jtime(p_data jsonb, p_key text)
returns timestamptz
language sql
stable
set search_path = ''
as $$ select app.clamp_device_time((p_data->>p_key)::timestamptz) $$;

create or replace function app.sync_attendance(p_uid uuid, p_op text, p_id uuid, p_data jsonb)
returns void
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_row public.session_attendance;
  v_session public.sessions;
  v_recorder uuid;
begin
  select * into v_row from public.session_attendance where id = p_id for update;
  if not found and p_op = 'PATCH' then
    perform app.fail('not_found', 'El registro no existe en el servidor.');
  end if;
  select * into v_session from public.sessions
  where id = coalesce(v_row.session_id, (p_data->>'session_id')::uuid);
  if not found then
    perform app.fail('session_not_found', 'La sesión no existe.');
  end if;
  v_recorder := app.facilitator_person_for(p_uid, v_session.round_table_id);
  if v_recorder is null then
    perform app.fail('forbidden', 'Solo el facilitador de la mesa registra la asistencia.');
  end if;

  if v_row.id is null then
    -- Same person already has a row (e.g. created by auto-attendance): update it instead.
    select * into v_row from public.session_attendance
    where session_id = v_session.id and person_id = (p_data->>'person_id')::uuid for update;
  end if;

  if v_row.id is not null then
    update public.session_attendance set
      status = coalesce((p_data->>'status')::public.attendance_status, status),
      source = 'facilitator',
      recorded_by_person_id = v_recorder,
      device_modified_at = coalesce(app.jtime(p_data, 'device_modified_at'), now())
    where id = v_row.id;
  else
    insert into public.session_attendance (id, session_id, person_id, status, source,
      recorded_by_person_id, device_created_at, device_modified_at)
    values (p_id, v_session.id, (p_data->>'person_id')::uuid,
            (p_data->>'status')::public.attendance_status, 'facilitator', v_recorder,
            coalesce(app.jtime(p_data, 'device_created_at'), now()),
            app.jtime(p_data, 'device_modified_at'));
  end if;
end;
$$;

create or replace function app.sync_assessment(p_uid uuid, p_op text, p_id uuid, p_data jsonb)
returns void
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_row public.member_assessments;
begin
  select * into v_row from public.member_assessments where id = p_id for update;
  if found then
    perform app.require_own_person(p_uid, v_row.person_id);
    update public.member_assessments set
      session_id = coalesce((p_data->>'session_id')::uuid, session_id),
      person_id = coalesce((p_data->>'person_id')::uuid, person_id),
      kind = coalesce((p_data->>'kind')::public.assessment_kind, kind),
      score = coalesce((p_data->>'score')::smallint, score),
      justification = case when p_data ? 'justification' then p_data->>'justification'
                           else justification end,
      device_modified_at = coalesce(app.jtime(p_data, 'device_modified_at'), now())
    where id = p_id;
  elsif p_op = 'PATCH' then
    perform app.fail('not_found', 'El registro no existe en el servidor.');
  else
    perform app.require_own_person(p_uid, (p_data->>'person_id')::uuid);
    insert into public.member_assessments (id, session_id, person_id, kind, score, justification,
      device_created_at, device_modified_at)
    values (p_id, (p_data->>'session_id')::uuid, (p_data->>'person_id')::uuid,
            (p_data->>'kind')::public.assessment_kind, (p_data->>'score')::smallint,
            p_data->>'justification', coalesce(app.jtime(p_data, 'device_created_at'), now()),
            app.jtime(p_data, 'device_modified_at'));
  end if;
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
      device_modified_at = coalesce(app.jtime(p_data, 'device_modified_at'), now())
    where id = v_row.id;
  elsif p_op = 'PATCH' then
    perform app.fail('not_found', 'El registro no existe en el servidor.');
  else
    perform app.require_own_person(p_uid, (p_data->>'person_id')::uuid);
    insert into public.member_answers (id, session_id, person_id, question_id, answer_text,
      device_created_at, device_modified_at)
    values (p_id, (p_data->>'session_id')::uuid, (p_data->>'person_id')::uuid,
            (p_data->>'question_id')::uuid, coalesce(p_data->>'answer_text', ''),
            coalesce(app.jtime(p_data, 'device_created_at'), now()),
            app.jtime(p_data, 'device_modified_at'));
  end if;
end;
$$;

create or replace function app.sync_commitment(p_uid uuid, p_op text, p_id uuid, p_data jsonb)
returns void
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_row public.member_commitments;
begin
  select * into v_row from public.member_commitments where id = p_id for update;
  if not found and p_op = 'PUT' then
    select * into v_row from public.member_commitments
    where session_id = (p_data->>'session_id')::uuid and person_id = (p_data->>'person_id')::uuid
    for update;
  end if;
  if v_row.id is not null then
    perform app.require_own_person(p_uid, v_row.person_id);
    update public.member_commitments set
      session_id = coalesce((p_data->>'session_id')::uuid, session_id),
      person_id = coalesce((p_data->>'person_id')::uuid, person_id),
      action_text = coalesce(p_data->>'action_text', action_text),
      measure_text = case when p_data ? 'measure_text' then p_data->>'measure_text'
                          else measure_text end,
      follow_up_session_id = coalesce((p_data->>'follow_up_session_id')::uuid, follow_up_session_id),
      follow_up_status = coalesce((p_data->>'follow_up_status')::public.commitment_follow_up_status,
                                  follow_up_status),
      follow_up_note = case when p_data ? 'follow_up_note' then p_data->>'follow_up_note'
                            else follow_up_note end,
      follow_up_device_at = case when p_data ? 'follow_up_status' or p_data ? 'follow_up_note'
                                 then coalesce(app.jtime(p_data, 'follow_up_device_at'),
                                               app.jtime(p_data, 'device_modified_at'), now())
                                 else follow_up_device_at end,
      device_modified_at = case
        when p_data ? 'action_text' or p_data ? 'measure_text'
          then coalesce(app.jtime(p_data, 'device_modified_at'), now())
        else device_modified_at end
    where id = v_row.id;
  elsif p_op = 'PATCH' then
    perform app.fail('not_found', 'El registro no existe en el servidor.');
  else
    perform app.require_own_person(p_uid, (p_data->>'person_id')::uuid);
    insert into public.member_commitments (id, session_id, person_id, action_text, measure_text,
      follow_up_session_id, follow_up_status, follow_up_note, follow_up_device_at,
      device_created_at, device_modified_at)
    values (p_id, (p_data->>'session_id')::uuid, (p_data->>'person_id')::uuid,
            p_data->>'action_text', p_data->>'measure_text',
            (p_data->>'follow_up_session_id')::uuid,
            (p_data->>'follow_up_status')::public.commitment_follow_up_status,
            p_data->>'follow_up_note', app.jtime(p_data, 'follow_up_device_at'),
            coalesce(app.jtime(p_data, 'device_created_at'), now()),
            app.jtime(p_data, 'device_modified_at'));
  end if;
end;
$$;

-- Maps a Postgres error to the stable API error code.
create or replace function app.error_code(p_state text, p_message text, p_constraint text)
returns text
language sql
immutable
set search_path = ''
as $$
  select case
    when p_state = 'P0001' then p_message
    when p_state = '23505' then case
      when p_constraint like '%_pkey' then 'duplicate_id'
      when p_constraint = 'member_assessments_session_person_kind_key' then 'duplicate_assessment'
      when p_constraint = 'member_answers_session_person_question_key' then 'duplicate_answer'
      when p_constraint = 'member_commitments_session_person_key' then 'duplicate_commitment'
      when p_constraint = 'session_attendance_session_id_person_id_key' then 'duplicate_attendance'
      when p_constraint = 'table_members_active_person_key' then 'already_member'
      when p_constraint = 'table_members_active_facilitator_key' then 'table_has_facilitator'
      when p_constraint = 'round_tables_org_code_key' then 'duplicate_table_code'
      when p_constraint = 'organizations_name_key' then 'duplicate_organization'
      when p_constraint = 'locations_org_name_key' then 'duplicate_location'
      when p_constraint = 'people_auth_user_per_org_key' then 'identity_linked_elsewhere'
      when p_constraint = 'sessions_one_pending_key' then 'session_pending_exists'
      when p_constraint = 'device_tokens_token_key' then 'duplicate_token'
      else 'conflict' end
    when p_state = '23514' then case
      when p_constraint = 'member_assessments_score_check' then 'score_out_of_range'
      else 'validation_failed' end
    when p_state = '23503' then 'invalid_reference'
    when p_state in ('23502', '22P02', '22007', '22008', '22003', '22001', '22023') then
      'validation_failed'
    when p_state = '42501' then 'forbidden'
    else 'internal_error' end;
$$;

create or replace function api.sync_apply(p_uid uuid, p_ops jsonb)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_op jsonb;
  v_kind text;
  v_table text;
  v_id uuid;
  v_data jsonb;
  v_results jsonb := '[]'::jsonb;
  v_state text;
  v_message text;
  v_detail text;
  v_constraint text;
  v_applied integer := 0;
  v_rejected integer := 0;
begin
  if p_uid is null then
    perform app.fail('unauthenticated', 'Inicia sesión para continuar.');
  end if;
  if jsonb_typeof(p_ops) <> 'array' then
    perform app.fail('validation_failed', 'El lote de cambios no es válido.');
  end if;

  for v_op in select value from jsonb_array_elements(p_ops) loop
    v_kind := upper(coalesce(v_op->>'op', ''));
    v_table := coalesce(v_op->>'table', v_op->>'type');
    begin
      v_id := (v_op->>'id')::uuid;
      v_data := coalesce(v_op->'data', v_op->'opData', '{}'::jsonb);
      if v_id is null then
        perform app.fail('validation_failed', 'Falta el identificador del registro.');
      end if;
      if v_kind not in ('PUT', 'PATCH', 'DELETE') then
        perform app.fail('validation_failed', 'Operación desconocida.');
      end if;
      if v_kind = 'DELETE' then
        perform app.fail('operation_not_allowed',
          'Los datos de la sesión no se borran; corrige la respuesta en su lugar.');
      end if;
      case v_table
        when 'sessions' then
          if v_kind <> 'PATCH' then
            perform app.fail('operation_not_allowed',
              'Las sesiones las crea el servidor según el horario de la mesa.');
          end if;
          perform api.session_change(p_uid, v_id, v_data);
        when 'session_attendance' then perform app.sync_attendance(p_uid, v_kind, v_id, v_data);
        when 'member_assessments' then perform app.sync_assessment(p_uid, v_kind, v_id, v_data);
        when 'member_answers' then perform app.sync_answer(p_uid, v_kind, v_id, v_data);
        when 'member_commitments' then perform app.sync_commitment(p_uid, v_kind, v_id, v_data);
        else
          perform app.fail('unsupported_table',
            'Esta tabla no se sincroniza desde el dispositivo.');
      end case;
      v_applied := v_applied + 1;
      v_results := v_results || jsonb_build_array(jsonb_build_object(
        'id', v_id, 'table', v_table, 'op', v_kind, 'status', 'applied'));
    exception when others then
      get stacked diagnostics v_state = returned_sqlstate, v_message = message_text,
                              v_detail = pg_exception_detail, v_constraint = constraint_name;
      v_rejected := v_rejected + 1;
      v_results := v_results || jsonb_build_array(jsonb_build_object(
        'id', v_op->>'id', 'table', v_table, 'op', v_kind, 'status', 'rejected',
        'code', app.error_code(v_state, v_message, v_constraint),
        'message', case when v_state = 'P0001' then nullif(v_detail, '') end,
        'debug', case when v_state <> 'P0001' then v_state || ': ' || v_message end));
    end;
  end loop;

  if v_applied > 0 then
    perform kpi.mark_dirty();
  end if;
  return jsonb_build_object('applied', v_applied, 'rejected', v_rejected, 'results', v_results);
end;
$$;

-- ---------------------------------------------------------------------------------------------
-- Invites
-- ---------------------------------------------------------------------------------------------
create or replace function api.invite_create(p_uid uuid, p_input jsonb)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_role public.invite_role_kind := (p_input->>'role_kind')::public.invite_role_kind;
  v_table public.round_tables;
  v_org uuid;
  v_person public.people;
  v_invite_id uuid;
begin
  if p_uid is null then
    perform app.fail('unauthenticated', 'Inicia sesión para continuar.');
  end if;
  if v_role is null then
    perform app.fail('validation_failed', 'Elige el rol de la persona invitada.');
  end if;

  if v_role in ('facilitator', 'member') then
    select * into v_table from public.round_tables
    where id = (p_input->>'round_table_id')::uuid;
    if not found then
      perform app.fail('validation_failed', 'Elige la mesa a la que se invita.');
    end if;
    v_org := v_table.organization_id;
    if v_table.status not in ('active', 'paused') then
      perform app.fail('table_not_active', 'La mesa está cerrada o completó el programa.');
    end if;
  else
    v_org := (p_input->>'organization_id')::uuid;
    if v_org is null then
      perform app.fail('validation_failed', 'Elige la organización.');
    end if;
  end if;

  -- Coordinators and platform admins invite any role in the organization; a facilitator
  -- invites members to their own table only.
  if not app.manages_org_for(p_uid, v_org)
     and not (v_role = 'member' and v_table.id in (select app.facilitator_tables_for(p_uid))) then
    perform app.fail('forbidden', 'No tienes permiso para invitar con este rol.');
  end if;
  perform app.require_active_org(v_org);

  if p_input ? 'person_id' and p_input->>'person_id' is not null then
    select * into v_person from public.people
    where id = (p_input->>'person_id')::uuid and organization_id = v_org;
    if not found then
      perform app.fail('not_found', 'La persona no existe en esta organización.');
    end if;
  else
    v_person := app.create_person(v_org, coalesce(p_input->'person', '{}'::jsonb));
  end if;

  v_invite_id := app.create_invite(p_uid, v_org, v_person, v_role, v_table.id,
                                   (p_input->>'expires_in_days')::integer);
  return app.invite_json(v_invite_id);
end;
$$;

create or replace function app.require_invite_manager(p_uid uuid, p_invite public.invites)
returns void
language plpgsql
stable
security definer
set search_path = ''
as $$
begin
  if p_uid is null then
    perform app.fail('unauthenticated', 'Inicia sesión para continuar.');
  end if;
  if not app.manages_org_for(p_uid, p_invite.organization_id)
     and not (p_invite.role_kind = 'member'
              and p_invite.round_table_id in (select app.facilitator_tables_for(p_uid))) then
    perform app.fail('forbidden', 'No tienes permiso para gestionar esta invitación.');
  end if;
end;
$$;

create or replace function api.invite_list(p_uid uuid, p_input jsonb)
returns jsonb
language plpgsql
stable
security definer
set search_path = ''
as $$
declare
  v_table_id uuid := (p_input->>'round_table_id')::uuid;
  v_org uuid := (p_input->>'organization_id')::uuid;
  v_status text := p_input->>'status';
begin
  if p_uid is null then
    perform app.fail('unauthenticated', 'Inicia sesión para continuar.');
  end if;
  if v_table_id is not null then
    select organization_id into v_org from public.round_tables where id = v_table_id;
    if not app.manages_org_for(p_uid, v_org)
       and v_table_id not in (select app.facilitator_tables_for(p_uid)) then
      perform app.fail('forbidden', 'No tienes permiso para ver estas invitaciones.');
    end if;
  elsif v_org is not null then
    perform app.require_manages_org(p_uid, v_org);
  else
    perform app.require_platform_admin(p_uid);
  end if;

  return coalesce((
    select jsonb_agg(app.invite_json(i.id) order by i.created_at desc)
    from public.invites i
    where (v_table_id is null or i.round_table_id = v_table_id)
      and (v_org is null or i.organization_id = v_org)
      and (v_status is null or app.invite_effective_status(i)::text = v_status)
  ), '[]'::jsonb);
end;
$$;

create or replace function api.invite_revoke(p_uid uuid, p_input jsonb)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_invite public.invites;
  v_person public.people;
  v_actor uuid;
begin
  select * into v_invite from public.invites where id = (p_input->>'invite_id')::uuid for update;
  if not found then
    perform app.fail('invite_not_found', 'La invitación no existe.');
  end if;
  perform app.require_invite_manager(p_uid, v_invite);
  if v_invite.status = 'accepted' then
    perform app.fail('invite_already_used', 'Esta invitación ya fue aceptada.');
  end if;
  if v_invite.status = 'revoked' then
    return app.invite_json(v_invite.id);
  end if;

  v_actor := app.actor_person(p_uid, v_invite.organization_id);
  update public.invites set status = 'revoked', revoked_at = now(), revoked_by_person_id = v_actor
  where id = v_invite.id;

  -- An invited person who never signed in loses the seat/role the invite reserved.
  select * into v_person from public.people where id = v_invite.person_id for update;
  if v_person.auth_user_id is null then
    if v_invite.round_table_id is not null then
      update public.table_members set status = 'inactive', left_reason = 'invite_revoked'
      where round_table_id = v_invite.round_table_id and person_id = v_person.id
        and status = 'active';
    else
      update public.role_assignments set status = 'inactive', revoked_at = now()
      where person_id = v_person.id and role = 'coordinator'
        and organization_id = v_invite.organization_id and status = 'active';
    end if;
    if not exists (select 1 from public.table_members where person_id = v_person.id and status = 'active')
       and not exists (select 1 from public.role_assignments where person_id = v_person.id and status = 'active')
       and not exists (select 1 from public.invites where person_id = v_person.id and status = 'pending') then
      update public.people set status = 'inactive' where id = v_person.id;
    end if;
  end if;

  perform app.audit(p_uid, v_actor, v_invite.organization_id, 'invite.revoked', 'invite',
    v_invite.id, jsonb_build_object('person_id', v_invite.person_id));
  return app.invite_json(v_invite.id);
end;
$$;

create or replace function api.invite_renew(p_uid uuid, p_input jsonb)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_invite public.invites;
  v_actor uuid;
begin
  select * into v_invite from public.invites where id = (p_input->>'invite_id')::uuid for update;
  if not found then
    perform app.fail('invite_not_found', 'La invitación no existe.');
  end if;
  perform app.require_invite_manager(p_uid, v_invite);
  if v_invite.status = 'accepted' then
    perform app.fail('invite_already_used', 'Esta invitación ya fue aceptada.');
  end if;
  if v_invite.status = 'revoked' then
    perform app.fail('invite_revoked', 'La invitación fue revocada. Crea una nueva.');
  end if;

  v_actor := app.actor_person(p_uid, v_invite.organization_id);
  update public.invites set
    code = app.new_invite_code(),
    status = 'pending',
    expires_at = now() + make_interval(days =>
      greatest(1, least(coalesce((p_input->>'expires_in_days')::integer, 14), 60)))
  where id = v_invite.id;
  perform app.audit(p_uid, v_actor, v_invite.organization_id, 'invite.renewed', 'invite',
    v_invite.id, '{}'::jsonb);
  return app.invite_json(v_invite.id);
end;
$$;

-- Anonymous-safe preview: only what the welcome card needs. Errors for unusable invites.
create or replace function api.invite_preview(p_code text)
returns jsonb
language plpgsql
stable
security definer
set search_path = ''
as $$
declare
  v_invite public.invites;
  v_status public.invite_status;
begin
  select * into v_invite from public.invites where code = app.normalize_invite_code(p_code);
  if not found then
    perform app.fail('invite_not_found', 'No encontramos ese código. Revisa las letras y números.');
  end if;
  v_status := app.invite_effective_status(v_invite);
  if v_status = 'expired' then
    perform app.fail('invite_expired', 'Esta invitación venció. Pide una nueva a quien te invitó.');
  elsif v_status = 'revoked' then
    perform app.fail('invite_revoked', 'Esta invitación fue anulada. Pide una nueva a quien te invitó.');
  elsif v_status = 'accepted' then
    perform app.fail('invite_already_used', 'Esta invitación ya se usó. Inicia sesión con tu cuenta.');
  end if;

  return (
    select jsonb_build_object(
      'code', v_invite.code, 'status', v_status, 'role_kind', v_invite.role_kind,
      'organization_name', o.name, 'round_table_name', rt.name,
      'person_first_name', p.first_name,
      'invited_by_name', nullif(btrim(coalesce(ib.first_name, '') || ' ' || coalesce(ib.last_name, '')), ''),
      'expires_at', v_invite.expires_at)
    from public.organizations o
    join public.people p on p.id = v_invite.person_id
    left join public.round_tables rt on rt.id = v_invite.round_table_id
    left join public.people ib on ib.id = v_invite.invited_by_person_id
    where o.id = v_invite.organization_id);
end;
$$;

-- Binds the signed-in identity to the pre-registered person (ADR 0007).
-- p_input: {code, profile?: {first_name, last_name, position, phone}}
create or replace function api.invite_redeem(p_uid uuid, p_email text, p_input jsonb)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_invite public.invites;
  v_person public.people;
  v_profile jsonb := coalesce(p_input->'profile', '{}'::jsonb);
begin
  if p_uid is null then
    perform app.fail('unauthenticated', 'Inicia sesión para continuar.');
  end if;
  select * into v_invite from public.invites
  where code = app.normalize_invite_code(p_input->>'code') for update;
  if not found then
    perform app.fail('invite_not_found', 'No encontramos ese código. Revisa las letras y números.');
  end if;
  if v_invite.status = 'revoked' then
    perform app.fail('invite_revoked', 'Esta invitación fue anulada. Pide una nueva a quien te invitó.');
  end if;
  if v_invite.status = 'accepted' then
    if v_invite.accepted_auth_user_id = p_uid then
      return jsonb_build_object('already_redeemed', true,
        'person', (select app.person_json(p) from public.people p where p.id = v_invite.person_id),
        'invite', app.invite_json(v_invite.id), 'contexts', app.contexts_for(p_uid));
    end if;
    perform app.fail('invite_already_used', 'Esta invitación ya se usó con otra cuenta.');
  end if;
  if v_invite.expires_at < now() then
    perform app.fail('invite_expired', 'Esta invitación venció. Pide una nueva a quien te invitó.');
  end if;
  perform app.require_active_org(v_invite.organization_id);

  select * into v_person from public.people where id = v_invite.person_id for update;
  if v_person.status = 'inactive' then
    perform app.fail('person_inactive', 'Esta persona fue desactivada. Habla con tu coordinador.');
  end if;
  if v_person.auth_user_id is not null and v_person.auth_user_id <> p_uid then
    perform app.fail('person_linked_elsewhere',
      'Esta invitación pertenece a una persona que ya está vinculada a otra cuenta.');
  end if;
  if exists (select 1 from public.people
             where organization_id = v_invite.organization_id and auth_user_id = p_uid
               and id <> v_person.id) then
    perform app.fail('identity_linked_elsewhere',
      'Tu cuenta ya está vinculada a otra persona de esta organización.');
  end if;

  update public.people set
    auth_user_id = p_uid,
    status = 'active',
    email = coalesce(email, nullif(lower(btrim(p_email)), '')),
    first_name = coalesce(nullif(btrim(v_profile->>'first_name'), ''), first_name),
    last_name = coalesce(nullif(btrim(v_profile->>'last_name'), ''), last_name),
    position = case when v_profile ? 'position' then nullif(btrim(v_profile->>'position'), '')
                    else position end,
    phone = case when v_profile ? 'phone' then nullif(btrim(v_profile->>'phone'), '')
                 else phone end
  where id = v_person.id
  returning * into v_person;

  update public.invites set status = 'accepted', accepted_at = now(), accepted_auth_user_id = p_uid
  where id = v_invite.id;

  perform app.audit(p_uid, v_person.id, v_invite.organization_id, 'invite.accepted', 'invite',
    v_invite.id, jsonb_build_object('person_id', v_person.id, 'role_kind', v_invite.role_kind));

  return jsonb_build_object('already_redeemed', false, 'person', app.person_json(v_person),
    'invite', app.invite_json(v_invite.id), 'contexts', app.contexts_for(p_uid));
end;
$$;

-- ---------------------------------------------------------------------------------------------
-- Profile (any signed-in user) — updates every person bound to the identity.
-- ---------------------------------------------------------------------------------------------
create or replace function api.profile_update(p_uid uuid, p_input jsonb)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
begin
  if p_uid is null or not exists (select 1 from public.people where auth_user_id = p_uid) then
    perform app.fail('no_person', 'Tu cuenta todavía no está vinculada a ninguna invitación.');
  end if;
  update public.people set
    first_name = coalesce(nullif(btrim(p_input->>'first_name'), ''), first_name),
    last_name = coalesce(nullif(btrim(p_input->>'last_name'), ''), last_name),
    position = case when p_input ? 'position' then nullif(btrim(p_input->>'position'), '') else position end,
    phone = case when p_input ? 'phone' then nullif(btrim(p_input->>'phone'), '') else phone end
  where auth_user_id = p_uid and status <> 'inactive';
  return jsonb_build_object(
    'people', (select jsonb_agg(app.person_json(p)) from public.people p where p.auth_user_id = p_uid),
    'contexts', app.contexts_for(p_uid));
end;
$$;

create or replace function api.me(p_uid uuid)
returns jsonb
language sql
stable
security definer
set search_path = ''
as $$
  select jsonb_build_object(
    'auth_user_id', p_uid,
    'is_platform_admin', app.is_platform_admin_for(p_uid),
    'people', coalesce((select jsonb_agg(app.person_json(p)) from public.people p
                        where p.auth_user_id = p_uid), '[]'::jsonb),
    'contexts', app.contexts_for(p_uid));
$$;

-- ---------------------------------------------------------------------------------------------
-- Administration (online-only, ADR 0003)
-- ---------------------------------------------------------------------------------------------
create or replace function api.organization_create(p_uid uuid, p_input jsonb)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_org public.organizations;
begin
  perform app.require_platform_admin(p_uid);
  insert into public.organizations (name, kind, country_code, country_name, region, contact_name,
                                    contact_email, contact_phone)
  values (btrim(p_input->>'name'), coalesce(p_input->>'kind', 'other'),
          upper(btrim(p_input->>'country_code')), btrim(p_input->>'country_name'),
          nullif(btrim(p_input->>'region'), ''), nullif(btrim(p_input->>'contact_name'), ''),
          nullif(lower(btrim(p_input->>'contact_email')), ''),
          nullif(btrim(p_input->>'contact_phone'), ''))
  returning * into v_org;
  perform app.audit(p_uid, app.actor_person(p_uid, null), v_org.id, 'organization.created',
    'organization', v_org.id, jsonb_build_object('name', v_org.name));
  return to_jsonb(v_org);
end;
$$;

create or replace function api.organization_update(p_uid uuid, p_input jsonb)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_org public.organizations;
begin
  perform app.require_platform_admin(p_uid);
  update public.organizations set
    name = coalesce(nullif(btrim(p_input->>'name'), ''), name),
    kind = coalesce(p_input->>'kind', kind),
    country_code = coalesce(upper(btrim(p_input->>'country_code')), country_code),
    country_name = coalesce(nullif(btrim(p_input->>'country_name'), ''), country_name),
    region = case when p_input ? 'region' then nullif(btrim(p_input->>'region'), '') else region end,
    contact_name = case when p_input ? 'contact_name' then nullif(btrim(p_input->>'contact_name'), '') else contact_name end,
    contact_email = case when p_input ? 'contact_email' then nullif(lower(btrim(p_input->>'contact_email')), '') else contact_email end,
    contact_phone = case when p_input ? 'contact_phone' then nullif(btrim(p_input->>'contact_phone'), '') else contact_phone end
  where id = (p_input->>'organization_id')::uuid
  returning * into v_org;
  if v_org.id is null then
    perform app.fail('not_found', 'La organización no existe.');
  end if;
  perform app.audit(p_uid, app.actor_person(p_uid, null), v_org.id, 'organization.updated',
    'organization', v_org.id, p_input - 'organization_id');
  return to_jsonb(v_org);
end;
$$;

create or replace function api.organization_set_status(p_uid uuid, p_input jsonb)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_before public.organizations;
  v_org public.organizations;
begin
  perform app.require_platform_admin(p_uid);
  select * into v_before from public.organizations
  where id = (p_input->>'organization_id')::uuid for update;
  if not found then
    perform app.fail('not_found', 'La organización no existe.');
  end if;
  update public.organizations
  set status = (p_input->>'status')::public.organization_status
  where id = v_before.id
  returning * into v_org;
  perform app.audit(p_uid, app.actor_person(p_uid, null), v_org.id, 'organization.status_changed',
    'organization', v_org.id, jsonb_build_object('from', v_before.status, 'to', v_org.status));
  return to_jsonb(v_org);
end;
$$;

create or replace function api.location_create(p_uid uuid, p_input jsonb)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_org uuid := (p_input->>'organization_id')::uuid;
  v_loc public.locations;
begin
  perform app.require_manages_org(p_uid, v_org);
  perform app.require_active_org(v_org);
  insert into public.locations (organization_id, name, city, region, address)
  values (v_org, btrim(p_input->>'name'), nullif(btrim(p_input->>'city'), ''),
          nullif(btrim(p_input->>'region'), ''), nullif(btrim(p_input->>'address'), ''))
  returning * into v_loc;
  perform app.audit(p_uid, app.actor_person(p_uid, v_org), v_org, 'location.created', 'location',
    v_loc.id, jsonb_build_object('name', v_loc.name));
  return to_jsonb(v_loc);
end;
$$;

create or replace function api.location_update(p_uid uuid, p_input jsonb)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_loc public.locations;
begin
  select * into v_loc from public.locations where id = (p_input->>'location_id')::uuid for update;
  if not found then
    perform app.fail('not_found', 'La ubicación no existe.');
  end if;
  perform app.require_manages_org(p_uid, v_loc.organization_id);
  update public.locations set
    name = coalesce(nullif(btrim(p_input->>'name'), ''), name),
    city = case when p_input ? 'city' then nullif(btrim(p_input->>'city'), '') else city end,
    region = case when p_input ? 'region' then nullif(btrim(p_input->>'region'), '') else region end,
    address = case when p_input ? 'address' then nullif(btrim(p_input->>'address'), '') else address end,
    status = coalesce((p_input->>'status')::public.record_status, status)
  where id = v_loc.id
  returning * into v_loc;
  perform app.audit(p_uid, app.actor_person(p_uid, v_loc.organization_id), v_loc.organization_id,
    'location.updated', 'location', v_loc.id, p_input - 'location_id');
  return to_jsonb(v_loc);
end;
$$;

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
                                                  'value_id', s.value_id,
                                                  'follow_up_value_id', s.follow_up_value_id)
                        from public.sessions s
                        where s.round_table_id = rt.id and s.status in ('scheduled', 'open')))
  from public.round_tables rt
  join public.locations l on l.id = rt.location_id
  where rt.id = p_round_table_id;
$$;

-- p_input: {organization_id, location_id, name, code, weekday, start_time, timezone,
--           duration_minutes?, start_value_id?, first_session_after?,
--           facilitator: {person_id} | {person: {...}}}
create or replace function api.table_create(p_uid uuid, p_input jsonb)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_org uuid := (p_input->>'organization_id')::uuid;
  v_table public.round_tables;
  v_fac jsonb := p_input->'facilitator';
  v_person public.people;
  v_invite_id uuid;
begin
  perform app.require_manages_org(p_uid, v_org);
  perform app.require_active_org(v_org);
  if v_fac is null or (v_fac->>'person_id' is null and v_fac->'person' is null) then
    perform app.fail('facilitator_required', 'Asigna un facilitador a la mesa.');
  end if;

  insert into public.round_tables (organization_id, location_id, name, code, weekday, start_time,
                                   timezone, duration_minutes, current_value_id)
  values (v_org, (p_input->>'location_id')::uuid, btrim(p_input->>'name'), p_input->>'code',
          (p_input->>'weekday')::smallint, (p_input->>'start_time')::time,
          coalesce(p_input->>'timezone', 'America/Santo_Domingo'),
          coalesce((p_input->>'duration_minutes')::smallint, 30),
          coalesce((p_input->>'start_value_id')::uuid, app.first_value_id()))
  returning * into v_table;

  if v_fac->>'person_id' is not null then
    select * into v_person from public.people
    where id = (v_fac->>'person_id')::uuid and organization_id = v_org;
    if not found then
      perform app.fail('not_found', 'El facilitador no existe en esta organización.');
    end if;
    if v_person.auth_user_id is null then
      v_invite_id := app.create_invite(p_uid, v_org, v_person, 'facilitator', v_table.id);
    else
      insert into public.table_members (organization_id, round_table_id, person_id, role)
      values (v_org, v_table.id, v_person.id, 'facilitator');
    end if;
  else
    v_person := app.create_person(v_org, v_fac->'person');
    v_invite_id := app.create_invite(p_uid, v_org, v_person, 'facilitator', v_table.id);
  end if;

  perform app.schedule_next_session(v_table.id,
    coalesce((p_input->>'first_session_after')::timestamptz, now()));
  perform app.audit(p_uid, app.actor_person(p_uid, v_org), v_org, 'table.created', 'round_table',
    v_table.id, jsonb_build_object('name', v_table.name, 'code', v_table.code,
                                   'facilitator_person_id', v_person.id));
  perform kpi.mark_dirty();
  return app.table_json(v_table.id) || jsonb_build_object(
    'facilitator_invite', case when v_invite_id is not null then app.invite_json(v_invite_id) end);
end;
$$;

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
begin
  select * into v_before from public.round_tables
  where id = (p_input->>'round_table_id')::uuid for update;
  if not found then
    perform app.fail('not_found', 'La mesa no existe.');
  end if;
  perform app.require_manages_org(p_uid, v_before.organization_id);

  update public.round_tables set
    name = coalesce(nullif(btrim(p_input->>'name'), ''), name),
    code = coalesce(p_input->>'code', code),
    location_id = coalesce((p_input->>'location_id')::uuid, location_id),
    weekday = coalesce((p_input->>'weekday')::smallint, weekday),
    start_time = coalesce((p_input->>'start_time')::time, start_time),
    timezone = coalesce(p_input->>'timezone', timezone),
    duration_minutes = coalesce((p_input->>'duration_minutes')::smallint, duration_minutes),
    status = coalesce((p_input->>'status')::public.round_table_status, status),
    current_value_id = case when p_input ? 'current_value_id'
                            then (p_input->>'current_value_id')::uuid else current_value_id end
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

  -- Schedule changed (RF-23): the pending, not yet opened session moves to the new slot.
  if (v_after.weekday, v_after.start_time, v_after.timezone)
       is distinct from (v_before.weekday, v_before.start_time, v_before.timezone)
     and v_pending.status = 'scheduled' then
    update public.sessions set scheduled_at = app.next_slot(v_after.id, v_after.weekday,
      v_after.start_time, v_after.timezone, now())
    where id = v_pending.id;
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
    'table.updated', 'round_table', v_after.id, p_input - 'round_table_id');
  perform kpi.mark_dirty();
  return app.table_json(v_after.id);
end;
$$;

-- Assign or change a table's facilitator, preserving history (RF-16).
-- p_input: {round_table_id, person_id? | person?, keep_previous_as_member?}
create or replace function api.table_set_facilitator(p_uid uuid, p_input jsonb)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_table public.round_tables;
  v_previous public.table_members;
  v_person public.people;
  v_invite_id uuid;
begin
  select * into v_table from public.round_tables
  where id = (p_input->>'round_table_id')::uuid for update;
  if not found then
    perform app.fail('not_found', 'La mesa no existe.');
  end if;
  perform app.require_manages_org(p_uid, v_table.organization_id);
  perform app.require_active_org(v_table.organization_id);

  if p_input->>'person_id' is not null then
    select * into v_person from public.people
    where id = (p_input->>'person_id')::uuid and organization_id = v_table.organization_id;
    if not found then
      perform app.fail('not_found', 'La persona no existe en esta organización.');
    end if;
  elsif p_input->'person' is not null then
    v_person := app.create_person(v_table.organization_id, p_input->'person');
  else
    perform app.fail('facilitator_required', 'Elige al nuevo facilitador.');
  end if;

  select * into v_previous from public.table_members
  where round_table_id = v_table.id and role = 'facilitator' and status = 'active' for update;
  if v_previous.person_id = v_person.id then
    return app.table_json(v_table.id);
  end if;
  if v_previous.id is not null then
    update public.table_members set status = 'inactive', left_reason = 'facilitator_changed'
    where id = v_previous.id;
  end if;
  update public.table_members set status = 'inactive', left_reason = 'facilitator_changed'
  where round_table_id = v_table.id and person_id = v_person.id and status = 'active';

  if v_person.auth_user_id is null then
    v_invite_id := app.create_invite(p_uid, v_table.organization_id, v_person, 'facilitator',
                                     v_table.id);
  else
    insert into public.table_members (organization_id, round_table_id, person_id, role)
    values (v_table.organization_id, v_table.id, v_person.id, 'facilitator');
  end if;

  if coalesce((p_input->>'keep_previous_as_member')::boolean, false) and v_previous.id is not null then
    insert into public.table_members (organization_id, round_table_id, person_id, role)
    values (v_table.organization_id, v_table.id, v_previous.person_id, 'member');
  end if;

  perform app.audit(p_uid, app.actor_person(p_uid, v_table.organization_id), v_table.organization_id,
    'table.facilitator_changed', 'round_table', v_table.id,
    jsonb_build_object('from_person_id', v_previous.person_id, 'to_person_id', v_person.id,
                       'keep_previous_as_member',
                       coalesce((p_input->>'keep_previous_as_member')::boolean, false)));
  return app.table_json(v_table.id) || jsonb_build_object(
    'facilitator_invite', case when v_invite_id is not null then app.invite_json(v_invite_id) end);
end;
$$;

-- Adds an existing person of the organization to a table as member.
create or replace function api.member_add(p_uid uuid, p_input jsonb)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_table public.round_tables;
  v_member public.table_members;
begin
  select * into v_table from public.round_tables where id = (p_input->>'round_table_id')::uuid;
  if not found then
    perform app.fail('not_found', 'La mesa no existe.');
  end if;
  perform app.require_manages_org(p_uid, v_table.organization_id);
  perform app.require_active_org(v_table.organization_id);
  if not exists (select 1 from public.people where id = (p_input->>'person_id')::uuid
                 and organization_id = v_table.organization_id) then
    perform app.fail('not_found', 'La persona no existe en esta organización.');
  end if;
  if exists (select 1 from public.table_members where round_table_id = v_table.id
             and person_id = (p_input->>'person_id')::uuid and status = 'active') then
    perform app.fail('already_member', 'La persona ya está en esta mesa.');
  end if;
  insert into public.table_members (organization_id, round_table_id, person_id, role)
  values (v_table.organization_id, v_table.id, (p_input->>'person_id')::uuid, 'member')
  returning * into v_member;
  perform app.audit(p_uid, app.actor_person(p_uid, v_table.organization_id), v_table.organization_id,
    'member.added', 'table_member', v_member.id,
    jsonb_build_object('round_table_id', v_table.id, 'person_id', v_member.person_id));
  return to_jsonb(v_member);
end;
$$;

-- Moves a member to another table of the same organization, keeping history (RF-15).
create or replace function api.member_move(p_uid uuid, p_input jsonb)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_member public.table_members;
  v_target public.round_tables;
  v_new public.table_members;
begin
  select * into v_member from public.table_members
  where id = (p_input->>'table_member_id')::uuid and status = 'active' for update;
  if not found then
    perform app.fail('not_found', 'La membresía no existe o ya terminó.');
  end if;
  perform app.require_manages_org(p_uid, v_member.organization_id);
  if v_member.role = 'facilitator' then
    perform app.fail('cannot_move_facilitator',
      'Primero asigna otro facilitador a la mesa; luego mueve a esta persona.');
  end if;
  select * into v_target from public.round_tables
  where id = (p_input->>'to_round_table_id')::uuid and organization_id = v_member.organization_id;
  if not found then
    perform app.fail('not_found', 'La mesa de destino no existe en esta organización.');
  end if;
  if v_target.id = v_member.round_table_id then
    perform app.fail('validation_failed', 'La persona ya está en esa mesa.');
  end if;

  update public.table_members
  set status = 'inactive', left_reason = 'moved', moved_to_round_table_id = v_target.id
  where id = v_member.id;
  insert into public.table_members (organization_id, round_table_id, person_id, role)
  values (v_member.organization_id, v_target.id, v_member.person_id, 'member')
  returning * into v_new;

  perform app.audit(p_uid, app.actor_person(p_uid, v_member.organization_id), v_member.organization_id,
    'member.moved', 'table_member', v_new.id,
    jsonb_build_object('person_id', v_member.person_id, 'from_round_table_id', v_member.round_table_id,
                       'to_round_table_id', v_target.id));
  return to_jsonb(v_new);
end;
$$;

-- Ends a membership without deleting history (RF-14). Coordinators/admins, or the table's
-- facilitator for members of their own table.
create or replace function api.member_deactivate(p_uid uuid, p_input jsonb)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_member public.table_members;
begin
  select * into v_member from public.table_members
  where id = (p_input->>'table_member_id')::uuid and status = 'active' for update;
  if not found then
    perform app.fail('not_found', 'La membresía no existe o ya terminó.');
  end if;
  if not app.manages_org_for(p_uid, v_member.organization_id)
     and v_member.round_table_id not in (select app.facilitator_tables_for(p_uid)) then
    perform app.fail('forbidden', 'No tienes permiso para retirar a esta persona.');
  end if;
  if v_member.role = 'facilitator' then
    perform app.fail('cannot_remove_facilitator',
      'Para retirar al facilitador, asigna primero uno nuevo.');
  end if;
  update public.table_members set status = 'inactive', left_reason = 'deactivated'
  where id = v_member.id
  returning * into v_member;
  update public.invites set status = 'revoked', revoked_at = now(),
    revoked_by_person_id = app.actor_person(p_uid, v_member.organization_id)
  where person_id = v_member.person_id and round_table_id = v_member.round_table_id
    and status = 'pending';
  perform app.audit(p_uid, app.actor_person(p_uid, v_member.organization_id), v_member.organization_id,
    'member.deactivated', 'table_member', v_member.id,
    jsonb_build_object('person_id', v_member.person_id, 'round_table_id', v_member.round_table_id));
  return to_jsonb(v_member);
end;
$$;

create or replace function api.person_update(p_uid uuid, p_input jsonb)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_person public.people;
  v_status public.person_status := (p_input->>'status')::public.person_status;
begin
  select * into v_person from public.people where id = (p_input->>'person_id')::uuid for update;
  if not found then
    perform app.fail('not_found', 'La persona no existe.');
  end if;
  if v_person.organization_id is null then
    perform app.require_platform_admin(p_uid);
  else
    perform app.require_manages_org(p_uid, v_person.organization_id);
  end if;

  update public.people set
    first_name = coalesce(nullif(btrim(p_input->>'first_name'), ''), first_name),
    last_name = coalesce(nullif(btrim(p_input->>'last_name'), ''), last_name),
    position = case when p_input ? 'position' then nullif(btrim(p_input->>'position'), '') else position end,
    email = case when p_input ? 'email' then nullif(lower(btrim(p_input->>'email')), '') else email end,
    phone = case when p_input ? 'phone' then nullif(btrim(p_input->>'phone'), '') else phone end,
    status = case
      when v_status = 'inactive' then 'inactive'::public.person_status
      when v_status = 'active' and status = 'inactive'
        then case when auth_user_id is null then 'invited'::public.person_status
                  else 'active'::public.person_status end
      else status end
  where id = v_person.id
  returning * into v_person;

  if v_status = 'inactive' then
    update public.table_members set status = 'inactive', left_reason = 'deactivated'
    where person_id = v_person.id and status = 'active';
    update public.role_assignments set status = 'inactive', revoked_at = now()
    where person_id = v_person.id and status = 'active';
    update public.invites set status = 'revoked', revoked_at = now()
    where person_id = v_person.id and status = 'pending';
  end if;

  perform app.audit(p_uid, app.actor_person(p_uid, v_person.organization_id), v_person.organization_id,
    case when v_status = 'inactive' then 'person.deactivated' else 'person.updated' end,
    'person', v_person.id, p_input - 'person_id');
  return app.person_json(v_person);
end;
$$;

create or replace function api.role_grant(p_uid uuid, p_input jsonb)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_role public.role_kind := (p_input->>'role')::public.role_kind;
  v_person public.people;
  v_assignment public.role_assignments;
begin
  select * into v_person from public.people where id = (p_input->>'person_id')::uuid;
  if not found or v_person.status = 'inactive' then
    perform app.fail('not_found', 'La persona no existe o está desactivada.');
  end if;
  if v_role = 'platform_admin' then
    perform app.require_platform_admin(p_uid);
    if v_person.organization_id is not null then
      perform app.fail('validation_failed',
        'El rol de administrador de plataforma es solo para personal de la iglesia.');
    end if;
  else
    if v_person.organization_id is null then
      perform app.fail('validation_failed', 'La persona no pertenece a una organización.');
    end if;
    perform app.require_manages_org(p_uid, v_person.organization_id);
  end if;

  select * into v_assignment from public.role_assignments
  where person_id = v_person.id and role = v_role and status = 'active'
    and organization_id is not distinct from v_person.organization_id;
  if v_assignment.id is null then
    insert into public.role_assignments (person_id, role, organization_id, location_id,
                                         granted_by_person_id)
    values (v_person.id, v_role, v_person.organization_id,
            case when v_role = 'coordinator' then (p_input->>'location_id')::uuid end,
            app.actor_person(p_uid, v_person.organization_id))
    returning * into v_assignment;
    perform app.audit(p_uid, app.actor_person(p_uid, v_person.organization_id),
      v_person.organization_id, 'role.granted', 'role_assignment', v_assignment.id,
      jsonb_build_object('person_id', v_person.id, 'role', v_role));
  end if;
  return to_jsonb(v_assignment);
end;
$$;

create or replace function api.role_revoke(p_uid uuid, p_input jsonb)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_assignment public.role_assignments;
begin
  select * into v_assignment from public.role_assignments
  where id = (p_input->>'role_assignment_id')::uuid for update;
  if not found then
    perform app.fail('not_found', 'La asignación de rol no existe.');
  end if;
  if v_assignment.role = 'platform_admin' then
    perform app.require_platform_admin(p_uid);
    if (select count(*) from public.role_assignments
        where role = 'platform_admin' and status = 'active') <= 1 then
      perform app.fail('last_platform_admin', 'Debe quedar al menos un administrador de plataforma.');
    end if;
  else
    perform app.require_manages_org(p_uid, v_assignment.organization_id);
  end if;
  update public.role_assignments set status = 'inactive', revoked_at = now()
  where id = v_assignment.id
  returning * into v_assignment;
  perform app.audit(p_uid, app.actor_person(p_uid, v_assignment.organization_id),
    v_assignment.organization_id, 'role.revoked', 'role_assignment', v_assignment.id,
    jsonb_build_object('person_id', v_assignment.person_id, 'role', v_assignment.role));
  return to_jsonb(v_assignment);
end;
$$;

-- ---------------------------------------------------------------------------------------------
-- Answers reveal (logged access to individual free text; ADR 0015, PC-10)
-- p_input: {round_table_id, session_id?, person_id?, value_id?}
-- ---------------------------------------------------------------------------------------------
create or replace function api.answers_reveal(p_uid uuid, p_input jsonb)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_table public.round_tables;
  v_session uuid := (p_input->>'session_id')::uuid;
  v_person uuid := (p_input->>'person_id')::uuid;
  v_value uuid := (p_input->>'value_id')::uuid;
  v_result jsonb;
begin
  if p_uid is null then
    perform app.fail('unauthenticated', 'Inicia sesión para continuar.');
  end if;
  select * into v_table from public.round_tables where id = (p_input->>'round_table_id')::uuid;
  if not found then
    perform app.fail('not_found', 'La mesa no existe.');
  end if;
  if not app.manages_org_for(p_uid, v_table.organization_id)
     and v_table.id not in (select app.facilitator_tables_for(p_uid)) then
    perform app.fail('forbidden', 'No tienes permiso para ver respuestas individuales.');
  end if;

  select coalesce(jsonb_agg(person_block order by person_block->>'last_name'), '[]'::jsonb)
  into v_result
  from (
    select jsonb_build_object(
      'person_id', p.id, 'first_name', p.first_name, 'last_name', p.last_name,
      'assessments', coalesce((
        select jsonb_agg(jsonb_build_object(
          'id', a.id, 'session_id', a.session_id, 'value_id', a.value_id, 'value_name', cv.name,
          'kind', a.kind, 'score', a.score, 'justification', a.justification,
          'synced_late', a.synced_late, 'device_created_at', a.device_created_at)
          order by cv.sequence, a.kind)
        from public.member_assessments a
        join public.curriculum_values cv on cv.id = a.value_id
        where a.round_table_id = v_table.id and a.person_id = p.id
          and (v_session is null or a.session_id = v_session)
          and (v_value is null or a.value_id = v_value)), '[]'::jsonb),
      'answers', coalesce((
        select jsonb_agg(jsonb_build_object(
          'id', an.id, 'session_id', an.session_id, 'value_id', an.value_id,
          'question_id', an.question_id, 'question_text', q.question_text,
          'answer_text', an.answer_text, 'synced_late', an.synced_late)
          order by q.sort_order)
        from public.member_answers an
        join public.value_questions q on q.id = an.question_id
        where an.round_table_id = v_table.id and an.person_id = p.id
          and (v_session is null or an.session_id = v_session)
          and (v_value is null or an.value_id = v_value)), '[]'::jsonb),
      'commitments', coalesce((
        select jsonb_agg(jsonb_build_object(
          'id', c.id, 'session_id', c.session_id, 'value_id', c.value_id,
          'action_text', c.action_text, 'measure_text', c.measure_text,
          'follow_up_status', c.follow_up_status, 'follow_up_note', c.follow_up_note,
          'follow_up_session_id', c.follow_up_session_id, 'synced_late', c.synced_late))
        from public.member_commitments c
        where c.round_table_id = v_table.id and c.person_id = p.id
          and (v_session is null or c.session_id = v_session)
          and (v_value is null or c.value_id = v_value)), '[]'::jsonb)
    ) as person_block
    from public.people p
    where p.id in (select tm.person_id from public.table_members tm
                   where tm.round_table_id = v_table.id)
      and (v_person is null or p.id = v_person)
  ) blocks;

  perform app.audit(p_uid, app.actor_person(p_uid, v_table.organization_id), v_table.organization_id,
    'answers.revealed', 'round_table', v_table.id,
    jsonb_build_object('session_id', v_session, 'person_id', v_person, 'value_id', v_value));
  return jsonb_build_object('round_table_id', v_table.id, 'people', v_result,
                            'sensitive', true, 'revealed_at', now());
end;
$$;

-- ---------------------------------------------------------------------------------------------
-- Device tokens (notifications function)
-- ---------------------------------------------------------------------------------------------
create or replace function api.device_token_register(p_uid uuid, p_input jsonb)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_row public.device_tokens;
begin
  if p_uid is null then
    perform app.fail('unauthenticated', 'Inicia sesión para continuar.');
  end if;
  insert into public.device_tokens (auth_user_id, token, platform)
  values (p_uid, p_input->>'token', (p_input->>'platform')::public.device_platform)
  on conflict (token) do update
    set auth_user_id = excluded.auth_user_id, platform = excluded.platform, last_seen_at = now()
  returning * into v_row;
  return to_jsonb(v_row);
end;
$$;

create or replace function api.device_token_unregister(p_uid uuid, p_input jsonb)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_count integer;
begin
  delete from public.device_tokens where token = p_input->>'token' and auth_user_id = p_uid;
  get diagnostics v_count = row_count;
  return jsonb_build_object('removed', v_count);
end;
$$;

-- ---------------------------------------------------------------------------------------------
-- Privileges: api.* is service_role only.
-- ---------------------------------------------------------------------------------------------
revoke all on all functions in schema api from public, anon, authenticated;
grant execute on all functions in schema api to service_role;
alter default privileges in schema api revoke execute on functions from public;
alter default privileges in schema api grant execute on functions to service_role;
