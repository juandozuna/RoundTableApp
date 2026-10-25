-- Gold Roundtables — Row Level Security (ADR 0006).
--
-- Scope is derived from role_assignments (platform_admin, coordinator) and table_members
-- (facilitator, member) through SECURITY DEFINER helpers. The *_for(uid) variants take an
-- explicit auth user id so the api layer (service_role, no auth.uid()) applies exactly the same
-- rules; they are not executable by anon/authenticated.
--
-- Write model: anon/authenticated have SELECT only (plus a few own-row RPCs). Every write goes
-- through an Edge Function that calls an api.* function as service_role (ADR 0008). With no
-- INSERT/UPDATE/DELETE grants and no write policies, no client can write across tenants.
--
-- Individual free text (answers, commitments, justifications) is readable directly only by the
-- facilitator of the table and by the person themself. Coordinators and platform admins read it
-- through the answers-reveal Edge Function, which writes an audit event (ADR 0015).

-- ---------------------------------------------------------------------------------------------
-- Scope helpers with explicit user id (internal)
-- ---------------------------------------------------------------------------------------------
create or replace function app.person_ids_for(p_uid uuid)
returns setof uuid
language sql stable security definer set search_path = ''
as $$
  select id from public.people where auth_user_id = p_uid and status <> 'inactive';
$$;

create or replace function app.is_platform_admin_for(p_uid uuid)
returns boolean
language sql stable security definer set search_path = ''
as $$
  select exists (
    select 1 from public.role_assignments ra
    join public.people p on p.id = ra.person_id
    where p.auth_user_id = p_uid and p.status <> 'inactive'
      and ra.role = 'platform_admin' and ra.status = 'active'
  );
$$;

create or replace function app.coordinator_orgs_for(p_uid uuid)
returns setof uuid
language sql stable security definer set search_path = ''
as $$
  select ra.organization_id from public.role_assignments ra
  join public.people p on p.id = ra.person_id
  where p.auth_user_id = p_uid and p.status <> 'inactive'
    and ra.role = 'coordinator' and ra.status = 'active';
$$;

create or replace function app.facilitator_tables_for(p_uid uuid)
returns setof uuid
language sql stable security definer set search_path = ''
as $$
  select round_table_id from public.table_members
  where auth_user_id = p_uid and role = 'facilitator' and status = 'active';
$$;

create or replace function app.member_tables_for(p_uid uuid)
returns setof uuid
language sql stable security definer set search_path = ''
as $$
  select round_table_id from public.table_members
  where auth_user_id = p_uid and status = 'active';
$$;

create or replace function app.orgs_for(p_uid uuid)
returns setof uuid
language sql stable security definer set search_path = ''
as $$
  select organization_id from public.people
  where auth_user_id = p_uid and status <> 'inactive' and organization_id is not null;
$$;

-- Whether the user administers the organization (platform admin or its coordinator).
create or replace function app.manages_org_for(p_uid uuid, p_org uuid)
returns boolean
language sql stable security definer set search_path = ''
as $$
  select app.is_platform_admin_for(p_uid)
      or p_org in (select app.coordinator_orgs_for(p_uid));
$$;

revoke execute on function app.person_ids_for(uuid), app.is_platform_admin_for(uuid),
  app.coordinator_orgs_for(uuid), app.facilitator_tables_for(uuid), app.member_tables_for(uuid),
  app.orgs_for(uuid), app.manages_org_for(uuid, uuid)
  from public, anon, authenticated;

-- ---------------------------------------------------------------------------------------------
-- Caller-scoped helpers used by policies (auth.uid() of the request)
-- ---------------------------------------------------------------------------------------------
create or replace function app.my_person_ids()
returns setof uuid language sql stable security definer set search_path = ''
as $$ select app.person_ids_for(auth.uid()) $$;

create or replace function app.is_platform_admin()
returns boolean language sql stable security definer set search_path = ''
as $$ select app.is_platform_admin_for(auth.uid()) $$;

create or replace function app.coordinator_orgs()
returns setof uuid language sql stable security definer set search_path = ''
as $$ select app.coordinator_orgs_for(auth.uid()) $$;

create or replace function app.facilitator_tables()
returns setof uuid language sql stable security definer set search_path = ''
as $$ select app.facilitator_tables_for(auth.uid()) $$;

create or replace function app.member_tables()
returns setof uuid language sql stable security definer set search_path = ''
as $$ select app.member_tables_for(auth.uid()) $$;

create or replace function app.my_orgs()
returns setof uuid language sql stable security definer set search_path = ''
as $$ select app.orgs_for(auth.uid()) $$;

revoke execute on function app.my_person_ids(), app.is_platform_admin(), app.coordinator_orgs(),
  app.facilitator_tables(), app.member_tables(), app.my_orgs() from public, anon;
grant execute on function app.my_person_ids(), app.is_platform_admin(), app.coordinator_orgs(),
  app.facilitator_tables(), app.member_tables(), app.my_orgs() to authenticated, service_role;

-- ---------------------------------------------------------------------------------------------
-- Privileges: SELECT for authenticated, everything for service_role, nothing for anon.
-- ---------------------------------------------------------------------------------------------
revoke all on all tables in schema public from anon, authenticated;
grant select on all tables in schema public to authenticated;
grant all on all tables in schema public to service_role;
grant all on all tables in schema kpi to service_role;
alter default privileges in schema public revoke all on tables from anon, authenticated;
alter default privileges in schema public revoke execute on functions from public, anon;

-- ---------------------------------------------------------------------------------------------
-- Enable RLS everywhere
-- ---------------------------------------------------------------------------------------------
alter table public.organizations enable row level security;
alter table public.people enable row level security;
alter table public.locations enable row level security;
alter table public.role_assignments enable row level security;
alter table public.curriculum_modules enable row level security;
alter table public.curriculum_values enable row level security;
alter table public.value_questions enable row level security;
alter table public.round_tables enable row level security;
alter table public.table_members enable row level security;
alter table public.invites enable row level security;
alter table public.audit_events enable row level security;
alter table public.device_tokens enable row level security;
alter table public.sessions enable row level security;
alter table public.session_attendance enable row level security;
alter table public.member_assessments enable row level security;
alter table public.member_answers enable row level security;
alter table public.member_commitments enable row level security;

-- Curriculum: reference data for every signed-in user.
create policy curriculum_modules_read on public.curriculum_modules
  for select to authenticated using (true);
create policy curriculum_values_read on public.curriculum_values
  for select to authenticated using (true);
create policy value_questions_read on public.value_questions
  for select to authenticated using (true);

-- Organizations: platform admin all; anyone with a person in the org sees that org.
create policy organizations_read on public.organizations for select to authenticated using (
  (select app.is_platform_admin())
  or id in (select app.my_orgs())
);

-- Locations: same audience as the organization (members need the venue name).
create policy locations_read on public.locations for select to authenticated using (
  (select app.is_platform_admin())
  or organization_id in (select app.my_orgs())
);

-- People (contact data): admin, the org's coordinators, facilitators of a table the person
-- belongs to, and the person themself. Members see peers only through table_members names.
create policy people_read on public.people for select to authenticated using (
  (select app.is_platform_admin())
  or organization_id in (select app.coordinator_orgs())
  or id in (select app.my_person_ids())
  or id in (select tm.person_id from public.table_members tm
            where tm.round_table_id in (select app.facilitator_tables()))
);

create policy role_assignments_read on public.role_assignments for select to authenticated using (
  (select app.is_platform_admin())
  or organization_id in (select app.coordinator_orgs())
  or person_id in (select app.my_person_ids())
);

create policy round_tables_read on public.round_tables for select to authenticated using (
  (select app.is_platform_admin())
  or organization_id in (select app.coordinator_orgs())
  or id in (select app.member_tables())
);

-- Roster (names only): every participant of the table sees the table's memberships.
create policy table_members_read on public.table_members for select to authenticated using (
  (select app.is_platform_admin())
  or organization_id in (select app.coordinator_orgs())
  or round_table_id in (select app.member_tables())
  or person_id in (select app.my_person_ids())
);

-- Invites: admin, the org's coordinators, and the facilitator for invites to their table.
-- Anonymous preview-by-code goes through the invites Edge Function (minimal fields).
create policy invites_read on public.invites for select to authenticated using (
  (select app.is_platform_admin())
  or organization_id in (select app.coordinator_orgs())
  or round_table_id in (select app.facilitator_tables())
);

-- Audit: platform admin everything; coordinators their organization's events.
create policy audit_events_read on public.audit_events for select to authenticated using (
  (select app.is_platform_admin())
  or organization_id in (select app.coordinator_orgs())
);

-- Device tokens: own rows only.
create policy device_tokens_read on public.device_tokens for select to authenticated using (
  auth_user_id = (select auth.uid())
);

-- Sessions and attendance: everyone in the table (online board, presence strip) plus admins.
create policy sessions_read on public.sessions for select to authenticated using (
  (select app.is_platform_admin())
  or organization_id in (select app.coordinator_orgs())
  or round_table_id in (select app.member_tables())
);

create policy session_attendance_read on public.session_attendance for select to authenticated using (
  (select app.is_platform_admin())
  or organization_id in (select app.coordinator_orgs())
  or round_table_id in (select app.member_tables())
  or person_id in (select app.my_person_ids())
);

-- Individual answers (PC-10): the facilitator of the table and the person themself.
create policy member_assessments_read on public.member_assessments for select to authenticated using (
  round_table_id in (select app.facilitator_tables())
  or person_id in (select app.my_person_ids())
);

create policy member_answers_read on public.member_answers for select to authenticated using (
  round_table_id in (select app.facilitator_tables())
  or person_id in (select app.my_person_ids())
);

create policy member_commitments_read on public.member_commitments for select to authenticated using (
  round_table_id in (select app.facilitator_tables())
  or person_id in (select app.my_person_ids())
);

-- ---------------------------------------------------------------------------------------------
-- Own-profile and context RPCs (authenticated, PostgREST /rpc)
-- ---------------------------------------------------------------------------------------------

-- Every context a user can switch to (ADR 0006 context switcher).
create or replace function app.contexts_for(p_uid uuid)
returns jsonb
language sql
stable
security definer
set search_path = ''
as $$
  select coalesce(jsonb_agg(ctx order by ctx->>'kind', ctx->>'label'), '[]'::jsonb)
  from (
    select jsonb_build_object(
      'kind', 'platform_admin', 'person_id', p.id, 'organization_id', null,
      'round_table_id', null, 'label', 'Administrador · Plataforma') as ctx
    from public.role_assignments ra join public.people p on p.id = ra.person_id
    where p.auth_user_id = p_uid and p.status <> 'inactive'
      and ra.role = 'platform_admin' and ra.status = 'active'
    union all
    select jsonb_build_object(
      'kind', 'coordinator', 'person_id', p.id, 'organization_id', o.id,
      'organization_name', o.name, 'round_table_id', null,
      'label', 'Coordinador · ' || o.name)
    from public.role_assignments ra
    join public.people p on p.id = ra.person_id
    join public.organizations o on o.id = ra.organization_id
    where p.auth_user_id = p_uid and p.status <> 'inactive'
      and ra.role = 'coordinator' and ra.status = 'active'
    union all
    select jsonb_build_object(
      'kind', tm.role, 'person_id', tm.person_id, 'organization_id', o.id,
      'organization_name', o.name, 'round_table_id', rt.id, 'round_table_name', rt.name,
      'round_table_code', rt.code,
      'label', case tm.role when 'facilitator' then 'Facilitador · ' else 'Miembro · ' end
               || rt.name)
    from public.table_members tm
    join public.round_tables rt on rt.id = tm.round_table_id
    join public.organizations o on o.id = tm.organization_id
    where tm.auth_user_id = p_uid and tm.status = 'active'
  ) contexts;
$$;

revoke execute on function app.contexts_for(uuid) from public, anon, authenticated;

create or replace function public.my_contexts()
returns jsonb
language sql
stable
security definer
set search_path = ''
as $$ select app.contexts_for(auth.uid()) $$;

revoke execute on function public.my_contexts() from public, anon;
grant execute on function public.my_contexts() to authenticated;
