#!/usr/bin/env bash
# Shared helpers for the local-stack scripts. Source it; do not execute it.

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"

info() { printf '\033[34m==>\033[0m %s\n' "$*"; }
ok() { printf '\033[32m ✓\033[0m %s\n' "$*"; }
warn() { printf '\033[33m !\033[0m %s\n' "$*" >&2; }
fail() { printf '\033[31m ✗\033[0m %s\n' "$*" >&2; exit 1; }

require_cmd() {
  command -v "$1" >/dev/null 2>&1 || fail "'$1' is required but not installed."
}

# Loads .env (when present) and applies the defaults documented in .env.example.
load_env() {
  if [[ -f "$repo_root/.env" ]]; then
    set -a
    # shellcheck disable=SC1091
    source "$repo_root/.env"
    set +a
  fi
  : "${SUPABASE_PROJECT_ID:=gold-roundtables}"
  : "${SUPABASE_DB_PORT:=54322}"
  : "${SUPABASE_API_PORT:=54321}"
  : "${WEB_PORT:=3000}"
  export SUPABASE_PROJECT_ID SUPABASE_DB_PORT SUPABASE_API_PORT WEB_PORT
}

supabase_db_container() { echo "supabase_db_${SUPABASE_PROJECT_ID}"; }

supabase_running() {
  [[ "$(docker inspect -f '{{.State.Running}}' "$(supabase_db_container)" 2>/dev/null || true)" == "true" ]]
}

require_supabase_running() {
  supabase_running || fail "Supabase local is not running. Start it with 'supabase start' (or scripts/dev-up.sh)."
}

# Exports SUPABASE_URL / SUPABASE_ANON_KEY (public local demo values) from the Supabase CLI.
# Values already set in the environment/.env win, so a remote stack can be targeted.
load_supabase_keys() {
  if [[ -n "${SUPABASE_URL:-}" && -n "${SUPABASE_ANON_KEY:-}" ]]; then return; fi
  require_cmd supabase
  local status
  status="$(cd "$repo_root" && supabase status -o env 2>/dev/null)" \
    || fail "'supabase status' failed. Is the local stack running?"
  local value
  value="$(sed -n 's/^API_URL="\(.*\)"$/\1/p' <<<"$status")"
  : "${SUPABASE_URL:=$value}"
  value="$(sed -n 's/^ANON_KEY="\(.*\)"$/\1/p' <<<"$status")"
  : "${SUPABASE_ANON_KEY:=$value}"
  SERVICE_ROLE_KEY="$(sed -n 's/^SERVICE_ROLE_KEY="\(.*\)"$/\1/p' <<<"$status")"
  [[ -n "$SUPABASE_URL" && -n "$SUPABASE_ANON_KEY" ]] || fail "Could not read API_URL / ANON_KEY from 'supabase status -o env'."
  export SUPABASE_URL SUPABASE_ANON_KEY SERVICE_ROLE_KEY
}

# Polls a URL until it answers with a 2xx/3xx status (default timeout 90 s).
wait_for_url() {
  local url="$1" label="${2:-$1}" timeout="${3:-90}" waited=0
  until curl -fsS -o /dev/null "$url" 2>/dev/null; do
    ((waited += 2))
    ((waited > timeout)) && fail "Timed out waiting for $label ($url)."
    sleep 2
  done
  ok "$label is up"
}

compose() {
  (cd "$repo_root" && docker compose "$@")
}
