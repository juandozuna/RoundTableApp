# PowerSync — Gold Roundtables

PowerSync replicates the session domain into each device's SQLite database (ADR 0003/0004).
[`sync-rules.yaml`](sync-rules.yaml) defines what each user downloads, as **Sync Streams**
(`config.edition: 3`; the older `bucket_definitions` format is deprecated). It is part of the
security perimeter and mirrors the RLS policies in
[`supabase/migrations/20261025100400_rls.sql`](../supabase/migrations/20261025100400_rls.sql).

Requirements: PowerSync Service **≥ 1.20**, Flutter `powersync` SDK **≥ 1.16** (Sync Streams).
All streams use `auto_subscribe: true`, so the client needs no subscription code.

## What each user downloads

| Stream | Who | Rows |
|---|---|---|
| `curriculum` | everyone | `curriculum_modules`, `curriculum_values`, `value_questions` |
| `my_identity` | signed-in user | own `people` rows (one per organization), own `table_members` rows (history) |
| `my_rows` | signed-in user | own `role_assignments`, `member_assessments`, `member_answers`, `member_commitments`, `session_attendance` (incl. last week's commitment for the follow-up) |
| `table_shared` | active participant of a table (facilitator or member) | the `round_tables` row, its roster (`table_members`, names only — no contact data, no auth ids), `sessions`, `session_attendance`, the `organizations` row and its `locations` |
| `table_facilitator` | active facilitator of a table | every participant's `member_assessments`, `member_answers`, `member_commitments` of that table |

Not synced (online-only, ADR 0003): invites, audit log, KPIs, administration lists, other people's
contact data, anything of other organizations. Coordinators and platform admins get offline data
only for tables they personally belong to.

Window: session-domain rows carry `archived_at`; `app.archive_old_session_data()` (pg_cron, daily)
sets it 8 weeks after a session closed, except for each table's latest closed session. Archived
rows leave the device; history remains online. This comfortably covers the 7-day offline window
(ADR 0005).

Types on the device: uuid/text/enums/time/date/timestamptz → `TEXT` (timestamps as ISO-8601),
smallint/integer → `INTEGER`, boolean → `INTEGER` (0/1), jsonb → `TEXT`.

## Uploads

PowerSync's `uploadData` sends the CRUD queue to the `sync-upload` Edge Function, never straight to
Postgres. See [api-contract.md § sync-upload](../docs/implementation/api-contract.md#sync-upload).

## Validating the rules

```bash
supabase start && supabase db reset     # seeded local database
bash powersync/tools/validate.sh
```

`validate.sh` snapshots the published schema and rows, then
[`tools/simulate-buckets.mjs`](tools/simulate-buckets.mjs):

1. compiles `sync-rules.yaml` with PowerSync's own compiler
   (`@powersync/service-sync-rules`) against the live column types — unknown columns,
   unsupported operators and unsafe queries fail here;
2. replays every row through the rules, resolves the streams of seeded users (member, facilitator,
   coordinator, another organization's coordinator, platform admin, unknown user) and asserts what
   each device would download (e.g. a member receives only their own answers; nothing crosses
   organizations).

The library needs Node ≥ 24; on older hosts the script runs it in the `node:24-alpine` image.
Re-run it whenever the rules or the schema change.

## Connecting the PowerSync service (local stack)

The Docker phase owns the service container; it needs:

1. **Publication** — created by migration: `powersync` (the 14 tables used by the rules).
2. **Replication role** (password from the environment, never committed):

   ```sql
   create role powersync_role with replication bypassrls login password '<POWERSYNC_DB_PASSWORD>';
   grant select on all tables in schema public to powersync_role;
   alter default privileges in schema public grant select on tables to powersync_role;
   ```

   Connection: `postgresql://powersync_role:<password>@<db-host>:5432/postgres` (from another
   container the Supabase CLI database is `host.docker.internal:54322`, or `supabase_db_gold-roundtables:5432`
   on the `supabase_network_gold-roundtables` network).
3. **Client auth** — the local Supabase Auth signs user tokens with **ES256** and publishes the key at
   `http://127.0.0.1:54321/auth/v1/.well-known/jwks.json` (from a container:
   `http://host.docker.internal:54321/auth/v1/.well-known/jwks.json`). Configure the service with
   that `jwks_uri` and audience `authenticated`. (The legacy HS256 `JWT_SECRET` from
   `supabase status` only signs the anon/service keys, not user sessions.)
4. **Sync config** — mount `powersync/sync-rules.yaml` as the service's sync config.

The client's `fetchCredentials` returns `{ endpoint: POWERSYNC_URL, token: <Supabase access token> }`.
