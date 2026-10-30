-- RLS for the online reads (ADR 0019): the app reads these tables straight through PostgREST under
-- the caller's JWT, so what each role gets here is exactly what the app shows.
-- Covers sessions, session_attendance, member_commitments, the curriculum tables and
-- content_locales per actor (member, facilitator of the table, facilitator of a second table in the
-- same organization, coordinator, platform admin, other organization, a member who left the
-- table, anonymous), and the table privileges of every table the app reads (PostgrestTables).
-- Runs against the seed (supabase db reset). Ids are md5('gold-roundtables:<label>')::uuid.
--
-- Expected counts are measured as the owner (RLS bypassed) before switching role, then compared
-- with what the role sees, so the test does not depend on how many rows the seed generates.
begin;
create extension if not exists pgtap with schema extensions;
select plan(68);

create function pg_temp.id(p text) returns uuid language sql immutable as
  $$ select md5('gold-roundtables:' || p)::uuid $$;
create function pg_temp.act_as(p_user text) returns void language sql as $$
  select set_config('request.jwt.claims',
    json_build_object('sub', pg_temp.id('user:' || p_user), 'role', 'authenticated')::text, true);
$$;
grant execute on function pg_temp.act_as(text) to authenticated;

-- ── Ground truth, measured with RLS bypassed ────────────────────────────────────────────────
create temp table exp (k text primary key, n bigint not null);
insert into exp values
  ('s_all', (select count(*) from public.sessions)),
  ('s_t3', (select count(*) from public.sessions where round_table_id = pg_temp.id('table:luz-03'))),
  ('s_t1', (select count(*) from public.sessions where round_table_id = pg_temp.id('table:luz-01'))),
  ('s_t4', (select count(*) from public.sessions where round_table_id = pg_temp.id('table:luz-04'))),
  ('s_luz', (select count(*) from public.sessions where organization_id = pg_temp.id('org:luz'))),
  ('s_hor', (select count(*) from public.sessions where organization_id = pg_temp.id('org:horizonte'))),
  ('s_hor01', (select count(*) from public.sessions where round_table_id = pg_temp.id('table:hor-01'))),
  ('a_t3', (select count(*) from public.session_attendance where round_table_id = pg_temp.id('table:luz-03'))),
  ('a_t1', (select count(*) from public.session_attendance where round_table_id = pg_temp.id('table:luz-01'))),
  ('a_t4', (select count(*) from public.session_attendance where round_table_id = pg_temp.id('table:luz-04'))),
  ('a_luz', (select count(*) from public.session_attendance where organization_id = pg_temp.id('org:luz'))),
  ('a_hor01', (select count(*) from public.session_attendance where round_table_id = pg_temp.id('table:hor-01'))),
  ('a_left_old', (select count(*) from public.session_attendance
                  where round_table_id = pg_temp.id('table:luz-02') and person_id = pg_temp.id('person:luz-02:7'))),
  ('c_t3', (select count(*) from public.member_commitments where round_table_id = pg_temp.id('table:luz-03'))),
  ('c_t1', (select count(*) from public.member_commitments where round_table_id = pg_temp.id('table:luz-01'))),
  ('c_ana', (select count(*) from public.member_commitments where person_id = pg_temp.id('person:ana'))),
  ('c_left', (select count(*) from public.member_commitments where person_id = pg_temp.id('person:luz-02:7'))),
  ('c_hor01_1', (select count(*) from public.member_commitments where person_id = pg_temp.id('person:hor-01:1')));
grant select on exp to authenticated;
create function pg_temp.e(p_key text) returns bigint language sql stable as
  $$ select n from exp where k = p_key $$;
grant execute on function pg_temp.e(text) to authenticated;

-- The curriculum and the content languages, with one translation so that table is not empty.
insert into public.content_locales (code, name) values ('en', 'English') on conflict (code) do nothing;
insert into public.curriculum_translations (locale, entity_type, entity_id, name)
select 'en', 'module', id, 'Character' from public.curriculum_modules order by number limit 1
on conflict do nothing;
create function pg_temp.curriculum_counts() returns text language sql as $$
  select concat_ws(',',
    (select count(*) from public.curriculum_modules),
    (select count(*) from public.curriculum_values),
    (select count(*) from public.value_questions),
    (select count(*) from public.content_locales),
    (select count(*) from public.curriculum_translations))
$$;
grant execute on function pg_temp.curriculum_counts() to authenticated;
create temp table exp_cur as select pg_temp.curriculum_counts() as c;
grant select on exp_cur to authenticated;

select ok((select c !~ '(^|,)0(,|$)' from exp_cur),
          'the seed has modules, values, questions, languages and translations');
select ok(pg_temp.e('s_t3') > 0 and pg_temp.e('a_t3') > 0 and pg_temp.e('c_t3') > 0
          and pg_temp.e('s_t1') > 0 and pg_temp.e('a_t1') > 0 and pg_temp.e('c_t1') > 0
          and pg_temp.e('s_hor01') > 0 and pg_temp.e('a_left_old') > 0 and pg_temp.e('s_t4') > 0,
          'the seed has sessions, attendance and commitments on every table the roles are compared on');

-- ── Table privileges of every table the app reads (PostgrestTables) ─────────────────────────
create temp table read_tables (t text primary key);
insert into read_tables values
  ('curriculum_modules'), ('curriculum_values'), ('value_questions'), ('content_locales'),
  ('curriculum_translations'), ('organizations'), ('locations'), ('people'), ('role_assignments'),
  ('round_tables'), ('table_members'), ('sessions'), ('session_attendance'), ('member_assessments'),
  ('member_answers'), ('member_commitments');

select ok(has_table_privilege('authenticated', 'public.' || t, 'select'), 'authenticated can select ' || t)
  from read_tables order by t;
select is((select array_agg(t order by t) from read_tables
           where has_table_privilege('anon', 'public.' || t, 'select')), null::text[],
          'anon can select none of them');
select is((select array_agg(t order by t) from read_tables
           where has_table_privilege('authenticated', 'public.' || t, 'insert')
              or has_table_privilege('authenticated', 'public.' || t, 'update')
              or has_table_privilege('authenticated', 'public.' || t, 'delete')), null::text[],
          'authenticated cannot write any of them (writes go through sync-upload)');
select is((select array_agg(t order by t) from read_tables r
           join pg_catalog.pg_class c on c.relname = r.t and c.relnamespace = 'public'::regnamespace
           where not c.relrowsecurity), null::text[], 'every one of them has row level security enabled');

-- ── Member of Mesa Esperanza 03 (ana) ───────────────────────────────────────────────────────
select pg_temp.act_as('ana');
set local role authenticated;
select is((select count(*) from public.sessions), pg_temp.e('s_t3'), 'member sees their table''s sessions, only those');
select is((select count(*) from public.session_attendance), pg_temp.e('a_t3'),
          'member sees the attendance of their table, only that');
select ok((select count(distinct person_id) from public.session_attendance) > 1,
          'member sees the attendance of the other members of the table');
select is((select count(*) from public.member_commitments where person_id <> pg_temp.id('person:ana')), 0::bigint,
          'member cannot read other people''s commitments');
select is((select count(*) from public.member_commitments), pg_temp.e('c_ana'), 'member reads their own commitments');
select is(pg_temp.curriculum_counts(), (select c from exp_cur), 'member reads the whole curriculum and the languages');
reset role;

-- ── Facilitator of Mesa Esperanza 03 (facil) ────────────────────────────────────────────────
select pg_temp.act_as('facil');
set local role authenticated;
select is((select count(*) from public.sessions), pg_temp.e('s_t3'), 'facilitator sees their table''s sessions only');
select is((select count(*) from public.session_attendance), pg_temp.e('a_t3'),
          'facilitator sees their table''s attendance only');
select is((select count(*) from public.member_commitments), pg_temp.e('c_t3'),
          'facilitator reads every commitment of their table and none of another table');
select is(pg_temp.curriculum_counts(), (select c from exp_cur), 'facilitator reads the whole curriculum and the languages');
reset role;

-- ── Facilitator of a second table of the same organization (Mesa Fe 01) ─────────────────────
select pg_temp.act_as('luz-01:0');
set local role authenticated;
select is((select count(*) from public.sessions), pg_temp.e('s_t1'), 'second-table facilitator sees only their table''s sessions');
select is((select count(*) from public.sessions where round_table_id = pg_temp.id('table:luz-03')), 0::bigint,
          'second-table facilitator sees no session of the first table');
select is((select count(*) from public.session_attendance), pg_temp.e('a_t1'),
          'second-table facilitator sees only their table''s attendance');
select is((select count(*) from public.member_commitments), pg_temp.e('c_t1'),
          'second-table facilitator reads their own table''s commitments');
select is((select count(*) from public.member_commitments where round_table_id = pg_temp.id('table:luz-03')), 0::bigint,
          'second-table facilitator reads no commitment of the first table, same organization or not');
reset role;

-- ── Coordinator of Fundación Luz (also a member of Mesa Fe 01) ──────────────────────────────
select pg_temp.act_as('coord');
set local role authenticated;
select is((select count(*) from public.sessions), pg_temp.e('s_luz'), 'coordinator sees every session of their organization');
select is((select count(*) from public.sessions where organization_id <> pg_temp.id('org:luz')), 0::bigint,
          'coordinator sees no session of another organization');
select is((select count(*) from public.session_attendance), pg_temp.e('a_luz'),
          'coordinator sees every attendance row of their organization');
select is((select count(*) from public.member_commitments where person_id <> pg_temp.id('person:coord')), 0::bigint,
          'coordinator cannot read anyone else''s commitment');
select is(pg_temp.curriculum_counts(), (select c from exp_cur), 'coordinator reads the whole curriculum and the languages');
reset role;

-- ── Coordinator of another organization (Colegio Horizonte) ─────────────────────────────────
select pg_temp.act_as('coord-horizonte');
set local role authenticated;
select is((select count(*) from public.sessions), pg_temp.e('s_hor'), 'other-organization coordinator sees only their sessions');
select is((select count(*) from public.sessions where organization_id = pg_temp.id('org:luz')), 0::bigint,
          'other-organization coordinator sees no Fundación Luz session');
select is((select count(*) from public.session_attendance where organization_id = pg_temp.id('org:luz')), 0::bigint,
          'other-organization coordinator sees no Fundación Luz attendance');
select is((select count(*) from public.member_commitments), 0::bigint, 'other-organization coordinator reads no commitment');
select is(pg_temp.curriculum_counts(), (select c from exp_cur), 'curriculum is shared across organizations');
reset role;

-- ── Member of another organization (Mesa Docentes 01) ───────────────────────────────────────
select pg_temp.act_as('hor-01:1');
set local role authenticated;
select is((select count(*) from public.sessions), pg_temp.e('s_hor01'), 'other-organization member sees only their table''s sessions');
select is((select count(*) from public.session_attendance), pg_temp.e('a_hor01'),
          'other-organization member sees only their table''s attendance');
select is((select count(*) from public.sessions where organization_id = pg_temp.id('org:luz')), 0::bigint,
          'other-organization member sees no Fundación Luz session');
select is((select count(*) from public.member_commitments), pg_temp.e('c_hor01_1'),
          'other-organization member reads only their own commitments');
reset role;

-- ── A member who left Mesa Alba 02 for Mesa Camino 04 ───────────────────────────────────────
select pg_temp.act_as('luz-02:7');
set local role authenticated;
select is((select count(*) from public.sessions), pg_temp.e('s_t4'),
          'a member who left sees the sessions of their current table only');
select is((select count(*) from public.sessions where round_table_id = pg_temp.id('table:luz-02')), 0::bigint,
          'a member who left no longer sees the old table''s sessions');
select is((select count(*) from public.session_attendance where round_table_id = pg_temp.id('table:luz-02')
           and person_id <> pg_temp.id('person:luz-02:7')), 0::bigint,
          'a member who left no longer sees the old table''s attendance of others');
select is((select count(*) from public.session_attendance where round_table_id = pg_temp.id('table:luz-02')),
          pg_temp.e('a_left_old'), 'a member who left keeps their own attendance history');
select is((select count(*) from public.session_attendance where round_table_id = pg_temp.id('table:luz-04')),
          pg_temp.e('a_t4'), 'a member who left sees the attendance of the new table');
select is((select count(*) from public.member_commitments), pg_temp.e('c_left'),
          'a member who left keeps reading their own commitments, and only those');
select is(pg_temp.curriculum_counts(), (select c from exp_cur), 'a member who left still reads the curriculum');
reset role;

-- ── Platform admin ──────────────────────────────────────────────────────────────────────────
select pg_temp.act_as('admin');
set local role authenticated;
select is((select count(*) from public.sessions), pg_temp.e('s_all'), 'platform admin sees every session');
select is((select count(*) from public.member_commitments), 0::bigint,
          'platform admin reads no individual commitment (answers stay with the table)');
select is(pg_temp.curriculum_counts(), (select c from exp_cur), 'platform admin reads the whole curriculum and the languages');
reset role;

-- ── Anonymous ───────────────────────────────────────────────────────────────────────────────
set local role anon;
select throws_ok($$select count(*) from public.sessions$$, '42501', null, 'anon cannot read sessions');
select throws_ok($$select count(*) from public.session_attendance$$, '42501', null, 'anon cannot read attendance');
select throws_ok($$select count(*) from public.member_commitments$$, '42501', null, 'anon cannot read commitments');
select throws_ok($$select count(*) from public.curriculum_modules$$, '42501', null, 'anon cannot read the curriculum');
select throws_ok($$select count(*) from public.content_locales$$, '42501', null, 'anon cannot read the content languages');
reset role;

-- ── Direct writes are refused ───────────────────────────────────────────────────────────────
select pg_temp.act_as('facil');
set local role authenticated;
select throws_ok($$update public.sessions set status = 'cancelled'$$, '42501', null,
                 'a facilitator cannot write sessions directly');
select throws_ok($$update public.member_commitments set action_text = 'x'$$, '42501', null,
                 'a facilitator cannot rewrite commitments directly');
select throws_ok($$insert into public.content_locales (code, name) values ('fr', 'Français')$$, '42501', null,
                 'a client cannot add a content language directly');
reset role;

select * from finish();
rollback;
