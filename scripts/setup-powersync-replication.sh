#!/usr/bin/env bash
# Creates (or refreshes) the PowerSync replication role and checks the `powersync` publication.
# Idempotent; never resets or drops data.
#
#   bash scripts/setup-powersync-replication.sh                 # RUNNING local Supabase (docker)
#   bash scripts/setup-powersync-replication.sh --hosted        # hosted project (deploy/hosted.env)
#   bash scripts/setup-powersync-replication.sh --hosted --env-file FILE
#
# Local environment (optional, see .env.example): POWERSYNC_DB_PASSWORD, SUPABASE_DB_CONTAINER.
# Hosted: POWERSYNC_DB_PASSWORD (required, no default) and SUPABASE_PROJECT_REF in
# deploy/hosted.env; SQL runs through the linked project (SUPABASE_ACCESS_TOKEN / `supabase login`)
# or SUPABASE_DB_URL. Run the migrations first (scripts/deploy-hosted.sh): they create the
# publication.
set -euo pipefail
here="$(cd "$(dirname "$0")" && pwd)"
# shellcheck source=scripts/lib/hosted.sh
source "$here/lib/hosted.sh"

hosted=false
while (($#)); do
  case "$1" in
    --hosted) hosted=true ;;
    --env-file) hosted_env_file="${2:?--env-file needs a path}"; shift ;;
    -h|--help) sed -n '2,/^set -euo/p' "$0" | sed '$d' | sed 's/^# \{0,1\}//'; exit 0 ;;
    *) fail "Unknown option: $1 (see --help)" ;;
  esac
  shift
done

if $hosted; then
  load_hosted_env
  require_var POWERSYNC_DB_PASSWORD "generate with: openssl rand -hex 24"
else
  load_env
fi

password="${POWERSYNC_DB_PASSWORD:?POWERSYNC_DB_PASSWORD is not set}"
if [[ ! "$password" =~ ^[A-Za-z0-9_.-]+$ ]]; then
  fail "POWERSYNC_DB_PASSWORD may only contain letters, digits, '_', '.' and '-'."
fi
if $hosted && [[ "$password" == powersync_local_dev ]]; then
  fail "POWERSYNC_DB_PASSWORD is the local development default; set a real one."
fi

replication_sql() {
  cat <<SQL
do \$\$
begin
  if not exists (select 1 from pg_roles where rolname = 'powersync_role') then
    create role powersync_role with replication bypassrls login password '${password}';
  else
    alter role powersync_role with replication bypassrls login password '${password}';
  end if;
  -- Inside the block: \`supabase db query --db-url\` runs a single statement per file.
  grant usage on schema public to powersync_role;
  grant select on all tables in schema public to powersync_role;
  alter default privileges in schema public grant select on tables to powersync_role;
end
\$\$;
SQL
}

if $hosted; then
  require_cmd supabase
  require_cmd jq
  if [[ -z "${SUPABASE_DB_URL:-}" ]]; then hosted_ensure_link; fi
  hosted_tmpdir
  info "Configuring replication role powersync_role on project $SUPABASE_PROJECT_REF"
  replication_sql >"$HOSTED_TMP/replication.sql"
  hosted_sql_file "$HOSTED_TMP/replication.sql" >/dev/null || fail "Could not create the replication role on the hosted database."
  echo "select count(*) as publication_tables from pg_publication_tables where pubname = 'powersync';" >"$HOSTED_TMP/publication.sql"
  count_output="$(hosted_sql_file "$HOSTED_TMP/publication.sql")" || fail "Could not read the publication."
  # The CLI prints JSON ({"rows": [...]}, plus a boundary token with digits); read the row itself.
  publication_tables="$(jq -r '.rows[0].publication_tables // empty' <<<"$count_output" 2>/dev/null || true)"
  if [[ -z "$publication_tables" || "$publication_tables" -lt 1 ]]; then
    fail "Publication 'powersync' is missing or empty. Apply the migrations first: bash scripts/deploy-hosted.sh --only link,db"
  fi
  ok "Replication role ready; publication 'powersync' has ${publication_tables} tables."
  cat <<INFO

PowerSync connection (PowerSync Cloud → instance → Database connections; or PS_DATA_SOURCE_URI when self-hosting):
  Host      db.${SUPABASE_PROJECT_REF}.supabase.co   (direct connection, port 5432, database postgres)
  Username  powersync_role
  Password  <POWERSYNC_DB_PASSWORD from ${hosted_env_file#"$repo_root"/}>
  SSL mode  verify-full (Supabase CA) or require
  JWKS URI  ${SUPABASE_URL}/auth/v1/.well-known/jwks.json   (audience: authenticated)
Logical replication does not work through the transaction pooler. The direct host is IPv6-only unless
the project has the IPv4 add-on; see docs/deployment.md.
INFO
  exit 0
fi

require_cmd docker
require_supabase_running

info "Configuring replication role powersync_role on $(supabase_db_container)"
replication_sql | docker exec -i "$(supabase_db_container)" psql -U postgres -d postgres -v ON_ERROR_STOP=1 -q

publication_tables=$(docker exec "$(supabase_db_container)" psql -U postgres -d postgres -tA \
  -c "select count(*) from pg_publication_tables where pubname = 'powersync'")
if [[ "$publication_tables" -lt 1 ]]; then
  fail "Publication 'powersync' is missing or empty. Apply the migrations first: 'supabase db reset' (never run it on a shared stack by accident) or 'supabase migration up'."
fi
ok "Replication role ready; publication 'powersync' has ${publication_tables} tables."
