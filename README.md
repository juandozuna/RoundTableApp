# Gold Roundtables

A multi-tenant app for running weekly "mesas redondas", the values-formation program of
Iglesia Casa del Altísimo. Facilitators run sessions and members record attendance, self-scores,
reflections and commitments on their own phones, even without internet. Organizations, the church
and coordinators follow progress through KPI dashboards.

## Status
The app is implemented end to end (auth and invites, live session with offline sync, administration,
KPIs, audit, notifications, settings) and verified in the browser against the full local stack
(Supabase + PowerSync + the Flutter web build). Real social sign-in, push delivery and the Android /
iOS builds still need provider credentials or devices; see [Deploying](#deploying).

- Architecture decisions: [docs/adr](docs/adr/README.md)
- Contributor and agent rules: [AGENTS.md](AGENTS.md)
- Backend contract: [docs/implementation/api-contract.md](docs/implementation/api-contract.md)
- UI prototypes (open in a browser): [docs/design/prototypes](docs/design/prototypes)
- End-to-end browser tests: [tool/e2e](tool/e2e/README.md)

## Stack
Flutter (Android, iOS, web) · Supabase (Postgres + RLS, Auth, Edge Functions) · PowerSync + Drift
for offline session sync · Firebase Cloud Messaging.

## Running locally

The whole app runs on your machine: Supabase (Postgres, Auth, Edge Functions) through the Supabase
CLI, plus PowerSync and the Flutter web build in Docker (`docker-compose.yml`). Supabase is **not**
in the compose file.

### Prerequisites
- Docker (Desktop on macOS/Windows, Engine on Linux) with `docker compose` v2.
- [Supabase CLI](https://supabase.com/docs/guides/cli) ≥ 2.
- `curl`, and Node ≥ 18 for the sync check in `scripts/smoke.sh` (optional).
- Flutter 3.41.x on the host only for `--local-web` / `flutter run`; the Docker web build brings its
  own Flutter.

### One command
```bash
bash scripts/dev-up.sh
```
It starts Supabase if needed (migrations + seed on first start), creates the PowerSync replication
role, starts PowerSync and its storage, builds the web app in Docker and serves it. The first run
pulls images and takes a few minutes; later runs take about a minute.

| What | URL |
|---|---|
| Web app | http://127.0.0.1:3000 |
| PowerSync Service | http://127.0.0.1:8080 (`/probes/liveness`) |
| Supabase API (Auth, REST, Edge Functions) | http://127.0.0.1:54321 |
| Supabase Studio · Mailpit | http://127.0.0.1:54323 · http://127.0.0.1:54324 |

Open the web app on exactly `http://127.0.0.1:3000` or `http://localhost:3000` (the only origins
allowed by Supabase Auth redirects and CORS). The app uses hash routing, so deep links look like
`http://127.0.0.1:3000/#/invite/MESA34`.

### Signing in
Google, Apple and Facebook cannot work locally without provider credentials (see below). The web
build made by these scripts is compiled with `DEV_AUTH=true`, which adds an email + password
sign-in. Password for every dev user: `dev-password-123`.

| Email | Role |
|---|---|
| `admin@dev.local` | Administrador · Plataforma |
| `coord@dev.local` | Coordinador · Fundación Luz (and member of Mesa Fe 01) |
| `facil@dev.local` | Facilitador · Mesa Esperanza 03 |
| `ana@dev.local`, `luis@dev.local`, `marta@dev.local` | Miembros · Mesa Esperanza 03 |
| `coord.horizonte@seed.local`, `coord.andina@seed.local` | Coordinators of the other organizations (cross-tenant tests) |

Seeded invite codes: `MESA34` (pending member), `VENC22` (expired), `REVK23` (revoked), `ACEP24`
(accepted), `CRDN26` (coordinator), `FACL27` (facilitator). More detail in
[docs/implementation/api-contract.md](docs/implementation/api-contract.md) §1.

### Everyday commands
| Command | Does |
|---|---|
| `bash scripts/dev-status.sh` | containers, endpoints and PowerSync replication slot |
| `bash scripts/smoke.sh` | Supabase REST + Edge Functions + dev login, PowerSync liveness/CORS and a real sync stream for `facil@dev.local` (must contain Mesa Esperanza 03), web assets (`.wasm`, worker) |
| `bash scripts/dev-down.sh` | stops web + PowerSync (`--purge` also deletes PowerSync storage, `--with-supabase` stops Supabase) |
| `bash scripts/dev-reset.sh` | **wipes** the local database (`supabase db reset`), re-seeds, resets PowerSync |
| `bash scripts/dev-up.sh --local-web` | build the web app with the host Flutter instead of Docker |
| `bash scripts/web-dev-serve.sh` | rebuild with the host Flutter and re-serve (fastest loop); `--no-build` only restarts nginx |
| `bash scripts/dev-open-session.sh` | puts **Mesa Esperanza 03**'s demo session back to *scheduled · lobby* at the current time (wipes what a previous run captured), so the live flow can be tried again at any moment, no reset needed |
| `bash scripts/dev-up.sh --no-web` | backend only, for `flutter run -d chrome --web-port 3000 --dart-define=…` |

Seed times are relative to the last reset (Mesa Esperanza 03's pending session is "today, one hour
after the reset"), so run `dev-open-session.sh` (or `dev-reset.sh` for all data) when the demo feels
stale. The explorer and KPI screens read rollups that `pg_cron` refreshes every 5 minutes (shown as
"Datos actualizados HH:MM"); run `docker exec supabase_db_gold-roundtables psql -U postgres -c
"select kpi.refresh_if_dirty()"` to see a change right away. Variables are documented
in [`.env.example`](.env.example); copy it to `.env` only to override defaults.

### Resetting data
`bash scripts/dev-reset.sh` (asks for confirmation; `--yes` skips it). It drops PowerSync's storage
too, because the replication slot is invalid after a database reset. The Supabase stack may be shared
between worktrees: tell the others before you reset it.

### How the pieces connect
- **PowerSync** (`journeyapps/powersync-service`, ≥ 1.20 for Sync Streams) replicates the
  `powersync` publication of the Supabase database with the `powersync_role` replication role
  (`scripts/setup-powersync-replication.sh`, idempotent). Its own bucket storage is a separate
  Postgres container (`powersync-storage`, volume `powersync-storage-data`).
- Client tokens are Supabase JWTs validated through the local Auth **JWKS** (ES256, audience
  `authenticated`). The sync rules are mounted from `powersync/sync-rules.yaml`.
- The web image (`docker/web/Dockerfile`) builds `flutter build web --release` with the
  `--dart-define`s `SUPABASE_URL`, `SUPABASE_ANON_KEY` (read from `supabase status -o env`),
  `POWERSYNC_URL`, `DEV_AUTH`, `APP_ENV` and serves it with nginx (gzip, `application/wasm`, SPA
  fallback, real 404s for missing assets so a broken worker/wasm path is visible).
- Flutter's CanvasKit renderer and fonts are fetched from Google's CDN on first load, so the browser
  needs internet access.

### Social sign-in credentials
Providers are `enabled = false` in `supabase/config.toml` and read their credentials by
environment substitution, so nothing is committed. To try them locally, export these variables
(or put them in `supabase/.env`, which is git-ignored) and set `enabled = true` for the provider:

| Provider | Variables | Where to get them |
|---|---|---|
| Google | `SUPABASE_AUTH_EXTERNAL_GOOGLE_CLIENT_ID`, `…_SECRET` | Google Cloud Console → OAuth client (web); authorized redirect URI `http://127.0.0.1:54321/auth/v1/callback`. Native Android/iOS sign-in also needs the Android/iOS client IDs |
| Apple | `SUPABASE_AUTH_EXTERNAL_APPLE_CLIENT_ID`, `…_SECRET` | Apple Developer → Services ID + Sign in with Apple key; the secret is a JWT generated from the `.p8` key (expires after 6 months) |
| Facebook | `SUPABASE_AUTH_EXTERNAL_FACEBOOK_CLIENT_ID`, `…_SECRET` | Meta for Developers → app ID and app secret; valid OAuth redirect URI `http://127.0.0.1:54321/auth/v1/callback` |

Then restart Supabase (`supabase stop && supabase start`, after coordinating on a shared stack).
Redirect URLs allowed by Auth: `http://127.0.0.1:3000`, `http://localhost:3000`,
`io.goldroundtables.app://login-callback`. Production values (FCM service account, `APP_PUBLIC_URL`,
`ALLOWED_ORIGINS`, `CRON_SECRET`) are listed in `.env.example` and are Supabase function secrets.

### Test it in the browser

Open http://127.0.0.1:3000, pick a dev account on the sign-in screen ("Acceso de desarrollo") and try:

| Account | What to try |
|---|---|
| **Administrador** (`admin@dev.local`) | *Mesas*: explorer with views ("Mesas retrasadas"), filters, *Guardar vista*, *Crear* → mesa / organización / invitar persona; open a table → *Agregar miembro*, *Cambiar facilitador*, *Ver respuestas de…* (audited); *Informes* (filters, drill-down, CSV); *Auditoría*; the chip shows "Administrador · Plataforma" |
| **Coordinador · Miembro** (`coord@dev.local`) | Pick a role on first access; the chip switches between "Coordinador · Fundación Luz" and "Miembro · Mesa Fe 01"; sees only Fundación Luz (no other organization anywhere); *Invitaciones* → *Invitar* |
| **Facilitador** (`facil@dev.local`) | Run `bash scripts/dev-open-session.sh`, then *Inicio* → *Abrir sesión*: pass attendance (*Marcar a todos Presente*), *Abrir seguimiento*, answer yours with *Responder yo*, *Abrir valor actual*, *Cerrar respuestas*, *Cerrar sesión* |
| **Miembro (Ana / Luis / Marta)** | In a second browser profile or private window: *Sesión* follows the facilitator live; answer follow-up, reflection (score 5 is blocked) and commitment; turn the network off in DevTools (Network → Offline) and keep answering, then go back online: the answers upload and, if the session was already closed, show "Sincronizado tarde" |
| **Crear cuenta de prueba nueva** | A signed-in account without an invitation: *Tengo un código de invitación* → `MESA34` (member of Esperanza 03; only the first account to use it succeeds). `VENC22` / `REVK23` / `ACEP24` show the expired / revoked / used messages |

Use two different browsers (or one normal and one private window) for facilitator + member: both keep
their own session. Everything above is also automated in [tool/e2e](tool/e2e/README.md).

### Deploying

What has to exist before a real environment works. Nothing here is committed: values are Supabase
secrets, build-time `--dart-define`s or provider consoles. [`.env.example`](.env.example) lists the
variable names.

1. **Supabase project** (hosted). `supabase link --project-ref <ref>` then `supabase db push`
   (migrations only: `supabase/seed.sql` is development data and must not run in production). Enable
   `pg_cron` and `pg_net` (the KPI refresh and notification jobs are scheduled by the migrations).
   Deploy the functions: `supabase functions deploy` (each has `verify_jwt = false` in
   `supabase/config.toml`; they verify tokens themselves).
2. **First administrator.** There is no seed in production. Sign in once with the church staff
   account (it answers "No encontramos tu cuenta"), then in the SQL editor link it as platform admin:
   ```sql
   with staff as (
     insert into public.people (organization_id, auth_user_id, first_name, last_name, email, status)
     select null, u.id, 'Nombre', 'Apellido', u.email, 'active'
     from auth.users u where u.email = 'staff@example.org'
     returning id)
   insert into public.role_assignments (person_id, role, organization_id)
   select id, 'platform_admin', null from staff;
   ```
3. **Auth providers** (Authentication → Providers): Google, Apple, Facebook with their client ids and
   secrets (see [Social sign-in credentials](#social-sign-in-credentials)). Site URL = the web app's
   public URL; additional redirect URLs = the web origin and `io.goldroundtables.app://login-callback`
   (mobile). Disable "Allow new users to sign up with email" and do not build with `DEV_AUTH=true`.
4. **PowerSync.** PowerSync Cloud or self-hosted (`docker/powersync/powersync.yaml` is the template):
   point it at the Supabase **direct** Postgres connection, create the replication role and the
   `powersync` publication (the migrations create the publication; the role is
   `scripts/setup-powersync-replication.sh` with a real password), upload `powersync/sync-rules.yaml`,
   and set the client-auth JWKS to `https://<ref>.supabase.co/auth/v1/.well-known/jwks.json`
   (audience `authenticated`). Its public URL becomes `POWERSYNC_URL` in the web/mobile build.
5. **Edge Function secrets** (`supabase secrets set …`): `APP_PUBLIC_URL` (invite links),
   `ALLOWED_ORIGINS` (the web origin, not `*`), `CRON_SECRET` (long random; the cron jobs send it as
   `x-cron-secret`), `FCM_SERVICE_ACCOUNT_JSON` (one line). The anonymous invite preview is rate
   limited server-side (20 per address and 300 in total per minute, `429` + `Retry-After`).
6. **Push (FCM).** A Firebase project: web app config (`FIREBASE_*` defines + VAPID key), Android
   `google-services.json`, iOS `GoogleService-Info.plist` and APNs key; the service account JSON from
   step 5. Without it notifications are skipped, the rest works.
7. **Web hosting.** `flutter build web --release --base-href / --dart-define=SUPABASE_URL=… --dart-define=SUPABASE_ANON_KEY=… --dart-define=POWERSYNC_URL=… --dart-define=APP_ENV=production` (optional `--dart-define=ERROR_REPORT_URL=…`, see [docs/operations.md](docs/operations.md))
   (the anon key is public; never the service-role key). Serve `build/web` over HTTPS with the
   headers of `docker/web/nginx.conf` (`application/wasm`, no SPA fallback for assets, no-cache for
   `index.html` and the service worker). The compose `web` image builds exactly that.
8. **Mobile.** `flutter build apk|appbundle|ipa` with the same defines, signing keys, and the OAuth
   native client ids (Google Android/iOS client ids, Apple Sign in capability, Facebook app id).
9. **Before go-live**: run `scripts/smoke.sh`-style checks against the deployed URLs, create the first
   organization and coordinator from the admin screens, test an invitation on a real phone.

### Troubleshooting
- **PowerSync cannot reach Supabase** (`ECONNREFUSED`, `ENOTFOUND host.docker.internal`): on Docker
  Desktop `host.docker.internal` works out of the box; on Linux the compose file adds it through
  `extra_hosts`. If your setup differs set `DOCKER_HOST_ALIAS` and `POWERSYNC_JWKS_URI` in `.env`
  (e.g. `172.17.0.1`). Test from a container:
  `docker compose exec powersync node -e "fetch(process.env.PS_JWKS_URI).then(r=>console.log(r.status))"`.
- **`password authentication failed for user "powersync_role"`**: run
  `bash scripts/setup-powersync-replication.sh` (it re-applies the password from `.env`).
- **Port already in use** (3000, 8080, 54321–54324): stop the other process or change
  `WEB_PORT` / `POWERSYNC_PORT` in `.env`. If you change `WEB_PORT`, Supabase Auth only accepts
  redirects for 3000 unless you add the origin to `additional_redirect_urls`.
- **PowerSync says the replication slot is gone/invalid or replication is stuck** (typically after
  `supabase db reset` run by hand): `bash scripts/dev-down.sh --purge && bash scripts/dev-up.sh`.
  To drop a stale slot manually:
  `docker exec supabase_db_gold-roundtables psql -U postgres -c "select pg_drop_replication_slot(slot_name) from pg_replication_slots where slot_name like 'powersync%' and not active"`.
  Inactive slots retain WAL; `scripts/dev-status.sh` shows how much.
- **Sync works but the app shows no data**: `bash scripts/smoke.sh` runs the same stream the app
  opens. If it passes, the problem is in the client (token, `POWERSYNC_URL` compiled into the build).
  Rebuild after changing `.env` (`dev-up.sh`).
- **Old web bundle in the browser**: assets are served with `Cache-Control: no-cache`; if a rebuild still
  looks stale, hard-reload the tab.
- **Docker web build is slow or fails**: use `bash scripts/dev-up.sh --local-web`. The Flutter image is
  multi-arch (native on Apple Silicon); the first build downloads the Flutter SDK layers.
- **Edge Functions return 404/500**: functions are served by the Supabase CLI (`supabase start`);
  logs: `docker logs -f supabase_edge_runtime_gold-roundtables`.

## License
[MIT](LICENSE)
