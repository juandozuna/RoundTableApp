# 0019 — Online-only data layer on Supabase (PowerSync and Drift removed)

Supersedes [0004](0004-powersync-drift-sync.md). Amends [0003](0003-offline-scope.md).

## Context
PowerSync + Drift (ADR 0004) added a replication service, a replication role, sync rules that
duplicate the RLS policies, a SQLite WASM worker on the web and a second copy of the schema on the
client. For the first release the owner decided to ship against Supabase directly and bring offline
capture back later as a smaller, own design. Operating PowerSync (Cloud or self-hosted) was the
largest piece of infrastructure outside Supabase for a one-person team.

## Decision
- **The app is online only.** There is no local database and no PowerSync. `powersync/`,
  `docker/powersync`, the replication role `powersync_role`, the `powersync` publication and the
  web worker are deleted (migration `20261101000000_drop_powersync.sql` drops the role and the
  publication, also on the hosted project).
- **Reads** go to PostgREST through Retrofit (ADR 0008) under the user's JWT; RLS is the only
  access control. The sync rules no longer exist, so there is no second perimeter to test.
- **Live screens poll** about every 5 seconds while visible and refetch right after the user's own
  writes. Supabase Realtime is not used.
- **Writes** keep the UUID-keyed operation batches and are sent immediately to the `sync-upload`
  Edge Function (ADR 0008). The function and its server-side `synced_late` logic (ADR 0005) are
  unchanged. Idempotency by UUID is kept, so a retry is always safe.
- **Offline is an explicit state, not a queue.** When there is no connection the app shows the
  offline state, refuses session writes with a plain message ("sin conexión"), keeps what the user
  typed in the form and writes nothing to disk. Nothing is silently queued. After reconnecting the
  user repeats the action and it succeeds.
- **Amends ADR 0003:** the session domain is *temporarily* online like administration, invites and
  KPI dashboards. The product requirement (members may lack signal during a session) still stands;
  it is deferred, not dropped. Documented layering stays: Cubit → use case → domain service
  contract → data service → remote data source → Retrofit client. The local data source slot in
  AGENTS.md §1/§9 is empty for now.

## Future offline outbox (design, not built)
When offline capture returns it is built on the seams this ADR keeps, without replication:
- **Drift tables** mirroring the records in `lib/core/data/records` (one table per record type)
  on mobile and web (SQLite), read by the local data source and exposed through the same domain
  contracts, so Cubits and use cases do not change.
- **An outbox table** of operation batches (the exact payload `sync-upload` takes: op, table, UUID,
  data), written in the same transaction as the local row change.
- **Replay** of pending batches to `sync-upload`, oldest first, when connectivity returns. The
  server applies each op idempotently by UUID, answers per-op results, and keeps flagging late
  answers `synced_late` and marking a submitting member present (ADR 0005).
- **Incremental pull** through PostgREST by `updated_at` (with a per-table cursor and tombstones
  where deletes exist), replacing the full refetch. A pull never overwrites rows that still have a
  pending outbox batch.
- The offline-window rules of `docs/implementation/offline-window.md` apply again at that point.

## Alternatives considered
- Keep PowerSync: works, but the operating cost and the duplicated security rules are the reason
  for this ADR.
- Supabase Realtime for live screens: another moving part (channel RLS, reconnects); a 5-second
  poll is enough for a weekly session with at most nine people per table.
- Queue writes silently while offline: hides data loss risk (nothing guarantees the queue is
  delivered) and conflicts with the idempotent, auditable design of the future outbox.

## Consequences
- No PowerSync bill, no replication role, no web worker or WASM assets; the web build is smaller.
- A member without signal cannot capture a session until the outbox exists. Facilitators should
  confirm connectivity before the session starts.
- More requests than a replicated database (polling); acceptable at this scale, watch Supabase
  usage after launch.
- Hosted databases that ran PowerSync need the new migration applied; if `postgres` is not allowed
  to drop the role the migration warns and the role is dropped by hand
  (`drop owned by powersync_role; drop role powersync_role;`). The PowerSync Cloud instance, if
  one was created, is deleted from its dashboard.
