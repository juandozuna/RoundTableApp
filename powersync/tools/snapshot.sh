#!/usr/bin/env bash
# Dumps the published schema and rows of the local Supabase database for the sync-rules tools.
set -euo pipefail
here="$(cd "$(dirname "$0")" && pwd)"
out="$here/.snapshot"
container="${DB_CONTAINER:-supabase_db_gold-roundtables}"
mkdir -p "$out"
q() { docker exec -i "$container" psql -U postgres -At -v ON_ERROR_STOP=1 -c "$1"; }

q "select coalesce(json_agg(json_build_object('table', c.table_name, 'name', c.column_name,
     'type', c.data_type) order by c.table_name, c.ordinal_position), '[]')
   from information_schema.columns c
   join pg_publication_tables p on p.schemaname = c.table_schema and p.tablename = c.table_name
   where p.pubname = 'powersync'" > "$out/schema.json"

for table in $(q "select tablename from pg_publication_tables where pubname = 'powersync' order by 1"); do
  q "select coalesce(json_agg(t), '[]') from public.$table t" > "$out/$table.json"
done
q "select coalesce(json_agg(json_build_object('email', email, 'id', id)), '[]') from auth.users" > "$out/_users.json"
echo "snapshot written to $out"
