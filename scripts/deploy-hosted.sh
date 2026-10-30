#!/usr/bin/env bash
# Deploys Gold Roundtables to a HOSTED Supabase project. Idempotent: every step can be repeated.
#
#   bash scripts/deploy-hosted.sh [--dry-run] [--only STEPS | --skip STEPS] [--env-file FILE]
#
# Reads deploy/hosted.env (git-ignored; template: deploy/hosted.env.example). The Supabase access
# token and DB password may come from the shell (SUPABASE_ACCESS_TOKEN, SUPABASE_DB_PASSWORD) and
# are never printed. Does not touch the local Docker/Supabase stack.
#
# Steps (default order):
#   link       supabase link to the project
#   db         enable pg_cron/pg_net, then supabase db push (migrations only; seed.sql never runs)
#   functions  supabase functions deploy for every directory in supabase/functions
#   secrets    supabase secrets set: APP_PUBLIC_URL, ALLOWED_ORIGINS, CRON_SECRET, FCM_SERVICE_ACCOUNT_JSON
#   vault      Vault secrets functions_base_url + cron_secret read by app.dispatch_notifications_http()
#   verify     lists the gr-* pg_cron jobs and the Vault secret names
#   admin      first platform administrator (only when FIRST_ADMIN_EMAIL is set)
#   auth       opt-in (--with-auth or --only auth): PATCH Auth settings through the Management API
#              (site URL, redirects, JWT/session settings of docs/implementation/offline-window.md)
#              and read them back
#
# --dry-run      validate settings, link, `supabase db push --dry-run`, and print what the other
#                steps would do. Changes nothing on the project.
# --only/--skip  comma-separated step names, e.g. --only functions,secrets  |  --only admin
# --with-auth    add the opt-in `auth` step to the default run
# --env-file F   settings file (default deploy/hosted.env)
# -h, --help     this text
set -euo pipefail
here="$(cd "$(dirname "$0")" && pwd)"
# shellcheck source=scripts/lib/hosted.sh
source "$here/lib/hosted.sh"

all_steps=(link db functions secrets vault verify admin auth)
dry_run=false
only=""
skip=""
with_auth=false

usage() { sed -n '2,/^set -euo/p' "$0" | sed '$d' | sed 's/^# \{0,1\}//'; }

while (($#)); do
  case "$1" in
    -h|--help) usage; exit 0 ;;
    --dry-run) dry_run=true ;;
    --with-auth) with_auth=true ;;
    --only) only="${2:?--only needs a comma-separated step list}"; shift ;;
    --skip) skip="${2:?--skip needs a comma-separated step list}"; shift ;;
    --env-file) hosted_env_file="${2:?--env-file needs a path}"; shift ;;
    *) usage >&2; fail "Unknown option: $1" ;;
  esac
  shift
done

valid_step() { local s; for s in "${all_steps[@]}"; do [[ "$s" == "$1" ]] && return 0; done; return 1; }
for s in ${only//,/ } ${skip//,/ }; do valid_step "$s" || fail "Unknown step '$s'. Steps: ${all_steps[*]}"; done

wants() { # step
  local step="$1"
  if [[ -n "$only" ]]; then [[ ",$only," == *",$step,"* ]]; return; fi
  [[ ",$skip," == *",$step,"* ]] && return 1
  case "$step" in
    admin) [[ -n "${FIRST_ADMIN_EMAIL:-}" ]] ;;
    auth) $with_auth ;;
    *) return 0 ;;
  esac
}

load_hosted_env
require_cmd supabase

# ── Validation (offline; runs before anything is changed) ─────────────────────────────────────
validate_settings() {
  if wants link || wants db; then
    [[ -n "${SUPABASE_DB_PASSWORD:-}" || -n "${SUPABASE_DB_URL:-}" ]] \
      || fail "SUPABASE_DB_PASSWORD (or SUPABASE_DB_URL) is required to link and push migrations. Export it or put it in ${hosted_env_file#"$repo_root"/}."
  fi
  if wants secrets || wants auth; then
    require_https_url APP_PUBLIC_URL
    APP_PUBLIC_URL="${APP_PUBLIC_URL%/}"
  fi
  if wants secrets; then
    require_var ALLOWED_ORIGINS "comma-separated https origins of the web app"
    [[ ",$ALLOWED_ORIGINS," != *",*,"* ]] || fail "ALLOWED_ORIGINS must list the real web origins, not '*'."
    local origin
    for origin in ${ALLOWED_ORIGINS//,/ }; do
      [[ "$origin" =~ ^https://[^/[:space:]]+$ ]] || fail "ALLOWED_ORIGINS entry '$origin' must look like https://app.example.org (no path, no trailing slash)."
    done
  fi
  if wants secrets || wants vault; then
    require_var CRON_SECRET "generate with: openssl rand -hex 32"
    [[ "$CRON_SECRET" =~ ^[A-Za-z0-9._~+=-]{32,}$ ]] \
      || fail "CRON_SECRET must be at least 32 characters from A-Z a-z 0-9 . _ ~ + = - (openssl rand -hex 32)."
  fi
  if wants secrets && [[ -n "${FCM_SERVICE_ACCOUNT_FILE:-}" ]]; then
    require_cmd jq
    [[ -f "$FCM_SERVICE_ACCOUNT_FILE" ]] || fail "FCM_SERVICE_ACCOUNT_FILE not found: $FCM_SERVICE_ACCOUNT_FILE"
    jq -e '.type == "service_account" and (.private_key | type == "string")' "$FCM_SERVICE_ACCOUNT_FILE" >/dev/null 2>&1 \
      || fail "FCM_SERVICE_ACCOUNT_FILE is not a Firebase service-account JSON key."
  fi
  if wants admin; then
    require_var FIRST_ADMIN_EMAIL
    [[ "$FIRST_ADMIN_EMAIL" =~ ^[^@\'\"\\[:space:]]+@[^@\'\"\\[:space:]]+\.[^@\'\"\\[:space:]]+$ ]] \
      || fail "FIRST_ADMIN_EMAIL is not a valid email address."
    require_var FIRST_ADMIN_FIRST_NAME
    require_var FIRST_ADMIN_LAST_NAME
  fi
  if wants auth; then
    require_cmd jq
    require_cmd curl
  fi
}

function_names() {
  local dir
  for dir in "$repo_root"/supabase/functions/*/; do
    if [[ -f "$dir/index.ts" ]]; then basename "$dir"; fi
  done
}

warn_functions_without_config() {
  local name
  while IFS= read -r name; do
    grep -q "^\[functions\.${name}\]" "$repo_root/supabase/config.toml" \
      || warn "Function '$name' has no [functions.$name] verify_jwt entry in supabase/config.toml (it would default to verify_jwt = true)."
  done < <(function_names)
}

# ── Steps ────────────────────────────────────────────────────────────────────────────────────
step_link() {
  info "link"
  hosted_ensure_link
}

step_db() {
  info "db: migrations"
  if $dry_run; then
    (cd "$repo_root" && supabase db push --linked --dry-run --skip-vault) \
      || fail "supabase db push --dry-run failed. Check the link, SUPABASE_DB_PASSWORD and that the database is reachable."
    return
  fi
  hosted_tmpdir
  # The migrations guard these two (a failure is only a NOTICE and the cron jobs would be silently
  # skipped), so enable them first and fail loudly if the project cannot.
  printf '%s\n' \
    'create extension if not exists pg_cron;' \
    'create extension if not exists pg_net with schema extensions;' >"$HOSTED_TMP/extensions.sql"
  hosted_sql_file "$HOSTED_TMP/extensions.sql" >/dev/null \
    || fail "Could not enable pg_cron / pg_net. Enable them in the dashboard (Database → Extensions) and re-run."
  ok "pg_cron and pg_net enabled"
  (cd "$repo_root" && supabase db push --linked --skip-vault) || fail "supabase db push failed."
  ok "Migrations applied (supabase/seed.sql is not run)"
}

step_functions() {
  info "functions"
  warn_functions_without_config
  local names=() flags=() name
  while IFS= read -r name; do names+=("$name"); done < <(function_names)
  if [[ "${FUNCTIONS_USE_API:-true}" == "true" ]]; then flags+=(--use-api); fi
  if $dry_run; then
    ok "would deploy: ${names[*]} (verify_jwt per supabase/config.toml)"
    return
  fi
  (cd "$repo_root" && supabase functions deploy "${names[@]}" --project-ref "$SUPABASE_PROJECT_REF" "${flags[@]+"${flags[@]}"}") \
    || fail "supabase functions deploy failed."
  ok "Deployed: ${names[*]}"
}

step_secrets() {
  info "secrets"
  local names="APP_PUBLIC_URL ALLOWED_ORIGINS CRON_SECRET"
  if [[ -n "${FCM_SERVICE_ACCOUNT_FILE:-}" ]]; then names+=" FCM_SERVICE_ACCOUNT_JSON"; fi
  if $dry_run; then
    ok "would set: $names (values hidden)"
    return
  fi
  hosted_tmpdir
  {
    printf "APP_PUBLIC_URL='%s'\n" "$APP_PUBLIC_URL"
    printf "ALLOWED_ORIGINS='%s'\n" "$ALLOWED_ORIGINS"
    printf "CRON_SECRET='%s'\n" "$CRON_SECRET"
    if [[ -n "${FCM_SERVICE_ACCOUNT_FILE:-}" ]]; then
      local fcm
      fcm="$(jq -c . "$FCM_SERVICE_ACCOUNT_FILE")"
      [[ "$fcm" != *"'"* ]] || fail "The service-account JSON contains a single quote; set FCM_SERVICE_ACCOUNT_JSON by hand."
      printf "FCM_SERVICE_ACCOUNT_JSON='%s'\n" "$fcm"
    fi
  } >"$HOSTED_TMP/secrets.env"
  (cd "$repo_root" && supabase secrets set --env-file "$HOSTED_TMP/secrets.env" --project-ref "$SUPABASE_PROJECT_REF") \
    || fail "supabase secrets set failed."
  ok "Secrets set: $names"
  [[ -n "${FCM_SERVICE_ACCOUNT_FILE:-}" ]] || warn "FCM_SERVICE_ACCOUNT_FILE is empty: push notifications will be skipped (the rest works)."
}

step_vault() {
  info "vault"
  if $dry_run; then
    ok "would upsert Vault secrets functions_base_url (${SUPABASE_URL}/functions/v1) and cron_secret"
    return
  fi
  hosted_tmpdir
  cat >"$HOSTED_TMP/vault.sql" <<SQL
do \$vault\$
declare
  v_id uuid;
  v_item record;
begin
  for v_item in
    select * from (values
      ('functions_base_url', $(sql_quote "${SUPABASE_URL}/functions/v1"), 'Base URL of the Edge Functions (app.dispatch_notifications_http)'),
      ('cron_secret', $(sql_quote "$CRON_SECRET"), 'x-cron-secret for the notifications dispatcher')
    ) as t(name, secret, description)
  loop
    select id into v_id from vault.secrets where name = v_item.name;
    if v_id is null then
      perform vault.create_secret(v_item.secret, v_item.name, v_item.description);
    else
      perform vault.update_secret(v_id, v_item.secret, v_item.name, v_item.description);
    end if;
  end loop;
end
\$vault\$;
SQL
  hosted_sql_file "$HOSTED_TMP/vault.sql" >/dev/null \
    || fail "Could not write the Vault secrets (is the Vault extension enabled? Dashboard → Database → Extensions)."
  ok "Vault secrets functions_base_url and cron_secret written"
}

step_verify() {
  info "verify"
  if $dry_run; then
    ok "would list cron jobs and Vault secret names"
    return
  fi
  hosted_tmpdir
  cat >"$HOSTED_TMP/verify.sql" <<'SQL'
select jobname, schedule, active from cron.job where jobname like 'gr-%' order by jobname;
select name from vault.secrets where name in ('functions_base_url', 'cron_secret') order by name;
SQL
  hosted_sql_file "$HOSTED_TMP/verify.sql" || warn "Could not run the verification queries."
  echo "   Expected cron jobs: gr-apply-schedule gr-archive-sessions gr-commitment-nudges gr-invites-expire gr-kpi-refresh-dirty gr-kpi-refresh-hourly gr-pending-sessions gr-session-reminders gr-table-alerts"
  echo "   Expected Vault secrets: cron_secret functions_base_url"
}

step_admin() {
  info "admin: $FIRST_ADMIN_EMAIL"
  if $dry_run; then
    ok "would link $FIRST_ADMIN_EMAIL as platform_admin (must have signed in once)"
    return
  fi
  hosted_tmpdir
  cat >"$HOSTED_TMP/admin.sql" <<SQL
do \$admin\$
declare
  v_user uuid;
  v_person uuid;
begin
  select id into v_user from auth.users where lower(email) = lower($(sql_quote "$FIRST_ADMIN_EMAIL")) limit 1;
  if v_user is null then
    raise exception 'FIRST_ADMIN_NOT_SIGNED_IN: no auth user with that email yet';
  end if;
  select id into v_person from public.people where organization_id is null and auth_user_id = v_user;
  if v_person is null then
    insert into public.people (organization_id, auth_user_id, first_name, last_name, email, status)
    values (null, v_user, $(sql_quote "$FIRST_ADMIN_FIRST_NAME"), $(sql_quote "$FIRST_ADMIN_LAST_NAME"), $(sql_quote "$FIRST_ADMIN_EMAIL"), 'active')
    returning id into v_person;
  end if;
  if not exists (select 1 from public.role_assignments
                 where person_id = v_person and role = 'platform_admin' and status = 'active') then
    insert into public.role_assignments (person_id, role, organization_id) values (v_person, 'platform_admin', null);
  end if;
end
\$admin\$;
SQL
  local output
  if ! output="$(hosted_sql_file "$HOSTED_TMP/admin.sql" 2>&1)"; then
    if [[ "$output" == *FIRST_ADMIN_NOT_SIGNED_IN* ]]; then
      fail "$FIRST_ADMIN_EMAIL has not signed in yet. Open the web app, sign in once with that account (it answers \"No encontramos tu cuenta\"), then run: bash scripts/deploy-hosted.sh --only admin"
    fi
    printf '%s\n' "${output:0:800}" >&2
    fail "Could not create the first administrator."
  fi
  ok "$FIRST_ADMIN_EMAIL is a platform administrator"
}

# Management API (PATCH/GET /v1/projects/{ref}/config/auth). Field names follow the public API
# reference; they are read back and compared so a mismatch is reported instead of silently ignored.
step_auth() {
  info "auth (Management API)"
  local token="${SUPABASE_ACCESS_TOKEN:-}"
  local url="https://api.supabase.com/v1/projects/${SUPABASE_PROJECT_REF}/config/auth"
  local redirects="${APP_PUBLIC_URL},${APP_PUBLIC_URL}/**,io.goldroundtables.app://login-callback"
  local body
  body="$(jq -n --arg site "$APP_PUBLIC_URL" --arg redirects "$redirects" '{
      site_url: $site, uri_allow_list: $redirects,
      jwt_exp: 3600,
      refresh_token_rotation_enabled: true, security_refresh_token_reuse_interval: 10,
      external_email_enabled: false
    }')"
  if $dry_run; then
    ok "would PATCH $url with: $(jq -c . <<<"$body")"
    return
  fi
  [[ -n "$token" ]] || fail "The auth step needs SUPABASE_ACCESS_TOKEN in the environment."
  # The token goes through curl's stdin config so it never appears in the process list.
  api() { printf 'header = "Authorization: Bearer %s"\n' "$token" | curl -fsS -K - -H 'Content-Type: application/json' "$@"; }
  api -X PATCH "$url" -d "$body" >/dev/null || fail "PATCH of the Auth config failed (token without access to the project?)."
  local current key mismatch=false
  current="$(api "$url")" || fail "Could not read the Auth config back."
  for key in site_url uri_allow_list jwt_exp refresh_token_rotation_enabled security_refresh_token_reuse_interval external_email_enabled; do
    if [[ "$(jq -c --arg k "$key" '.[$k]' <<<"$current")" != "$(jq -c --arg k "$key" '.[$k]' <<<"$body")" ]]; then
      warn "Auth setting $key differs from the requested value: $(jq -c --arg k "$key" '.[$k]' <<<"$current")"
      mismatch=true
    fi
  done
  if $mismatch; then
    warn "Check Authentication in the dashboard (the checklist below lists every setting)."
  else
    ok "Auth settings applied and verified"
  fi
  warn "Time-box and inactivity timeout are not set here: confirm they are disabled (or >= 30 / >= 8 days) in the dashboard."
}

print_checklist() {
  local app="${APP_PUBLIC_URL:-<APP_PUBLIC_URL>}"
  cat <<CHECKLIST

────────────────────────────────────────────────────────────────────────────
Manual steps this script cannot do (dashboard: https://supabase.com/dashboard/project/${SUPABASE_PROJECT_REF})
────────────────────────────────────────────────────────────────────────────
Authentication → URL Configuration
  [ ] Site URL: ${app}
  [ ] Redirect URLs: ${app}, ${app}/**, io.goldroundtables.app://login-callback
Authentication → Providers (callback URL shown there: ${SUPABASE_URL}/auth/v1/callback)
  [ ] Google, Apple and Facebook enabled with their client ids / secrets (Apple secret expires in <= 6 months)
  [ ] Email: "Allow new users to sign up" off (no email sign-in in production)
Authentication → Sessions / Settings (docs/implementation/offline-window.md, "Required production Supabase settings")
  [ ] JWT expiry 3600 s (do not raise it)
  [ ] Refresh token rotation on, reuse interval >= 10 s
  [ ] Time-box disabled or >= 30 days
  [ ] Inactivity timeout disabled or >= 8 days (Pro plan)
  [ ] "Single session per user" off
Project settings
  [ ] Daily backups verified; PITR on a paid plan (docs/operations.md §2)
Next (docs/deployment.md): PowerSync replication + service, web build and hosting, smoke test.
CHECKLIST
}

# ── Run ──────────────────────────────────────────────────────────────────────────────────────
validate_settings
if $dry_run; then info "Dry run: nothing on project $SUPABASE_PROJECT_REF is changed"; fi
# A dry run still needs the link (db push --dry-run reads the remote migration history).
if wants link || { $dry_run && wants db; }; then step_link; fi
for step in db functions secrets vault verify admin auth; do
  if wants "$step"; then "step_$step"; fi
done
print_checklist
if $dry_run; then ok "Dry run finished. Re-run without --dry-run to apply."; fi
