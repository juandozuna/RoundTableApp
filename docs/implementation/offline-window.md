# Offline window and sync window (issue #10, audit G-10/G-11)

> **Suspended (ADR 0019).** The app is online only for now: there is no local database, no
> PowerSync and no sync window, so none of the guarantees below are active. The Supabase Auth
> settings still apply. This document is the starting point for the future offline outbox (Drift +
> own queue replayed to `sync-upload`); statements about PowerSync, `ps_crud` and
> the former sync rules describe the removed implementation and must be redesigned then.

Two different windows exist; do not confuse them.

| Window | Value | What it limits | Enforced by |
|---|---|---|---|
| **Offline window** (ADR 0005) | 7 days | How long a device may work without the server confirming its sign-in | `AppLimits.offlineWindow`, `OfflineWindow`, `AccessSessionServiceImpl` |
| **Sync window** | 56 days (8 weeks) | How old a closed session may be before it leaves the device | `app.archive_old_session_data` + `archived_at IS NULL` in the former PowerSync sync rules |
| **Unsynced warning** (ADR 0009) | 24 h | When waiting local changes raise a warning | `AppLimits.unsyncedWarningAfter`, `UnsyncedChangesPolicy` |

## Offline window guarantees (7 days)

1. A device that signed in online keeps working offline for **7 days** after the last time the
   server confirmed the session. Reading, capturing attendance/scores/answers and queuing
   changes all work from the local database (ADR 0003/0004); nothing needs a valid JWT locally.
2. "Confirmed" means: a sign-in or a successful Supabase token refresh (`SessionVerificationSource`),
   or a successful account load (`AccessSessionService`). The instant is stored per user in
   `shared_preferences` (`auth.verified.<userId>`) so it survives restarts.
3. Cached identity: while offline and within the window, the app starts from the cached account
   and last chosen context (`AccessState.fromCache == true`).
4. **Beyond 7 days without a confirmation** and with the server unreachable, the app shows
   `AccessStatus.needsOnlineSignIn` (`/acceso`: "Conéctate para volver a entrar"). Local data is
   **not deleted** and pending changes stay queued; "Reintentar" re-checks and the block lifts as
   soon as the account loads (or a token refresh succeeds). Signing out keeps local data too
   (`SyncLifecycle`).
5. A device with no recorded confirmation (installed before this feature) starts its window the
   first time it is found offline; it is never locked out retroactively.
6. The check runs when the access state is (re)loaded: app start, sign-in events, and "Reintentar".
   An app left open and offline for more than 7 days is not interrupted mid-use; it is
   re-checked on the next load. (Gap: no timer-driven re-check.)

### What happens to credentials offline

- **Supabase session**: `supabase_flutter` persists the session. With the access token (JWT)
  expired and no network, the refresh fails with a retryable error; the session is kept, so
  `AuthStatus` stays `authenticated` and sync is not torn down. The SDK retries the refresh when
  connectivity returns.
- **PowerSync**: `SupabasePowerSyncConnector.fetchCredentials` hands over the current JWT only
  when PowerSync (re)connects. Offline there is no connection, so an expired JWT is irrelevant;
  writes go to `ps_crud` and are not lost. On reconnect, an expired/rejected token triggers
  `invalidateCredentials`, which refreshes the Supabase session; `uploadData` then drains the queue
  through the `sync-upload` Edge Function (idempotent by UUID, ADR 0005). A refresh token that was
  revoked or expired server-side ends in sign-out with local data kept.
- **Edge Functions / PostgREST** (online-only features) need a valid JWT; Dio refreshes on 401.

### Required production Supabase settings (Auth)

| Setting | Required | Why |
|---|---|---|
| JWT expiry (`jwt_expiry`) | 3600 s (default). Do **not** raise it to cover the offline window | Offline work does not depend on JWT lifetime; a short JWT keeps revocation effective. Max is 604800 s but is not needed |
| Refresh token rotation (`enable_refresh_token_rotation`) | `true` | Standard hardening |
| Refresh token reuse interval (`refresh_token_reuse_interval`) | ≥ 10 s (default 10) | A client that refreshes then loses the response (flaky network) can retry without being logged out |
| Session time-box (`timebox`) | **Disabled**, or ≥ 30 days | A shorter time-box forces re-login server-side and can break a returning offline device |
| Inactivity timeout (`inactivity_timeout`, Pro plan) | **Disabled**, or ≥ 8 days | Must exceed the 7-day offline window |
| Single session per user | Off | A second device must not invalidate the first |

Local dev (`supabase/config.toml`) already has `jwt_expiry = 3600`, rotation on, reuse interval 10,
time-box/inactivity unset. Re-check these in the hosted dashboard (Authentication → Sessions /
Settings) before launch.

### Tests

- `test/features/auth/data/access_session_service_test.dart` (`offline window`): day 7 still
  works, 7 days + 1 minute needs online sign-in, refresh restarts the window, coming online
  lifts the block, unrecorded device starts counting. Time comes from the `ClockService`
  abstraction (fake clock), never `DateTime.now`.
- `test/core/sync/domain/unsynced_changes_policy_test.dart`: 23 h 59 min → no warning, 24 h →
  warning, nothing pending → no warning; boundary of `OfflineWindow`.
- (removed with PowerSync) `test/core/sync/powersync_sync_database_test.dart`: end-to-end `hasStalePending` from the
  persisted `pendingSince`.
- Not covered: a real device with an expired JWT writing offline and syncing later in the
  browser (`tool/e2e/scenarios/offline.mjs`); to be exercised during manual E2E.

## Unsynced-changes warning (24 h)

Already existed; verified and now unit-tested. `PendingSinceTracker` persists when the upload
queue first became non-empty (survives restarts), `PowerSyncSyncStatusService` re-evaluates every
5 minutes using `ClockService` and `UnsyncedChangesPolicy`, and the `hasStalePending` flag feeds
the home, settings, member sync block, facilitator board and the unsynced notification.

## Sync window (56 days) — decision

**Decision: keep 56 days; do not sync archived rows.** It bounds device storage and the
`sessions`/answers download on low-end phones, and the 7-day offline requirement only needs
recent data. The latest closed session of each table is never archived (its commitments feed the
next follow-up).

- On the device (offline): sessions, attendance, scores, answers and commitments whose session
  closed more than 56 days ago, and were archived by the daily job, disappear after the next sync.
  Unsynced local changes are never dropped by this (conflict protection, AGENTS §8).
- Online: nothing is deleted on the server (`archived_at` only). Coordinator/admin KPI and
  history screens read the server online and still show full history. Member/facilitator
  per-session history older than 56 days is not available in the app today (G-02 covers history
  views reading `kpi_*` online).
- UI wording: the app makes no claim on-device about older history and shows no "archived"
  state. If a history screen for members is added, it must read online and say "Se muestra el
  historial reciente guardado en este teléfono" for offline lists. No UI text was added for this
  decision.
- Changing the window means changing both `app.archive_old_session_data(p_window)` and
  `AppLimits.sessionSyncWindow` (documentation constant), plus the header of
  the former PowerSync sync rules.
