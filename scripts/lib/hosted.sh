#!/usr/bin/env bash
# Helpers for the hosted-deployment scripts (deploy-hosted.sh, build-web.sh, smoke-hosted.sh,
# setup-powersync-replication.sh --hosted). Source it; do not execute it.
#
# Deliberately never reads the local `.env`: local-stack values (DEV_AUTH=true, 127.0.0.1 URLs)
# must not leak into a hosted build or deploy.

# shellcheck source=scripts/lib/common.sh
source "$(dirname "${BASH_SOURCE[0]}")/common.sh"

hosted_env_file="${HOSTED_ENV_FILE:-$repo_root/deploy/hosted.env}"

# Variables the shell environment may provide instead of the file (secrets); the environment wins.
_hosted_env_wins=(SUPABASE_ACCESS_TOKEN SUPABASE_DB_PASSWORD SUPABASE_DB_URL)

load_hosted_env() {
  [[ -f "$hosted_env_file" ]] || fail "Settings file not found: ${hosted_env_file#"$repo_root"/}
   Create it with:  cp deploy/hosted.env.example deploy/hosted.env   and fill it in (see docs/deployment.md)."
  local name pair saved=()
  for name in "${_hosted_env_wins[@]}"; do
    if [[ -n "${!name:-}" ]]; then saved+=("$name=${!name}"); fi
  done
  set -a
  # shellcheck disable=SC1090
  source "$hosted_env_file"
  set +a
  for pair in "${saved[@]+"${saved[@]}"}"; do
    export "${pair%%=*}=${pair#*=}"
  done

  [[ "${SUPABASE_PROJECT_REF:-}" =~ ^[a-z]{20}$ ]] \
    || fail "SUPABASE_PROJECT_REF must be the 20-letter project id (dashboard URL: supabase.com/dashboard/project/<ref>)."
  : "${SUPABASE_URL:=https://${SUPABASE_PROJECT_REF}.supabase.co}"
  SUPABASE_URL="${SUPABASE_URL%/}"
  : "${APP_ENV:=production}"
  export SUPABASE_URL APP_ENV SUPABASE_PROJECT_REF
}

require_var() { # NAME [hint]
  [[ -n "${!1:-}" ]] || fail "$1 is required in ${hosted_env_file#"$repo_root"/}${2:+ ($2)}."
}

require_https_url() { # NAME
  require_var "$1"
  [[ "${!1}" =~ ^https://[^/[:space:]]+[^[:space:]]*$ ]] || fail "$1 must be an https:// URL (got '${!1}')."
}

# Links the Supabase CLI to the hosted project when it is not already (idempotent).
hosted_ensure_link() {
  require_cmd supabase
  local linked=""
  if [[ -f "$repo_root/supabase/.temp/project-ref" ]]; then linked="$(<"$repo_root/supabase/.temp/project-ref")"; fi
  if [[ "$linked" == "$SUPABASE_PROJECT_REF" ]]; then
    ok "Supabase CLI already linked to $SUPABASE_PROJECT_REF"
    return
  fi
  info "Linking the Supabase CLI to $SUPABASE_PROJECT_REF"
  # SUPABASE_DB_PASSWORD (environment) is read by the CLI; it is never put on the command line.
  (cd "$repo_root" && supabase link --project-ref "$SUPABASE_PROJECT_REF") \
    || fail "supabase link failed. Check SUPABASE_PROJECT_REF, SUPABASE_ACCESS_TOKEN (supabase.com → Account → Access Tokens, or run 'supabase login') and SUPABASE_DB_PASSWORD."
}

# Runs a SQL file against the hosted database: SUPABASE_DB_URL when set, else the linked project
# (Management API, needs SUPABASE_ACCESS_TOKEN or 'supabase login').
hosted_sql_file() { # file
  if [[ -n "${SUPABASE_DB_URL:-}" ]]; then
    (cd "$repo_root" && supabase db query --db-url "$SUPABASE_DB_URL" -f "$1")
  else
    (cd "$repo_root" && supabase db query --linked -f "$1")
  fi
}

# Creates a private temporary directory (removed on exit) for files that contain secrets and
# stores its path in HOSTED_TMP. Call it directly, not in a command substitution.
hosted_tmpdir() {
  if [[ -z "${HOSTED_TMP:-}" ]]; then
    HOSTED_TMP="$(umask 077 && mktemp -d "${TMPDIR:-/tmp}/gr-hosted.XXXXXX")"
    trap 'rm -rf "$HOSTED_TMP"' EXIT
  fi
}

# Quotes a value as a SQL string literal.
sql_quote() { local v="${1//\'/\'\'}"; printf "'%s'" "$v"; }
