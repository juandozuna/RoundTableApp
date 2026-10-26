#!/usr/bin/env bash
# Smoke test of the running local stack (read-only: no data is changed):
#   Supabase REST · Edge Function · GoTrue dev login · PowerSync liveness + CORS + a real sync
#   stream for the facilitator · web server and PowerSync web assets.
#
#   bash scripts/smoke.sh [--no-web]
set -uo pipefail
here="$(cd "$(dirname "$0")" && pwd)"
# shellcheck source=scripts/lib/common.sh
source "$here/lib/common.sh"

load_env
require_cmd curl
check_web=true
[[ "${1:-}" == "--no-web" ]] && check_web=false
load_supabase_keys

pass=0
failed=0
check() { # description, command...
  local description="$1"; shift
  local output
  if output="$("$@" 2>&1)"; then ok "$description"; ((pass++)); else printf '\033[31m ✗\033[0m %s\n%s\n' "$description" "${output:0:600}" >&2; ((failed++)); fi
}
status_of() { curl -s -o /dev/null -w '%{http_code}' --max-time 10 "$@"; }
expect_status() { local want="$1"; shift; local got; got="$(status_of "$@")"; [[ "$got" == "$want" ]] || { echo "expected HTTP $want, got $got"; return 1; }; }
expect_header() { # header-substring url [curl args]
  local want="$1"; shift
  curl -s -I --max-time 10 "$@" | tr -d '\r' | grep -iq -- "$want" || { echo "header '$want' missing from: $*"; return 1; }
}

web_origin="http://127.0.0.1:${WEB_PORT}"
powersync="http://127.0.0.1:${POWERSYNC_PORT}"
api="$SUPABASE_URL"

info "Supabase"
check "GoTrue JWKS publishes an ES256 key" bash -c "curl -fsS '$api/auth/v1/.well-known/jwks.json' | grep -q ES256"
dev_login() {
  curl -fsS "$api/auth/v1/token?grant_type=password" -H "apikey: $SUPABASE_ANON_KEY" \
    -H 'Content-Type: application/json' -d "{\"email\":\"$1\",\"password\":\"dev-password-123\"}"
}
token="$(dev_login facil@dev.local 2>/dev/null | sed -n 's/.*"access_token":"\([^"]*\)".*/\1/p')"
check "GoTrue dev login (facil@dev.local)" test -n "$token"
check "PostgREST read as facil (curriculum_modules)" bash -c \
  "curl -fsS '$api/rest/v1/curriculum_modules?select=id&limit=1' -H 'apikey: $SUPABASE_ANON_KEY' -H 'Authorization: Bearer $token' | grep -q '\"id\"'"
check "Edge Function invites/preview (anonymous, MESA34)" bash -c \
  "curl -fsS '$api/functions/v1/invites/preview?code=MESA34' -H 'apikey: $SUPABASE_ANON_KEY' | grep -q MESA34"
check "Edge Function admin/me requires a user (401 without token)" expect_status 401 "$api/functions/v1/admin/me" -H "apikey: $SUPABASE_ANON_KEY"
check "Edge Function admin/me with facil token" expect_status 200 "$api/functions/v1/admin/me" -H "apikey: $SUPABASE_ANON_KEY" -H "Authorization: Bearer $token"

info "PowerSync"
check "liveness probe" expect_status 200 "$powersync/probes/liveness"
check "readiness probe" expect_status 200 "$powersync/probes/readiness"
check "CORS preflight from $web_origin" expect_header 'access-control-allow-origin' -X OPTIONS "$powersync/sync/stream" \
  -H "Origin: $web_origin" -H 'Access-Control-Request-Method: POST' -H 'Access-Control-Request-Headers: authorization,content-type'
if command -v node >/dev/null 2>&1; then
  check "sync stream for facil@dev.local contains Mesa Esperanza 03" \
    env SUPABASE_URL="$api" SUPABASE_ANON_KEY="$SUPABASE_ANON_KEY" POWERSYNC_URL="$powersync" \
    node "$here/powersync-sync-check.mjs" facil@dev.local "Mesa Esperanza 03"
else
  warn "node not found: skipping the sync stream check"
fi

if $check_web; then
  info "Web ($web_origin)"
  check "index.html served" bash -c "curl -fsS '$web_origin/' | grep -q flutter_bootstrap"
  check "main.dart.js served" expect_status 200 "$web_origin/main.dart.js"
  check "powersync_db.worker.js served (no SPA fallback)" bash -c \
    "curl -fsS -I '$web_origin/powersync_db.worker.js' | tr -d '\r' | grep -iq 'content-type: .*javascript'"
  check "sqlite3.wasm served as application/wasm" bash -c \
    "curl -fsS -I '$web_origin/sqlite3.wasm' | tr -d '\r' | grep -iq 'content-type: application/wasm'"
  check "missing asset is a real 404" expect_status 404 "$web_origin/does-not-exist.js"
fi

echo
if ((failed > 0)); then
  printf '\033[31m%d passed, %d failed\033[0m\n' "$pass" "$failed" >&2
  exit 1
fi
printf '\033[32m%d checks passed\033[0m\n' "$pass"
