# syntax=docker/dockerfile:1
# Flutter web release served by nginx.
#
#   docker compose --profile web build web      (reads .env; scripts/dev-up.sh does this)
#
# Configuration reaches the app only through --dart-define (build args below). The Flutter image
# is pinned to the repository's Flutter version (pubspec/AGENTS: 3.41.x); it is multi-arch, so it
# builds natively on Apple Silicon. For a faster iteration loop use scripts/web-dev-serve.sh.

ARG FLUTTER_VERSION=3.41.1

FROM ghcr.io/cirruslabs/flutter:${FLUTTER_VERSION} AS build
WORKDIR /app

ARG SUPABASE_URL=http://127.0.0.1:54321
ARG SUPABASE_ANON_KEY
ARG POWERSYNC_URL=http://127.0.0.1:8080
ARG DEV_AUTH=true
ARG APP_ENV=local
# Optional (hosted/self-hosted production builds; empty = off). See docs/deployment.md.
ARG ERROR_REPORT_URL=
ARG FIREBASE_API_KEY=
ARG FIREBASE_APP_ID=
ARG FIREBASE_MESSAGING_SENDER_ID=
ARG FIREBASE_PROJECT_ID=
ARG FIREBASE_VAPID_KEY=
# Set to true only if generated files (freezed, json, injectable, drift, retrofit) are not committed.
ARG RUN_CODEGEN=false

# Resolve dependencies first so this layer is cached until pubspec changes.
COPY pubspec.yaml pubspec.lock ./
RUN flutter pub get

COPY . .
RUN flutter pub get --offline \
 && if [ "$RUN_CODEGEN" = "true" ]; then flutter gen-l10n && dart run build_runner build; fi

RUN test -n "$SUPABASE_ANON_KEY" || (echo "SUPABASE_ANON_KEY build arg is required (see .env.example)" >&2; exit 1)
RUN flutter build web --release --base-href / \
      --dart-define=SUPABASE_URL="$SUPABASE_URL" \
      --dart-define=SUPABASE_ANON_KEY="$SUPABASE_ANON_KEY" \
      --dart-define=POWERSYNC_URL="$POWERSYNC_URL" \
      --dart-define=DEV_AUTH="$DEV_AUTH" \
      --dart-define=APP_ENV="$APP_ENV" \
      --dart-define=ERROR_REPORT_URL="$ERROR_REPORT_URL" \
      --dart-define=FIREBASE_API_KEY="$FIREBASE_API_KEY" \
      --dart-define=FIREBASE_APP_ID="$FIREBASE_APP_ID" \
      --dart-define=FIREBASE_MESSAGING_SENDER_ID="$FIREBASE_MESSAGING_SENDER_ID" \
      --dart-define=FIREBASE_PROJECT_ID="$FIREBASE_PROJECT_ID" \
      --dart-define=FIREBASE_VAPID_KEY="$FIREBASE_VAPID_KEY"

FROM nginx:1.27-alpine
COPY docker/web/nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build /app/build/web /usr/share/nginx/html
EXPOSE 3000
HEALTHCHECK --interval=10s --timeout=3s --retries=5 \
  CMD wget -qO- http://127.0.0.1:3000/healthz >/dev/null || exit 1
