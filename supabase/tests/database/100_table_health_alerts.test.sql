-- Table health reasons (low attendance, fewer than 3 people) and the table_alert outbox.
begin;
create extension if not exists pgtap with schema extensions;
select plan(23);

create function pg_temp.id(p text) returns uuid language sql immutable as
  $$ select md5('gold-roundtables:' || p)::uuid $$;
create function pg_temp.act_as(p_user text) returns void language sql as $$
  select set_config('request.jwt.claims',
    json_build_object('sub', md5('gold-roundtables:user:' || p_user)::uuid, 'role', 'authenticated')::text,
    true);
$$;
grant execute on function pg_temp.act_as(text) to authenticated;
create function pg_temp.reasons(p_table text) returns text[] language sql as $$
  select health_reasons from public.kpi_tables(p_round_table_id := pg_temp.id('table:' || p_table))
$$;
grant execute on function pg_temp.reasons(text) to authenticated;
-- Marks everybody absent in the n-th latest closed session (1 = latest) of LUZ-02.
create function pg_temp.empty_session(p_nth integer) returns void language plpgsql as $$
begin
  alter table public.session_attendance disable trigger user;
  update public.session_attendance set status = 'absent'
  where session_id = (select id from public.sessions
                      where round_table_id = pg_temp.id('table:luz-02') and status = 'closed'
                      order by ended_at desc offset p_nth - 1 limit 1);
  alter table public.session_attendance enable trigger user;
  perform public.refresh_kpis();
end;
$$;

-- ── The rules, in isolation ────────────────────────────────────────────────────────────────────
select is(kpi.health_reasons('active', 2, 80), array['few_people'], 'fewer than 3 people is flagged');
select is(kpi.health_reasons('active', 3, 80), '{}'::text[], 'exactly 3 people is fine');
select is(kpi.health_reasons('active', 8, 69.9), array['low_attendance'], 'attendance under 70 is flagged');
select is(kpi.health_reasons('active', 8, 70), '{}'::text[], 'attendance of exactly 70 is not low');
select is(kpi.health_reasons('active', 1, 10), array['low_attendance', 'few_people'], 'both reasons can apply');
select is(kpi.health_reasons('active', 8, null), '{}'::text[], 'no closed session yet is not low attendance');
select is(kpi.health_reasons('paused', 1, 10), '{}'::text[], 'paused tables are not alerted');
select is(kpi.health_reasons('completed', 1, 10), '{}'::text[], 'completed tables are not alerted');

-- ── Thresholds live in one place ───────────────────────────────────────────────────────────────
select is((select row(low_attendance_pct, recent_sessions, min_active_people) from kpi.health_settings),
          row(70::numeric, 3::smallint, 3::smallint), 'defaults: 70 %, last 3 sessions, 3 people');
update kpi.health_settings set min_active_people = 5;
select is(kpi.health_reasons('active', 4, 90), array['few_people'], 'the minimum of people is configurable');
update kpi.health_settings set min_active_people = 3;

-- ── kpi_tables.health_reasons on the seed ──────────────────────────────────────────────────────
select public.refresh_kpis();
select pg_temp.act_as('coord');
set local role authenticated;
select is(pg_temp.reasons('luz-07'), array['few_people'], 'LUZ-07 (1 person) shows few_people');
select is(pg_temp.reasons('luz-02'), '{}'::text[], 'a healthy table has no reasons');
reset role;

-- A higher threshold flags a table that is fine by default (LUZ-01 averages 77 % lately).
update kpi.health_settings set low_attendance_pct = 80;
select pg_temp.act_as('coord');
set local role authenticated;
select is(pg_temp.reasons('luz-01'), array['low_attendance'], 'the attendance threshold is configurable');
reset role;
update kpi.health_settings set low_attendance_pct = 70;

-- Only the last 3 closed sessions count: an old bad session does not flag the table.
select pg_temp.empty_session(5);
select pg_temp.act_as('coord');
set local role authenticated;
select is(pg_temp.reasons('luz-02'), '{}'::text[], 'a bad session older than the last 3 is ignored');
reset role;

-- The 3 latest sessions with no one present: low attendance.
select pg_temp.empty_session(1);
select pg_temp.empty_session(2);
select pg_temp.empty_session(3);
select pg_temp.act_as('coord');
set local role authenticated;
select is(pg_temp.reasons('luz-02'), array['low_attendance'], 'three empty sessions flag low attendance');
select is((select recent_attendance_pct from public.kpi_tables(p_round_table_id := pg_temp.id('table:luz-02'))),
          0::numeric, 'recent_attendance_pct is the average of the last 3 sessions');
reset role;

-- ── Alerts ─────────────────────────────────────────────────────────────────────────────────────
delete from public.notification_outbox;
select is(app.enqueue_table_alerts() >= 4, true, 'alerts are queued for the flagged tables');
select is((select count(*)::int from public.notification_outbox
           where kind = 'table_alert' and data->>'round_table_id' = pg_temp.id('table:luz-02')::text
             and auth_user_id = pg_temp.id('user:coord')), 1,
          'the organization''s coordinator is alerted about low attendance');
select is((select count(*)::int from public.notification_outbox
           where kind = 'table_alert' and data->>'round_table_id' = pg_temp.id('table:luz-02')::text
             and auth_user_id = pg_temp.id('user:admin')), 1, 'the platform administrator is alerted too');
select is((select count(*)::int from public.notification_outbox
           where kind = 'table_alert' and auth_user_id = pg_temp.id('user:coord-horizonte')),
          0, 'another organization''s coordinator gets nothing about Fundación Luz tables');
select is((select count(*)::int from public.notification_outbox
           where kind = 'table_alert' and data->>'round_table_id' = pg_temp.id('table:luz-06')::text),
          0, 'a paused table is not alerted');
select is(app.enqueue_table_alerts(), 0, 'the same week is deduplicated per table');
select is((select (api.notifications_enqueue('table_alert')->>'enqueued')::int), 0,
          'the Edge Function entry point is idempotent as well');

select * from finish();
rollback;
