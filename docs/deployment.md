# Deploying Gold Roundtables (hosted)

End-to-end runbook for a hosted environment: **Supabase** (Postgres, Auth, Edge Functions) →
**secrets** → **PowerSync** → **web** → **auth providers** → **smoke test**. The services stay the
ones the architecture decisions fixed (ADR 0002, 0004, 0008, 0009); this page only adds the
commands. Running and monitoring afterwards: [operations.md](operations.md). The local stack is
unaffected by anything here (`README.md` → "Running locally").

| Piece | Where it runs | Recommended | Alternative |
|---|---|---|---|
| Database, Auth, Edge Functions | Supabase project | supabase.com (hosted) | — |
| Offline sync service | PowerSync | **PowerSync Cloud** | self-hosted `docker/powersync` |
| Web app (static files) | CDN | **Cloudflare Pages** (direct upload) | `docker/web` nginx image |
| Push | Firebase Cloud Messaging, project `roundtable-v1` (sender id `1050044136194`) | — | — |

## 0. Before you start

Tools on the machine that deploys: Supabase CLI ≥ 2.115, `jq`, `curl`, `openssl`, Flutter 3.41.x
(web build), Node ≥ 18 (`npx wrangler`). No Docker is needed (functions are bundled server-side).
`psql` is not needed either: SQL steps go through the Supabase CLI.

You create these by hand (they cannot be scripted):
1. A Supabase project (supabase.com → New project). Keep the **database password**. Note the
   **project ref** (the 20 letters in `supabase.com/dashboard/project/<ref>`) and, under Project
   Settings → API, the **anon / publishable key**. Create an **access token** (Account → Access
   Tokens).
2. A **Cloudflare Pages** project, so the web URL exists before it is needed in secrets:
   `npx wrangler login` (or `CLOUDFLARE_API_TOKEN` + `CLOUDFLARE_ACCOUNT_ID`) then
   `npx wrangler pages project create <name> --production-branch main`. The URL is
   `https://<name>.pages.dev` until a custom domain is attached.
3. A **PowerSync Cloud** instance (section 3), whose URL goes into the web build.

Then create the settings file (git-ignored, see `.gitignore`; every variable is documented in the
template):

```bash
cp deploy/hosted.env.example deploy/hosted.env
openssl rand -hex 32     # → CRON_SECRET
openssl rand -hex 24     # → POWERSYNC_DB_PASSWORD
$EDITOR deploy/hosted.env
export SUPABASE_ACCESS_TOKEN=sbp_…     # kept out of the file; never printed by the scripts
export SUPABASE_DB_PASSWORD=…          # idem (either may also live in the file)
```

`deploy/hosted.env` is read only by the hosted scripts. They never read the local `.env`, so local
values (`DEV_AUTH=true`, `127.0.0.1`) cannot leak into a hosted build.

| Variable | Used by | Meaning |
|---|---|---|
| `SUPABASE_PROJECT_REF` | all | project id; `SUPABASE_URL` defaults to `https://<ref>.supabase.co` |
| `SUPABASE_ACCESS_TOKEN`, `SUPABASE_DB_PASSWORD`, `SUPABASE_DB_URL` | deploy, replication | credentials (environment wins over the file); `SUPABASE_DB_URL` replaces the linked project for SQL steps |
| `SUPABASE_ANON_KEY` | build, smoke | public anon key (the build refuses a service-role/secret key) |
| `APP_PUBLIC_URL`, `ALLOWED_ORIGINS`, `CRON_SECRET`, `FCM_SERVICE_ACCOUNT_FILE` | deploy | Edge Function secrets (`FCM_SERVICE_ACCOUNT_FILE` is a path; the script sends the JSON as one line) |
| `FIRST_ADMIN_EMAIL`, `FIRST_ADMIN_FIRST_NAME`, `FIRST_ADMIN_LAST_NAME` | deploy | first platform administrator (optional) |
| `POWERSYNC_URL` | build, smoke | public URL of PowerSync as the browser reaches it |
| `POWERSYNC_DB_PASSWORD` | replication | password of `powersync_role` |
| `APP_ENV`, `ERROR_REPORT_URL`, `FIREBASE_*` | build | `--dart-define` values; `DEV_AUTH` is always compiled `false` |
| `FUNCTIONS_USE_API` | deploy | `true` (default) bundles functions server-side, `false` uses local Docker |

## 1. Supabase: database, functions, secrets

```bash
bash scripts/deploy-hosted.sh --dry-run     # validates the file, links, lists pending migrations
bash scripts/deploy-hosted.sh               # applies everything
```

`--help` lists the steps; `--only functions,secrets` / `--skip db` run a subset, and every step can
be repeated. Without a settings file, token or password the script stops with a message saying
which one is missing; nothing is changed before the validation passes.

What it does, in order:

| Step | Effect |
|---|---|
| `link` | `supabase link --project-ref …` |
| `db` | enables `pg_cron` and `pg_net`, then `supabase db push` (**migrations only**; `supabase/seed.sql` is development data and never runs). The migrations schedule the `gr-*` cron jobs; `pg_cron`/`pg_net` are enabled first because the migrations only log a NOTICE when they are unavailable and would silently skip the jobs |
| `functions` | `supabase functions deploy` for every directory of `supabase/functions` (`admin`, `answers-reveal`, `invites`, `notifications`, `sessions`, `sync-upload`). `verify_jwt = false` comes from `supabase/config.toml`: the functions verify tokens themselves |
| `secrets` | `supabase secrets set`: `APP_PUBLIC_URL` (invite links), `ALLOWED_ORIGINS` (`*` is refused), `CRON_SECRET`, `FCM_SERVICE_ACCOUNT_JSON` (when `FCM_SERVICE_ACCOUNT_FILE` is set; without it push is skipped and the rest works). `SUPABASE_URL` and the keys are injected by the platform |
| `vault` | writes the two **Vault** secrets the cron job needs (below) |
| `verify` | prints the `gr-*` cron jobs and the Vault secret names (nine jobs are expected) |
| `admin` | first administrator, only when `FIRST_ADMIN_EMAIL` is set (below) |
| `auth` | opt-in (`--with-auth`): applies site URL, redirect URLs and the JWT/session settings through the Management API and reads them back |

### Cron → Edge Function (Vault)

The migration `20261025100700_notifications_cron_sync.sql` defines
`app.dispatch_notifications_http()`. The cron jobs `gr-session-reminders`, `gr-commitment-nudges`
and `gr-table-alerts` call it after queuing notifications; it POSTs through `pg_net` to
`<functions_base_url>/notifications/dispatch` with header `x-cron-secret`, reading two Vault secrets
by name:

| Vault secret | Value written by the script |
|---|---|
| `functions_base_url` | `https://<ref>.supabase.co/functions/v1` |
| `cron_secret` | the same value as the `CRON_SECRET` function secret |

If either is missing the function silently returns and the outbox just waits, so `verify` lists
them. Rotating `CRON_SECRET` = update the file and re-run `--only secrets,vault`
(operations.md §4.4).

### First administrator

There is no demo data in hosted. The first administrator is an existing account: open the web app
(section 4), sign in once with the church staff account (it answers *"No encontramos tu cuenta"*,
which creates the Auth user), then:

```bash
# FIRST_ADMIN_EMAIL / FIRST_ADMIN_FIRST_NAME / FIRST_ADMIN_LAST_NAME in deploy/hosted.env
bash scripts/deploy-hosted.sh --only admin
```

It is idempotent (reuses the person row and the active `platform_admin` assignment). The same
inserts as plain SQL are in the README ("Deploying" → First administrator). The first organization
and coordinators are then created from the admin screens.

### Auth settings (manual checklist)

The script prints this checklist at the end. Values come from
[implementation/offline-window.md](implementation/offline-window.md); `--with-auth` sets the ones
the Management API exposes and compares them with what the project reports, but check the dashboard
(Authentication) once either way.

- URL Configuration: **Site URL** = `APP_PUBLIC_URL`; **Redirect URLs** = `APP_PUBLIC_URL`,
  `APP_PUBLIC_URL/**`, `io.goldroundtables.app://login-callback` (mobile).
- Providers: Google, Apple, Facebook (section 5). Email sign-up **off**.
- Sessions: **JWT expiry 3600 s** (do not raise it), refresh-token rotation **on**, reuse interval
  **≥ 10 s**, **time-box disabled or ≥ 30 days**, **inactivity timeout disabled or ≥ 8 days**
  (Pro plan), single session per user **off**. A shorter time-box or inactivity timeout logs a
  returning offline device out (7-day offline window, ADR 0005).
- Backups: daily backups on; **PITR** on a paid plan (operations.md §2).

## 2. Secrets: what lives where

| Secret | Stored in | Set by |
|---|---|---|
| `CRON_SECRET`, `FCM_SERVICE_ACCOUNT_JSON`, `APP_PUBLIC_URL`, `ALLOWED_ORIGINS` | Supabase function secrets | `deploy-hosted.sh` (`secrets`) |
| `functions_base_url`, `cron_secret` | Supabase Vault | `deploy-hosted.sh` (`vault`) |
| `powersync_role` password | Postgres role + PowerSync connection | `setup-powersync-replication.sh --hosted` |
| OAuth client ids/secrets | Supabase Auth | dashboard |
| Anon key, Firebase web options, `POWERSYNC_URL` | compiled into the web build (public by design) | `build-web.sh` |
| Service-role key | nowhere in this repo; never in a client | — |

Keep the originals in a password manager (operations.md §2.1); `deploy/hosted.env` and any service
account key under `deploy/` are git-ignored, but they are still plaintext on disk.

## 3. PowerSync

### 3.1 Replication role and publication

The migrations create the `powersync` publication (it includes the curriculum language tables).
The replication role needs a password, so it is created separately:

```bash
bash scripts/setup-powersync-replication.sh --hosted    # idempotent; uses POWERSYNC_DB_PASSWORD
```

It runs through the linked project (or `SUPABASE_DB_URL`) and ends by printing the connection values
below. The local mode of the same script (no flag) is unchanged.

### 3.2 PowerSync Cloud (recommended)

In the PowerSync dashboard create a project and an instance (use one instance per environment), then:

1. **Database connection** (Supabase Postgres): host `db.<ref>.supabase.co`, port `5432`, database
   `postgres`, user `powersync_role`, the password from `POWERSYNC_DB_PASSWORD`, SSL mode
   `verify-full` (or `require`). Use the **direct** connection: logical replication does not work
   through the transaction pooler. The direct host resolves to IPv6 only unless the Supabase project
   has the IPv4 add-on; if the instance cannot connect, check PowerSync's Supabase guide for the
   currently supported option (IPv4 add-on or a pooler mode that supports replication).
2. **Client auth**: JWKS URI `https://<ref>.supabase.co/auth/v1/.well-known/jwks.json`, audience
   `authenticated`. Supabase signs user tokens with an asymmetric key (ES256 for the local stack);
   `scripts/smoke-hosted.sh` checks that the project's JWKS publishes one. A project still on the
   legacy shared-secret (HS256) key must be migrated to JWT signing keys, or PowerSync configured
   with the secret instead.
3. **Sync rules**: edition 3 *Sync Streams*; deploy the contents of `powersync/sync-rules.yaml`
   (dashboard → Sync Rules → paste/deploy, validate, deploy). This file is part of the security
   perimeter (it mirrors the RLS scopes): re-deploy it whenever it changes in git (operations.md
   deploy order: migrations → functions → sync rules → web).
4. Copy the instance URL (`https://<instance>.powersync.journeyapps.com`) to `POWERSYNC_URL` in
   `deploy/hosted.env`, then build the web app.

### 3.3 Self-hosted fallback

`docker/powersync/powersync.yaml` is the template (the service image is `journeyapps/powersync-service`
≥ 1.20, see `docker-compose.yml` for the environment). Differences for hosted Supabase:

- `PS_DATA_SOURCE_URI=postgresql://powersync_role:<password>@db.<ref>.supabase.co:5432/postgres` and change
  `sslmode: disable` → `require` (or `verify-full`) in your copy of the file;
- `PS_JWKS_URI=https://<ref>.supabase.co/auth/v1/.well-known/jwks.json`;
- bucket storage: its own Postgres (`powersync-storage`) with a persistent volume;
- put it behind TLS on a public hostname (the browser needs `https://` for `POWERSYNC_URL`), and
  allow the web origin in CORS (the service answers preflights; verified by `smoke-hosted.sh`).

The compose file is for the local stack; for production copy the two services into your own compose
or orchestrator rather than running `dev-up.sh`.

## 4. Web app

```bash
bash scripts/build-web.sh      # → build/web
```

It reads `deploy/hosted.env` and passes every `String.fromEnvironment` key of
`lib/core/config/app_config.dart`: `SUPABASE_URL`, `SUPABASE_ANON_KEY`, `POWERSYNC_URL`, `APP_ENV`,
`DEV_AUTH` (always `false`; the script refuses a settings file that enables it),
`ERROR_REPORT_URL` and the five `FIREBASE_*` values. It refuses a service-role/secret key, warns
when the Firebase web options are incomplete, and writes `build/web/firebase-config.js` for the push
service worker when they are complete. A change in any value needs a rebuild.

Flutter's output is plain static files; the app uses hash routing (`/#/…`), so the host only ever
serves `/`.

### 4.1 Cloudflare Pages (recommended)

```bash
npx wrangler pages deploy build/web --project-name <name> --branch main
```

`--branch main` is the production deployment of a project created with
`--production-branch main`; any other branch name produces a preview URL
(`https://<hash>.<name>.pages.dev`). Every file in `web/` is copied into `build/web`, including:

| File | Purpose |
|---|---|
| `web/_headers` | `Cache-Control: no-cache` for everything (Flutter's files are not content-hashed, so the browser revalidates by ETag and a release is picked up on the next load; Flutter 3.41's `flutter_service_worker.js` is only a stub that unregisters old workers), plus `X-Content-Type-Options`, `X-Frame-Options`, `Referrer-Policy`, HSTS and a `Permissions-Policy` that still allows the camera (invite QR scanner). No CSP: it must be tested against the real build first |
| `web/404.html` | Pages treats a project **without** a top-level `404.html` as a single-page app and answers every unknown path with `index.html` (HTTP 200), which hides broken worker/wasm paths. With this file missing assets are real 404s, as in `docker/web/nginx.conf` |
| `web/_redirects` | `/invite/* → /#/invite/:splat`. The Edge Functions build invite links as `<APP_PUBLIC_URL>/invite/<CODE>` while the web app only understands the hash form |

Cloudflare serves `.wasm` as `application/wasm` and compresses text assets itself. Attach a custom
domain in the Pages project (Custom domains) and then update `APP_PUBLIC_URL` / `ALLOWED_ORIGINS` and
re-run `bash scripts/deploy-hosted.sh --only secrets` plus the Auth URL settings. Previews need
their own origin in `ALLOWED_ORIGINS` to talk to Supabase.

### 4.2 Self-hosted nginx image (`docker/web`)

```bash
set -a; source deploy/hosted.env; set +a
docker build -f docker/web/Dockerfile -t gold-roundtables-web:prod \
  --build-arg SUPABASE_URL --build-arg SUPABASE_ANON_KEY --build-arg POWERSYNC_URL \
  --build-arg APP_ENV --build-arg DEV_AUTH=false --build-arg ERROR_REPORT_URL \
  --build-arg FIREBASE_API_KEY --build-arg FIREBASE_APP_ID --build-arg FIREBASE_MESSAGING_SENDER_ID \
  --build-arg FIREBASE_PROJECT_ID --build-arg FIREBASE_VAPID_KEY .
docker run -d --restart unless-stopped -p 3000:3000 gold-roundtables-web:prod
```

The container serves plain HTTP on port 3000: terminate TLS in front (Caddy, Traefik, a cloud load
balancer). `docker/web/nginx.conf` sets `application/wasm`, real 404s for assets and `no-cache`, but
**not** the security headers or the `/invite/*` redirect of `_headers`/`_redirects`: add them in the
proxy if you need them. Web push needs `web/firebase-config.js` in the build context (copy
`web/firebase-config.sample.js`; it is git-ignored). The Dockerfile build was not run as part of
this runbook; `scripts/build-web.sh` + any static server is equivalent.

## 5. Auth providers

Callback URL for every provider: `https://<ref>.supabase.co/auth/v1/callback`. Enter client ids and
secrets in Authentication → Providers (never in git). Details of each console are in the README
("Social sign-in credentials").

- **Google**: Cloud Console → OAuth client (web) with that callback and the web origin as an
  authorized JavaScript origin. Android and iOS need their own client ids for native sign-in.
- **Apple**: Services ID + Sign in with Apple key; the client secret is a JWT that expires within 6
  months (calendar reminder, operations.md §3).
- **Facebook**: Meta app id and secret; valid OAuth redirect URI = the callback above.
- Then the **URL Configuration** and **Sessions** settings of the checklist in section 1.
- Create the first administrator (section 1) after one sign-in.

## 6. Smoke test

```bash
bash scripts/smoke-hosted.sh                      # reads deploy/hosted.env
bash scripts/smoke-hosted.sh --check-cron-secret  # also proves function secret == Vault secret
bash scripts/smoke-hosted.sh --web-url https://<hash>.<name>.pages.dev   # a preview deployment
```

It is read-only and needs no account: Auth health, asymmetric JWKS, anonymous PostgREST returns no
rows, Edge Functions (401 without token, anonymous invite preview works, cron endpoint refuses
callers without the secret, CORS limited to the web origin), PowerSync liveness/readiness/CORS and
token requirement, and the web assets (`no-cache`, `.wasm` and worker content types, real 404).
The security-header and invite-redirect checks are advisory warnings: they only apply to Cloudflare
Pages (`web/_headers`, `web/_redirects`) unless you add them to your own proxy.
`SMOKE_ACCESS_TOKEN=<a user's access token>` adds an authenticated `admin/me` call.

Then the manual pass (the part nothing automated can do on a canvas app with real providers):
sign in with each provider on a phone and in a desktop browser; create the first organization,
location, table and coordinator; send and redeem an invite (QR and link); run a session end to end,
answer offline, reconnect and watch pending → synced; on the web check the install/offline load.
After 15 minutes confirm `select jobname, status from cron.job_run_details …` shows the `gr-*` jobs
succeeding (operations.md §3).

### `scripts/smoke.sh` and `tool/e2e` against hosted

Neither is meant for the hosted environment:

- `scripts/smoke.sh` logs in as the seeded dev users (`facil@dev.local`, password
  `dev-password-123`) and checks the seeded invite `MESA34`; hosted has no demo data and no email
  sign-in. Use `smoke-hosted.sh`. `smoke.sh` accepts `SUPABASE_URL`, `SUPABASE_ANON_KEY`,
  `SMOKE_WEB_ORIGIN` and `SMOKE_POWERSYNC_URL` so it can target a **staging** stack that was seeded
  with the dev data (never production); defaults still point at the local stack.
- `tool/e2e` drives the web build with the dev accounts (`DEV_AUTH=true`), writes data, and reads
  and resets state through `docker exec … psql` into the *local* Supabase container
  (`tool/e2e/flows.mjs`). `E2E_BASE` (web URL), `SUPABASE_URL`/`SUPABASE_ANON_KEY` can be
  overridden, but the database access cannot, so it must not be pointed at hosted data.

## 7. Updating a deployed environment

Order (operations.md §5): migrations → Edge Functions → PowerSync sync rules (if changed) → web
build → mobile builds. In practice: `bash scripts/deploy-hosted.sh --dry-run`, then the same
without `--dry-run`, deploy sync rules if `powersync/sync-rules.yaml` changed, `bash
scripts/build-web.sh && npx wrangler pages deploy build/web …`, then `smoke-hosted.sh`.
Migrations are forward-only and must stay compatible with the previous app version (old mobile
builds stay in use for days).

## 8. Troubleshooting

- **`supabase link` / `db push` fail**: wrong or missing `SUPABASE_ACCESS_TOKEN` /
  `SUPABASE_DB_PASSWORD`; a direct `SUPABASE_DB_URL` needs IPv6 or the IPv4 add-on, otherwise use the
  session pooler string from Dashboard → Connect (percent-encode the password).
- **`gr-*` jobs missing** after `verify`: `pg_cron` was not enabled when the migration ran (the
  migration only logs a NOTICE). Enable it (Database → Extensions) and re-run the cron block of
  migrations `20261025100700`, `20261027200000` and `20261029000000`, or re-create the jobs from them.
- **Notifications stay `pending`**: Vault secrets missing or different from `CRON_SECRET`
  (`--only vault` then `smoke-hosted.sh --check-cron-secret`).
- **Browser CORS errors on Edge Functions**: the page's origin is not in `ALLOWED_ORIGINS`
  (`--only secrets`, no trailing slash, `https`).
- **PowerSync cannot connect / replicate**: replication role password, direct vs pooled connection,
  IPv6 reachability, publication present (`setup-powersync-replication.sh --hosted` checks it), JWKS
  reachable. After a restore or a lost slot follow operations.md §2.4.
- **Stale web release**: `no-cache` makes the next load revalidate; a hard reload clears any older
  caching worker. Missing push on web: `build/web/firebase-config.js` absent (incomplete `FIREBASE_*`).
- **Invite links open the home screen**: the `/invite/*` redirect (`web/_redirects`) only exists on
  Cloudflare Pages; on another host add the equivalent redirect to `/#/invite/<code>`.

## 9. Not verified yet

Written before any hosted project existed, so these were checked only against the CLI help and the
vendors' documentation, not against a live project:

- `supabase db query --linked -f` (used for extensions, Vault, first admin, replication role) and the
  `auth` step's Management API field names (`site_url`, `uri_allow_list`, `jwt_exp`,
  `refresh_token_rotation_enabled`, `security_refresh_token_reuse_interval`,
  `external_email_enabled`; the script reads them back and warns on a mismatch).
- `supabase functions deploy --use-api` bundling the shared `_shared/` imports.
- PowerSync Cloud connectivity to Supabase's direct (IPv6) host, and the sync-rules deploy flow.
- The `docker/web` build with the new optional build args.
