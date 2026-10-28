#!/usr/bin/env bash
# Puts Mesa Esperanza 03's demo session (value 4, Responsabilidad) back to "scheduled / lobby" at
# the current time, so the live flow can be exercised again at any moment: the facilitator
# (facil@dev.local) opens it and ana/luis/marta follow along.
#
# Idempotent. It also wipes whatever a previous run captured for that session (attendance,
# follow-up and assessment scores, reflection answers, commitments, follow-up reports made in it),
# drops the session the server scheduled after it was closed, and rewinds the table's current value.
# Changes go through Postgres, so PowerSync replicates them to connected devices.
#
#   bash scripts/dev-open-session.sh
set -euo pipefail
here="$(cd "$(dirname "$0")" && pwd)"
# shellcheck source=scripts/lib/common.sh
source "$here/lib/common.sh"

load_env
require_cmd docker
require_supabase_running

info "Resetting Mesa Esperanza 03's session to scheduled/lobby (now)"
docker exec -i "$(supabase_db_container)" psql -U postgres -v ON_ERROR_STOP=1 -q <<'SQL'
begin;
-- Session rules (state machine, "closed is final") would reject a rewind: bypass triggers.
set local session_replication_role = replica;
set local app.seeding = 'on';

create temp table demo on commit drop as
  select md5('gold-roundtables:session:luz-03:4')::uuid as session_id,
         md5('gold-roundtables:table:luz-03')::uuid as table_id;

do $$
declare
  v_session uuid; v_table uuid; v_value uuid;
  v_now timestamptz := date_trunc('minute', now());
begin
  select session_id, table_id into v_session, v_table from demo;
  select value_id into v_value from public.sessions where id = v_session;
  if v_value is null then
    raise exception 'Demo session not found: run scripts/dev-reset.sh first.';
  end if;

  -- Sessions the server scheduled after the demo one was closed, and their data.
  create temp table extra on commit drop as
    select id from public.sessions where round_table_id = v_table and id <> v_session
      and status in ('scheduled', 'open', 'cancelled') and scheduled_at > (select scheduled_at from public.sessions where id = v_session) - interval '1 day';
  update public.member_commitments set follow_up_session_id = null, follow_up_status = null,
    follow_up_note = null, follow_up_device_at = null, follow_up_received_at = null,
    follow_up_synced_late = false where follow_up_session_id in (select id from extra union select v_session);
  delete from public.member_commitments where session_id in (select id from extra union select v_session);
  delete from public.member_answers where session_id in (select id from extra union select v_session);
  delete from public.member_assessments where session_id in (select id from extra union select v_session);
  delete from public.session_attendance where session_id in (select id from extra union select v_session);
  delete from public.sessions where id in (select id from extra);

  -- The table's weekly slot moves to "now" too, so closing the session schedules the next one a
  -- week from now (a slot still ahead today would take over the summary screen immediately).
  update public.round_tables set current_value_id = v_value, status = 'active',
    weekday = extract(isodow from (v_now at time zone timezone))::smallint,
    start_time = (v_now at time zone timezone)::time where id = v_table;
  -- Session slots follow the schedule history (RF-23), so it is reset to that one slot as well.
  delete from public.table_schedule_versions where round_table_id = v_table;
  insert into public.table_schedule_versions (organization_id, round_table_id, weekday, start_time,
                                              timezone, duration_minutes, effective_from)
  select organization_id, id, weekday, start_time, timezone, duration_minutes,
         (created_at at time zone timezone)::date
  from public.round_tables where id = v_table;
  update public.sessions set status = 'scheduled', stage = 'lobby', scheduled_at = v_now,
    started_at = null, ended_at = null, answers_closed_at = null, cancelled_reason = null,
    kind = 'regular', original_scheduled_at = null,
    device_modified_at = null, archived_at = null where id = v_session;
end $$;

reset session_replication_role;
select kpi.mark_dirty() \gset
commit;
SQL
ok "Mesa Esperanza 03: session scheduled for now (lobby). Sign in as facil@dev.local → Sesión → Abrir sesión."
