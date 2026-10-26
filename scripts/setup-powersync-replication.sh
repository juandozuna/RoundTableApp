#!/usr/bin/env bash
# Creates (or refreshes) the PowerSync replication role on the RUNNING Supabase local database and
# checks the `powersync` publication. Idempotent; never resets or drops data.
#
#   bash scripts/setup-powersync-replication.sh
#
# Environment (optional, see .env.example): POWERSYNC_DB_PASSWORD, SUPABASE_DB_CONTAINER.
set -euo pipefail
here="$(cd "$(dirname "$0")" && pwd)"
# shellcheck source=scripts/lib/common.sh
source "$here/lib/common.sh"

load_env
require_cmd docker
require_supabase_running

password="${POWERSYNC_DB_PASSWORD:?POWERSYNC_DB_PASSWORD is not set}"
if [[ ! "$password" =~ ^[A-Za-z0-9_.-]+$ ]]; then
  fail "POWERSYNC_DB_PASSWORD may only contain letters, digits, '_', '.' and '-'."
fi

info "Configuring replication role powersync_role on $(supabase_db_container)"
docker exec -i "$(supabase_db_container)" psql -U postgres -d postgres -v ON_ERROR_STOP=1 -q <<SQL
do \$\$
begin
  if not exists (select 1 from pg_roles where rolname = 'powersync_role') then
    create role powersync_role with replication bypassrls login password '${password}';
  else
    alter role powersync_role with replication bypassrls login password '${password}';
  end if;
end
\$\$;
grant usage on schema public to powersync_role;
grant select on all tables in schema public to powersync_role;
alter default privileges in schema public grant select on tables to powersync_role;
SQL

publication_tables=$(docker exec "$(supabase_db_container)" psql -U postgres -d postgres -tA \
  -c "select count(*) from pg_publication_tables where pubname = 'powersync'")
if [[ "$publication_tables" -lt 1 ]]; then
  fail "Publication 'powersync' is missing or empty. Apply the migrations first: 'supabase db reset' (never run it on a shared stack by accident) or 'supabase migration up'."
fi
ok "Replication role ready; publication 'powersync' has ${publication_tables} tables."
