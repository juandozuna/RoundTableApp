-- Gold Roundtables — KPI freshness, live seat counts, reminder rescheduling and hardening.
--
-- 1. KPI rollups no longer lag minutes behind the data:
--    * every write that can change a rollup marks it dirty (statement-level triggers, so no write
--      path can forget);
--    * kpi_* reads call kpi.ensure_fresh(): when dirty (and not refreshed in the last 2 s) or older
--      than 5 min, the caller refreshes the rollups (advisory-lock guarded, ~25 ms on the seed),
--      so the numbers a coordinator sees include the session that just closed;
--    * pg_cron stays as the safety net (every 30 s when dirty, hourly unconditionally).
-- 2. Seat counts never come from rollups: kpi_tables / admin_tables count live table_members
--    (pending invites already hold a seat as an active membership).
-- 3. Reminders are re-sent when a session is rescheduled (the dedupe key includes the slot).
-- 4. History and defence in depth: audit_events is append-only, profile edits are audited,
--    moving a member re-points their pending invite, coordinator location is validated, and the
--    internal app/kpi helper functions are no longer executable by API roles.

-- ---------------------------------------------------------------------------------------------
-- 1. KPI freshness
-- ---------------------------------------------------------------------------------------------
create or replace function public.refresh_kpis()
returns void
language plpgsql
security definer
set search_path = ''
as $$
begin
  update kpi.refresh_state set dirty = false where id;
  refresh materialized view concurrently kpi.mv_session_facts;
  refresh materialized view concurrently kpi.mv_member_value_facts;
  refresh materialized view concurrently kpi.mv_member_attendance;
  refresh materialized view concurrently kpi.mv_table_status;
  update kpi.refresh_state set refreshed_at = clock_timestamp() where id;
end;
$$;

-- Whether the rollups need a refresh now:
--   dirty   : something changed since the last refresh, debounced by p_min_interval
--   too old : mv_table_status.health depends on now(), so refresh at least every p_max_age
create or replace function kpi.is_stale(p_min_interval interval, p_max_age interval)
returns boolean
language sql
stable
security definer
set search_path = ''
as $$
  select s.refreshed_at is null
         or s.refreshed_at < clock_timestamp() - p_max_age
         or (s.dirty and s.refreshed_at < clock_timestamp() - p_min_interval)
  from kpi.refresh_state s where s.id;
$$;

-- Refreshes the rollups when they are stale; returns whether this call refreshed them.
-- Concurrent callers do not queue: the one that gets the advisory lock refreshes, the others read
-- the previous (at most p_min_interval old) rollups.
create or replace function kpi.ensure_fresh(
  p_min_interval interval default interval '2 seconds',
  p_max_age interval default interval '5 minutes')
returns boolean
language plpgsql
volatile
security definer
set search_path = ''
as $$
begin
  if not kpi.is_stale(p_min_interval, p_max_age) then
    return false;
  end if;
  if not pg_try_advisory_xact_lock(hashtextextended('gold-roundtables:kpi-refresh', 0)) then
    return false;
  end if;
  -- Another caller may have refreshed while we were deciding.
  if not kpi.is_stale(p_min_interval, p_max_age) then
    return false;
  end if;
  perform public.refresh_kpis();
  return true;
end;
$$;

create or replace function kpi.refresh_if_dirty()
returns boolean
language sql
volatile
security definer
set search_path = ''
as $$ select kpi.ensure_fresh(interval '0 seconds', interval '1 hour'); $$;

-- Marks the rollups dirty after any statement that can change them.
create or replace function kpi.mark_dirty_trigger()
returns trigger
language plpgsql
security definer
set search_path = ''
as $$
begin
  perform kpi.mark_dirty();
  return null;
end;
$$;

do $dirty$
declare
  v_table text;
begin
  foreach v_table in array array['organizations', 'round_tables', 'table_members', 'sessions',
      'session_attendance', 'member_assessments', 'member_answers', 'member_commitments']
  loop
    execute format('create trigger kpi_mark_dirty after insert or update or delete on public.%I
                    for each statement execute function kpi.mark_dirty_trigger()', v_table);
  end loop;
end;
$dirty$;

-- The public kpi_* RPCs keep their contract; the previous bodies move to kpi.*_impl and the
-- public functions become volatile wrappers that make sure the rollups are fresh first.
alter function public.kpi_summary(date, date, text, uuid, uuid, uuid, uuid, uuid, uuid)
  set schema kpi;
alter function kpi.kpi_summary(date, date, text, uuid, uuid, uuid, uuid, uuid, uuid)
  rename to summary_impl;
alter function public.kpi_breakdown(text, date, date, text, uuid, uuid, uuid, uuid, uuid, uuid)
  set schema kpi;
alter function kpi.kpi_breakdown(text, date, date, text, uuid, uuid, uuid, uuid, uuid, uuid)
  rename to breakdown_impl;
alter function public.kpi_weekly_series(date, date, text, uuid, uuid, uuid, uuid, uuid, uuid)
  set schema kpi;
alter function kpi.kpi_weekly_series(date, date, text, uuid, uuid, uuid, uuid, uuid, uuid)
  rename to weekly_series_impl;
alter function public.kpi_tables(text, uuid, uuid, uuid, uuid, text) set schema kpi;
alter function kpi.kpi_tables(text, uuid, uuid, uuid, uuid, text) rename to tables_impl;
alter function public.kpi_member_detail(uuid) set schema kpi;
alter function kpi.kpi_member_detail(uuid) rename to member_detail_impl;

create or replace function public.kpi_summary(
  p_from date default null, p_to date default null, p_country text default null,
  p_organization_id uuid default null, p_location_id uuid default null,
  p_round_table_id uuid default null, p_facilitator_person_id uuid default null,
  p_module_id uuid default null, p_value_id uuid default null)
returns jsonb
language sql
volatile
security definer
set search_path = ''
as $$
  select kpi.ensure_fresh();
  select kpi.summary_impl(p_from, p_to, p_country, p_organization_id, p_location_id,
                          p_round_table_id, p_facilitator_person_id, p_module_id, p_value_id);
$$;

create or replace function public.kpi_breakdown(
  p_dimension text,
  p_from date default null, p_to date default null, p_country text default null,
  p_organization_id uuid default null, p_location_id uuid default null,
  p_round_table_id uuid default null, p_facilitator_person_id uuid default null,
  p_module_id uuid default null, p_value_id uuid default null)
returns table (
  key text, label text, sessions_closed bigint, values_completed bigint,
  member_values_completed bigint, attendance_pct numeric, initial_avg numeric,
  follow_up_avg numeric, improvement_avg numeric, improvement_pairs bigint,
  synced_late_rows bigint, tables_total bigint, tables_active bigint, tables_delayed bigint,
  tables_inactive bigint)
language sql
volatile
security definer
set search_path = ''
as $$
  select kpi.ensure_fresh();
  select * from kpi.breakdown_impl(p_dimension, p_from, p_to, p_country, p_organization_id,
    p_location_id, p_round_table_id, p_facilitator_person_id, p_module_id, p_value_id);
$$;

create or replace function public.kpi_weekly_series(
  p_from date default null, p_to date default null, p_country text default null,
  p_organization_id uuid default null, p_location_id uuid default null,
  p_round_table_id uuid default null, p_facilitator_person_id uuid default null,
  p_module_id uuid default null, p_value_id uuid default null)
returns table (
  week_start date, sessions_closed bigint, values_completed bigint, attendance_pct numeric,
  initial_avg numeric, improvement_avg numeric, synced_late_rows bigint)
language sql
volatile
security definer
set search_path = ''
as $$
  select kpi.ensure_fresh();
  select * from kpi.weekly_series_impl(p_from, p_to, p_country, p_organization_id, p_location_id,
    p_round_table_id, p_facilitator_person_id, p_module_id, p_value_id);
$$;

-- Seat counts are live (table_members), never taken from the rollup. max_people / seats_free are
-- appended for the seat meter.
create or replace function public.kpi_tables(
  p_country text default null, p_organization_id uuid default null,
  p_location_id uuid default null, p_round_table_id uuid default null,
  p_facilitator_person_id uuid default null, p_health text default null)
returns table (
  round_table_id uuid, code text, name text, organization_id uuid, organization_name text,
  country_code text, location_id uuid, location_name text, facilitator_person_id uuid,
  facilitator_name text, status public.round_table_status, health text, active_people bigint,
  values_completed bigint, current_value_id uuid, current_value_label text,
  attendance_pct numeric, improvement_avg numeric, synced_late_rows bigint,
  last_session_at timestamptz, pending_session_at timestamptz,
  max_people integer, seats_free bigint)
language sql
volatile
security definer
set search_path = ''
as $$
  select kpi.ensure_fresh();
  select t.round_table_id, t.code, t.name, t.organization_id, t.organization_name, t.country_code,
         t.location_id, t.location_name, t.facilitator_person_id, t.facilitator_name, t.status,
         t.health, live.active_people, t.values_completed, t.current_value_id,
         t.current_value_label, t.attendance_pct, t.improvement_avg, t.synced_late_rows,
         t.last_session_at, t.pending_session_at,
         9, greatest(9 - live.active_people, 0)
  from kpi.tables_impl(p_country, p_organization_id, p_location_id, p_round_table_id,
                       p_facilitator_person_id, p_health) t
  cross join lateral (
    select count(*) as active_people from public.table_members tm
    where tm.round_table_id = t.round_table_id and tm.status = 'active') live
  order by t.organization_name, t.name;
$$;

create or replace function public.kpi_member_detail(p_round_table_id uuid)
returns table (
  person_id uuid, first_name text, last_name text, role public.table_member_role,
  membership_status public.record_status, sessions_expected bigint, sessions_present bigint,
  attendance_pct numeric, values_completed bigint, improvement_avg numeric,
  synced_late_sessions bigint, scores jsonb)
language sql
volatile
security definer
set search_path = ''
as $$
  select kpi.ensure_fresh();
  select * from kpi.member_detail_impl(p_round_table_id);
$$;

revoke execute on function
  public.kpi_summary(date, date, text, uuid, uuid, uuid, uuid, uuid, uuid),
  public.kpi_breakdown(text, date, date, text, uuid, uuid, uuid, uuid, uuid, uuid),
  public.kpi_weekly_series(date, date, text, uuid, uuid, uuid, uuid, uuid, uuid),
  public.kpi_tables(text, uuid, uuid, uuid, uuid, text),
  public.kpi_member_detail(uuid)
  from public, anon;
grant execute on function
  public.kpi_summary(date, date, text, uuid, uuid, uuid, uuid, uuid, uuid),
  public.kpi_breakdown(text, date, date, text, uuid, uuid, uuid, uuid, uuid, uuid),
  public.kpi_weekly_series(date, date, text, uuid, uuid, uuid, uuid, uuid, uuid),
  public.kpi_tables(text, uuid, uuid, uuid, uuid, text),
  public.kpi_member_detail(uuid)
  to authenticated, service_role;

-- pg_cron safety net: dirty rollups are at most ~30 s old even when nobody reads KPIs.
do $cron$
begin
  perform cron.unschedule('gr-kpi-refresh-dirty');
  perform cron.schedule('gr-kpi-refresh-dirty', '30 seconds', 'select kpi.refresh_if_dirty()');
exception when others then
  raise notice 'pg_cron unavailable (%); KPI freshness relies on reads', sqlerrm;
end;
$cron$;

-- ---------------------------------------------------------------------------------------------
-- 2. Live seats on the admin table view (appended columns; pending invites already hold a seat)
-- ---------------------------------------------------------------------------------------------
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
   where i.round_table_id = rt.id and i.status = 'pending' and i.expires_at >= now()) as pending_invites
from public.round_tables rt
join public.organizations o on o.id = rt.organization_id
join public.locations l on l.id = rt.location_id
left join public.curriculum_values cv on cv.id = rt.current_value_id
left join public.table_members fac on fac.round_table_id = rt.id
  and fac.role = 'facilitator' and fac.status = 'active'
left join lateral (
  select s.id, s.status, s.scheduled_at from public.sessions s
  where s.round_table_id = rt.id and s.status in ('scheduled', 'open') limit 1
) pending on true;

-- ---------------------------------------------------------------------------------------------
-- 3. Session reminders: a rescheduled session reminds again (the slot is part of the dedupe key)
-- ---------------------------------------------------------------------------------------------
create or replace function app.enqueue_session_reminders(p_lead interval default interval '24 hours')
returns integer
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_count integer;
begin
  insert into public.notification_outbox (kind, auth_user_id, person_id, organization_id, title,
                                          body, data, dedupe_key)
  select 'session_reminder', tm.auth_user_id, tm.person_id, s.organization_id,
         'Tu mesa se reúne pronto',
         rt.name || ' · Valor ' || cv.sequence || ' · ' || cv.name || ' · '
           || to_char(s.scheduled_at at time zone rt.timezone, 'DD/MM HH24:MI'),
         jsonb_build_object('type', 'session_reminder', 'session_id', s.id,
                            'round_table_id', rt.id, 'scheduled_at', s.scheduled_at),
         'session_reminder:' || s.id || ':' || tm.person_id || ':'
           || extract(epoch from s.scheduled_at)::bigint
  from public.sessions s
  join public.round_tables rt on rt.id = s.round_table_id and rt.status = 'active'
  join public.curriculum_values cv on cv.id = s.value_id
  join public.table_members tm on tm.round_table_id = rt.id and tm.status = 'active'
    and tm.auth_user_id is not null
  where s.status = 'scheduled' and s.scheduled_at between now() and now() + p_lead
  on conflict (dedupe_key) do nothing;
  get diagnostics v_count = row_count;
  return v_count;
end;
$$;

-- ---------------------------------------------------------------------------------------------
-- 4. History, audit and validation
-- ---------------------------------------------------------------------------------------------
-- The audit trail is append-only, also against the service role.
create or replace function app.audit_events_append_only()
returns trigger
language plpgsql
set search_path = ''
as $$
begin
  raise exception 'audit_events is append-only' using errcode = '42501';
end;
$$;
create trigger audit_events_no_change before update or delete on public.audit_events
  for each row execute function app.audit_events_append_only();
create trigger audit_events_no_truncate before truncate on public.audit_events
  for each statement execute function app.audit_events_append_only();

-- Self-service profile edits are audited like administrator edits.
create or replace function api.profile_update(p_uid uuid, p_input jsonb)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_fields jsonb := to_jsonb(array(select k from unnest(array['first_name', 'last_name', 'position', 'phone']) k
                                   where p_input ? k));
  v_ids uuid[];
  v_person public.people;
begin
  if p_uid is null or not exists (select 1 from public.people where auth_user_id = p_uid) then
    perform app.fail('no_person', 'Tu cuenta todavía no está vinculada a ninguna invitación.');
  end if;
  with updated as (
    update public.people set
      first_name = coalesce(nullif(btrim(p_input->>'first_name'), ''), first_name),
      last_name = coalesce(nullif(btrim(p_input->>'last_name'), ''), last_name),
      position = case when p_input ? 'position' then nullif(btrim(p_input->>'position'), '') else position end,
      phone = case when p_input ? 'phone' then nullif(btrim(p_input->>'phone'), '') else phone end
    where auth_user_id = p_uid and status <> 'inactive'
    returning id)
  select array_agg(id) into v_ids from updated;
  for v_person in select * from public.people where id = any (coalesce(v_ids, '{}')) loop
    perform app.audit(p_uid, v_person.id, v_person.organization_id, 'person.updated', 'person',
                      v_person.id, jsonb_build_object('self', true, 'fields', v_fields));
  end loop;
  return jsonb_build_object(
    'people', (select jsonb_agg(app.person_json(p)) from public.people p where p.auth_user_id = p_uid),
    'contexts', app.contexts_for(p_uid));
end;
$$;

-- A moved member's pending invite follows them to the new table (it used to keep pointing at the
-- table they left).
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
  v_invites integer;
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

  update public.invites set round_table_id = v_target.id
  where person_id = v_member.person_id and round_table_id = v_member.round_table_id
    and role_kind = 'member' and status = 'pending';
  get diagnostics v_invites = row_count;

  perform app.audit(p_uid, app.actor_person(p_uid, v_member.organization_id), v_member.organization_id,
    'member.moved', 'table_member', v_new.id,
    jsonb_build_object('person_id', v_member.person_id, 'from_round_table_id', v_member.round_table_id,
                       'to_round_table_id', v_target.id, 'invites_moved', v_invites));
  return to_jsonb(v_new);
end;
$$;

-- Coordinator location is informational in v1 (coordinators are organization-wide); it must at
-- least reference a location of the person's own organization.
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

-- ---------------------------------------------------------------------------------------------
-- Defence in depth: internal SECURITY DEFINER helpers are not callable by API roles. Only the
-- scope helpers that RLS policies evaluate as the caller stay executable. (PostgREST exposes just
-- public, graphql_public and api, and api is usable by service_role only, so these were not
-- reachable through the API; this keeps it that way if a schema is ever exposed. New app/kpi
-- functions need the same explicit revoke.)
-- ---------------------------------------------------------------------------------------------
revoke execute on all functions in schema app from public, anon, authenticated;
revoke execute on all functions in schema kpi from public, anon, authenticated;
grant execute on function app.my_person_ids(), app.is_platform_admin(), app.coordinator_orgs(),
  app.facilitator_tables(), app.member_tables(), app.my_orgs() to authenticated;

-- ---------------------------------------------------------------------------------------------
-- Cron → dispatcher: app.dispatch_notifications_http() calls the notifications function through
-- pg_net when the Vault secrets exist (it is a silent no-op otherwise). Make sure pg_net is there.
-- ---------------------------------------------------------------------------------------------
do $net$
begin
  create extension if not exists pg_net with schema extensions;
exception when others then
  raise notice 'pg_net unavailable (%); notifications must be dispatched by an external caller', sqlerrm;
end;
$net$;
