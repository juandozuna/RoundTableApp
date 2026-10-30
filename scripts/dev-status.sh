#!/usr/bin/env bash
# Shows what is running: Supabase and the web app.
set -euo pipefail
here="$(cd "$(dirname "$0")" && pwd)"
# shellcheck source=scripts/lib/common.sh
source "$here/lib/common.sh"

load_env
require_cmd docker

probe() { # label url
  local code
  code="$(curl -s -o /dev/null -w '%{http_code}' --max-time 3 "$2" || true)"
  if [[ "$code" =~ ^[23] ]]; then ok "$1  $2  (HTTP $code)"; else warn "$1  $2  (not reachable: ${code:-000})"; fi
}

info "Supabase (${SUPABASE_PROJECT_ID})"
if supabase_running; then ok "database container $(supabase_db_container) running"; else warn "Supabase is not running (supabase start)"; fi
probe "Auth JWKS  " "http://127.0.0.1:${SUPABASE_API_PORT}/auth/v1/.well-known/jwks.json"
probe "Studio     " "http://127.0.0.1:54323"

info "Containers"
compose --profile core --profile web --profile web-local ps -a || true

info "Endpoints"
probe "Web        " "http://127.0.0.1:${WEB_PORT}/healthz"
