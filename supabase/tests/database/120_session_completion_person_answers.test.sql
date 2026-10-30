-- Incomplete sessions (RF-50, P-72) and person answers (RF-54): the server derives the
-- completion when a session closes, clients cannot write it, the follow-up rule is unchanged,
-- and a picked person must sit at the member's table.
begin;
create extension if not exists pgtap with schema extensions;
select plan(27);

create function pg_temp.u(p text) returns uuid language sql immutable as
  $$ select md5('gold-roundtables:user:' || p)::uuid $$;
create function pg_temp.id(p text) returns uuid language sql immutable as
  $$ select md5('gold-roundtables:' || p)::uuid $$;
create function pg_temp.sync1(p_user text, p_op jsonb) returns jsonb language sql as
  $$ select (api.sync_apply(pg_temp.u(p_user), jsonb_build_array(p_op)))->'results'->0 $$;
-- The pending session of a table, by table code.
create function pg_temp.pending(p_code text) returns uuid language sql as $$
  select s.id from public.sessions s join public.round_tables rt on rt.id = s.round_table_id
  where rt.code = p_code and s.status in ('scheduled', 'open')
$$;
create function pg_temp.act_as(p_user text) returns void language sql as $$
  select set_config('request.jwt.claims',
    json_build_object('sub', pg_temp.u(p_user), 'role', 'authenticated')::text, true);
$$;
grant execute on function pg_temp.act_as(text) to authenticated;
grant execute on function pg_temp.pending(text) to authenticated;

-- ── Migration backfill ─────────────────────────────────────────────────────────────────────
select is((select count(*)::int from public.sessions where status = 'closed' and completion is null),
          0, 'every closed session has a completion');
select is((select count(*)::int from public.sessions where status <> 'closed' and completion is not null),
          0, 'only closed sessions have a completion');

-- ── Closing early / complete (LUZ-01 and LUZ-02, direct updates run the same triggers) ─────
create temp table t_closed on commit drop as
  select pg_temp.pending('LUZ-01') as early_id, pg_temp.pending('LUZ-02') as full_id,
         (select value_id from public.sessions where id = pg_temp.pending('LUZ-01')) as early_value;

update public.sessions set status = 'open', stage = 'attendance'
  where id = (select early_id from t_closed);
update public.sessions set status = 'closed'
  where id = (select early_id from t_closed);
select is((select completion::text from public.sessions where id = (select early_id from t_closed)),
          'incomplete', 'closing from the attendance stage is incomplete');
select is((select incomplete_reason from public.sessions where id = (select early_id from t_closed)),
          'closed_early', 'with the reason closed_early');

update public.sessions set status = 'open', stage = 'value'
  where id = (select full_id from t_closed);
update public.sessions set answers_closed_at = now()
  where id = (select full_id from t_closed);
update public.sessions set status = 'closed'
  where id = (select full_id from t_closed);
select is((select completion::text from public.sessions where id = (select full_id from t_closed)),
          'complete', 'closing from the answers stage is complete');
select is((select incomplete_reason from public.sessions where id = (select full_id from t_closed)),
          null, 'a complete session has no reason');

-- Closing a scheduled session without opening it is incomplete as well.
create temp table t_direct on commit drop as select pg_temp.pending('LUZ-04') as id;
create temp table t_luz3 on commit drop as select pg_temp.pending('LUZ-03') as id;
update public.sessions set status = 'closed', stage = 'closed' where id = (select id from t_direct);
select is((select completion::text from public.sessions where id = (select id from t_direct)),
          'incomplete', 'closing a session that never left the lobby is incomplete');

-- ── The follow-up rule is unchanged: once, in the next session ─────────────────────────────
select is((select s.follow_up_value_id from public.sessions s
           where s.round_table_id = (select round_table_id from public.sessions
                                     where id = (select early_id from t_closed))
             and s.status = 'scheduled'),
          (select early_value from t_closed),
          'the next session follows up the value of the incomplete session');
select is((select count(*)::int from public.sessions s
           where s.round_table_id = (select round_table_id from public.sessions
                                     where id = (select early_id from t_closed))
             and s.status in ('scheduled', 'open')),
          1, 'and exactly one session is pending');

-- ── Clients cannot write the completion ────────────────────────────────────────────────────
select is(pg_temp.sync1('facil', jsonb_build_object('op', 'PATCH', 'table', 'sessions',
            'id', pg_temp.pending('LUZ-03'),
            'data', '{"status":"open","stage":"attendance","completion":"incomplete"}'::jsonb))->>'status',
          'applied', 'the facilitator opens the session');
select is((select completion::text from public.sessions where id = pg_temp.pending('LUZ-03')),
          null, 'a completion sent by a client is ignored');
update public.sessions set completion = 'complete' where id = (select early_id from t_closed);
select is((select completion::text from public.sessions where id = (select early_id from t_closed)),
          'incomplete', 'a closed session''s completion cannot be rewritten');

-- ── Person answers (RF-54) on LUZ-03: the facilitator opened it above ──────────────────────
select is((select response_type from public.value_questions
           where id = pg_temp.id('question:4:ejemplo')), 'person', 'the example question is a person question');
select is(pg_temp.sync1('ana', jsonb_build_object('op', 'PUT', 'table', 'member_answers',
            'id', pg_temp.id('t:ana-ejemplo'), 'data', jsonb_build_object(
              'session_id', pg_temp.pending('LUZ-03'), 'person_id', pg_temp.id('person:ana'),
              'question_id', pg_temp.id('question:4:ejemplo'), 'answer_text', 'Luis',
              'answer_person_id', pg_temp.id('person:luis'))))->>'status',
          'applied', 'a member picks a person of their table');
select is((select answer_person_id from public.member_answers where id = pg_temp.id('t:ana-ejemplo')),
          pg_temp.id('person:luis'), 'the picked person id is stored');
select is((select answer_text from public.member_answers where id = pg_temp.id('t:ana-ejemplo')),
          'Luis', 'with the name as the answer text');
select is(pg_temp.sync1('ana', jsonb_build_object('op', 'PUT', 'table', 'member_answers',
            'id', pg_temp.id('t:ana-ejemplo'), 'data', jsonb_build_object(
              'session_id', pg_temp.pending('LUZ-03'), 'person_id', pg_temp.id('person:ana'),
              'question_id', pg_temp.id('question:4:ejemplo'), 'answer_text', 'Mi tía',
              'answer_person_id', null)))->>'status',
          'applied', 'switching to "otra persona" is accepted');
select is((select answer_person_id from public.member_answers where id = pg_temp.id('t:ana-ejemplo')),
          null, 'and clears the picked person');
select is(pg_temp.sync1('ana', jsonb_build_object('op', 'PATCH', 'table', 'member_answers',
            'id', pg_temp.id('t:ana-ejemplo'), 'data', jsonb_build_object(
              'answer_text', 'Mi tía Rosa')))->>'status',
          'applied', 'a patch without the person column is accepted');
select is((select answer_text from public.member_answers where id = pg_temp.id('t:ana-ejemplo')),
          'Mi tía Rosa', 'and edits only the text');
select is(pg_temp.sync1('ana', jsonb_build_object('op', 'PUT', 'table', 'member_answers',
            'id', pg_temp.id('t:ana-ejemplo'), 'data', jsonb_build_object(
              'session_id', pg_temp.pending('LUZ-03'), 'person_id', pg_temp.id('person:ana'),
              'question_id', pg_temp.id('question:4:ejemplo'), 'answer_text', 'Horizonte',
              'answer_person_id', pg_temp.id('person:coord-horizonte'))))->>'code',
          'answer_person_not_at_table', 'a person of another organization cannot be picked');
select is(pg_temp.sync1('ana', jsonb_build_object('op', 'PUT', 'table', 'member_answers',
            'id', gen_random_uuid(), 'data', jsonb_build_object(
              'session_id', pg_temp.pending('LUZ-03'), 'person_id', pg_temp.id('person:ana'),
              'question_id', pg_temp.id('question:4:por_que'), 'answer_text', 'Luis',
              'answer_person_id', pg_temp.id('person:luis'))))->>'code',
          'answer_person_not_at_table', 'only a person question takes a picked person');

-- ── KPI headline counts the incomplete sessions (admin scope) ──────────────────────────────
select pg_temp.act_as('admin');
set local role authenticated;
select ok(((public.kpi_summary())->>'sessions_incomplete')::int >= 2,
          'kpi_summary reports the incomplete sessions');
select is(((public.kpi_summary())->>'sessions_closed')::int
          - ((public.kpi_summary())->>'sessions_incomplete')::int >= 1, true,
          'and the complete ones are still counted');
reset role;

-- ── Audit: the close event carries the completion ──────────────────────────────────────────
select is(pg_temp.sync1('facil', jsonb_build_object('op', 'PATCH', 'table', 'sessions',
            'id', pg_temp.pending('LUZ-03'), 'data', '{"status":"closed"}'::jsonb))->>'status',
          'applied', 'the facilitator closes the session');
select is((select payload->>'completion' from public.audit_events
           where entity_id = (select id from t_luz3) and event_type = 'session.closed'),
          'incomplete', 'the close is audited as incomplete (it closed from the attendance stage)');
select is((select payload->>'incomplete_reason' from public.audit_events
           where entity_id = (select id from t_luz3) and event_type = 'session.closed'),
          'closed_early', 'with its reason');

select * from finish();
rollback;
