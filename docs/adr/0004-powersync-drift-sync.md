# 0004 — PowerSync + Drift for local persistence and sync

**Status: superseded by [0019](0019-online-only-supabase-data-layer.md).** PowerSync and Drift were
removed; the app is online only. Kept for history and as the starting point of the future offline
design.

## Context
The session domain is offline-first (ADR 0003). The client architecture mandates Drift for
reactive relational persistence. Building and hardening a custom sync protocol is a large risk for
one part-time developer.

## Decision
PowerSync replicates the Postgres rows each user may see (sync rules scoped by organization, table
and role) into a local SQLite database. Drift is the typed query and watch layer on top of that
database (drift_sqlite_async). This runs on mobile and on web (SQLite WASM), so there is one code
path; the web is online-only by policy, not by separate code.

Uploads: PowerSync's `uploadData` hands queued CRUD operations to the data service implementation,
which sends them through a Retrofit client to the `sync-upload` Edge Function (ADR 0008).

## Documented exception to the client architecture (AGENTS.md, rules 8–9)
- PowerSync's upload queue replaces the hand-written `isSynced` column. "Pending" status comes
  from PowerSync's queue and sync status, exposed through domain service contracts.
- PowerSync's download stream replaces "request server copy and merge". It does not overwrite
  local changes that are still waiting to upload.
- Device-generated UUIDs remain mandatory (PowerSync requires text UUID ids).

## Alternatives considered
- Drift + hand-written sync against Edge Function push/pull endpoints: no PowerSync bill, but
  outbox, deltas, tombstones and checkpoints all have to be written and tested.
- Firestore offline persistence: tied to the Firebase backend that was rejected in ADR 0002.

## Consequences
- PowerSync Cloud costs: Free tier for development (deactivated after 1 week of inactivity,
  50 peak concurrent connections); Pro from US$49/month for production.
- Sync rules become part of the security perimeter and need tests next to the RLS policies.
