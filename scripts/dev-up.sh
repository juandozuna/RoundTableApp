#!/usr/bin/env bash
# One command to run the whole app locally:
#   Supabase (CLI) → web app.
#
#   bash scripts/dev-up.sh                 # web built in Docker (docker/web/Dockerfile; default)
#   bash scripts/dev-up.sh --local-web     # web built with the host Flutter (faster rebuilds)
#   bash scripts/dev-up.sh --no-web        # backend only (e.g. while running `flutter run -d chrome`)
#
# Idempotent: re-running reuses what is already up and rebuilds the web app.
set -euo pipefail
here="$(cd "$(dirname "$0")" && pwd)"
# shellcheck source=scripts/lib/common.sh
source "$here/lib/common.sh"

load_env
mode="${WEB_MODE:-docker}"
for arg in "$@"; do
  case "$arg" in
    --docker-web) mode=docker ;;
    --local-web) mode=local ;;
    --no-web) mode=none ;;
    -h | --help) sed -n '2,10p' "$0"; exit 0 ;;
    *) fail "Unknown option: $arg" ;;
  esac
done

require_cmd docker
require_cmd curl
require_cmd supabase
docker info >/dev/null 2>&1 || fail "Docker is not running."

if supabase_running; then
  ok "Supabase local already running"
else
  info "supabase start (first run pulls images and applies migrations + seed)"
  (cd "$repo_root" && supabase start)
fi
load_supabase_keys

case "$mode" in
  local) bash "$here/web-dev-serve.sh" ;;
  docker)
    info "Building the web image (slow the first time)"
    compose --profile web rm -sf web-local >/dev/null 2>&1 || true
    compose --profile web up -d --build --wait web
    ok "Web container healthy"
    ;;
  none) warn "Skipping the web app (--no-web)." ;;
  *) fail "WEB_MODE must be local, docker or none (got '$mode')." ;;
esac

cat <<INFO

  Gold Roundtables is up
  ──────────────────────────────────────────────────────────────
  Web app        http://127.0.0.1:${WEB_PORT}
  Supabase API   ${SUPABASE_URL}
  Studio         http://127.0.0.1:54323
  Mail (Mailpit) http://127.0.0.1:54324

  Dev sign-in (password: dev-password-123)
    admin@dev.local   Administrador · Plataforma
    coord@dev.local   Coordinador · Fundación Luz (miembro de Mesa Fe 01)
    facil@dev.local   Facilitador · Mesa Esperanza 03
    ana@dev.local     Miembro · Mesa Esperanza 03     (also luis@ / marta@dev.local)

  Check:   bash scripts/smoke.sh      Status: bash scripts/dev-status.sh
  Stop:    bash scripts/dev-down.sh   Reset: bash scripts/dev-reset.sh
INFO
