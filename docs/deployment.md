# Deploying Gold Roundtables (hosted)

End-to-end runbook for a hosted environment: **Supabase** (Postgres, Auth, Edge Functions) →
**secrets** → **web** → **auth providers** → **smoke test**. The services stay the
ones the architecture decisions fixed (ADR 0002, 0008, 0009, 0019); this page only adds the
commands. Running and monitoring afterwards: [operations.md](operations.md). The local stack is
unaffected by anything here (`README.md` → "Running locally").

| Piece | Where it runs | Recommended | Alternative |
|---|---|---|---|
| Database, Auth, Edge Functions | Supabase project | supabase.com (hosted) | — |
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

Then create the settings file (git-ignored, see `.gitignore`; every variable is documented in the
template):

```bash
cp deploy/hosted.env.example deploy/hosted.env
openssl rand -hex 32     # → CRON_SECRET
$EDITOR deploy/hosted.env
export SUPABASE_ACCESS_TOKEN=sbp_…     # kept out of the file; never printed by the scripts
export SUPABASE_DB_PASSWORD=…          # idem (either may also live in the file)
```

`deploy/hosted.env` is read only by the hosted scripts. They never read the local `.env`, so local
values (`DEV_AUTH=true`, `127.0.0.1`) cannot leak into a hosted build.

| Variable | Used by | Meaning |
|---|---|---|
| `SUPABASE_PROJECT_REF` | all | project id; `SUPABASE_URL` defaults to `https://<ref>.supabase.co` |
| `SUPABASE_ACCESS_TOKEN`, `SUPABASE_DB_PASSWORD`, `SUPABASE_DB_URL` | deploy | credentials (environment wins over the file); `SUPABASE_DB_URL` replaces the linked project for SQL steps |
| `SUPABASE_ANON_KEY` | build, smoke | public anon key (the build refuses a service-role/secret key) |
| `APP_PUBLIC_URL`, `ALLOWED_ORIGINS`, `CRON_SECRET`, `FCM_SERVICE_ACCOUNT_FILE` | deploy | Edge Function secrets (`FCM_SERVICE_ACCOUNT_FILE` is a path; the script sends the JSON as one line) |
| `FIRST_ADMIN_EMAIL`, `FIRST_ADMIN_FIRST_NAME`, `FIRST_ADMIN_LAST_NAME` | deploy | first platform administrator (optional) |
| `APP_ENV`, `ERROR_REPORT_URL`, `FIREBASE_*` | build | `--dart-define` values; `DEV_AUTH` is always compiled `false` |
| `AUTH_METHODS` | build | sign-in methods the app offers: comma list of `email`, `google`, `apple`, `facebook` (default `email`, ADR 0018) |
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
| `api` | exposes the Data API schemas of `supabase/config.toml` (`public, graphql_public, api`) through the Management API. Hosted projects expose only `public, graphql_public` by default; without `api` every Edge Function call fails with `PGRST106 Invalid schema: api` |
| `functions` | `supabase functions deploy`, one call per function (a multi-function deploy fails with `TransportError`), for every directory of `supabase/functions` (`admin`, `answers-reveal`, `invites`, `notifications`, `sessions`, `sync-upload`). `verify_jwt = false` comes from `supabase/config.toml`: the functions verify tokens themselves |
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
- Providers → **Email** (ADR 0018, the production sign-in): provider **on**, "Allow new users to
  sign up" **on**, "Confirm email" **off** for now, minimum password length 8. Supabase's built-in
  mailer is rate limited (a few emails per hour), so confirmation emails would block sign-ups;
  with confirmation off a new account is signed in immediately. Turn "Confirm email" on once a
  custom SMTP sender is configured. The password-reset email still goes through the built-in
  mailer, so expect that limit when many people reset at once. `--with-auth` sets
  `external_email_enabled`, `disable_signup=false`, `mailer_autoconfirm=true` and
  `password_min_length=8`.
- Password reset: the emailed link returns to `APP_PUBLIC_URL/#/nueva-contrasena`, which the
  `APP_PUBLIC_URL/**` redirect URL already covers. It must be opened in the same browser that asked
  for it (PKCE).
- Providers → Google, Apple, Facebook: only needed when `AUTH_METHODS` includes them (section 5).
- Sessions: **JWT expiry 3600 s** (do not raise it), refresh-token rotation **on**, reuse interval
  **≥ 10 s**, **time-box disabled or ≥ 30 days**, **inactivity timeout disabled or ≥ 8 days**
  (Pro plan), single session per user **off**. A shorter time-box or inactivity timeout logs a
  returning device out. (The offline window of ADR 0005 is suspended with offline capture, ADR 0019.)
- Backups: daily backups on; **PITR** on a paid plan (operations.md §2).

## 2. Secrets: what lives where

| Secret | Stored in | Set by |
|---|---|---|
| `CRON_SECRET`, `FCM_SERVICE_ACCOUNT_JSON`, `APP_PUBLIC_URL`, `ALLOWED_ORIGINS` | Supabase function secrets | `deploy-hosted.sh` (`secrets`) |
| `functions_base_url`, `cron_secret` | Supabase Vault | `deploy-hosted.sh` (`vault`) |
| OAuth client ids/secrets | Supabase Auth | dashboard |
| Anon key, Firebase web options | compiled into the web build (public by design) | `build-web.sh` |
| Service-role key | nowhere in this repo; never in a client | — |

Keep the originals in a password manager (operations.md §2.1); `deploy/hosted.env` and any service
account key under `deploy/` are git-ignored, but they are still plaintext on disk.

## 3. Retiring PowerSync (environments deployed before ADR 0019)

The app no longer uses PowerSync (ADR 0019): there is no replication service, role, publication or
sync-rules deploy. A new environment skips this section. An environment that ran PowerSync:

1. Apply the migrations (`bash scripts/deploy-hosted.sh --only link,db`). Migration
   `20261101000000_drop_powersync.sql` drops the `powersync` publication, any `powersync*`
   replication slot and the `powersync_role` login role (it revokes the role's grants first).
   If `postgres` is not allowed to drop the role or a slot, the migration prints a WARNING instead
   of failing; run what it prints in the SQL editor (`drop owned by powersync_role; drop role
   powersync_role;`, `select pg_drop_replication_slot('<name>');`). An inactive slot retains WAL.
2. Delete the PowerSync Cloud instance (or stop the self-hosted service and its storage).
3. Remove `POWERSYNC_URL` and `POWERSYNC_DB_PASSWORD` from `deploy/hosted.env`; the scripts ignore
   them.

After that the app reads through PostgREST under RLS and writes through the Edge Functions; the
only secret between the web build and the database is the public anon key.

## 4. Web app

```bash
bash scripts/build-web.sh      # → build/web
```

It reads `deploy/hosted.env` and passes every `String.fromEnvironment` key of
`lib/core/config/app_config.dart`: `SUPABASE_URL`, `SUPABASE_ANON_KEY`, `APP_ENV`,
`DEV_AUTH` (always `false`; the script refuses a settings file that enables it), `AUTH_METHODS`
(default `email`; the script rejects unknown names),
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
| `web/404.html` | Pages treats a project **without** a top-level `404.html` as a single-page app and answers every unknown path with `index.html` (HTTP 200), which hides broken asset paths. With this file missing assets are real 404s, as in `docker/web/nginx.conf` |
| `web/_redirects` | `/invite/* → /#/invite/:splat`. The Edge Functions build invite links as `<APP_PUBLIC_URL>/invite/<CODE>` while the web app only understands the hash form |

Cloudflare compresses text assets itself. Attach a custom
domain in the Pages project (Custom domains) and then update `APP_PUBLIC_URL` / `ALLOWED_ORIGINS` and
re-run `bash scripts/deploy-hosted.sh --only secrets` plus the Auth URL settings. Previews need
their own origin in `ALLOWED_ORIGINS` to talk to Supabase.

### 4.2 Self-hosted nginx image (`docker/web`)

```bash
set -a; source deploy/hosted.env; set +a
docker build -f docker/web/Dockerfile -t gold-roundtables-web:prod \
  --build-arg SUPABASE_URL --build-arg SUPABASE_ANON_KEY \
  --build-arg APP_ENV --build-arg DEV_AUTH=false --build-arg ERROR_REPORT_URL \
  --build-arg FIREBASE_API_KEY --build-arg FIREBASE_APP_ID --build-arg FIREBASE_MESSAGING_SENDER_ID \
  --build-arg FIREBASE_PROJECT_ID --build-arg FIREBASE_VAPID_KEY .
docker run -d --restart unless-stopped -p 3000:3000 gold-roundtables-web:prod
```

The container serves plain HTTP on port 3000: terminate TLS in front (Caddy, Traefik, a cloud load
balancer). `docker/web/nginx.conf` sets real 404s for assets and `no-cache`, but
**not** the security headers or the `/invite/*` redirect of `_headers`/`_redirects`: add them in the
proxy if you need them. Web push needs `web/firebase-config.js` in the build context (copy
`web/firebase-config.sample.js`; it is git-ignored). The Dockerfile build was not run as part of
this runbook; `scripts/build-web.sh` + any static server is equivalent.

## 5. Auth providers (social sign-in, optional)

Production currently uses email + password only (ADR 0018, `AUTH_METHODS=email`). Everything below
is needed only when you add `google`, `apple` or `facebook` to `AUTH_METHODS`.

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
callers without the secret, CORS limited to the web origin), and the web assets (`no-cache`, real 404).
The security-header and invite-redirect checks are advisory warnings: they only apply to Cloudflare
Pages (`web/_headers`, `web/_redirects`) unless you add them to your own proxy.
`SMOKE_ACCESS_TOKEN=<a user's access token>` adds an authenticated `admin/me` call.

Then the manual pass (the part nothing automated can do on a canvas app with real providers):
sign in with each provider on a phone and in a desktop browser; create the first organization,
location, table and coordinator; send and redeem an invite (QR and link); run a session end to end,
answer a question and watch it appear on the facilitator's screen; switch the phone to airplane
mode and check the app says it is offline and refuses the write (no silent queue).
After 15 minutes confirm `select jobname, status from cron.job_run_details …` shows the `gr-*` jobs
succeeding (operations.md §3).

### `scripts/smoke.sh` and `tool/e2e` against hosted

Neither is meant for the hosted environment:

- `scripts/smoke.sh` logs in as the seeded dev users (`facil@dev.local`, password
  `dev-password-123`) and checks the seeded invite `MESA34`; hosted has no demo data and no email
  sign-in. Use `smoke-hosted.sh`. `smoke.sh` accepts `SUPABASE_URL`, `SUPABASE_ANON_KEY`,
  `SMOKE_WEB_ORIGIN` so it can target a **staging** stack that was seeded
  with the dev data (never production); defaults still point at the local stack.
- `tool/e2e` drives the web build with the dev accounts (`DEV_AUTH=true`), writes data, and reads
  and resets state through `docker exec … psql` into the *local* Supabase container
  (`tool/e2e/flows.mjs`). `E2E_BASE` (web URL), `SUPABASE_URL`/`SUPABASE_ANON_KEY` can be
  overridden, but the database access cannot, so it must not be pointed at hosted data.

## 7. Updating a deployed environment

Order (operations.md §5): migrations → Edge Functions → web build → mobile builds. In practice:
`bash scripts/deploy-hosted.sh --dry-run`, then the same without `--dry-run`, `bash
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
- **Stale web release**: `no-cache` makes the next load revalidate; a hard reload clears any older
  caching worker. Missing push on web: `build/web/firebase-config.js` absent (incomplete `FIREBASE_*`).
- **Invite links open the home screen**: the `/invite/*` redirect (`web/_redirects`) only exists on
  Cloudflare Pages; on another host add the equivalent redirect to `/#/invite/<code>`.

## 9. Not verified yet

Written before any hosted project existed, so these were checked only against the CLI help and the
vendors' documentation, not against a live project:

- `supabase db query --linked -f` (used for extensions, Vault, first admin) and the
  `auth` step's Management API field names (`site_url`, `uri_allow_list`, `jwt_exp`,
  `refresh_token_rotation_enabled`, `security_refresh_token_reuse_interval`,
  `external_email_enabled`, `disable_signup`, `mailer_autoconfirm`, `password_min_length`; the script reads them back and warns on a mismatch).
- `supabase functions deploy --use-api` bundling the shared `_shared/` imports.
- Migration `20261101000000_drop_powersync.sql` on a hosted project: `postgres` dropping a role it
  created and terminating the replication backend were checked only against the PostgreSQL docs.
- The `docker/web` build with the new optional build args.
