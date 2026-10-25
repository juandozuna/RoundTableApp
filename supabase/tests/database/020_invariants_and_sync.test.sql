-- Business invariants and the sync-upload rules (ADR 0002, 0005, 0014), exercised through the
-- api layer exactly as the Edge Functions call it (service_role → api.*(auth_user_id, input)).
begin;
create extension if not exists pgtap with schema extensions;
select plan(39);

create function pg_temp.u(p text) returns uuid language sql immutable as
  $$ select md5('gold-roundtables:user:' || p)::uuid $$;
create function pg_temp.id(p text) returns uuid language sql immutable as
  $$ select md5('gold-roundtables:' || p)::uuid $$;
-- Runs one sync op for a user and returns its result object.
create function pg_temp.sync1(p_user text, p_op jsonb) returns jsonb language sql as
  $$ select (api.sync_apply(pg_temp.u(p_user), jsonb_build_array(p_op)))->'results'->0 $$;

-- Pending session of Mesa Esperanza 03: value 4 (Responsabilidad), follow-up of value 3.
select is((select value_id from public.sessions where id = pg_temp.id('session:luz-03:4')),
          pg_temp.id('value:4'), 'pending session works the current value');

-- ── Score rule ──────────────────────────────────────────────────────────────────────────────
select is(pg_temp.sync1('ana', jsonb_build_object('op', 'PUT', 'table', 'member_assessments',
            'id', gen_random_uuid(), 'data', jsonb_build_object(
              'session_id', pg_temp.id('session:luz-03:4'), 'person_id', pg_temp.id('person:ana'),
              'kind', 'initial', 'score', 5)))->>'code',
          'score_five_not_allowed', 'score 5 is rejected');
select is(pg_temp.sync1('ana', jsonb_build_object('op', 'PUT', 'table', 'member_assessments',
            'id', gen_random_uuid(), 'data', jsonb_build_object(
              'session_id', pg_temp.id('session:luz-03:4'), 'person_id', pg_temp.id('person:ana'),
              'kind', 'initial', 'score', 11)))->>'code',
          'score_out_of_range', 'score 11 is rejected');
select throws_ok($$insert into public.member_assessments (session_id, person_id, kind, score)
                   values (md5('gold-roundtables:session:luz-03:4')::uuid,
                           md5('gold-roundtables:person:ana')::uuid, 'initial', 5)$$,
                 'P0001', 'score_five_not_allowed', 'score 5 is rejected by the database itself');
select is(pg_temp.sync1('ana', jsonb_build_object('op', 'PUT', 'table', 'member_assessments',
            'id', pg_temp.id('t:ana-initial'), 'data', jsonb_build_object(
              'session_id', pg_temp.id('session:luz-03:4'), 'person_id', pg_temp.id('person:ana'),
              'kind', 'initial', 'score', 7, 'device_created_at', now() - interval '1 minute')))->>'status',
          'applied', 'a valid initial score is applied');

-- ── Follow-up exactly once ─────────────────────────────────────────────────────────────────
select is(pg_temp.sync1('ana', jsonb_build_object('op', 'PUT', 'table', 'member_assessments',
            'id', pg_temp.id('t:ana-follow'), 'data', jsonb_build_object(
              'session_id', pg_temp.id('session:luz-03:4'), 'person_id', pg_temp.id('person:ana'),
              'kind', 'follow_up', 'score', 8)))->>'status',
          'applied', 'follow-up score applied in the next session');
select is((select value_id from public.member_assessments where id = pg_temp.id('t:ana-follow')),
          pg_temp.id('value:3'), 'follow-up is recorded against the previous value');
select is(pg_temp.sync1('ana', jsonb_build_object('op', 'PUT', 'table', 'member_assessments',
            'id', gen_random_uuid(), 'data', jsonb_build_object(
              'session_id', pg_temp.id('session:luz-03:4'), 'person_id', pg_temp.id('person:ana'),
              'kind', 'follow_up', 'score', 9)))->>'code',
          'duplicate_follow_up', 'a second follow-up for the same value is rejected');
select is(pg_temp.sync1('ana', jsonb_build_object('op', 'PUT', 'table', 'member_assessments',
            'id', pg_temp.id('t:ana-follow'), 'data', jsonb_build_object(
              'session_id', pg_temp.id('session:luz-03:4'), 'person_id', pg_temp.id('person:ana'),
              'kind', 'follow_up', 'score', 9)))->>'status',
          'applied', 're-uploading the same row id is idempotent (update)');
select is((select count(*)::int from public.member_assessments
           where session_id = pg_temp.id('session:luz-03:4') and person_id = pg_temp.id('person:ana')),
          2, 'idempotent upload kept one initial and one follow-up row');
select throws_ok($$insert into public.member_assessments (session_id, person_id, kind, score)
                   values (md5('gold-roundtables:session:luz-07:1')::uuid,
                           md5('gold-roundtables:person:luz-07:0')::uuid, 'follow_up', 7)$$,
                 'P0001', 'follow_up_not_available', 'the first session of a table has no follow-up');

-- ── Ownership and cross-tenant writes ──────────────────────────────────────────────────────
select is(pg_temp.sync1('luis', jsonb_build_object('op', 'PUT', 'table', 'member_answers',
            'id', gen_random_uuid(), 'data', jsonb_build_object(
              'session_id', pg_temp.id('session:luz-03:4'), 'person_id', pg_temp.id('person:ana'),
              'question_id', pg_temp.id('question:4:por_que'), 'answer_text', 'x')))->>'code',
          'forbidden', 'a member cannot write another member''s answers');
select is(pg_temp.sync1('coord-horizonte', jsonb_build_object('op', 'PUT', 'table', 'member_assessments',
            'id', gen_random_uuid(), 'data', jsonb_build_object(
              'session_id', pg_temp.id('session:luz-03:4'), 'person_id', pg_temp.id('person:ana'),
              'kind', 'initial', 'score', 3)))->>'code',
          'forbidden', 'a user of another organization cannot write into this organization');
select is(pg_temp.sync1('coord-horizonte', jsonb_build_object('op', 'PUT', 'table', 'member_assessments',
            'id', gen_random_uuid(), 'data', jsonb_build_object(
              'session_id', pg_temp.id('session:luz-03:4'), 'person_id', pg_temp.id('person:coord-horizonte'),
              'kind', 'initial', 'score', 3)))->>'code',
          'not_table_participant', 'own person of org B cannot attach to a session of org A');
select is(pg_temp.sync1('ana', jsonb_build_object('op', 'PUT', 'table', 'member_assessments',
            'id', gen_random_uuid(), 'data', jsonb_build_object(
              'session_id', pg_temp.id('session:luz-01:9'), 'person_id', pg_temp.id('person:ana'),
              'kind', 'initial', 'score', 6)))->>'code',
          'not_table_participant', 'a member cannot answer for a table they do not belong to');
select is(pg_temp.sync1('ana', jsonb_build_object('op', 'PUT', 'table', 'session_attendance',
            'id', gen_random_uuid(), 'data', jsonb_build_object(
              'session_id', pg_temp.id('session:luz-03:4'), 'person_id', pg_temp.id('person:luis'),
              'status', 'present')))->>'code',
          'forbidden', 'a member cannot record attendance');
select is(pg_temp.sync1('ana', jsonb_build_object('op', 'PATCH', 'table', 'sessions',
            'id', pg_temp.id('session:luz-03:4'), 'data', '{"status":"open","stage":"attendance"}'::jsonb))->>'code',
          'forbidden', 'a member cannot drive the session');
select is(pg_temp.sync1('ana', jsonb_build_object('op', 'DELETE', 'table', 'member_assessments',
            'id', pg_temp.id('t:ana-initial')))->>'code',
          'operation_not_allowed', 'session data cannot be deleted from devices');
select is(pg_temp.sync1('ana', jsonb_build_object('op', 'PUT', 'table', 'organizations',
            'id', gen_random_uuid(), 'data', '{}'::jsonb))->>'code',
          'unsupported_table', 'only session-domain tables are accepted by sync-upload');

-- ── Session flow (facilitator) and auto-attendance ─────────────────────────────────────────
select is(pg_temp.sync1('facil', jsonb_build_object('op', 'PATCH', 'table', 'sessions',
            'id', pg_temp.id('session:luz-03:4'),
            'data', jsonb_build_object('status', 'open', 'stage', 'attendance',
                                       'started_at', now() - interval '20 minutes')))->>'status',
          'applied', 'facilitator opens the session');
select is(pg_temp.sync1('facil', jsonb_build_object('op', 'PUT', 'table', 'session_attendance',
            'id', pg_temp.id('t:att-luis'), 'data', jsonb_build_object(
              'session_id', pg_temp.id('session:luz-03:4'), 'person_id', pg_temp.id('person:luis'),
              'status', 'absent')))->>'status',
          'applied', 'facilitator marks a member absent');
select is(pg_temp.sync1('luis', jsonb_build_object('op', 'PUT', 'table', 'member_commitments',
            'id', pg_temp.id('t:luis-commit'), 'data', jsonb_build_object(
              'session_id', pg_temp.id('session:luz-03:4'), 'person_id', pg_temp.id('person:luis'),
              'action_text', 'Llegar puntual a todas mis reuniones', 'measure_text', '5 de 5 reuniones',
              'device_created_at', now() - interval '5 minutes')))->>'status',
          'applied', 'absent member submits a commitment');
select results_eq(
  $$select status::text, source::text from public.session_attendance
    where session_id = md5('gold-roundtables:session:luz-03:4')::uuid
      and person_id = md5('gold-roundtables:person:luis')::uuid$$,
  $$values ('present', 'auto_submission')$$,
  'a submission flips absent to present (auto_submission)');
select is(pg_temp.sync1('facil', jsonb_build_object('op', 'PATCH', 'table', 'session_attendance',
            'id', pg_temp.id('t:att-luis'), 'data', '{"status":"absent"}'::jsonb))->>'status',
          'applied', 'facilitator re-marking absent is accepted...');
select is((select status::text from public.session_attendance where id = pg_temp.id('t:att-luis')),
          'present', '...but a submission still wins over absent');
select is((select count(*)::int from public.session_attendance
           where session_id = pg_temp.id('session:luz-03:4') and person_id = pg_temp.id('person:ana')),
          1, 'ana was auto-marked present by her earlier scores');

select is(pg_temp.sync1('facil', jsonb_build_object('op', 'PATCH', 'table', 'sessions',
            'id', pg_temp.id('session:luz-03:4'), 'data', '{"status":"scheduled","stage":"lobby"}'::jsonb))->>'code',
          'invalid_session_transition', 'an open session cannot go back to scheduled');
-- now() is frozen inside this test transaction; pretend ana's score arrived 30 minutes ago,
-- before the close (received_at is a server column: this is a maintenance update).
update public.member_assessments set received_at = now() - interval '30 minutes'
where id = pg_temp.id('t:ana-initial');
select is(pg_temp.sync1('facil', jsonb_build_object('op', 'PATCH', 'table', 'sessions',
            'id', pg_temp.id('session:luz-03:4'),
            'data', jsonb_build_object('status', 'closed', 'ended_at', now() - interval '2 minutes')))->>'status',
          'applied', 'facilitator closes the session');

-- ── Late sync (ADR 0005) ───────────────────────────────────────────────────────────────────
select is(pg_temp.sync1('marta', jsonb_build_object('op', 'PUT', 'table', 'member_answers',
            'id', pg_temp.id('t:marta-late'), 'data', jsonb_build_object(
              'session_id', pg_temp.id('session:luz-03:4'), 'person_id', pg_temp.id('person:marta'),
              'question_id', pg_temp.id('question:4:por_que'), 'answer_text', 'Respondí sin señal',
              'device_created_at', now() - interval '10 minutes')))->>'status',
          'applied', 'an answer captured before the close is accepted after the close');
select ok((select synced_late from public.member_answers where id = pg_temp.id('t:marta-late')),
          'and it is flagged synced_late');
select ok((select status = 'present' from public.session_attendance
           where session_id = pg_temp.id('session:luz-03:4') and person_id = pg_temp.id('person:marta')),
          'a late submission also marks the member present');
select is(pg_temp.sync1('marta', jsonb_build_object('op', 'PUT', 'table', 'member_answers',
            'id', gen_random_uuid(), 'data', jsonb_build_object(
              'session_id', pg_temp.id('session:luz-03:4'), 'person_id', pg_temp.id('person:marta'),
              'question_id', pg_temp.id('question:4:ejemplo'), 'answer_text', 'Escrito después',
              'device_created_at', now() + interval '1 hour')))->>'status',
          'applied', 'future device clocks are clamped to server time (within grace: accepted)');
select ok(not (select synced_late from public.member_assessments where id = pg_temp.id('t:ana-initial')),
          'rows received before the close are not late');
select throws_ok($$update public.sessions set stage = 'value'
                   where id = md5('gold-roundtables:session:luz-03:4')::uuid$$,
                 'P0001', 'session_finalized', 'a closed session is final');

-- Closing advanced the program and scheduled the next session.
select is((select current_value_id from public.round_tables where id = pg_temp.id('table:luz-03')),
          pg_temp.id('value:5'), 'closing advanced the table to the next value');
select results_eq(
  $$select value_id, follow_up_value_id from public.sessions
    where round_table_id = md5('gold-roundtables:table:luz-03')::uuid and status = 'scheduled'$$,
  $$values (md5('gold-roundtables:value:5')::uuid, md5('gold-roundtables:value:4')::uuid)$$,
  'the next session works value 5 with follow-up of value 4');

-- ── Seats and memberships ──────────────────────────────────────────────────────────────────
select is((select count(*)::int from public.table_members
           where round_table_id = pg_temp.id('table:luz-05') and status = 'active'), 9,
          'Mesa Roble 05 is full (9 incl. facilitator)');
select throws_ok($$insert into public.table_members (organization_id, round_table_id, person_id)
                   values (md5('gold-roundtables:org:luz')::uuid, md5('gold-roundtables:table:luz-05')::uuid,
                           md5('gold-roundtables:person:luz-01:3')::uuid)$$,
                 'P0001', 'table_full', 'the 10th seat is rejected');
select throws_ok($$insert into public.table_members (organization_id, round_table_id, person_id, role)
                   values (md5('gold-roundtables:org:luz')::uuid, md5('gold-roundtables:table:luz-04')::uuid,
                           md5('gold-roundtables:person:luz-01:4')::uuid, 'facilitator')$$,
                 '23505', null, 'a second active facilitator is rejected');

select * from finish();
rollback;
