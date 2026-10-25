-- Gold Roundtables — KPI rollups (ADR 0010) and online admin list views.
--
-- Rollups are materialized views in the private kpi schema, refreshed by public.refresh_kpis()
-- (pg_cron: every 5 minutes when dirty, hourly unconditionally). The app never reads them
-- directly: public.kpi_* RPCs filter by the caller's scope —
--   platform admin  → everything
--   coordinator     → their organizations
--   facilitator     → their tables
--   member          → nothing (no KPI screens for members in v1)
--
-- Definitions
--   values_completed        distinct (table, value) pairs with a closed session
--   member_values_completed initial scores captured in closed sessions
--   improvement (mejora)    follow-up score − initial score, per person and value
--   attendance_pct          (present + late) / participants at session time × 100
--   synced_late_rows        session-domain rows flagged synced_late (ADR 0005)
--   table health            completed | inactive (paused/closed, or no closed session in 28 days)
--                           | delayed (pending session overdue by > 1 day, or last session
--                           > 9 days ago) | active

-- One row per closed session.
create materialized view kpi.mv_session_facts as
select
  s.id as session_id,
  s.organization_id,
  o.country_code,
  o.country_name,
  rt.location_id,
  s.round_table_id,
  s.facilitator_person_id,
  cv.module_id,
  s.value_id,
  s.follow_up_value_id,
  s.started_at,
  s.ended_at,
  (date_trunc('week', s.started_at at time zone rt.timezone))::date as week_start,
  greatest(
    (select count(*) from public.table_members tm
     where tm.round_table_id = s.round_table_id
       and tm.joined_at <= s.ended_at
       and (tm.left_at is null or tm.left_at > s.started_at)),
    (select count(*) from public.session_attendance a where a.session_id = s.id)
  ) as expected_count,
  (select count(*) from public.session_attendance a
   where a.session_id = s.id and a.status in ('present', 'late')) as present_count,
  (select count(*) from public.member_assessments a
   where a.session_id = s.id and a.kind = 'initial') as initial_count,
  (select coalesce(sum(a.score), 0) from public.member_assessments a
   where a.session_id = s.id and a.kind = 'initial') as initial_score_sum,
  (select count(*) from public.member_assessments a
   where a.session_id = s.id and a.kind = 'follow_up') as follow_up_count,
  (select coalesce(sum(a.score), 0) from public.member_assessments a
   where a.session_id = s.id and a.kind = 'follow_up') as follow_up_score_sum,
  (select count(*) from public.member_commitments c where c.session_id = s.id) as commitments_count,
  (select count(*) from public.session_attendance x where x.session_id = s.id and x.synced_late)
  + (select count(*) from public.member_assessments x where x.session_id = s.id and x.synced_late)
  + (select count(*) from public.member_answers x where x.session_id = s.id and x.synced_late)
  + (select count(*) from public.member_commitments x where x.session_id = s.id and x.synced_late)
  + (select count(*) from public.member_commitments x
     where x.follow_up_session_id = s.id and x.follow_up_synced_late) as synced_late_rows
from public.sessions s
join public.round_tables rt on rt.id = s.round_table_id
join public.organizations o on o.id = s.organization_id
join public.curriculum_values cv on cv.id = s.value_id
where s.status = 'closed';

create unique index mv_session_facts_key on kpi.mv_session_facts (session_id);
create index mv_session_facts_org_idx on kpi.mv_session_facts (organization_id, week_start);

-- One row per initial score in a closed session, paired with the follow-up of the same value.
create materialized view kpi.mv_member_value_facts as
select
  i.id as initial_assessment_id,
  i.organization_id,
  o.country_code,
  rt.location_id,
  i.round_table_id,
  si.facilitator_person_id,
  cv.module_id,
  i.value_id,
  i.person_id,
  i.score as initial_score,
  i.session_id as initial_session_id,
  si.started_at as initial_at,
  f.score as follow_up_score,
  f.session_id as follow_up_session_id,
  f.started_at as follow_up_at,
  (f.score - i.score) as delta,
  (i.synced_late or coalesce(f.synced_late, false)) as synced_late
from public.member_assessments i
join public.sessions si on si.id = i.session_id and si.status = 'closed'
join public.round_tables rt on rt.id = i.round_table_id
join public.organizations o on o.id = i.organization_id
join public.curriculum_values cv on cv.id = i.value_id
left join lateral (
  select fa.score, fa.session_id, fa.synced_late, sf.started_at
  from public.member_assessments fa
  join public.sessions sf on sf.id = fa.session_id and sf.status = 'closed'
  where fa.kind = 'follow_up' and fa.person_id = i.person_id and fa.value_id = i.value_id
    and fa.round_table_id = i.round_table_id
  order by sf.started_at
  limit 1
) f on true
where i.kind = 'initial';

create unique index mv_member_value_facts_key on kpi.mv_member_value_facts (initial_assessment_id);
create index mv_member_value_facts_table_idx on kpi.mv_member_value_facts (round_table_id, person_id);

-- One row per membership history slice (table, person): attendance across closed sessions.
create materialized view kpi.mv_member_attendance as
select
  tm.round_table_id,
  tm.person_id,
  tm.organization_id,
  count(distinct s.id) as sessions_expected,
  count(distinct s.id) filter (where a.status in ('present', 'late')) as sessions_present,
  count(distinct s.id) filter (where a.synced_late) as sessions_synced_late
from (select distinct round_table_id, person_id, organization_id from public.table_members) tm
join public.sessions s on s.round_table_id = tm.round_table_id and s.status = 'closed'
  and exists (select 1 from public.table_members m
              where m.round_table_id = tm.round_table_id and m.person_id = tm.person_id
                and m.joined_at <= s.ended_at and (m.left_at is null or m.left_at > s.started_at))
left join public.session_attendance a on a.session_id = s.id and a.person_id = tm.person_id
group by tm.round_table_id, tm.person_id, tm.organization_id;

create unique index mv_member_attendance_key on kpi.mv_member_attendance (round_table_id, person_id);

-- One row per table: status, health and program progress at refresh time.
create materialized view kpi.mv_table_status as
select
  rt.id as round_table_id,
  rt.organization_id,
  o.country_code,
  rt.location_id,
  rt.status,
  rt.created_at,
  rt.current_value_id,
  fac.person_id as facilitator_person_id,
  (select count(*) from public.table_members tm
   where tm.round_table_id = rt.id and tm.status = 'active') as active_people,
  (select count(distinct s.value_id) from public.sessions s
   where s.round_table_id = rt.id and s.status = 'closed') as values_completed,
  last.ended_at as last_session_at,
  pending.scheduled_at as pending_session_at,
  case
    when rt.status = 'completed' then 'completed'
    when rt.status in ('paused', 'closed') then 'inactive'
    when coalesce(last.ended_at, rt.created_at) < now() - interval '28 days' then 'inactive'
    when pending.scheduled_at < now() - interval '1 day' then 'delayed'
    when last.ended_at < now() - interval '9 days' then 'delayed'
    else 'active'
  end as health,
  now() as computed_at
from public.round_tables rt
join public.organizations o on o.id = rt.organization_id
left join public.table_members fac on fac.round_table_id = rt.id
  and fac.role = 'facilitator' and fac.status = 'active'
left join lateral (
  select s.ended_at from public.sessions s
  where s.round_table_id = rt.id and s.status = 'closed'
  order by s.ended_at desc limit 1
) last on true
left join lateral (
  select s.scheduled_at from public.sessions s
  where s.round_table_id = rt.id and s.status in ('scheduled', 'open')
  limit 1
) pending on true;

create unique index mv_table_status_key on kpi.mv_table_status (round_table_id);

revoke all on all tables in schema kpi from public, anon, authenticated;
grant select on all tables in schema kpi to service_role;

-- ---------------------------------------------------------------------------------------------
-- Refresh
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
  update kpi.refresh_state set refreshed_at = now() where id;
end;
$$;

create or replace function kpi.refresh_if_dirty()
returns boolean
language plpgsql
security definer
set search_path = ''
as $$
begin
  if exists (select 1 from kpi.refresh_state where id and dirty) then
    perform public.refresh_kpis();
    return true;
  end if;
  return false;
end;
$$;

revoke execute on function public.refresh_kpis() from public, anon, authenticated;
grant execute on function public.refresh_kpis() to service_role;

-- ---------------------------------------------------------------------------------------------
-- Scope and filters
-- ---------------------------------------------------------------------------------------------
create or replace function kpi.row_visible(p_org uuid, p_table uuid)
returns boolean
language sql
stable
security definer
set search_path = ''
as $$
  select app.is_platform_admin()
      or p_org in (select app.coordinator_orgs())
      or p_table in (select app.facilitator_tables());
$$;

create or replace function kpi.session_facts_scoped(
  p_from date, p_to date, p_country text, p_organization_id uuid, p_location_id uuid,
  p_round_table_id uuid, p_facilitator_person_id uuid, p_module_id uuid, p_value_id uuid)
returns setof kpi.mv_session_facts
language sql
stable
security definer
set search_path = ''
as $$
  select f.* from kpi.mv_session_facts f
  where kpi.row_visible(f.organization_id, f.round_table_id)
    and (p_from is null or f.week_start >= date_trunc('week', p_from)::date)
    and (p_to is null or f.started_at::date <= p_to)
    and (p_country is null or f.country_code = upper(p_country))
    and (p_organization_id is null or f.organization_id = p_organization_id)
    and (p_location_id is null or f.location_id = p_location_id)
    and (p_round_table_id is null or f.round_table_id = p_round_table_id)
    and (p_facilitator_person_id is null or f.facilitator_person_id = p_facilitator_person_id)
    and (p_module_id is null or f.module_id = p_module_id)
    and (p_value_id is null or f.value_id = p_value_id);
$$;

create or replace function kpi.member_facts_scoped(
  p_from date, p_to date, p_country text, p_organization_id uuid, p_location_id uuid,
  p_round_table_id uuid, p_facilitator_person_id uuid, p_module_id uuid, p_value_id uuid)
returns setof kpi.mv_member_value_facts
language sql
stable
security definer
set search_path = ''
as $$
  select f.* from kpi.mv_member_value_facts f
  where kpi.row_visible(f.organization_id, f.round_table_id)
    and (p_from is null or f.initial_at::date >= p_from)
    and (p_to is null or f.initial_at::date <= p_to)
    and (p_country is null or f.country_code = upper(p_country))
    and (p_organization_id is null or f.organization_id = p_organization_id)
    and (p_location_id is null or f.location_id = p_location_id)
    and (p_round_table_id is null or f.round_table_id = p_round_table_id)
    and (p_facilitator_person_id is null or f.facilitator_person_id = p_facilitator_person_id)
    and (p_module_id is null or f.module_id = p_module_id)
    and (p_value_id is null or f.value_id = p_value_id);
$$;

create or replace function kpi.table_status_scoped(
  p_country text, p_organization_id uuid, p_location_id uuid, p_round_table_id uuid,
  p_facilitator_person_id uuid)
returns setof kpi.mv_table_status
language sql
stable
security definer
set search_path = ''
as $$
  select t.* from kpi.mv_table_status t
  where kpi.row_visible(t.organization_id, t.round_table_id)
    and (p_country is null or t.country_code = upper(p_country))
    and (p_organization_id is null or t.organization_id = p_organization_id)
    and (p_location_id is null or t.location_id = p_location_id)
    and (p_round_table_id is null or t.round_table_id = p_round_table_id)
    and (p_facilitator_person_id is null or t.facilitator_person_id = p_facilitator_person_id);
$$;

create or replace function kpi.dim_key(
  p_dimension text, p_country text, p_org uuid, p_location uuid, p_table uuid,
  p_facilitator uuid, p_module uuid, p_value uuid)
returns text
language sql
immutable
set search_path = ''
as $$
  select case p_dimension
    when 'country' then p_country
    when 'organization' then p_org::text
    when 'location' then p_location::text
    when 'round_table' then p_table::text
    when 'facilitator' then p_facilitator::text
    when 'module' then p_module::text
    when 'value' then p_value::text
  end;
$$;

create or replace function kpi.dim_label(p_dimension text, p_key text)
returns text
language sql
stable
security definer
set search_path = ''
as $$
  select case p_dimension
    when 'country' then (select max(country_name) from public.organizations where country_code = p_key)
    when 'organization' then (select name from public.organizations where id = p_key::uuid)
    when 'location' then (select name from public.locations where id = p_key::uuid)
    when 'round_table' then (select name from public.round_tables where id = p_key::uuid)
    when 'facilitator' then (select first_name || ' ' || last_name from public.people where id = p_key::uuid)
    when 'module' then (select 'Módulo ' || number || ' · ' || name from public.curriculum_modules where id = p_key::uuid)
    when 'value' then (select 'Valor ' || sequence || ' · ' || name from public.curriculum_values where id = p_key::uuid)
  end;
$$;

-- ---------------------------------------------------------------------------------------------
-- Public KPI RPCs (PostgREST: POST /rest/v1/rpc/<name>)
-- ---------------------------------------------------------------------------------------------
create or replace function public.kpi_summary(
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
stable
security definer
set search_path = ''
as $$
  with sf as (
    select kpi.dim_key(p_dimension, f.country_code, f.organization_id, f.location_id,
                       f.round_table_id, f.facilitator_person_id, f.module_id, f.value_id) as k, f.*
    from kpi.session_facts_scoped(p_from, p_to, p_country, p_organization_id, p_location_id,
      p_round_table_id, p_facilitator_person_id, p_module_id, p_value_id) f
  ), mf as (
    select kpi.dim_key(p_dimension, f.country_code, f.organization_id, f.location_id,
                       f.round_table_id, f.facilitator_person_id, f.module_id, f.value_id) as k, f.*
    from kpi.member_facts_scoped(p_from, p_to, p_country, p_organization_id, p_location_id,
      p_round_table_id, p_facilitator_person_id, p_module_id, p_value_id) f
  ), ts as (
    select kpi.dim_key(p_dimension, t.country_code, t.organization_id, t.location_id,
                       t.round_table_id, t.facilitator_person_id, null, null) as k, t.*
    from kpi.table_status_scoped(p_country, p_organization_id, p_location_id, p_round_table_id,
      p_facilitator_person_id) t
    where p_dimension not in ('module', 'value')
  ), s_agg as (
    select k, count(*) as sessions_closed, count(distinct (round_table_id, value_id)) as values_completed,
           sum(present_count) as present, sum(expected_count) as expected,
           sum(synced_late_rows) as late
    from sf group by k
  ), m_agg as (
    select k, count(*) as member_values, avg(initial_score) as initial_avg,
           avg(follow_up_score) as follow_up_avg, avg(delta) as improvement_avg,
           count(delta) as pairs
    from mf group by k
  ), t_agg as (
    select k, count(*) as total, count(*) filter (where health = 'active') as active,
           count(*) filter (where health = 'delayed') as delayed,
           count(*) filter (where health = 'inactive') as inactive
    from ts group by k
  ), keys as (
    select k from s_agg union select k from m_agg union select k from t_agg
  )
  select keys.k, kpi.dim_label(p_dimension, keys.k),
         coalesce(s.sessions_closed, 0), coalesce(s.values_completed, 0),
         coalesce(m.member_values, 0),
         round(100.0 * s.present / nullif(s.expected, 0), 1),
         round(m.initial_avg, 2), round(m.follow_up_avg, 2), round(m.improvement_avg, 2),
         coalesce(m.pairs, 0), coalesce(s.late, 0)::bigint,
         t.total, t.active, t.delayed, t.inactive
  from keys
  left join s_agg s on s.k is not distinct from keys.k
  left join m_agg m on m.k is not distinct from keys.k
  left join t_agg t on t.k is not distinct from keys.k
  where keys.k is not null -- unknown dimensions and rows without a key (e.g. no facilitator) drop out
  order by 2;
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
stable
security definer
set search_path = ''
as $$
  with sf as (
    select * from kpi.session_facts_scoped(p_from, p_to, p_country, p_organization_id,
      p_location_id, p_round_table_id, p_facilitator_person_id, p_module_id, p_value_id)
  ), mf as (
    select (date_trunc('week', follow_up_at))::date as week_start, delta
    from kpi.member_facts_scoped(null, null, p_country, p_organization_id, p_location_id,
      p_round_table_id, p_facilitator_person_id, p_module_id, p_value_id)
    where follow_up_at is not null
  ), weeks as (
    select sf.week_start, count(*) as sessions_closed,
           count(distinct (round_table_id, value_id)) as values_completed,
           round(100.0 * sum(present_count) / nullif(sum(expected_count), 0), 1) as attendance_pct,
           round(sum(initial_score_sum)::numeric / nullif(sum(initial_count), 0), 2) as initial_avg,
           sum(synced_late_rows)::bigint as synced_late_rows
    from sf group by sf.week_start
  )
  select w.week_start, w.sessions_closed, w.values_completed, w.attendance_pct, w.initial_avg,
         (select round(avg(mf.delta), 2) from mf where mf.week_start = w.week_start),
         w.synced_late_rows
  from weeks w
  order by w.week_start;
$$;

-- Grid rows for "Explorador de mesas": one row per visible table with health and KPIs.
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
  last_session_at timestamptz, pending_session_at timestamptz)
language sql
stable
security definer
set search_path = ''
as $$
  select t.round_table_id, rt.code, rt.name, t.organization_id, o.name, t.country_code::text,
         t.location_id, l.name, t.facilitator_person_id,
         nullif(btrim(coalesce(p.first_name, '') || ' ' || coalesce(p.last_name, '')), ''),
         t.status, t.health, t.active_people, t.values_completed, t.current_value_id,
         case when cv.id is not null then 'Valor ' || cv.sequence || ' · ' || cv.name end,
         (select round(100.0 * sum(f.present_count) / nullif(sum(f.expected_count), 0), 1)
          from kpi.mv_session_facts f where f.round_table_id = t.round_table_id),
         (select round(avg(m.delta), 2) from kpi.mv_member_value_facts m
          where m.round_table_id = t.round_table_id),
         (select coalesce(sum(f.synced_late_rows), 0)::bigint from kpi.mv_session_facts f
          where f.round_table_id = t.round_table_id),
         t.last_session_at, t.pending_session_at
  from kpi.table_status_scoped(p_country, p_organization_id, p_location_id, p_round_table_id,
                               p_facilitator_person_id) t
  join public.round_tables rt on rt.id = t.round_table_id
  join public.organizations o on o.id = t.organization_id
  join public.locations l on l.id = t.location_id
  left join public.people p on p.id = t.facilitator_person_id
  left join public.curriculum_values cv on cv.id = t.current_value_id
  where p_health is null or t.health = p_health
  order by o.name, rt.name;
$$;

-- Member-level drill-down for one table (sensitive: individual scores). Free-text answers are
-- not included; they go through the answers-reveal Edge Function (logged).
create or replace function public.kpi_member_detail(p_round_table_id uuid)
returns table (
  person_id uuid, first_name text, last_name text, role public.table_member_role,
  membership_status public.record_status, sessions_expected bigint, sessions_present bigint,
  attendance_pct numeric, values_completed bigint, improvement_avg numeric,
  synced_late_sessions bigint, scores jsonb)
language plpgsql
stable
security definer
set search_path = ''
as $$
declare
  v_org uuid;
begin
  select organization_id into v_org from public.round_tables where id = p_round_table_id;
  if not (app.is_platform_admin()
          or v_org in (select app.coordinator_orgs())
          or p_round_table_id in (select app.facilitator_tables())) then
    perform app.fail('forbidden', 'No tienes permiso para ver el detalle de esta mesa.');
  end if;

  return query
  select tm.person_id, tm.first_name, tm.last_name, tm.role, tm.status,
         coalesce(a.sessions_expected, 0), coalesce(a.sessions_present, 0),
         round(100.0 * a.sessions_present / nullif(a.sessions_expected, 0), 1),
         (select count(*) from kpi.mv_member_value_facts m
          where m.round_table_id = p_round_table_id and m.person_id = tm.person_id),
         (select round(avg(m.delta), 2) from kpi.mv_member_value_facts m
          where m.round_table_id = p_round_table_id and m.person_id = tm.person_id),
         coalesce(a.sessions_synced_late, 0),
         coalesce((select jsonb_agg(jsonb_build_object(
                     'value_id', m.value_id, 'value_label', 'Valor ' || cv.sequence || ' · ' || cv.name,
                     'sequence', cv.sequence, 'initial_score', m.initial_score,
                     'follow_up_score', m.follow_up_score, 'delta', m.delta,
                     'synced_late', m.synced_late) order by cv.sequence)
                   from kpi.mv_member_value_facts m
                   join public.curriculum_values cv on cv.id = m.value_id
                   where m.round_table_id = p_round_table_id and m.person_id = tm.person_id),
                  '[]'::jsonb)
  from (select distinct on (x.person_id) x.* from public.table_members x
        where x.round_table_id = p_round_table_id
        order by x.person_id, (x.status = 'active') desc, x.joined_at desc) tm
  left join kpi.mv_member_attendance a
    on a.round_table_id = p_round_table_id and a.person_id = tm.person_id
  order by tm.role, tm.last_name, tm.first_name;
end;
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

-- ---------------------------------------------------------------------------------------------
-- Admin list views (live data, RLS of the caller applies through security_invoker)
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
  rt.created_at, rt.updated_at
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

create or replace view public.admin_people with (security_invoker = true) as
select
  p.id, p.organization_id, p.first_name, p.last_name, p.position, p.email, p.phone, p.status,
  p.auth_user_id is not null as linked,
  coalesce((select jsonb_agg(jsonb_build_object('id', ra.id, 'role', ra.role,
                                                'organization_id', ra.organization_id))
            from public.role_assignments ra
            where ra.person_id = p.id and ra.status = 'active'), '[]'::jsonb) as roles,
  coalesce((select jsonb_agg(jsonb_build_object('table_member_id', tm.id,
                                                'round_table_id', tm.round_table_id,
                                                'round_table_name', rt.name, 'role', tm.role))
            from public.table_members tm
            join public.round_tables rt on rt.id = tm.round_table_id
            where tm.person_id = p.id and tm.status = 'active'), '[]'::jsonb) as tables,
  p.created_at, p.updated_at
from public.people p;

create or replace view public.admin_invites with (security_invoker = true) as
select
  i.id, i.organization_id, i.person_id, p.first_name, p.last_name, p.email, p.phone,
  i.code, i.role_kind, i.round_table_id, rt.name as round_table_name,
  case when i.status = 'pending' and i.expires_at < now() then 'expired'::public.invite_status
       else i.status end as status,
  i.invited_by_person_id, i.expires_at, i.accepted_at, i.revoked_at, i.created_at
from public.invites i
join public.people p on p.id = i.person_id
left join public.round_tables rt on rt.id = i.round_table_id;

create or replace view public.audit_log with (security_invoker = true) as
select
  e.id, e.organization_id, o.name as organization_name, e.actor_person_id,
  nullif(btrim(coalesce(p.first_name, '') || ' ' || coalesce(p.last_name, '')), '') as actor_name,
  e.event_type, e.entity_type, e.entity_id, e.payload, e.created_at
from public.audit_events e
left join public.organizations o on o.id = e.organization_id
left join public.people p on p.id = e.actor_person_id;

revoke all on public.admin_tables, public.admin_people, public.admin_invites, public.audit_log
  from anon, public;
grant select on public.admin_tables, public.admin_people, public.admin_invites, public.audit_log
  to authenticated, service_role;
