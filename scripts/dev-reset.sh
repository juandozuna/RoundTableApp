#!/usr/bin/env bash
# Resets the local data: `supabase db reset` (migrations + seed). Web containers are left alone.
#
# DESTRUCTIVE: wipes the local Supabase database. If other people/agents share this stack,
# coordinate first. Pass --yes to skip the confirmation.
set -euo pipefail
here="$(cd "$(dirname "$0")" && pwd)"
# shellcheck source=scripts/lib/common.sh
source "$here/lib/common.sh"

load_env
require_cmd docker
require_cmd supabase
require_supabase_running

if [[ "${1:-}" != "--yes" ]]; then
  read -r -p "This wipes the local database '${SUPABASE_PROJECT_ID}' and re-seeds it. Continue? [y/N] " answer
  [[ "$answer" =~ ^[Yy]$ ]] || { echo "Aborted."; exit 1; }
fi

info "supabase db reset"
(cd "$repo_root" && supabase db reset)
ok "Data reset and re-seeded (dev users keep password dev-password-123)"
