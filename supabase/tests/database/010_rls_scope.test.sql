-- RLS: tenant isolation and answer visibility per role (ADR 0006, PC-10).
-- Runs against the seed (supabase db reset). Ids are md5('gold-roundtables:<label>')::uuid.
begin;
create extension if not exists pgtap with schema extensions;
select plan(30);

create function pg_temp.act_as(p_user text) returns void language sql as $$
  select set_config('request.jwt.claims',
    json_build_object('sub', md5('gold-roundtables:user:' || p_user)::uuid, 'role', 'authenticated')::text,
    true);
$$;
grant execute on function pg_temp.act_as(text) to authenticated;

-- ── Coordinator of Fundación Luz ────────────────────────────────────────────────────────────
select pg_temp.act_as('coord');
set local role authenticated;
select is((select count(*)::int from public.organizations), 1, 'coordinator sees only their organization');
select is((select count(*)::int from public.round_tables
           where organization_id <> md5('gold-roundtables:org:luz')::uuid), 0,
          'coordinator sees no tables of other organizations');
select is((select count(*)::int from public.round_tables), 7, 'coordinator sees all 7 Fundación Luz tables');
select is((select count(*)::int from public.people where organization_id is distinct from md5('gold-roundtables:org:luz')::uuid), 0,
          'coordinator sees no people of other organizations (nor platform staff)');
select is((select count(*)::int from public.sessions where organization_id <> md5('gold-roundtables:org:luz')::uuid), 0,
          'coordinator sees no sessions of other organizations');
select is((select count(*)::int from public.member_answers), 0,
          'coordinator cannot read individual answers directly (answers-reveal only)');
select is((select count(*)::int from public.audit_events where organization_id <> md5('gold-roundtables:org:luz')::uuid), 0,
          'coordinator sees only their organization''s audit events');
select ok((select count(*) from public.audit_events) > 0, 'coordinator sees their audit events');
select is(jsonb_array_length(public.my_contexts()), 2, 'coordinator has two contexts (coordinator + member of Mesa Fe 01)');
reset role;

-- ── Coordinator of Colegio Horizonte ────────────────────────────────────────────────────────
select pg_temp.act_as('coord-horizonte');
set local role authenticated;
select is((select count(*)::int from public.round_tables
           where organization_id = md5('gold-roundtables:org:luz')::uuid), 0,
          'org B coordinator cannot see org A tables');
select is((select count(*)::int from public.people
           where organization_id = md5('gold-roundtables:org:luz')::uuid), 0,
          'org B coordinator cannot see org A people');
select is((select count(*)::int from public.invites
           where organization_id = md5('gold-roundtables:org:luz')::uuid), 0,
          'org B coordinator cannot see org A invites');
select is(((public.kpi_summary())->'tables'->>'total')::int, 5, 'org B KPI summary counts only its 5 tables');
reset role;

-- ── Member (ana) ────────────────────────────────────────────────────────────────────────────
select pg_temp.act_as('ana');
set local role authenticated;
select is((select count(*)::int from public.member_assessments
           where person_id <> md5('gold-roundtables:person:ana')::uuid), 0,
          'member cannot read other people''s scores');
select is((select count(*)::int from public.member_answers
           where person_id <> md5('gold-roundtables:person:ana')::uuid), 0,
          'member cannot read other people''s answers');
select ok((select count(*) from public.member_answers) > 0, 'member reads their own answers');
select is((select count(*)::int from public.people), 1, 'member sees only their own contact data');
select is((select count(distinct round_table_id)::int from public.table_members), 1,
          'member sees the roster of their own table only');
select is((select count(*)::int from public.invites), 0, 'member cannot see invites');
select is(((public.kpi_summary())->'tables'->>'total')::int, 0, 'member has no KPI scope');
select throws_ok($$select * from public.kpi_member_detail(md5('gold-roundtables:table:luz-03')::uuid)$$,
                 'P0001', 'forbidden', 'member cannot open member-level drill-down');
reset role;

-- ── Facilitator of Mesa Esperanza 03 ───────────────────────────────────────────────────────
select pg_temp.act_as('facil');
set local role authenticated;
select is((select count(*)::int from public.member_assessments),
          (select count(*)::int from public.member_assessments
           where round_table_id = md5('gold-roundtables:table:luz-03')::uuid),
          'facilitator sees exactly their table''s scores');
select ok((select count(distinct person_id) from public.member_answers) > 1,
          'facilitator sees the answers of every member of their table');
select is((select count(*)::int from public.member_answers
           where round_table_id = md5('gold-roundtables:table:luz-01')::uuid), 0,
          'facilitator cannot see answers of another table');
select ok((select count(*) from public.people) >= 6, 'facilitator sees contact data of their table');
select ok((select count(*) from public.invites) >= 4, 'facilitator sees invites of their table');
reset role;

-- ── Platform admin ──────────────────────────────────────────────────────────────────────────
select pg_temp.act_as('admin');
set local role authenticated;
select is((select count(*)::int from public.organizations), 3, 'platform admin sees every organization');
select is(((public.kpi_summary())->'tables'->>'total')::int, 17, 'platform admin KPI scope is global');
reset role;

-- ── Anonymous and writes ────────────────────────────────────────────────────────────────────
set local role anon;
select throws_ok($$select count(*) from public.people$$, '42501', null, 'anon cannot read tables');
reset role;
select pg_temp.act_as('ana');
set local role authenticated;
select throws_ok($$insert into public.member_assessments (session_id, person_id, kind, score)
                   values (md5('gold-roundtables:session:luz-03:4')::uuid,
                           md5('gold-roundtables:person:ana')::uuid, 'initial', 8)$$,
                 '42501', null, 'clients cannot write tables directly (writes go through Edge Functions)');
reset role;

select * from finish();
rollback;
