# Gold Roundtables

A multi-tenant app for running weekly "mesas redondas", the values-formation program of
Iglesia Casa del Altísimo. Facilitators run sessions and members record attendance, self-scores,
reflections and commitments on their own phones (online for now; offline capture is planned, ADR 0019). Organizations, the church
and coordinators follow progress through KPI dashboards.

## Status
The app is implemented end to end (auth and invites, live session, administration,
KPIs, audit, notifications, settings) and verified in the browser against the full local stack
(Supabase + the Flutter web build). Real social sign-in, push delivery and the Android /
iOS builds still need provider credentials or devices; see [Deploying](#deploying).

- Architecture decisions: [docs/adr](docs/adr/README.md)
- Contributor and agent rules: [AGENTS.md](AGENTS.md)
- Backend contract: [docs/implementation/api-contract.md](docs/implementation/api-contract.md)
- UI prototypes (open in a browser): [docs/design/prototypes](docs/design/prototypes)
- End-to-end browser tests: [tool/e2e](tool/e2e/README.md)

## Stack
Flutter (Android, iOS, web) · Supabase (Postgres + RLS, Auth, Edge Functions) · Firebase Cloud Messaging. The app is online
only for now: PostgREST reads under RLS, writes through the `sync-upload` Edge Function, an offline
outbox later (ADR 0019).

## Running locally

The whole app runs on your machine: Supabase (Postgres, Auth, Edge Functions) through the Supabase
CLI, plus the Flutter web build in Docker (`docker-compose.yml`). Supabase is **not**
in the compose file.

### Prerequisites
- Docker (Desktop on macOS/Windows, Engine on Linux) with `docker compose` v2.
- [Supabase CLI](https://supabase.com/docs/guides/cli) ≥ 2.
- `curl`, and Node ≥ 18 for `tool/e2e` (optional).
- Flutter 3.41.x on the host only for `--local-web` / `flutter run`; the Docker web build brings its
  own Flutter.

### One command
```bash
bash scripts/dev-up.sh
```
It starts Supabase if needed (migrations + seed on first start), builds the web app in Docker and
serves it. The first run pulls images and takes a few minutes; later runs take about a minute.

| What | URL |
|---|---|
| Web app | http://127.0.0.1:3000 |
| Supabase API (Auth, REST, Edge Functions) | http://127.0.0.1:54321 |
| Supabase Studio · Mailpit | http://127.0.0.1:54323 · http://127.0.0.1:54324 |

Open the web app on exactly `http://127.0.0.1:3000` or `http://localhost:3000` (the only origins
allowed by Supabase Auth redirects and CORS). The app uses hash routing, so deep links look like
`http://127.0.0.1:3000/#/invite/MESA34`.

### Signing in
Google, Apple and Facebook cannot work locally without provider credentials (see below). The web
build made by these scripts is compiled with `DEV_AUTH=true`, which adds the quick-login chips for
the dev users, and with `AUTH_METHODS=email,google,apple,facebook` so every sign-in method is on
screen (production builds default to `AUTH_METHODS=email`, ADR 0018). Email + password works locally
too: create an account from the sign-in screen (local Supabase auto-confirms; reset emails land in
Mailpit). Password for every dev user: `dev-password-123`.

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
| `bash scripts/dev-status.sh` | containers and endpoints |
| `bash scripts/smoke.sh` | Supabase REST (under RLS, as `facil@dev.local`) + Edge Functions + dev login, web assets |
| `bash scripts/dev-down.sh` | stops the web containers (`--purge` also removes compose volumes, `--with-supabase` stops Supabase) |
| `bash scripts/dev-reset.sh` | **wipes** the local database (`supabase db reset`), re-seeds |
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

### Curriculum import

The 48 values and questions in the seed are placeholders. Load the church's real content with
`node scripts/import-curriculum.mjs <file.json>` (idempotent, validates 5 modules / 10-10-10-10-8
values and refuses partial files). Format and rules: `supabase/curriculum/curriculum.example.json`
and [docs/implementation/curriculum-import.md](docs/implementation/curriculum-import.md).

### Resetting data
`bash scripts/dev-reset.sh` (asks for confirmation; `--yes` skips it). The Supabase stack may be
shared between worktrees: tell the others before you reset it.

### How the pieces connect
- The app reads through PostgREST with the user's Supabase JWT (RLS decides what is visible) and
  writes through the `sync-upload` and admin Edge Functions (ADR 0008, 0019). There is no
  replication service and no local database.
- The web image (`docker/web/Dockerfile`) builds `flutter build web --release` with the
  `--dart-define`s `SUPABASE_URL`, `SUPABASE_ANON_KEY` (read from `supabase status -o env`),
  `DEV_AUTH`, `APP_ENV` and serves it with nginx (gzip, SPA fallback, real 404s for missing
  assets so a broken asset path is visible).
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
| **Miembro (Ana / Luis / Marta)** | In a second browser profile or private window: *Sesión* follows the facilitator live; answer follow-up, reflection (score 5 is blocked) and commitment; turn the network off in DevTools (Network → Offline): the app says it is offline and refuses the write without losing what you typed; go back online and send it again |
| **Crear cuenta de prueba nueva** | A signed-in account without an invitation: *Tengo un código de invitación* → `MESA34` (member of Esperanza 03; only the first account to use it succeeds). `VENC22` / `REVK23` / `ACEP24` show the expired / revoked / used messages |

Use two different browsers (or one normal and one private window) for facilitator + member: both keep
their own session. Everything above is also automated in [tool/e2e](tool/e2e/README.md).

### Deploying

What has to exist before a real environment works. Nothing here is committed: values are Supabase
secrets, build-time `--dart-define`s or provider consoles. [`.env.example`](.env.example) lists the
variable names.

**Scripted path:** [docs/deployment.md](docs/deployment.md) is the end-to-end runbook (Supabase →
secrets → web → auth providers → smoke test) with `scripts/deploy-hosted.sh`,
`scripts/build-web.sh` (Firebase Hosting `roundtable-v1.web.app`, Cloudflare Pages or the
`docker/web` image) and `scripts/smoke-hosted.sh`, all driven by `deploy/hosted.env`
(template: [`deploy/hosted.env.example`](deploy/hosted.env.example)). The list below is the manual
equivalent.

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
   secrets (see [Social sign-in credentials](#social-sign-in-credentials)); they are only needed for
   the methods listed in `AUTH_METHODS`. Production signs in with **email + password** (ADR 0018):
   Authentication → Providers → Email enabled, "Allow new users to sign up" **on**, "Confirm email"
   **off** until custom SMTP exists, minimum password length 8. Site URL = the web app's public URL;
   additional redirect URLs = the web origin (`<origin>/**` also covers the password-reset link
   `<origin>/#/nueva-contrasena`) and `io.goldroundtables.app://login-callback` (mobile). Do not
   build with `DEV_AUTH=true`.
4. **Edge Function secrets** (`supabase secrets set …`): `APP_PUBLIC_URL` (invite links),
   `ALLOWED_ORIGINS` (the web origin, not `*`), `CRON_SECRET` (long random; the cron jobs send it as
   `x-cron-secret`), `FCM_SERVICE_ACCOUNT_JSON` (one line). The anonymous invite preview is rate
   limited server-side (20 per address and 300 in total per minute, `429` + `Retry-After`).
5. **Push (FCM).** A Firebase project: web app config (`FIREBASE_*` defines + VAPID key), Android
   `google-services.json`, iOS `GoogleService-Info.plist` and APNs key; the service account JSON from
   step 4. Without it notifications are skipped, the rest works.
6. **Web hosting.** `flutter build web --release --base-href / --dart-define=SUPABASE_URL=… --dart-define=SUPABASE_ANON_KEY=… --dart-define=APP_ENV=production` (optional `--dart-define=ERROR_REPORT_URL=…`, see [docs/operations.md](docs/operations.md))
   (the anon key is public; never the service-role key). Serve `build/web` over HTTPS with the
   headers of `docker/web/nginx.conf` (no SPA fallback for assets, no-cache for
   `index.html` and the service worker). The compose `web` image builds exactly that.
7. **Mobile.** `flutter build apk|appbundle|ipa` with the same defines, signing keys, and the OAuth
   native client ids (Google Android/iOS client ids, Apple Sign in capability, Facebook app id).
8. **Before go-live**: run `scripts/smoke.sh`-style checks against the deployed URLs, create the first
   organization and coordinator from the admin screens, test an invitation on a real phone.

### Troubleshooting
- **Port already in use** (3000, 54321–54324): stop the other process or change
  `WEB_PORT` in `.env`. If you change `WEB_PORT`, Supabase Auth only accepts
  redirects for 3000 unless you add the origin to `additional_redirect_urls`.
- **The app shows no data**: `bash scripts/smoke.sh` checks the same PostgREST read the app does as
  `facil@dev.local`. If it passes, the problem is in the client (token, `SUPABASE_URL` compiled into
  the build). Rebuild after changing `.env` (`dev-up.sh`).
- **Hosted database still has `powersync_role`** (older deployments): migration
  `20261101000000_drop_powersync.sql` drops it with the `powersync` publication; if `postgres` is
  not allowed to, run `drop owned by powersync_role; drop role powersync_role;` in the SQL editor
  and delete any PowerSync Cloud instance.
- **Old web bundle in the browser**: assets are served with `Cache-Control: no-cache`; if a rebuild still
  looks stale, hard-reload the tab.
- **Docker web build is slow or fails**: use `bash scripts/dev-up.sh --local-web`. The Flutter image is
  multi-arch (native on Apple Silicon); the first build downloads the Flutter SDK layers.
- **Edge Functions return 404/500**: functions are served by the Supabase CLI (`supabase start`);
  logs: `docker logs -f supabase_edge_runtime_gold-roundtables`.

## License
[MIT](LICENSE)
