#!/usr/bin/env bash
# Stops the web containers. Supabase keeps running (it may be shared).
#
#   bash scripts/dev-down.sh                  # stop containers
#   bash scripts/dev-down.sh --purge          # also remove compose volumes
#   bash scripts/dev-down.sh --with-supabase  # also `supabase stop`
set -euo pipefail
here="$(cd "$(dirname "$0")" && pwd)"
# shellcheck source=scripts/lib/common.sh
source "$here/lib/common.sh"

load_env
require_cmd docker
volumes=()
stop_supabase=false
for arg in "$@"; do
  case "$arg" in
    --purge) volumes=(--volumes) ;;
    --with-supabase) stop_supabase=true ;;
    -h | --help) sed -n '2,6p' "$0"; exit 0 ;;
    *) fail "Unknown option: $arg" ;;
  esac
done

info "docker compose down"
compose --profile core --profile web --profile web-local down --remove-orphans "${volumes[@]}"
ok "Web containers stopped"

if $stop_supabase; then
  require_cmd supabase
  info "supabase stop"
  (cd "$repo_root" && supabase stop)
else
  info "Supabase left running (use --with-supabase to stop it)"
fi
