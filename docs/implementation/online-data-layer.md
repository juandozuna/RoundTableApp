# Online data layer (PowerSync removed)

The app talks to Supabase directly while online. There is no local replica:
reads are PostgREST calls under RLS, writes go to the `sync-upload` Edge
Function immediately, and offline is an error. Domain contracts keep their
stream shape so a local outbox can come back without touching use cases or
Cubits.

## Reading

```
Cubit → use case → domain service contract (Stream<Model>)
  → data service impl
    → remote data source → TableReadsClient (Retrofit → PostgREST)
```

1. **Fetch records.** `TableReadsClient` (`lib/core/network/postgrest/`) has one
   GET per table and returns `<Entity>Record` models
   (`lib/core/data/records/`). Build the query with `PostgrestQuery.of(...)`,
   `PostgrestFilter` and the `PostgrestTables` / `PostgrestColumns` constants;
   never hand-build filter strings.
2. **Always filter.** RLS is broader than the old sync scopes (coordinators and
   administrators read whole organizations), so every call filters by the
   table, person or organization it means. Session-domain reads add
   `archived_at=is.null`. PostgREST caps a response at the project's max rows;
   page with `limit`/`offset` where a list can grow.
3. **Map records to domain models** in the data layer (focused `toModel()`
   extensions). Records are data-layer types: they never appear in a domain
   contract.
4. **Wrap in `RemoteWatch`** (`lib/core/data/remote_watch.dart`) to produce the
   `Stream<T>` the contract promises:

   ```dart
   Stream<List<SessionSummary>> watchSessions(String tableId) => _watch(
     () => _remote.fetchSessions(tableId).then((rows) => rows.map(_toModel).toList()),
     scopes: {DataScope.session},
     pollInterval: const Duration(seconds: 5), // live screens only
   );
   ```

   `RemoteWatch` emits on first listen, refetches on `DataChangeSignal` (for the
   given scopes) and on the poll interval, pauses polling while the app is in
   the background, skips results equal to the previous one, reports a failed
   fetch as a stream error while it keeps watching, and cancels its timer when
   the listener cancels. Every active watch also refetches when the app returns
   to the foreground and when the connection comes back; screens without a
   `pollInterval` need no tap to recover.

Polling is the only way other people's changes arrive (no Realtime). Pick the
interval by how live the screen is:

| Screens | `pollInterval` |
|---|---|
| Running session, facilitator board | 5 s (`LiveSessionServiceImpl.pollInterval`) |
| Home (all roles), calendar, history | 30 s (`slowPollInterval` in `remote_watch.dart`) |
| Content languages, admin lists, other screens | none |

Besides the poll, every screen refetches on the app's own writes
(`DataChangeSignal`), when the app returns to the foreground and when the
connection returns. Polling pauses while the app is in the background.

### Table notes

- `table_members.first_name`, `last_name` and `auth_user_id` are real columns,
  denormalized from `people` by trigger (migration `20261025100300`), so the
  roster needs no embedded select. `auth_user_id` is not mapped in
  `TableMemberRecord`; add it if a feature needs it.
- Records carry the columns the PowerSync schema replicated. Extra columns of a
  `select=*` response are ignored; add fields to a record when a feature needs
  them. Narrow `select` only while every required field stays selected.
- Enums with a shared type in `lib/core/models` are typed on the records
  (session status/stage, attendance, assessment kind, follow-up status, role).
  Other statuses (`active`/`inactive`, table status, `kind`, `source`,
  `completion`) stay `String` until a shared enum exists.

## Writing

1. Build the same UUID-keyed operation batch as before (client-generated ids;
   uploads are idempotent by UUID) and send it with the session remote data
   source (`SessionRemoteDataSource.uploadBatch` → `sync-upload` Edge
   Function) right away.
2. On success, `DataChangeSignal.notify(scope)` for every scope the write
   touched, so live watches refetch immediately instead of waiting for the next
   poll. Notify after the server accepted the batch, not before.
3. A rejected operation (`SyncRejection`) maps to a domain failure for the
   Cubit, as before. A network failure also maps to a failure; nothing is queued.

## Offline

- `ConnectivitySyncStatusService` (`lib/core/sync/data/`) implements
  `SyncStatusService`: `connected`/`offline` from `ConnectivityService`,
  `pendingCount` always 0. The sync indicator, sign-out guard and unsynced
  alert keep compiling and show nothing pending.
- Reads fail with a stream error while offline. They recover by themselves on
  the next signal, poll tick (5 s live session, 30 s home/calendar/history),
  return to the foreground or reconnect. Screens that already show content
  keep it on such an error; only a first load that fails shows the error.
- Writes while offline fail with the offline error; the UI shows it and the
  person retries. Nothing is stored for later.

## Where a future offline outbox plugs in

- **Reads:** a Drift local data source (never the network) behind the same
  service implementation: emit local rows immediately, refresh them from
  `TableReadsClient` through `RemoteWatch`-style refetches, and expose the
  merged result through the unchanged `Stream<Model>` contract.
- **Writes:** an outbox table (Drift/SQLite) in the service implementation:
  write the row locally first, enqueue the op batch, and upload the queue
  through the same `uploadBatch` call, calling `DataChangeSignal.notify` after
  each accepted batch. Idempotency by UUID already makes retries safe.
- **Status:** replace `ConnectivitySyncStatusService` with an implementation
  that reports the outbox size and oldest pending time through the existing
  `SyncSnapshot` (`pendingCount`, `pendingSince`, `hasStalePending`).
- Cubits, use cases and domain contracts do not change.
