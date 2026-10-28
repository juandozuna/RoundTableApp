-- Gold Roundtables — table health alerts (RF-25, RF-67; audit G-06).
--
-- Health keeps its four states (completed | inactive | delayed | active) and gains *reasons*:
--   low_attendance  average attendance of the last N closed sessions is below the threshold
--   few_people      fewer than the minimum of active people (facilitator included)
-- Reasons only apply to active tables. They are computed on read from the live seat count and the
-- session facts rollup (never stored), exposed by kpi_tables.health_reasons, and drive the
-- coordinator/administrator alert in the notification outbox (kind table_alert).
--
-- Thresholds live in one place: the single row of kpi.health_settings.

alter type public.notification_kind add value if not exists 'table_alert';

create table kpi.health_settings (
  id boolean primary key default true check (id),
  low_attendance_pct numeric not null default 70 check (low_attendance_pct between 1 and 100),
  recent_sessions smallint not null default 3 check (recent_sessions between 1 and 12),
  min_active_people smallint not null default 3 check (min_active_people between 1 and 9)
);
insert into kpi.health_settings default values;
alter table kpi.health_settings enable row level security;
revoke all on kpi.health_settings from public, anon, authenticated;
grant select on kpi.health_settings to service_role;

-- Average attendance % over the last N closed sessions of a table (null without sessions).
create or replace function kpi.recent_attendance_pct(p_round_table_id uuid)
returns numeric
language sql
stable
security definer
set search_path = ''
as $$
  select round(avg(100.0 * r.present_count / r.expected_count), 1)
  from (
    select f.present_count, f.expected_count
    from kpi.mv_session_facts f
    where f.round_table_id = p_round_table_id and f.expected_count > 0
    order by f.ended_at desc
    limit (select recent_sessions from kpi.health_settings)
  ) r;
$$;

create or replace function kpi.health_reasons(
  p_status public.round_table_status, p_active_people bigint, p_recent_attendance numeric)
returns text[]
language sql
stable
security definer
set search_path = ''
as $$
  select case when p_status <> 'active' then '{}'::text[] else
    array_remove(array[
      case when p_recent_attendance is not null
                and p_recent_attendance < s.low_attendance_pct then 'low_attendance' end,
      case when p_active_people < s.min_active_people then 'few_people' end
    ], null) end
  from kpi.health_settings s;
$$;

revoke execute on function kpi.recent_attendance_pct(uuid),
  kpi.health_reasons(public.round_table_status, bigint, numeric) from public, anon, authenticated;

-- ---------------------------------------------------------------------------------------------
-- kpi_tables: + recent_attendance_pct, health_reasons
-- ---------------------------------------------------------------------------------------------
drop function public.kpi_tables(text, uuid, uuid, uuid, uuid, text);

create function public.kpi_tables(
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
  max_people integer, seats_free bigint,
  recent_attendance_pct numeric, health_reasons text[])
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
         9, greatest(9 - live.active_people, 0),
         recent.pct, kpi.health_reasons(t.status, live.active_people, recent.pct)
  from kpi.tables_impl(p_country, p_organization_id, p_location_id, p_round_table_id,
                       p_facilitator_person_id, p_health) t
  cross join lateral (
    select count(*) as active_people from public.table_members tm
    where tm.round_table_id = t.round_table_id and tm.status = 'active') live
  cross join lateral (select kpi.recent_attendance_pct(t.round_table_id) as pct) recent
  order by t.organization_name, t.name;
$$;

revoke execute on function public.kpi_tables(text, uuid, uuid, uuid, uuid, text) from public, anon;
grant execute on function public.kpi_tables(text, uuid, uuid, uuid, uuid, text)
  to authenticated, service_role;

-- ---------------------------------------------------------------------------------------------
-- Alerts: one notification per table, per recipient, per week (dedupe_key), listing the reasons.
-- Recipients: the coordinators of the table's organization and the platform administrators that
-- have an account.
-- ---------------------------------------------------------------------------------------------
create or replace function app.enqueue_table_alerts()
returns integer
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_count integer;
begin
  perform kpi.ensure_fresh();
  with flagged as (
    select rt.id as table_id, rt.organization_id, rt.code, rt.name, r.reasons
    from public.round_tables rt
    cross join lateral (
      select kpi.health_reasons(
        rt.status,
        (select count(*) from public.table_members tm
         where tm.round_table_id = rt.id and tm.status = 'active'),
        kpi.recent_attendance_pct(rt.id)) as reasons) r
    where rt.status = 'active' and cardinality(r.reasons) > 0
  ), recipients as (
    select f.table_id, f.organization_id, f.code, f.name, f.reasons, p.id as person_id,
           p.auth_user_id
    from flagged f
    join public.role_assignments ra on ra.status = 'active'
      and (ra.role = 'platform_admin'
           or (ra.role = 'coordinator' and ra.organization_id = f.organization_id))
    join public.people p on p.id = ra.person_id and p.auth_user_id is not null
  )
  insert into public.notification_outbox (kind, auth_user_id, person_id, organization_id, title,
                                          body, data, dedupe_key)
  select 'table_alert', x.auth_user_id, x.person_id, x.organization_id,
         'Mesa que necesita atención',
         x.code || ' · ' || x.name || ': ' || array_to_string(array_remove(array[
           case when 'low_attendance' = any (x.reasons) then 'baja asistencia' end,
           case when 'few_people' = any (x.reasons) then 'menos de 3 personas' end], null), ' y '),
         jsonb_build_object('type', 'table_alert', 'round_table_id', x.table_id,
                            'reasons', to_jsonb(x.reasons)),
         'table_alert:' || x.table_id || ':' || (date_trunc('week', now()))::date || ':' || x.auth_user_id
  from recipients x
  group by x.table_id, x.organization_id, x.code, x.name, x.reasons, x.person_id, x.auth_user_id
  on conflict (dedupe_key) do nothing;
  get diagnostics v_count = row_count;
  return v_count;
end;
$$;

create or replace function api.notifications_enqueue(p_kind text, p_session_id uuid default null)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
begin
  return jsonb_build_object('enqueued', case p_kind
    when 'session_reminder' then app.enqueue_session_reminders()
    when 'commitment_nudge' then app.enqueue_commitment_nudges()
    when 'stage_opened' then app.enqueue_stage_opened(p_session_id)
    when 'table_alert' then app.enqueue_table_alerts()
    else 0 end);
end;
$$;

revoke execute on function app.enqueue_table_alerts() from public, anon, authenticated;

do $cron$
begin
  perform cron.schedule('gr-table-alerts', '0 13 * * *',
                        'select app.enqueue_table_alerts(); select app.dispatch_notifications_http()');
exception when others then
  raise notice 'pg_cron unavailable (%); table alerts must be triggered externally', sqlerrm;
end;
$cron$;
