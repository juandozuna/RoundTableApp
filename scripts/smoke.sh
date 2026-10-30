#!/usr/bin/env bash
# Smoke test of the running local stack (read-only: no data is changed):
#   Supabase REST (under RLS) · Edge Function · GoTrue dev login · web server.
#
#   bash scripts/smoke.sh [--no-web]
#
# Targets the local stack. SMOKE_WEB_ORIGIN and SUPABASE_URL/SUPABASE_ANON_KEY
# override the local defaults (e.g. a staging stack that has the dev accounts). The hosted
# environment has no dev accounts: use scripts/smoke-hosted.sh there.
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

web_origin="${SMOKE_WEB_ORIGIN:-http://127.0.0.1:${WEB_PORT}}"
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
check "PostgREST read as facil sees Mesa Esperanza 03 (RLS scope)" bash -c \
  "curl -fsS '$api/rest/v1/round_tables?select=name' -H 'apikey: $SUPABASE_ANON_KEY' -H 'Authorization: Bearer $token' | grep -q 'Mesa Esperanza 03'"
check "Edge Function invites/preview (anonymous, MESA34)" bash -c \
  "curl -fsS '$api/functions/v1/invites/preview?code=MESA34' -H 'apikey: $SUPABASE_ANON_KEY' | grep -q MESA34"
check "Edge Function admin/me requires a user (401 without token)" expect_status 401 "$api/functions/v1/admin/me" -H "apikey: $SUPABASE_ANON_KEY"
check "Edge Function admin/me with facil token" expect_status 200 "$api/functions/v1/admin/me" -H "apikey: $SUPABASE_ANON_KEY" -H "Authorization: Bearer $token"

if $check_web; then
  info "Web ($web_origin)"
  check "index.html served" bash -c "curl -fsS '$web_origin/' | grep -q flutter_bootstrap"
  check "main.dart.js served" expect_status 200 "$web_origin/main.dart.js"
  check "missing asset is a real 404" expect_status 404 "$web_origin/does-not-exist.js"
fi

echo
if ((failed > 0)); then
  printf '\033[31m%d passed, %d failed\033[0m\n' "$pass" "$failed" >&2
  exit 1
fi
printf '\033[32m%d checks passed\033[0m\n' "$pass"
