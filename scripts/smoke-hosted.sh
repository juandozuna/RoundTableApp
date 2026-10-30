#!/usr/bin/env bash
# Smoke test of the HOSTED environment. Read-only and account-free: no dev users exist in hosted and
# nothing is written (the optional cron check enqueues nothing new; it only drains the outbox).
#
#   bash scripts/smoke-hosted.sh [--env-file FILE] [--web-url URL] [--check-cron-secret]
#
# Reads deploy/hosted.env (SUPABASE_URL, SUPABASE_ANON_KEY, POWERSYNC_URL, APP_PUBLIC_URL,
# ALLOWED_ORIGINS, CRON_SECRET). --web-url overrides APP_PUBLIC_URL (e.g. a *.pages.dev preview;
# then add that origin to ALLOWED_ORIGINS first, or the CORS checks fail).
# Optional: SMOKE_ACCESS_TOKEN=<a real user's access token> also checks an authenticated call.
# --check-cron-secret calls POST /functions/v1/notifications/dispatch with CRON_SECRET (expects 200),
# which proves the secret in Supabase and the one in Vault agree.
set -uo pipefail
here="$(cd "$(dirname "$0")" && pwd)"
# shellcheck source=scripts/lib/hosted.sh
source "$here/lib/hosted.sh"

web_url=""
check_cron=false
while (($#)); do
  case "$1" in
    --env-file) hosted_env_file="${2:?--env-file needs a path}"; shift ;;
    --web-url) web_url="${2:?--web-url needs a URL}"; shift ;;
    --check-cron-secret) check_cron=true ;;
    -h|--help) sed -n '2,/^set -uo/p' "$0" | sed '$d' | sed 's/^# \{0,1\}//'; exit 0 ;;
    *) fail "Unknown option: $1 (see --help)" ;;
  esac
  shift
done

require_cmd curl
load_hosted_env
require_var SUPABASE_ANON_KEY "public anon key"
require_https_url POWERSYNC_URL
: "${web_url:=${APP_PUBLIC_URL:-}}"
[[ -n "$web_url" ]] || fail "Set APP_PUBLIC_URL in ${hosted_env_file#"$repo_root"/} or pass --web-url."
web_url="${web_url%/}"
powersync="${POWERSYNC_URL%/}"
api="$SUPABASE_URL"
origin="$web_url"

pass=0
failed=0
check() { # description, command...
  local description="$1"; shift
  local output
  if output="$("$@" 2>&1)"; then ok "$description"; ((pass++)); else printf '\033[31m ✗\033[0m %s\n%s\n' "$description" "${output:0:600}" >&2; ((failed++)); fi
}
soft() { # description, command... (reported, never fails the run)
  local description="$1"; shift
  if output="$("$@" 2>&1)"; then ok "$description"; else warn "$description — ${output:0:200}"; fi
}
status_of() { curl -s -o /dev/null -w '%{http_code}' --max-time 15 "$@"; }
expect_status() { local want="$1"; shift; local got; got="$(status_of "$@")"; [[ "$got" == "$want" ]] || { echo "expected HTTP $want, got $got"; return 1; }; }
expect_status_in() { local wants="$1"; shift; local got; got="$(status_of "$@")"; [[ " $wants " == *" $got "* ]] || { echo "expected HTTP $wants, got $got"; return 1; }; }
expect_header() { # header-regex url [curl args]
  local want="$1"; shift
  curl -s -I --max-time 15 "$@" | tr -d '\r' | grep -iEq -- "$want" || { echo "header matching '$want' missing from: $*"; return 1; }
}
body_of() { curl -fsS --max-time 15 "$@"; }

info "Supabase ($api)"
check "Auth health" expect_status 200 "$api/auth/v1/health" -H "apikey: $SUPABASE_ANON_KEY"
check "JWKS publishes an asymmetric signing key (PowerSync validates tokens with it)" bash -c \
  "curl -fsS '$api/auth/v1/.well-known/jwks.json' | grep -Eq '\"alg\" *: *\"(ES256|RS256|EdDSA)\"'"
check "Anonymous PostgREST read returns no program data (RLS)" bash -c \
  "! curl -s '$api/rest/v1/people?select=id&limit=1' -H 'apikey: $SUPABASE_ANON_KEY' | grep -q '\"id\"'"
check "Edge Function admin/me requires a user (401 without token)" expect_status 401 "$api/functions/v1/admin/me" -H "apikey: $SUPABASE_ANON_KEY"
check "Edge Function invites/preview answers anonymously (unknown code is not a 5xx)" \
  expect_status_in "400 404 410" "$api/functions/v1/invites/preview?code=ZZZZZZ" -H "apikey: $SUPABASE_ANON_KEY"
check "Edge Function notifications/dispatch refuses a caller without the cron secret (403)" \
  expect_status 403 -X POST "$api/functions/v1/notifications/dispatch" -H "apikey: $SUPABASE_ANON_KEY"
check "CORS preflight from $origin is allowed and not '*'" bash -c \
  "curl -s -i -X OPTIONS '$api/functions/v1/admin/me' -H 'Origin: $origin' -H 'Access-Control-Request-Method: GET' -H 'Access-Control-Request-Headers: authorization,apikey' \
   | tr -d '\r' | grep -iq '^access-control-allow-origin: $origin\$'"
if $check_cron; then
  require_var CRON_SECRET
  check "notifications/dispatch with the cron secret (200)" expect_status 200 -X POST "$api/functions/v1/notifications/dispatch" \
    -H "apikey: $SUPABASE_ANON_KEY" -H "x-cron-secret: $CRON_SECRET"
fi
if [[ -n "${SMOKE_ACCESS_TOKEN:-}" ]]; then
  check "Edge Function admin/me with SMOKE_ACCESS_TOKEN (200 or 403 for a non-admin)" \
    expect_status_in "200 403" "$api/functions/v1/admin/me" -H "apikey: $SUPABASE_ANON_KEY" -H "Authorization: Bearer $SMOKE_ACCESS_TOKEN"
fi

info "PowerSync ($powersync)"
check "liveness probe" expect_status 200 "$powersync/probes/liveness"
check "readiness probe" expect_status 200 "$powersync/probes/readiness"
check "sync stream refuses a request without a token (401)" expect_status_in "400 401 403" -X POST "$powersync/sync/stream" \
  -H 'Content-Type: application/json' -d '{}'
check "CORS preflight from $origin" expect_header 'access-control-allow-origin' -X OPTIONS "$powersync/sync/stream" \
  -H "Origin: $origin" -H 'Access-Control-Request-Method: POST' -H 'Access-Control-Request-Headers: authorization,content-type'

info "Web ($web_url)"
check "index.html served" bash -c "curl -fsS --max-time 15 '$web_url/' | grep -q flutter_bootstrap"
check "index.html is revalidated (Cache-Control: no-cache)" expect_header '^cache-control: .*no-cache' "$web_url/"
soft "security headers (nosniff, HSTS; web/_headers on Cloudflare Pages, add them in your proxy when self-hosting)" bash -c \
  "h=\$(curl -sI --max-time 15 '$web_url/' | tr -d '\r'); grep -iq '^x-content-type-options: nosniff' <<<\"\$h\" && grep -iq '^strict-transport-security:' <<<\"\$h\""
check "main.dart.js served" expect_status 200 "$web_url/main.dart.js"
check "flutter_service_worker.js is revalidated" expect_header '^cache-control: .*no-cache' "$web_url/flutter_service_worker.js"
check "powersync_db.worker.js served as JavaScript (no SPA fallback)" expect_header '^content-type: .*javascript' "$web_url/powersync_db.worker.js"
check "sqlite3.wasm served as application/wasm" expect_header '^content-type: application/wasm' "$web_url/sqlite3.wasm"
check "missing asset is a real 404" expect_status 404 "$web_url/does-not-exist.js"
soft "path-style invite links redirect to the hash route (web/_redirects; Cloudflare Pages only)" \
  expect_header '^location: .*#/invite/' "$web_url/invite/ABC123"

echo
if ((failed > 0)); then
  printf '\033[31m%d passed, %d failed\033[0m\n' "$pass" "$failed" >&2
  exit 1
fi
printf '\033[32m%d checks passed\033[0m\n' "$pass"
echo "Still manual: sign in with each provider, open a table, answer offline then reconnect (docs/deployment.md §8)."
