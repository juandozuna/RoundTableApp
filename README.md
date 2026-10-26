# Gold Roundtables

A multi-tenant app for running weekly "mesas redondas", the values-formation program of
Iglesia Casa del Altísimo. Facilitators run sessions and members record attendance, self-scores,
reflections and commitments on their own phones, even without internet. Organizations, the church
and coordinators follow progress through KPI dashboards.

## Status
Design and architecture phase. No application code yet.

- Architecture decisions: [docs/adr](docs/adr/README.md)
- Contributor and agent rules: [AGENTS.md](AGENTS.md)
- UI prototypes (open in a browser): [docs/design/prototypes](docs/design/prototypes)

## Planned stack
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
| `bash scripts/dev-up.sh --no-web` | backend only, for `flutter run -d chrome --web-port 3000 --dart-define=…` |

Seed times are relative to the last reset (Mesa Esperanza 03's pending session is "today, one hour
after the reset"), so run `dev-reset.sh` when the demo data feels stale. Variables are documented
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
