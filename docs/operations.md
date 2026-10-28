# Operations — Gold Roundtables

Backups, monitoring, incident response and releases for a hosted deployment (Supabase project +
PowerSync Service + web host + FCM). Covers RNF-21, RNF-23 and RNF-25. Setup of the services
themselves is in the README ("Deploying"); decisions are in [docs/adr](adr/README.md).

## 1. Error reporting in the app

The client reports unexpected errors through the `ErrorReporter` contract
(`lib/core/services/error_reporting/`). `FlutterError.onError`, `PlatformDispatcher.onError` and the
Bloc observer all feed it.

- Every error becomes one structured JSON log line (scope `error_report`; visible in `adb logcat`,
  the browser console, or any log collector attached to the host).
- The report holds: source, exception type, scrubbed/truncated message, first 25 stack frames, app
  version, environment, platform, active role and the route **without** ids or query string.
  Emails, UUIDs, phone-like numbers and JWTs are redacted from messages. No names, answers,
  commitments or contact data are ever included.
- Identical errors repeat at most once per minute and at most 30 reports per minute leave a device.
- Optional HTTP sink: build with `--dart-define=ERROR_REPORT_URL=https://…`. The report is POSTed
  as JSON (Sentry-event shaped, so a Sentry-compatible relay works). The sink uses its own HTTP
  client: the Supabase session token is never sent. Delivery failures are swallowed. Unset means
  log only.

## 2. Backups and restore

Data lives in two places: the Supabase Postgres (source of truth) and PowerSync's own storage
Postgres (derived; rebuildable). Device SQLite databases are derived too, except for changes not
yet uploaded (see "Sync stuck").

### 2.1 What is backed up

| Asset | Backup | Retention |
|---|---|---|
| Supabase Postgres | Supabase daily backups; **PITR** on paid plans (enable it for production) | per plan; keep ≥ 7 days PITR |
| Logical dump (off-platform copy) | weekly `pg_dump` (below) stored encrypted in separate object storage | 8 weeks |
| Edge Function code, migrations, sync rules | Git (`main`) | forever |
| Secrets (`CRON_SECRET`, `FCM_SERVICE_ACCOUNT_JSON`, `APP_PUBLIC_URL`, …) | password manager entry, not Git | current + previous |
| Auth providers (Google/Apple/Facebook client ids and keys) | password manager | current |
| PowerSync storage | **not backed up**; rebuilt from Postgres | — |

### 2.2 Logical dump (also the self-hosting path)

```bash
# Connection string: Supabase dashboard → Database → Connection string (direct, not pooled).
pg_dump "$SUPABASE_DB_URL" --format=custom --no-owner --no-privileges \
  --schema=public --schema=app --schema=kpi --schema=api \
  --file="gold-roundtables-$(date +%F).dump"
# Auth users (needed so ids in role_assignments/people keep their meaning):
pg_dump "$SUPABASE_DB_URL" --format=custom --no-owner --schema=auth \
  --file="gold-roundtables-auth-$(date +%F).dump"
```

Encrypt the files (`age`/`gpg`) before uploading; they contain personal data.

### 2.3 Restore drill (do it quarterly and before the first go-live)

Goal: prove a backup restores into a working system and measure the time. Use a scratch project,
never production.

1. Create a scratch Supabase project (or `supabase start` locally). Note the start time.
2. Restore the platform backup (dashboard → Database → Backups → restore, or PITR to a timestamp)
   **or** the dump: apply the migrations first (`supabase db push`), then
   `pg_restore --no-owner --data-only --disable-triggers -d "$SCRATCH_DB_URL" <dump>`.
3. Verify (all must hold):
   - `select count(*)` of `organizations`, `round_tables`, `sessions`, `member_assessments` match
     the source within the backup window.
   - `select jobname, schedule, active from cron.job order by 1;` lists the `gr-*` jobs
     (re-run the cron block of the migrations if not).
   - `select kpi.refresh_if_dirty();` then `select public.refresh_kpis();` succeed and dashboards
     match the source.
   - Sign in with a test account of each role; a facilitator opens a table and a session.
4. Rebuild PowerSync (2.4) against the scratch database and sync a device.
5. Record: date, backup used, start→usable duration, problems. Target: usable in under 2 hours.
   Add the record at the bottom of this file ("Drill log").

### 2.4 PowerSync storage rebuild

PowerSync storage only holds derived buckets. After a restore, a Postgres major upgrade, a changed
`sync-rules.yaml` that cannot hot-reload, or a lost replication slot:

1. Make sure the replication role and `powersync` publication exist:
   `bash scripts/setup-powersync-replication.sh` (idempotent; hosted: run its SQL against the
   direct connection).
2. Stop the PowerSync service, drop its storage (new empty database/volume), redeploy
   `powersync/sync-rules.yaml`, start it. It re-snapshots from Postgres.
3. Wait for the initial replication to finish (service logs: replication caught up).
4. Clients reconnect and re-download; pending local uploads are kept and go through
   `sync-upload` as usual.
5. Check with `node scripts/powersync-sync-check.mjs` (local) or by signing in on a device.

### 2.5 Disaster summary

| Scenario | Action |
|---|---|
| Bad migration / wrong data change | PITR to just before it, into a scratch project; copy the rows back (never overwrite production blindly) |
| Project lost | New project, apply migrations, restore latest dump, set secrets, redeploy functions, PowerSync rebuild, update `SUPABASE_URL`/`POWERSYNC_URL` builds |
| PowerSync storage lost | 2.4 only |
| Secret leaked | key rotation (4.4) |

## 3. Monitoring and alerts checklist

Review weekly and wire alerts for the starred items.

- [ ] ★ **Uptime**: external probe on the web URL, `GET $SUPABASE_URL/auth/v1/health`, and the
      PowerSync service `/probes/liveness`. Alert after 2 failures in 5 minutes.
- [ ] ★ **Edge Function errors**: Supabase dashboard → Edge Functions → Logs/Invocations. Alert on
      5xx rate > 2 % per function (`sync-upload`, `sessions`, `invites`, `admin`,
      `answers-reveal`, `notifications`). Also watch 401 spikes (token or clock problems) and 429
      on `invites` (abuse, 4.1).
- [ ] ★ **Replication slot lag**: `select slot_name, active,
      pg_size_pretty(pg_wal_lsn_diff(pg_current_wal_lsn(), confirmed_flush_lsn)) as lag
      from pg_replication_slots;` — alert if the PowerSync slot is inactive or lag > 1 GB (WAL
      fills the disk).
- [ ] ★ **pg_cron failures**:
      `select j.jobname, d.status, d.return_message, d.start_time from cron.job_run_details d
      join cron.job j using (jobid) where d.status <> 'succeeded' and d.start_time > now() -
      interval '1 day' order by d.start_time desc;` Expected jobs: `gr-kpi-refresh-dirty` (30 s),
      `gr-kpi-refresh-hourly`, `gr-session-reminders` (15 min), `gr-commitment-nudges`, `gr-table-alerts` (daily),
      `gr-invites-expire`, `gr-pending-sessions`, `gr-apply-schedule`, `gr-archive-sessions`
      (daily). Alert on any failure or a job without a run in 2× its period.
- [ ] **KPI freshness**: `select dirty, refreshed_at from kpi.refresh_state;` — `dirty` with
      `refreshed_at` older than 5 minutes means stale rollups (4.3).
- [ ] **Notification queue / FCM errors**: rows in the notification outbox that never leave it (the outbox waits when the functions URL/secret is missing),
      and `notifications` function logs for `UNREGISTERED`/`INVALID_ARGUMENT` (stale tokens are
      expected; sustained `UNAUTHENTICATED` means the service account is wrong). Check the Firebase
      console → Cloud Messaging for delivery drops.
- [ ] **Database**: disk usage, connections, CPU (Supabase dashboard → Reports); slow queries in
      Logs → Postgres.
- [ ] **Auth**: sign-in failure rate per provider; Apple key expiry date (calendar reminder 30
      days before; Apple client secrets expire after ≤ 6 months).
- [ ] **Client errors**: if `ERROR_REPORT_URL` is set, review new error types after each release;
      otherwise search device/browser logs for scope `error_report`.
- [ ] **Backups**: last daily backup succeeded; weekly dump present and decryptable.
- [ ] **Certificates/domains**: web host TLS expiry.

## 4. Incident runbook

For each incident: note the time, who is handling it, and what was changed. Never paste personal
data into tickets; use ids.

### 4.1 Invite abuse
Signals: 429s on `invites`, many failed redemptions, invites redeemed by unexpected people.
1. Revoke the affected invites from the admin screen (or `invites` function `revoke`); expired
   ones are closed hourly by `gr-invites-expire`.
2. Per-address/per-code rate limits are in `app.rate_limit_hits`; look at the hot buckets:
   `select bucket, sum(hits) from app.rate_limit_hits where window_start > now() - interval
   '15 min' group by 1 order by 2 desc limit 20;`
3. If a code leaked, revoke and create a new one with a short expiry. If someone joined who should
   not have, remove their membership and role (admin screen) and check the audit log.
4. Persistent flood: tighten the limits in `supabase/functions/invites/index.ts`, or block the
   address at the web host/CDN.

### 4.2 Sync stuck
Signals: users report "pending" for long; `sync-upload` errors; replication lag.
1. Scope it: one device, one organization, or everyone? Check `sync-upload` logs and the
   replication slot (section 3).
2. One device: it keeps its changes locally; ask the person to open the app online and wait on the
   sync indicator. A rejected upload names a row; check the function log for the validation error
   (never discard the device queue unless the data is verified lost).
3. Everyone: slot inactive → restart the PowerSync service; still failing → rebuild its storage
   (2.4). Postgres unreachable → Supabase status page / restart the project.
4. After recovery confirm late uploads were flagged `synced_late` and that the facilitator's session
   still shows the expected attendance.

### 4.3 Stale rollups (KPI dashboards wrong or old)
1. `select * from kpi.refresh_state;` and the cron failures query (section 3).
2. Force a refresh: `select public.refresh_kpis();` (safe to repeat).
3. If it errors, read the message; fix the cause with a migration, never by editing rollup tables.
   If `gr-kpi-*` jobs are missing, re-create them from the migrations' cron block.
4. Dashboards also refresh on read when dirty, so a persistent staleness means the refresh itself
   fails.

### 4.4 Key rotation
| Secret | Steps |
|---|---|
| `CRON_SECRET` | `supabase secrets set CRON_SECRET=<new>`, update the Vault secret `cron_secret` that `app.dispatch_notifications_http` sends as `x-cron-secret`, verify the next `gr-session-reminders` run succeeds |
| `FCM_SERVICE_ACCOUNT_JSON` | create a new Firebase service-account key, `supabase secrets set`, redeploy `notifications`, send a test push, then delete the old key |
| Supabase anon/service keys or JWT secret | rotate in the dashboard; rebuild web/mobile with the new anon key (old builds stop working: coordinate a release), redeploy functions, update PowerSync JWKS if the signing key changed |
| PowerSync replication password | `ALTER ROLE powersync_role PASSWORD …`, update the PowerSync service connection, restart it |
| OAuth client secrets (Google/Apple/Facebook) | create the new secret in the provider, update Supabase Auth settings, test each sign-in; schedule Apple's expiry |
| Suspected leak of the service-role key | treat as breach: rotate immediately, review `auth` and audit logs for the exposure window, notify the owner |

### 4.5 General
Rollback a bad release: web — redeploy the previous build; functions — `git revert` and redeploy;
migrations are forward-only, so ship a corrective migration (PITR only for data loss).

## 5. Release checklist

Before tagging:
- [ ] `bash tool/check.sh` (analyze + tests) green on `main`.
- [ ] Generated code is current (`bash tool/codegen.sh` leaves no diff).
- [ ] Edge Function tests: `deno test` in `supabase/functions`.
- [ ] New migrations applied to a scratch copy of production data; RLS and
      `powersync/sync-rules.yaml` re-checked per role (no cross-organization read).
- [ ] Build with production defines only: `APP_ENV=production`, **no** `DEV_AUTH`, anon key (not
      service role), `ERROR_REPORT_URL` if used.
- [ ] Version/build number bumped in `pubspec.yaml`.
- [ ] Translations (Spanish) complete; no placeholder text.

Deploy order: migrations → Edge Functions → PowerSync sync rules (if changed) → web build → mobile
store builds. Migrations first, and backwards compatible with the previous app version, because
old mobile builds stay in use for days (offline window, ADR 0005).

After deploying:
- [ ] Smoke test against the live URLs (sign in, open a table, submit a score, pending→synced).
- [ ] Monitoring section 3: no new errors for 30 minutes.
- [ ] Cron jobs still scheduled; replication slot active.
- [ ] Note the release (version, date, migrations) in the team log.

## Drill log

| Date | Backup used | Time to usable | Notes |
|---|---|---|---|
| _not yet run_ | | | |
