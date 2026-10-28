-- Table program position (RF-28): module + value 1..48, rewind confirmation, closed history intact.
begin;
create extension if not exists pgtap with schema extensions;
select plan(14);

create function pg_temp.u(p text) returns uuid language sql immutable as
  $$ select md5('gold-roundtables:user:' || p)::uuid $$;
create function pg_temp.id(p text) returns uuid language sql immutable as
  $$ select md5('gold-roundtables:' || p)::uuid $$;
create function pg_temp.err(p_sql text) returns text language plpgsql as $$
begin
  execute p_sql;
  return null;
exception when others then
  return sqlerrm;
end;
$$;
create function pg_temp.value(p_sequence int) returns uuid language sql as
  $$ select id from public.curriculum_values where sequence = p_sequence $$;
create function pg_temp.set_value(p_uid text, p_sequence int, p_confirm boolean default null)
returns text language sql as $$
  select pg_temp.err(format(
    $f$select api.table_update(%L, jsonb_build_object('round_table_id', %L, 'current_value_id', %L) || %L::jsonb)$f$,
    pg_temp.u(p_uid), pg_temp.id('table:luz-02'), pg_temp.value(p_sequence),
    case when p_confirm is null then '{}' else jsonb_build_object('confirm_rewind', p_confirm)::text end))
$$;

-- Mesa Alba 02 has closed history; k is the last value it completed.
create temp table t_base as
select (select max(cv.sequence) from public.sessions s join public.curriculum_values cv on cv.id = s.value_id
        where s.round_table_id = pg_temp.id('table:luz-02') and s.status = 'closed') as k,
       (select md5(string_agg(s.id::text || s.value_id::text || s.status::text, ',' order by s.id))
        from public.sessions s where s.round_table_id = pg_temp.id('table:luz-02') and s.status = 'closed') as history;
select ok((select k from t_base) >= 2, 'the demo table has closed history to protect');

-- ── Forward moves need no confirmation and are audited ────────────────────────────────────────
select is(pg_temp.set_value('coord', (select k from t_base) + 3), null::text,
          'moving forward in the program is accepted without confirmation');
select is((select sequence::int from public.curriculum_values cv join public.round_tables rt
           on rt.current_value_id = cv.id where rt.id = pg_temp.id('table:luz-02')),
          (select k from t_base) + 3, 'the table now works the chosen value');
select is((select value_id from public.sessions where round_table_id = pg_temp.id('table:luz-02')
           and status = 'scheduled'), pg_temp.value((select k from t_base) + 3),
          'the pending session follows the chosen value');
select is((select payload->>'rewind' from public.audit_events where event_type = 'table.value_changed'
           and entity_id = pg_temp.id('table:luz-02') order by created_at desc, id desc limit 1),
          'false', 'a forward move is audited as table.value_changed (no rewind)');

-- ── Rewinding past completed history needs explicit confirmation ──────────────────────────────
select is(pg_temp.set_value('coord', 1), 'value_rewind_confirmation_required',
          'moving back past completed history is refused without confirmation');
select is(pg_temp.set_value('coord', 1, false), 'value_rewind_confirmation_required',
          'confirm_rewind=false is not a confirmation');
select is((select sequence::int from public.curriculum_values cv join public.round_tables rt
           on rt.current_value_id = cv.id where rt.id = pg_temp.id('table:luz-02')),
          (select k from t_base) + 3, 'a refused rewind leaves the program position unchanged');
select is(pg_temp.set_value('coord', (select k from t_base) + 1), null::text,
          'moving back to a value with no completed session needs no confirmation');
select is(pg_temp.set_value('coord', 1, true), null::text, 'a confirmed rewind is accepted');
select is((select md5(string_agg(s.id::text || s.value_id::text || s.status::text, ',' order by s.id))
           from public.sessions s where s.round_table_id = pg_temp.id('table:luz-02') and s.status = 'closed'),
          (select history from t_base), 'closed sessions are untouched by the rewind');
select is((select payload->>'confirmed' || ':' || (payload->>'from_sequence') || '>' || (payload->>'to_sequence')
           from public.audit_events where event_type = 'table.value_changed'
           and entity_id = pg_temp.id('table:luz-02') order by created_at desc, id desc limit 1),
          'true:' || ((select k from t_base) + 1) || '>1', 'the confirmed rewind is audited with both positions');

-- ── Validation and scope ──────────────────────────────────────────────────────────────────────
select is(pg_temp.err(format($f$select api.table_update(%L, jsonb_build_object('round_table_id', %L,
           'current_value_id', %L))$f$, pg_temp.u('coord'), pg_temp.id('table:luz-02'), gen_random_uuid())),
          'validation_failed', 'an unknown program value is rejected');
select is(pg_temp.set_value('coord-horizonte', 3), 'forbidden',
          'a coordinator of another organization cannot move the table');

select * from finish();
rollback;
