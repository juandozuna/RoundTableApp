-- Notification scheduling (ADR 0009): reminder window, table timezones, dedupe, rescheduling,
-- commitment nudge window, and the cron → dispatcher path without Vault secrets.
begin;
create extension if not exists pgtap with schema extensions;
select plan(20);

create function pg_temp.id(p text) returns uuid language sql immutable as
  $$ select md5('gold-roundtables:' || p)::uuid $$;

-- Tables in different timezones; the facilitator and members of the seeded tables have accounts.
-- Local slot property: the pending session sits on the table's weekday and start time *in its own
-- timezone*, whatever the offset and DST rules of that zone.
create temp table t_zone as
select z.tz, z.weekday, z.start_time,
       (api.table_create(md5('gold-roundtables:user:coord')::uuid, jsonb_build_object(
          'organization_id', pg_temp.id('org:luz'), 'location_id', pg_temp.id('loc:luz-central'),
          'name', 'Mesa ' || z.tz, 'code', 'TZ-' || z.n, 'weekday', z.weekday,
          'start_time', z.start_time, 'timezone', z.tz,
          'facilitator', jsonb_build_object('person_id', pg_temp.id('person:facil'))))) as j
from (values (1, 'Asia/Tokyo', 2, '07:15'), (2, 'America/Los_Angeles', 4, '23:30'),
             (3, 'Europe/Madrid', 6, '00:30'), (4, 'America/Santo_Domingo', 1, '19:00')) z(n, tz, weekday, start_time);

select is(
  (select count(*)::int from t_zone z
   where extract(isodow from (z.j->'pending_session'->>'scheduled_at')::timestamptz at time zone z.tz) = z.weekday
     and ((z.j->'pending_session'->>'scheduled_at')::timestamptz at time zone z.tz)::time = z.start_time::time),
  4, 'each table''s first session is on its weekday and start time in the table''s own timezone');
select ok(
  (select bool_and((z.j->'pending_session'->>'scheduled_at')::timestamptz > now()
         and (z.j->'pending_session'->>'scheduled_at')::timestamptz <= now() + interval '8 days') from t_zone z),
  'first sessions are in the next 7 days');

-- A table whose DST changes between now and its slot keeps the local wall-clock time.
select is(app.next_slot(pg_temp.id('table:luz-03'), 7::smallint, '09:00'::time, 'Europe/Madrid',
                        '2027-03-24 12:00+00'::timestamptz),
          '2027-03-28 07:00+00'::timestamptz,
          'Sunday 09:00 Madrid after the spring-forward is 07:00 UTC (CEST), not 08:00');
select is(app.next_slot(pg_temp.id('table:luz-03'), 7::smallint, '09:00'::time, 'Europe/Madrid',
                        '2027-03-21 06:00+00'::timestamptz),
          '2027-03-21 08:00+00'::timestamptz, 'the same slot a week earlier is 08:00 UTC (CET)');

-- ── Reminder window ────────────────────────────────────────────────────────────────────────────
-- Pending session of Mesa Esperanza 03 (6 people with accounts, 8 seats).
create function pg_temp.set_slot(p_when timestamptz) returns void language sql as $$
  update public.sessions set scheduled_at = p_when where id = md5('gold-roundtables:session:luz-03:4')::uuid
$$;
create function pg_temp.reminders(p_person text default null) returns integer language sql as $$
  select count(*)::int from public.notification_outbox
  where kind = 'session_reminder'
    and data->>'session_id' = md5('gold-roundtables:session:luz-03:4')::uuid::text
    and (p_person is null or person_id = md5('gold-roundtables:' || p_person)::uuid)
$$;
delete from public.notification_outbox;
select pg_temp.set_slot(now() + interval '25 hours');
select app.enqueue_session_reminders();
select is(pg_temp.reminders(), 0, 'a session 25 h away is outside the 24 h reminder window');
select pg_temp.set_slot(now() + interval '23 hours');
select app.enqueue_session_reminders();
select is(pg_temp.reminders(), 6, 'a session 23 h away reminds the 6 participants with an account');
select is(pg_temp.reminders('person:facil'), 1, 'the facilitator is reminded as a participant too');
select app.enqueue_session_reminders();
select is(pg_temp.reminders(), 6, 'running the cron again does not duplicate reminders');
select matches((select body from public.notification_outbox
                where kind = 'session_reminder' and person_id = pg_temp.id('person:ana')
                  and data->>'session_id' = md5('gold-roundtables:session:luz-03:4')::uuid::text),
               to_char((now() + interval '23 hours') at time zone 'America/Santo_Domingo', 'DD/MM HH24:MI') || '$',
               'the reminder shows the time in the table''s timezone');
select pg_temp.set_slot(now() + interval '22 hours');
select app.enqueue_session_reminders();
select is(pg_temp.reminders(), 12, 'a rescheduled session reminds again with the new time');
select app.enqueue_session_reminders(interval '30 hours');
select is(pg_temp.reminders(), 12, 'a wider window finds nothing new for already reminded slots');
update public.sessions set status = 'cancelled', cancelled_reason = 'test'
  where id = md5('gold-roundtables:session:luz-03:4')::uuid;
delete from public.notification_outbox;
select app.enqueue_session_reminders();
select is(pg_temp.reminders(), 0, 'a cancelled session sends nothing');

-- ── Commitment nudge window (3 days after the close, while the follow-up is pending) ───────────
-- History fixtures: the closed-session guard is bypassed for this transaction only.
alter table public.sessions disable trigger t10_sessions_prepare;
create temp table t_sess as
select id, ended_at from public.sessions
where round_table_id = pg_temp.id('table:luz-03') and status = 'closed' order by ended_at desc limit 1;
create function pg_temp.nudges() returns integer language sql as $$
  select count(*)::int from public.notification_outbox
  where kind = 'commitment_nudge' and data->>'session_id' = (select id::text from t_sess)
$$;
delete from public.notification_outbox;
update public.member_commitments set follow_up_status = null, follow_up_session_id = null
  where session_id = (select id from t_sess);
update public.sessions set ended_at = now() - interval '2 days' where id = (select id from t_sess);
select app.enqueue_commitment_nudges();
select is(pg_temp.nudges(), 0, 'too early: 2 days after the session');
update public.sessions set ended_at = now() - interval '3 days 2 hours' where id = (select id from t_sess);
select app.enqueue_commitment_nudges();
select cmp_ok(pg_temp.nudges(), '>', 0, '3 days after the session nudges pending commitments');
create temp table t_n as select pg_temp.nudges() as n;
select app.enqueue_commitment_nudges();
select is(pg_temp.nudges(), (select n from t_n), 'nudges are sent once per commitment');
delete from public.notification_outbox;
update public.sessions set ended_at = now() - interval '5 days' where id = (select id from t_sess);
select app.enqueue_commitment_nudges();
select is(pg_temp.nudges(), 0, 'too late: 5 days after the session');

-- ── Cron → dispatcher without Vault secrets ────────────────────────────────────────────────────
delete from vault.secrets where name in ('functions_base_url', 'cron_secret');
select lives_ok($$select app.dispatch_notifications_http()$$,
                'the cron dispatcher is a no-op (not an error) when Vault secrets are missing');
select is((select count(*)::int from net.http_request_queue), 0,
          'no HTTP request is queued when Vault secrets are missing');
select lives_ok($$select app.enqueue_session_reminders(); select app.dispatch_notifications_http()$$,
                'the exact cron command runs');
select is((select count(*)::int from cron.job where jobname in ('gr-session-reminders', 'gr-commitment-nudges')), 2,
          'reminder and nudge jobs are scheduled');

select * from finish();
rollback;
