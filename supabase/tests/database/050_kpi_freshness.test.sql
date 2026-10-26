-- KPI freshness: rollups are refreshed on read after writes, seat counts are always live.
begin;
create extension if not exists pgtap with schema extensions;
select plan(22);

create function pg_temp.id(p text) returns uuid language sql immutable as
  $$ select md5('gold-roundtables:' || p)::uuid $$;
create function pg_temp.act_as(p_user text) returns void language sql as $$
  select set_config('request.jwt.claims',
    json_build_object('sub', md5('gold-roundtables:user:' || p_user)::uuid, 'role', 'authenticated')::text,
    true);
$$;
grant execute on function pg_temp.act_as(text) to authenticated;

-- Start from a fresh, clean rollup refreshed 10 s ago.
select public.refresh_kpis();
update kpi.refresh_state set refreshed_at = clock_timestamp() - interval '10 seconds' where id;

-- ── Dirty marking: every table feeding a rollup flags it, even for a statement touching no row ──
create function pg_temp.dirty_after(p_table text) returns boolean language plpgsql as $$
begin
  update kpi.refresh_state set dirty = false where id;
  execute format('update public.%I set id = id where false', p_table);
  return (select dirty from kpi.refresh_state where id);
end;
$$;
select ok(pg_temp.dirty_after('organizations'), 'a write to organizations marks the rollups dirty');
select ok(pg_temp.dirty_after('round_tables'), 'a write to round_tables marks the rollups dirty');
select ok(pg_temp.dirty_after('table_members'), 'a write to table_members marks the rollups dirty');
select ok(pg_temp.dirty_after('sessions'), 'a write to sessions marks the rollups dirty');
select ok(pg_temp.dirty_after('session_attendance'), 'a write to session_attendance marks the rollups dirty');
select ok(pg_temp.dirty_after('member_assessments'), 'a write to member_assessments marks the rollups dirty');
select ok(pg_temp.dirty_after('member_answers'), 'a write to member_answers marks the rollups dirty');
select ok(pg_temp.dirty_after('member_commitments'), 'a write to member_commitments marks the rollups dirty');

-- ── Read-your-writes: a new table is in the KPI summary right away ─────────────────────────────
update kpi.refresh_state set dirty = false where id;
create temp table t_made as select api.table_create(md5('gold-roundtables:user:coord')::uuid, jsonb_build_object(
  'organization_id', pg_temp.id('org:luz'), 'location_id', pg_temp.id('loc:luz-central'),
  'name', 'Mesa Fresca', 'code', 'LUZ-92', 'weekday', 3, 'start_time', '18:00',
  'timezone', 'America/Santo_Domingo',
  'facilitator', jsonb_build_object('person', jsonb_build_object('first_name', 'Fresca', 'last_name', 'Prueba')))) as j;
select ok((select dirty from kpi.refresh_state where id), 'creating a table marks the rollups dirty');
select pg_temp.act_as('admin');
set local role authenticated;
select is(((public.kpi_summary())->'tables'->>'total')::int, 18,
          'the next KPI read already counts the new table (17 seeded + 1)');
select is((select count(*)::int from public.kpi_tables(p_round_table_id := md5('gold-roundtables:table:luz-03')::uuid)),
          1, 'kpi_tables still answers for a single table');
reset role;
select ok(not (select dirty from kpi.refresh_state where id), 'the read refreshed the rollups');

-- ── Debounce and age ───────────────────────────────────────────────────────────────────────────
select public.refresh_kpis();
update kpi.refresh_state set dirty = true where id;
select is(kpi.ensure_fresh(), false, 'a dirty rollup refreshed a moment ago is not refreshed again (2 s debounce)');
update kpi.refresh_state set refreshed_at = clock_timestamp() - interval '3 seconds' where id;
select is(kpi.ensure_fresh(), true, 'once the debounce passed a dirty rollup is refreshed');
update kpi.refresh_state set dirty = false, refreshed_at = clock_timestamp() - interval '1 minute' where id;
select is(kpi.ensure_fresh(), false, 'a clean, recent rollup is left alone');
update kpi.refresh_state set dirty = false, refreshed_at = clock_timestamp() - interval '6 minutes' where id;
select is(kpi.ensure_fresh(), true, 'a clean rollup older than 5 min is refreshed (health depends on now())');

-- ── Seats are live, never from the rollup ─────────────────────────────────────────────────────
update kpi.refresh_state set refreshed_at = clock_timestamp() where id;  -- rollup "fresh": debounce blocks a refresh
create temp table t_seat as select api.invite_create(md5('gold-roundtables:user:facil')::uuid, jsonb_build_object(
  'role_kind', 'member', 'round_table_id', pg_temp.id('table:luz-03'),
  'person', jsonb_build_object('first_name', 'Plaza', 'last_name', 'Viva'))) as j;
select pg_temp.act_as('coord');
set local role authenticated;
select is((select active_people from public.kpi_tables(p_round_table_id := md5('gold-roundtables:table:luz-03')::uuid)),
          9::bigint, 'kpi_tables counts the seat the invite just took');
select is((select seats_free from public.kpi_tables(p_round_table_id := md5('gold-roundtables:table:luz-03')::uuid)),
          0::bigint, 'kpi_tables says no seat is left');
select is((select seats_free from public.admin_tables where id = md5('gold-roundtables:table:luz-03')::uuid),
          0::bigint, 'admin_tables says no seat is left');
select ok((select pending_invites from public.admin_tables where id = md5('gold-roundtables:table:luz-03')::uuid) >= 2,
          'admin_tables counts the pending invites');
reset role;

-- ── Safety net and privileges ──────────────────────────────────────────────────────────────────
select is((select schedule from cron.job where jobname = 'gr-kpi-refresh-dirty'), '30 seconds',
          'pg_cron refreshes dirty rollups every 30 s as a safety net');
select ok(
  not has_function_privilege('authenticated', 'kpi.ensure_fresh(interval, interval)', 'execute')
  and not has_function_privilege('authenticated', 'kpi.summary_impl(date, date, text, uuid, uuid, uuid, uuid, uuid, uuid)', 'execute')
  and has_function_privilege('authenticated', 'public.kpi_summary(date, date, text, uuid, uuid, uuid, uuid, uuid, uuid)', 'execute')
  and not has_function_privilege('anon', 'public.kpi_summary(date, date, text, uuid, uuid, uuid, uuid, uuid, uuid)', 'execute'),
  'kpi internals are private, the public RPCs stay callable by signed-in users only');

select * from finish();
rollback;
