-- Schedule changes with an effective date (RF-23) and single-session reschedule / cancel /
-- extraordinary session (RF-30): history, pending-session invariant, value rule, audit, roles,
-- reminder re-fire.
begin;
create extension if not exists pgtap with schema extensions;
select plan(57);

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
create function pg_temp.pending(p_table text) returns public.sessions language sql as $$
  select s from public.sessions s where s.round_table_id = pg_temp.id('table:' || p_table)
    and s.status in ('scheduled', 'open')
$$;
create function pg_temp.pending_count(p_table text) returns int language sql as $$
  select count(*)::int from public.sessions s where s.round_table_id = pg_temp.id('table:' || p_table)
    and s.status in ('scheduled', 'open')
$$;
create function pg_temp.update_table(p_uid text, p_table text, p_input jsonb) returns text language sql as $$
  select pg_temp.err(format($f$select api.table_update(%L, %L::jsonb || jsonb_build_object('round_table_id', %L))$f$,
    pg_temp.u(p_uid), p_input::text, pg_temp.id('table:' || p_table)))
$$;
create function pg_temp.reschedule(p_uid text, p_session uuid, p_at timestamptz) returns text language sql as $$
  select pg_temp.err(format($f$select api.session_reschedule(%L, jsonb_build_object('session_id', %L, 'scheduled_at', %L))$f$,
    pg_temp.u(p_uid), p_session, p_at))
$$;
create function pg_temp.cancel(p_uid text, p_session uuid, p_reason text) returns text language sql as $$
  select pg_temp.err(format($f$select api.session_cancel(%L, jsonb_build_object('session_id', %L, 'reason', %L))$f$,
    pg_temp.u(p_uid), p_session, p_reason))
$$;
create function pg_temp.extra(p_uid text, p_table text, p_at timestamptz) returns text language sql as $$
  select pg_temp.err(format($f$select api.session_extra_create(%L, jsonb_build_object('round_table_id', %L, 'scheduled_at', %L))$f$,
    pg_temp.u(p_uid), pg_temp.id('table:' || p_table), p_at))
$$;
create function pg_temp.audit_count(p_event text, p_entity uuid) returns int language sql as $$
  select count(*)::int from public.audit_events where event_type = p_event and entity_id = p_entity
$$;

-- ── Schedule history ──────────────────────────────────────────────────────────────────────────
select is((select count(*)::int from public.round_tables rt
           where not exists (select 1 from public.table_schedule_versions v where v.round_table_id = rt.id)),
          0, 'every table has an initial schedule version');

-- luz-01: Tuesday 19:00. A change without a date takes effect today and moves the pending session.
select is(pg_temp.update_table('coord', 'luz-01', '{"weekday": 5, "start_time": "20:15"}'), null::text,
          'a schedule change without a date is accepted');
select is((select weekday::int || ' ' || start_time::text from public.round_tables where id = pg_temp.id('table:luz-01')),
          '5 20:15:00', 'it applies to the table immediately');
select is((select count(*)::int from public.table_schedule_versions where round_table_id = pg_temp.id('table:luz-01')),
          2, 'the previous schedule stays in the history');
select ok((select extract(isodow from s.scheduled_at at time zone 'America/Santo_Domingo') = 5
                  and (s.scheduled_at at time zone 'America/Santo_Domingo')::time = '20:15' and s.scheduled_at > now()
           from pg_temp.pending('luz-01') s), 'the pending session moved to the next Friday 20:15');
select is(pg_temp.pending_count('luz-01'), 1, 'still exactly one pending session');
select is(pg_temp.audit_count('table.schedule_changed', pg_temp.id('table:luz-01')), 1,
          'the change is audited as table.schedule_changed');

-- A future-dated change is stored, not applied, and leaves earlier sessions alone.
create temp table t_future as
select (now() at time zone 'America/Santo_Domingo')::date + 21 as eff,
       (select s.scheduled_at from pg_temp.pending('luz-01') s) as pending_at;
select is(pg_temp.update_table('coord', 'luz-01',
          format('{"weekday": 1, "start_time": "18:00", "schedule_effective_from": "%s"}', (select eff from t_future))::jsonb),
          null::text, 'a future-dated schedule change is accepted');
select is((select weekday::int from public.round_tables where id = pg_temp.id('table:luz-01')), 5,
          'the table keeps its current schedule until the effective date');
select is((select scheduled_at from pg_temp.pending('luz-01')), (select pending_at from t_future),
          'a pending session before the effective date does not move');
select is((select count(*)::int from public.table_schedule_versions where round_table_id = pg_temp.id('table:luz-01')),
          3, 'the future version is kept in the history');
select is((select payload->>'applied' from public.audit_events where event_type = 'table.schedule_changed'
           and entity_id = pg_temp.id('table:luz-01') and payload->>'effective_from' = (select eff::text from t_future)),
          'false', 'the audit event says it is not applied yet');
select is((app.next_slot_versioned(pg_temp.id('table:luz-01'), (select pending_at from t_future))
             at time zone 'America/Santo_Domingo')::text,
          ((select pending_at from t_future) at time zone 'America/Santo_Domingo' + interval '7 days')::text,
          'slots before the effective date follow the old schedule (Friday 20:15)');
select is(extract(isodow from app.next_slot_versioned(pg_temp.id('table:luz-01'),
            (select eff from t_future)::timestamp at time zone 'America/Santo_Domingo') at time zone 'America/Santo_Domingo')::int,
          1, 'slots from the effective date follow the new schedule (Monday)');
select is(((app.next_slot_versioned(pg_temp.id('table:luz-01'),
            (select eff from t_future)::timestamp at time zone 'America/Santo_Domingo')) at time zone 'America/Santo_Domingo')::time,
          '18:00'::time, 'at the new start time');
select is(pg_temp.update_table('coord', 'luz-01', '{"start_time": "09:00", "schedule_effective_from": "2020-01-01"}'),
          'schedule_effective_in_past', 'an effective date in the past is refused');
-- The effective date arrives: the cron/apply path updates the table.
update public.table_schedule_versions set effective_from = effective_from - 1
where round_table_id = pg_temp.id('table:luz-01') and weekday = 5 and effective_from = (now() at time zone timezone)::date;
update public.table_schedule_versions set effective_from = (now() at time zone timezone)::date
where round_table_id = pg_temp.id('table:luz-01') and weekday = 1;
select is(app.apply_due_schedule(pg_temp.id('table:luz-01')), 1, 'apply_due_schedule applies the due version');
select is((select weekday::int || ' ' || start_time::text from public.round_tables where id = pg_temp.id('table:luz-01')),
          '1 18:00:00', 'the table now follows the new schedule');

-- A future change takes the pending session along when it falls on or after the effective date.
-- hor-03 (Thursday 11:00, Bogotá): effective the pending session's own date, new weekday + 2.
create temp table t_move as
select (s.scheduled_at at time zone 'America/Bogota')::date as eff, s.scheduled_at as old_at
from pg_temp.pending('hor-03') s;
select is(pg_temp.update_table('coord-horizonte', 'hor-03',
          format('{"weekday": %s, "start_time": "20:00", "schedule_effective_from": "%s"}',
                 (select ((extract(isodow from eff)::int + 1) % 7) + 1 from t_move), (select eff from t_move))::jsonb),
          null::text, 'a change effective on the pending session''s date is accepted');
select ok((select s.scheduled_at >= (select eff from t_move)::timestamp at time zone 'America/Bogota'
                  and s.scheduled_at <> (select old_at from t_move)
                  and (s.scheduled_at at time zone 'America/Bogota')::time = '20:00'
           from pg_temp.pending('hor-03') s), 'the pending session moved to the new slot on or after the effective date');
select is(pg_temp.pending_count('hor-03'), 1, 'one pending session after the move');

-- ── Reschedule ───────────────────────────────────────────────────────────────────────────────
create temp table t_res as
select (s).id as session_id, (s).scheduled_at as regular_at, (s).value_id as value_id
from (select pg_temp.pending('luz-05') s) x;
select is(pg_temp.reschedule('facil', (select session_id from t_res), now() + interval '30 hours'),
          'forbidden', 'a facilitator cannot reschedule a session');
select is(pg_temp.reschedule('coord-horizonte', (select session_id from t_res), now() + interval '30 hours'),
          'forbidden', 'a coordinator of another organization cannot reschedule it');
select is(pg_temp.reschedule('coord', (select session_id from t_res), now() - interval '1 hour'),
          'schedule_in_past', 'the new date must be in the future');
insert into public.sessions (organization_id, round_table_id, value_id, status, scheduled_at, cancelled_reason)
select organization_id, round_table_id, value_id, 'cancelled', now() + interval '50 hours', 'holiday'
from public.sessions where id = (select session_id from t_res);
select is(pg_temp.reschedule('coord', (select session_id from t_res), now() + interval '50 hours'),
          'slot_taken', 'a slot already used by another session of the table is refused');
select is(pg_temp.reschedule('coord', (select session_id from t_res), now() + interval '10 hours'), null::text,
          'a manager reschedules the pending session');
select is((select original_scheduled_at from pg_temp.pending('luz-05')), (select regular_at from t_res),
          'the regular slot is remembered');
select is(pg_temp.pending_count('luz-05'), 1, 'still one pending session');
select is(pg_temp.audit_count('session.rescheduled', (select session_id from t_res)), 1, 'rescheduling is audited');

-- Reminders re-fire for the new slot (the slot is part of the dedupe key).
delete from public.notification_outbox;
select app.enqueue_session_reminders();
create temp table t_rem1 as select count(*)::int n from public.notification_outbox
  where kind = 'session_reminder' and data->>'session_id' = (select session_id::text from t_res);
select ok((select n from t_rem1) > 0, 'the rescheduled session reminds its participants');
select pg_temp.reschedule('coord', (select session_id from t_res), now() + interval '11 hours');
select app.enqueue_session_reminders();
select is((select count(*)::int from public.notification_outbox
           where kind = 'session_reminder' and data->>'session_id' = (select session_id::text from t_res)),
          (select n * 2 from t_rem1), 'moving it again reminds again');
select app.enqueue_session_reminders();
select is((select count(*)::int from public.notification_outbox
           where kind = 'session_reminder' and data->>'session_id' = (select session_id::text from t_res)),
          (select n * 2 from t_rem1), 'but the same slot never reminds twice');

-- Closing the moved session keeps the weekly cadence: the next one follows the regular slot.
update public.sessions set status = 'closed' where id = (select session_id from t_res);
select is((select scheduled_at from pg_temp.pending('luz-05')),
          (select regular_at + interval '7 days' from t_res),
          'the next session is scheduled after the regular slot it replaced');

-- An open session cannot be rescheduled.
update public.sessions set status = 'open' where id = (select (pg_temp.pending('luz-05')).id);
select is(pg_temp.reschedule('coord', (select (pg_temp.pending('luz-05')).id), now() + interval '90 hours'),
          'session_in_progress', 'a session that already started cannot be moved');

-- ── Cancel (holiday / force majeure) ─────────────────────────────────────────────────────────
create temp table t_can as
select (s).id as session_id, (s).scheduled_at as at, (s).value_id as value_id,
       (select current_value_id from public.round_tables where id = pg_temp.id('table:luz-02')) as table_value
from (select pg_temp.pending('luz-02') s) x;
select is(pg_temp.cancel('coord', (select session_id from t_can), 'vacation'), 'validation_failed',
          'the reason must be one of the known ones');
select is(pg_temp.cancel('facil', (select session_id from t_can), 'holiday'), 'forbidden',
          'a facilitator cannot cancel through the admin function');
select is(pg_temp.cancel('coord', (select session_id from t_can), 'holiday'), null::text,
          'a coordinator cancels one session for a holiday');
select is((select status::text || ':' || cancelled_reason from public.sessions where id = (select session_id from t_can)),
          'cancelled:holiday', 'the session is cancelled with its reason');
select is((select current_value_id from public.round_tables where id = pg_temp.id('table:luz-02')),
          (select table_value from t_can), 'a cancelled session does not advance the value');
select ok((select s.value_id = (select value_id from t_can) and s.scheduled_at > (select at from t_can)
           from pg_temp.pending('luz-02') s), 'the next session carries the same value, one slot later');
select is(pg_temp.pending_count('luz-02'), 1, 'exactly one pending session after cancelling');
select is((select payload->>'value_advances' from public.audit_events where event_type = 'session.cancelled'
           and entity_id = (select session_id from t_can)), 'false', 'the cancellation is audited');
select is(pg_temp.cancel('coord', (select session_id from t_can), 'holiday'), 'session_finalized',
          'a cancelled session cannot be cancelled again');

-- ── Extraordinary session ────────────────────────────────────────────────────────────────────
-- luz-01 is Monday-bound now; pin its pending session three days out for a deterministic test.
update public.sessions set scheduled_at = date_trunc('hour', now()) + interval '3 days'
where id = (select (pg_temp.pending('luz-01')).id);
create temp table t_ext as
select (s).id as session_id, (s).scheduled_at as regular_at,
       (select current_value_id from public.round_tables where id = pg_temp.id('table:luz-01')) as value_id
from (select pg_temp.pending('luz-01') s) x;
select is(pg_temp.extra('facil', 'luz-01', now() + interval '1 day'), 'forbidden', 'a facilitator cannot add a session');
select is(pg_temp.extra('coord', 'luz-01', now() + interval '4 days'), 'extra_session_not_before_next',
          'an extra session must come before the next regular one');
select is(pg_temp.extra('coord', 'luz-01', now() - interval '1 hour'), 'schedule_in_past', 'and be in the future');
select is(pg_temp.extra('coord', 'luz-01', now() + interval '1 day'), null::text, 'a coordinator adds an extraordinary session');
select is(pg_temp.pending_count('luz-01'), 1, 'the invariant holds: still one pending session');
select is((select kind from pg_temp.pending('luz-01')), 'extraordinary', 'the pending session is the extraordinary one');
select is(pg_temp.extra('coord', 'luz-01', now() + interval '2 hours'), 'extra_session_exists',
          'only one extraordinary session can be pending');
select is(pg_temp.audit_count('session.extraordinary_added', (select session_id from t_ext)), 1,
          'adding it is audited');
-- Holding it advances the program and the regular cadence resumes.
update public.sessions set status = 'closed' where id = (select session_id from t_ext);
select ok((select s.kind = 'regular' and s.value_id <> (select value_id from t_ext) from pg_temp.pending('luz-01') s),
          'after it is held, the regular session carries the next value');
select is(pg_temp.extra('coord', 'luz-06', now() + interval '1 day'), 'table_not_active', 'a paused table cannot get extra sessions');

-- ── Schedule history is tenant-scoped ────────────────────────────────────────────────────────
create function pg_temp.act_as(p_user text) returns void language sql as $$
  select set_config('request.jwt.claims',
    json_build_object('sub', md5('gold-roundtables:user:' || p_user)::uuid, 'role', 'authenticated')::text, true);
$$;
grant execute on function pg_temp.act_as(text) to authenticated;
select pg_temp.act_as('coord');
set local role authenticated;
select ok((select count(*) from public.table_schedule_versions where round_table_id = pg_temp.id('table:luz-01')) >= 3,
          'a coordinator reads the schedule history of their tables');
select is((select count(*)::int from public.table_schedule_versions
           where organization_id <> pg_temp.id('org:luz')), 0, 'and no history of other organizations');
reset role;
select pg_temp.act_as('coord-horizonte');
set local role authenticated;
select is((select count(*)::int from public.table_schedule_versions
           where organization_id = pg_temp.id('org:luz')), 0, 'org B coordinator cannot read org A schedule history');
reset role;
select pg_temp.act_as('facil');
set local role authenticated;
select is((select count(*)::int from public.table_schedule_versions), 0, 'facilitators and members read no schedule history');
reset role;

select * from finish();
rollback;
