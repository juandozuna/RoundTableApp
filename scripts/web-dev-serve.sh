#!/usr/bin/env bash
# Builds the Flutter web app on the host (`flutter build web`) and serves it with the same nginx
# config as the Docker image, on http://127.0.0.1:${WEB_PORT:-3000}. Faster than the Docker build
# (`dev-up.sh --local-web` runs the whole stack this way).
#
#   bash scripts/web-dev-serve.sh            # build (debug-free release) + serve
#   bash scripts/web-dev-serve.sh --no-build # only (re)start nginx on the existing build/web
#
# Debug flavour for stack traces: WEB_BUILD_MODE=profile bash scripts/web-dev-serve.sh
set -euo pipefail
here="$(cd "$(dirname "$0")" && pwd)"
# shellcheck source=scripts/lib/common.sh
source "$here/lib/common.sh"

load_env
require_cmd docker
build=true
[[ "${1:-}" == "--no-build" ]] && build=false

if $build; then
  require_cmd flutter
  load_supabase_keys
  : "${POWERSYNC_URL:=http://127.0.0.1:${POWERSYNC_PORT}}"
  : "${DEV_AUTH:=true}"
  : "${APP_ENV:=local}"
  info "flutter build web (${WEB_BUILD_MODE:-release}) → build/web"
  defines=(
    "--dart-define=SUPABASE_URL=$SUPABASE_URL"
    "--dart-define=SUPABASE_ANON_KEY=$SUPABASE_ANON_KEY"
    "--dart-define=POWERSYNC_URL=$POWERSYNC_URL"
    "--dart-define=DEV_AUTH=$DEV_AUTH"
    "--dart-define=APP_ENV=$APP_ENV"
  )
  for name in FIREBASE_API_KEY FIREBASE_APP_ID FIREBASE_WEB_APP_ID FIREBASE_MESSAGING_SENDER_ID FIREBASE_PROJECT_ID FIREBASE_STORAGE_BUCKET FIREBASE_VAPID_KEY; do
    [[ -n "${!name:-}" ]] && defines+=("--dart-define=$name=${!name}")
  done
  (cd "$repo_root" && flutter pub get >/dev/null && flutter build web "--${WEB_BUILD_MODE:-release}" --base-href / "${defines[@]}")
fi

[[ -f "$repo_root/build/web/index.html" ]] || fail "build/web is missing. Run without --no-build first."

# The Docker-built `web` service uses the same port; make sure only one is up.
compose --profile web rm -sf web >/dev/null 2>&1 || true
info "Serving build/web with nginx"
compose --profile web-local up -d --force-recreate web-local
wait_for_url "http://127.0.0.1:${WEB_PORT}/healthz" "web (nginx)"
ok "Web app: http://127.0.0.1:${WEB_PORT}"
