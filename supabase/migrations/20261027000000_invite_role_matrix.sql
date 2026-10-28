-- Role matrix (ADR 0016, PC-03). Who may create whom:
--   platform admin → anyone · coordinator → facilitators and members of any table of their
--   organization, never coordinators · facilitator → members of their own table only · member → none.
-- One function decides, so invite_create, revoke/renew and role_grant cannot drift apart.
-- Typed failures: invite_role_forbidden (the inviter cannot grant that role), invite_table_forbidden
-- (a facilitator targeting a table that is not theirs), forbidden (no relationship at all).

create or replace function app.require_can_invite(
  p_uid uuid, p_role public.invite_role_kind, p_org uuid, p_table uuid)
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
  if app.is_platform_admin_for(p_uid) then
    return;
  end if;
  if p_org in (select app.coordinator_orgs_for(p_uid)) then
    if p_role = 'coordinator' then
      perform app.fail('invite_role_forbidden',
        'Solo la administración de la plataforma puede invitar coordinadores.');
    end if;
    return;
  end if;
  if exists (select 1 from app.facilitator_tables_for(p_uid)) then
    if p_role <> 'member' then
      perform app.fail('invite_role_forbidden',
        'Como facilitador solo puedes invitar integrantes a tu mesa.');
    end if;
    if p_table is null or p_table not in (select app.facilitator_tables_for(p_uid)) then
      perform app.fail('invite_table_forbidden',
        'Como facilitador solo puedes invitar integrantes a tu propia mesa.');
    end if;
    return;
  end if;
  perform app.fail('forbidden', 'No tienes permiso para invitar con este rol.');
end;
$$;

revoke execute on function app.require_can_invite(uuid, public.invite_role_kind, uuid, uuid)
  from public, anon, authenticated;

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
  else
    v_org := (p_input->>'organization_id')::uuid;
    if v_org is null then
      perform app.fail('validation_failed', 'Elige la organización.');
    end if;
  end if;

  -- Authorize before revealing anything else about the table (status, seats).
  perform app.require_can_invite(p_uid, v_role, v_org, v_table.id);
  if v_table.id is not null and v_table.status not in ('active', 'paused') then
    perform app.fail('table_not_active', 'La mesa está cerrada o completó el programa.');
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
  perform app.require_can_invite(p_uid, p_invite.role_kind, p_invite.organization_id,
                                 p_invite.round_table_id);
end;
$$;

-- Granting a role directly follows the same matrix: only the platform admin makes coordinators.
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
  v_location uuid := (p_input->>'location_id')::uuid;
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
    if v_role = 'coordinator' then
      perform app.require_can_invite(p_uid, 'coordinator', v_person.organization_id, null);
    end if;
  end if;
  if v_location is not null and (v_role <> 'coordinator' or not exists (
       select 1 from public.locations
       where id = v_location and organization_id = v_person.organization_id)) then
    perform app.fail('validation_failed', 'La ubicación no pertenece a la organización de la persona.');
  end if;

  select * into v_assignment from public.role_assignments
  where person_id = v_person.id and role = v_role and status = 'active'
    and organization_id is not distinct from v_person.organization_id;
  if v_assignment.id is null then
    insert into public.role_assignments (person_id, role, organization_id, location_id,
                                         granted_by_person_id)
    values (v_person.id, v_role, v_person.organization_id, v_location,
            app.actor_person(p_uid, v_person.organization_id))
    returning * into v_assignment;
    perform app.audit(p_uid, app.actor_person(p_uid, v_person.organization_id),
      v_person.organization_id, 'role.granted', 'role_assignment', v_assignment.id,
      jsonb_build_object('person_id', v_person.id, 'role', v_role));
  end if;
  return to_jsonb(v_assignment);
end;
$$;

revoke execute on function app.require_can_invite(uuid, public.invite_role_kind, uuid, uuid)
  from public, anon, authenticated;
