#!/usr/bin/env bash
# End-to-end smoke test of the Edge Functions and PostgREST RPCs against the local stack.
#
#   supabase start && supabase db reset
#   cp supabase/functions/.env.example supabase/functions/.env
#   supabase functions serve --env-file supabase/functions/.env &
#   bash supabase/tests/functions/smoke.sh
#
# Mutates data (closes Mesa Esperanza 03's pending session, creates invites and a table):
# run `supabase db reset` before re-running.
#
# Social sign-in cannot run locally without provider credentials. The invite redemption test
# stands in for "a new Google/Apple/Facebook identity" with a fresh auth user created through
# the GoTrue Admin API (app_metadata.provider = "google"): redemption only depends on the
# verified auth user id, so the path exercised is the same.
set -uo pipefail

API="${API_URL:-http://127.0.0.1:54321}"
FN="$API/functions/v1"
eval "$(supabase status -o env 2>/dev/null | grep -E '^(ANON_KEY|SERVICE_ROLE_KEY)=')"
CRON_SECRET="${CRON_SECRET:-change-me-local-cron-secret}"
PASS=0
FAIL=0

uuid() { python3 -c 'import uuid; print(uuid.uuid4())'; }
id() { python3 -c "import hashlib,uuid,sys; print(uuid.UUID(hashlib.md5(('gold-roundtables:'+sys.argv[1]).encode()).hexdigest()))" "$1"; }
iso() { python3 -c "import datetime,sys; print((datetime.datetime.now(datetime.timezone.utc)+datetime.timedelta(minutes=int(sys.argv[1]))).isoformat())" "$1"; }

login() {
  curl -s "$API/auth/v1/token?grant_type=password" -H "apikey: $ANON_KEY" \
    -H 'Content-Type: application/json' \
    -d "{\"email\":\"$1\",\"password\":\"dev-password-123\"}" | jq -r .access_token
}

# call METHOD URL TOKEN [BODY] → sets $STATUS and $BODY
call() {
  local method=$1 url=$2 token=$3 data=${4:-}
  local args=(-s -o /tmp/gr-smoke-body -w '%{http_code}' -X "$method" "$url" -H "apikey: $ANON_KEY"
              -H 'Content-Type: application/json')
  [[ -n $token ]] && args+=(-H "Authorization: Bearer $token")
  [[ -n $data ]] && args+=(-d "$data")
  STATUS=$(curl "${args[@]}")
  BODY=$(cat /tmp/gr-smoke-body)
}

# check "description" expected_status jq_filter expected_value
check() {
  local desc=$1 want_status=$2 filter=$3 want=$4 got
  got=$(echo "$BODY" | jq -r "$filter" 2>/dev/null)
  if [[ $STATUS == "$want_status" && $got == "$want" ]]; then
    PASS=$((PASS + 1)); printf '  ok   %s\n' "$desc"
  else
    FAIL=$((FAIL + 1)); printf '  FAIL %s (status %s, %s = %s; wanted %s / %s)\n      %s\n' \
      "$desc" "$STATUS" "$filter" "$got" "$want_status" "$want" "${BODY:0:400}"
  fi
}

S4=$(id session:luz-03:4)
ANA=$(id person:ana); LUIS=$(id person:luis); MARTA=$(id person:marta)
Q4=$(id question:4:por_que)

T_FACIL=$(login facil@dev.local); T_ANA=$(login ana@dev.local); T_LUIS=$(login luis@dev.local)
T_MARTA=$(login marta@dev.local); T_COORD=$(login coord@dev.local); T_ADMIN=$(login admin@dev.local)
T_HOR=$(login coord.horizonte@seed.local)

echo "── CORS and auth"
# The local gateway (Kong) may answer the preflight itself; either way the browser gets CORS headers.
ACAO=$(curl -s -D - -o /dev/null -X OPTIONS "$FN/admin/me" -H 'Origin: http://127.0.0.1:3000' \
  -H 'Access-Control-Request-Method: GET' | tr -d '\r' | awk -F': ' 'tolower($1)=="access-control-allow-origin"{print $2}')
STATUS=200; BODY="{\"origin\":\"$ACAO\"}"
check "CORS preflight allows the web origin" 200 '.origin|length>0' true
call GET "$FN/admin/me" ""
check "missing token → 401 unauthenticated" 401 .error.code unauthenticated
call GET "$FN/admin/me" "$T_COORD"
check "coordinator has two contexts" 200 '.contexts|length' 2

echo "── Invites"
call GET "$FN/invites/preview?code=mesa-34" ""
check "anonymous preview (normalized code)" 200 .invite.round_table_name "Mesa Esperanza 03"
call GET "$FN/invites/preview?code=VENC22" ""
check "expired invite → 410" 410 .error.code invite_expired
call GET "$FN/invites/preview?code=REVK23" ""
check "revoked invite → 410" 410 .error.code invite_revoked
call GET "$FN/invites/preview?code=ZZZZZZ" ""
check "unknown code → 404" 404 .error.code invite_not_found
call POST "$FN/invites" "$T_FACIL" "{\"role_kind\":\"member\",\"round_table_id\":\"$(id table:luz-03)\",\"person\":{\"first_name\":\"Valentina\",\"last_name\":\"Cruz\",\"phone\":\"+18095550199\"}}"
check "facilitator invites a member" 201 .invite.status pending
CODE=$(echo "$BODY" | jq -r .invite.code)
call POST "$FN/invites" "$T_FACIL" "{\"role_kind\":\"member\",\"round_table_id\":\"$(id table:luz-03)\",\"person\":{\"first_name\":\"Uno\",\"last_name\":\"Más\"}}"
check "10th seat → 409 table_full" 409 .error.code table_full
call POST "$FN/invites" "$T_FACIL" '{"role_kind":"member","round_table_id":"x","person":{"first_name":"","last_name":"B","phone":"123"}}'
check "invalid input → 422 with field errors" 422 '.error.fields|keys|join(",")' "person.first_name,person.phone,round_table_id"
call POST "$FN/invites" "$T_HOR" "{\"role_kind\":\"member\",\"round_table_id\":\"$(id table:luz-01)\",\"person\":{\"first_name\":\"A\",\"last_name\":\"B\"}}"
check "other organization's coordinator cannot invite here → 403" 403 .error.code forbidden
call GET "$FN/invites?round_table_id=$(id table:luz-03)" "$T_FACIL"
check "facilitator lists invites of their table" 200 '[.invites[].status]|unique|join(",")' "accepted,expired,pending,revoked"

NEW_EMAIL="nuevo.$(date +%s)@example.com"
curl -s "$API/auth/v1/admin/users" -H "apikey: $SERVICE_ROLE_KEY" -H "Authorization: Bearer $SERVICE_ROLE_KEY" \
  -H 'Content-Type: application/json' \
  -d "{\"email\":\"$NEW_EMAIL\",\"password\":\"dev-password-123\",\"email_confirm\":true,\"app_metadata\":{\"provider\":\"google\"}}" >/dev/null
T_NEW=$(login "$NEW_EMAIL")
call POST "$FN/invites/redeem" "$T_NEW" "{\"code\":\"$CODE\",\"profile\":{\"position\":\"Voluntaria\"}}"
check "new identity redeems the invite" 200 '.contexts[0].label' "Miembro · Mesa Esperanza 03"
call POST "$FN/invites/redeem" "$T_NEW" "{\"code\":\"$CODE\"}"
check "re-redeem is idempotent" 200 .already_redeemed true
call POST "$FN/invites/redeem" "$T_LUIS" "{\"code\":\"$CODE\"}"
check "another account cannot reuse it → 409" 409 .error.code invite_already_used
call POST "$FN/invites/redeem" "$T_LUIS" '{"code":"FACL27"}'
check "account already linked in the org → 409" 409 .error.code identity_linked_elsewhere

echo "── Notifications"
call POST "$FN/notifications/device-tokens" "$T_ANA" '{"token":"fake-fcm-token-ana-0001","platform":"android"}'
check "member registers a device token" 201 .device_token.platform android
call POST "$FN/notifications/cron/session-reminders" "" '{}'
check "cron endpoint requires the cron secret → 403" 403 .error.code forbidden
# Mesa Esperanza 03 meets within the hour (seed), so ana's device gets a reminder.
STATUS=$(curl -s -o /tmp/gr-smoke-body -w '%{http_code}' -X POST "$FN/notifications/cron/session-reminders" \
  -H "x-cron-secret: $CRON_SECRET" -H 'Content-Type: application/json' -d '{}'); BODY=$(cat /tmp/gr-smoke-body)
check "session reminders enqueued" 200 '.enqueued>=1' true
check "without FCM credentials the no-op sender skips them" 200 '.dispatch.sender + "/" + (.dispatch.skipped>=1|tostring)' "noop/true"

echo "── sync-upload (PowerSync uploadData)"
A1=$(uuid); A2=$(uuid); A3=$(uuid)
call POST "$FN/sync-upload" "$T_ANA" "{\"batch\":[
  {\"op\":\"PUT\",\"type\":\"member_assessments\",\"id\":\"$A1\",\"opData\":{\"session_id\":\"$S4\",\"person_id\":\"$ANA\",\"kind\":\"follow_up\",\"score\":8,\"device_created_at\":\"$(iso -3)\"}},
  {\"op\":\"PUT\",\"type\":\"member_answers\",\"id\":\"$A2\",\"opData\":{\"session_id\":\"$S4\",\"person_id\":\"$ANA\",\"question_id\":\"$Q4\",\"answer_text\":\"Cumplí lo que prometí\",\"device_created_at\":\"$(iso -2)\"}},
  {\"op\":\"PUT\",\"type\":\"member_assessments\",\"id\":\"$A3\",\"opData\":{\"session_id\":\"$S4\",\"person_id\":\"$ANA\",\"kind\":\"initial\",\"score\":5}},
  {\"op\":\"PATCH\",\"type\":\"member_answers\",\"id\":\"$A2\",\"opData\":{\"answer_text\":\"Cumplí casi todo\",\"device_modified_at\":\"$(iso -1)\"}}
]}"
check "batch: 3 applied, 1 rejected" 200 '"\(.applied)/\(.rejected)"' "3/1"
check "score 5 rejected with code + Spanish message" 200 '.results[2].code' score_five_not_allowed
call POST "$FN/sync-upload" "$T_ANA" "{\"batch\":[{\"op\":\"PUT\",\"type\":\"member_assessments\",\"id\":\"$A1\",\"opData\":{\"session_id\":\"$S4\",\"person_id\":\"$ANA\",\"kind\":\"follow_up\",\"score\":8}}]}"
check "re-upload of the same id is idempotent" 200 '.results[0].status' applied
call POST "$FN/sync-upload" "$T_ANA" "{\"batch\":[{\"op\":\"PUT\",\"type\":\"member_assessments\",\"id\":\"$(uuid)\",\"opData\":{\"session_id\":\"$S4\",\"person_id\":\"$ANA\",\"kind\":\"follow_up\",\"score\":9}}]}"
check "second follow-up rejected" 200 '.results[0].code' duplicate_follow_up
call POST "$FN/sync-upload" "$T_HOR" "{\"batch\":[{\"op\":\"PUT\",\"type\":\"member_assessments\",\"id\":\"$(uuid)\",\"opData\":{\"session_id\":\"$S4\",\"person_id\":\"$ANA\",\"kind\":\"initial\",\"score\":9}}]}"
check "cross-tenant write rejected" 200 '.results[0].code' forbidden
call POST "$FN/sync-upload" "$T_ANA" "{\"batch\":[{\"op\":\"PATCH\",\"type\":\"sessions\",\"id\":\"$S4\",\"opData\":{\"stage\":\"value\"}}]}"
check "member cannot drive the session" 200 '.results[0].code' forbidden

echo "── Sessions (facilitator, online)"
call POST "$FN/sessions/$S4/open" "$T_ANA" '{}'
check "member cannot open → 403" 403 .error.code forbidden
call POST "$FN/sessions/$S4/open" "$T_FACIL" "{\"stage\":\"attendance\",\"started_at\":\"$(iso -25)\"}"
check "facilitator opens" 200 .session.status open
ATT=$(uuid)
call POST "$FN/sync-upload" "$T_FACIL" "{\"batch\":[{\"op\":\"PUT\",\"type\":\"session_attendance\",\"id\":\"$ATT\",\"opData\":{\"session_id\":\"$S4\",\"person_id\":\"$LUIS\",\"status\":\"absent\"}}]}"
check "facilitator records attendance offline-style" 200 '.results[0].status' applied
call POST "$FN/sessions/$S4/stage" "$T_FACIL" '{"stage":"value"}'
check "facilitator moves to value" 200 .session.stage value
call POST "$FN/sessions/$S4/stage" "$T_FACIL" '{"stage":"closed"}'
check "stage endpoint does not close → 422" 422 .error.code validation_failed
call POST "$FN/sync-upload" "$T_LUIS" "{\"batch\":[{\"op\":\"PUT\",\"type\":\"member_commitments\",\"id\":\"$(uuid)\",\"opData\":{\"session_id\":\"$S4\",\"person_id\":\"$LUIS\",\"action_text\":\"Llegar puntual\",\"measure_text\":\"5 de 5\",\"device_created_at\":\"$(iso -4)\"}}]}"
check "absent member submits a commitment" 200 '.results[0].status' applied
call GET "$API/rest/v1/session_attendance?id=eq.$ATT&select=status,source" "$T_FACIL"
check "auto-attendance flipped absent → present" 200 '.[0].status + "/" + .[0].source' "present/auto_submission"
call POST "$FN/sessions/$S4/close" "$T_FACIL" "{\"ended_at\":\"$(iso -1)\"}"
check "facilitator closes" 200 .session.status closed
LATE=$(uuid)
call POST "$FN/sync-upload" "$T_MARTA" "{\"batch\":[{\"op\":\"PUT\",\"type\":\"member_answers\",\"id\":\"$LATE\",\"opData\":{\"session_id\":\"$S4\",\"person_id\":\"$MARTA\",\"question_id\":\"$Q4\",\"answer_text\":\"Sin señal en la sala\",\"device_created_at\":\"$(iso -10)\"}}]}"
check "answer captured before close, uploaded after: accepted" 200 '.results[0].status' applied
call GET "$API/rest/v1/member_answers?id=eq.$LATE&select=synced_late" "$T_FACIL"
check "…and flagged synced_late (facilitator can read it)" 200 '.[0].synced_late' true
call POST "$FN/sessions/$S4/stage" "$T_FACIL" '{"stage":"value"}'
check "closed session is final → 409" 409 .error.code session_finalized

echo "── Admin"
call POST "$FN/admin/tables" "$T_COORD" "{\"organization_id\":\"$(id org:luz)\",\"location_id\":\"$(id loc:luz-central)\",\"name\":\"Mesa Smoke 90\",\"code\":\"luz-90\",\"weekday\":3,\"start_time\":\"19:00\",\"timezone\":\"America/Santo_Domingo\",\"facilitator\":{\"person\":{\"first_name\":\"Rita\",\"last_name\":\"Gil\",\"email\":\"rita@example.com\"}}}"
check "coordinator creates a table with a new facilitator (invite)" 201 '.table.facilitator_invite.role_kind' facilitator
TABLE90=$(echo "$BODY" | jq -r .table.id)
call POST "$FN/admin/tables" "$T_COORD" "{\"organization_id\":\"$(id org:luz)\",\"location_id\":\"$(id loc:luz-central)\",\"name\":\"Otra\",\"code\":\"LUZ-90\",\"weekday\":3,\"start_time\":\"19:00\",\"timezone\":\"America/Santo_Domingo\",\"facilitator\":{\"person_id\":\"$(id person:coord)\"}}"
check "duplicate code → 409" 409 .error.code duplicate_table_code
call POST "$FN/admin/tables" "$T_COORD" "{\"organization_id\":\"$(id org:luz)\",\"location_id\":\"$(id loc:luz-central)\",\"name\":\"Sin fac\",\"code\":\"LUZ-91\",\"weekday\":3,\"start_time\":\"19:00\",\"timezone\":\"America/Santo_Domingo\"}"
check "missing facilitator → 422" 422 '.error.fields.facilitator' "Asigna un facilitador a la mesa."
call PATCH "$FN/admin/tables/$TABLE90" "$T_HOR" '{"name":"Hackeada"}'
check "other organization cannot edit the table → 403" 403 .error.code forbidden
call POST "$FN/admin/members/$(id "tm:luz-01:$(id person:luz-01:2)")/move" "$T_COORD" "{\"to_round_table_id\":\"$(id table:luz-05)\"}"
check "move into a full table → 409" 409 .error.code table_full
call POST "$FN/admin/organizations" "$T_COORD" '{"name":"Iglesia X","country_code":"GT","country_name":"Guatemala"}'
check "coordinator cannot create organizations → 403" 403 .error.code forbidden
call POST "$FN/admin/organizations" "$T_ADMIN" '{"name":"Taller Antorcha","kind":"community","country_code":"GT","country_name":"Guatemala","region":"Quetzaltenango"}'
check "platform admin creates an organization" 201 .organization.status active
ORG=$(echo "$BODY" | jq -r .organization.id)
call POST "$FN/admin/organizations/$ORG/coordinators" "$T_ADMIN" '{"person":{"first_name":"Julio","last_name":"Ixcot","email":"julio@example.com"}}'
check "first coordinator via invite" 201 .invite.role_kind coordinator
call GET "$API/rest/v1/audit_log?select=event_type&order=created_at.desc&limit=3" "$T_ADMIN"
check "admin writes are audit-logged" 200 '.[0].event_type' invite.created

echo "── Answers reveal and KPIs"
call POST "$FN/answers-reveal" "$T_COORD" "{\"round_table_id\":\"$(id table:luz-03)\"}"
check "coordinator reveals answers (sensitive, logged)" 200 .sensitive true
call POST "$FN/answers-reveal" "$T_HOR" "{\"round_table_id\":\"$(id table:luz-03)\"}"
check "other organization cannot reveal → 403" 403 .error.code forbidden
call POST "$API/rest/v1/rpc/kpi_summary" "$T_ADMIN" '{}'
check "admin KPI summary (global)" 200 '.tables.total>=17' true
call POST "$API/rest/v1/rpc/kpi_summary" "$T_COORD" '{"p_country":"DO"}'
check "coordinator KPI summary (own org only)" 200 '.tables.total>=7 and .tables.total<=8' true
call POST "$API/rest/v1/rpc/kpi_breakdown" "$T_ADMIN" '{"p_dimension":"country"}'
check "breakdown by country" 200 '[.[].label]|join(",")' "Colombia,República Dominicana"
call POST "$API/rest/v1/rpc/kpi_member_detail" "$T_FACIL" "{\"p_round_table_id\":\"$(id table:luz-03)\"}"
check "facilitator drill-down to members" 200 'map(select(.first_name=="Ana Lucía"))|.[0].scores|length' 3

# The rollups were dirtied by the close above; the read itself refreshes them (no 5-minute lag).
call POST "$API/rest/v1/rpc/kpi_tables" "$T_COORD" "{\"p_round_table_id\":\"$(id table:luz-03)\"}"
check "KPIs include the session closed seconds ago (value 4 done)" 200 '.[0].values_completed' 4
check "seat counts are live: taken + free = 9" 200 '.[0].active_people + .[0].seats_free' 9

echo "── Notifications (remove token)"
call DELETE "$FN/notifications/device-tokens" "$T_ANA" '{"token":"fake-fcm-token-ana-0001"}'
check "member removes the token on sign-out" 200 .removed 1

echo "── Rate limits (run last: they exhaust this address's allowance for the current minute)"
N429=0
for i in $(seq 1 25); do
  CODE_STATUS=$(curl -s -o /dev/null -w '%{http_code}' "$FN/invites/preview?code=ZZZZZZ" -H "apikey: $ANON_KEY" \
    -H "X-Forwarded-For: 10.9.8.$i")
  [[ $CODE_STATUS == 429 ]] && N429=$((N429 + 1))
done
if [[ $N429 -ge 1 ]]; then
  PASS=$((PASS + 1)); echo "  ok   preview: a spoofed X-Forwarded-For does not dodge the per-address limit"
else
  FAIL=$((FAIL + 1)); echo "  FAIL preview: 25 calls with rotating X-Forwarded-For were never throttled"
fi
for i in $(seq 1 12); do call POST "$FN/invites/redeem" "$T_NEW" '{"code":"QQQQQQ"}'; done
check "redeem: guessing the same code is throttled per code → 429" 429 .error.code rate_limited

echo
echo "passed: $PASS  failed: $FAIL"
[[ $FAIL -eq 0 ]]
