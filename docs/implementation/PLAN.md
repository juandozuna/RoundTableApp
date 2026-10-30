# Implementation plan

Goal: finish the complete code implementation of Gold Roundtables, then add the Docker dependencies
needed to run the whole stack locally. Deployment comes later; for now everything is tested in the
browser (Flutter web build against the local stack).

Source of truth: [AGENTS.md](../../AGENTS.md) (architecture rules), [ADRs](../adr/README.md),
prototypes in [docs/design/prototypes](../design/prototypes) (visual language "Mesa en vivo").
Requirements: the RoundTables Obsidian vault (notes 00–07) and the ADRs. Spanish UI copy.

## Workflow (no tickets, no PRs)
- Push directly to `main`. Parallel children work in their own git worktree/branch; the parent
  merges their branches into `main` and pushes. Children commit on their own branch only; they do
  not push and do not open PRs.
- Commit trailer: `Co-Authored-By: Claude <noreply@anthropic.com>` is fine; keep messages short.
- Stay inside the paths you own (see table). If you need a change in another owner's path, make the
  smallest change necessary and report it.

## Ownership map
| Area | Paths | Phase |
|---|---|---|
| Backend | `supabase/`, `docs/implementation/api-contract.md` | 1 |
| Flutter foundation | `pubspec.yaml`, `analysis_options.yaml`, `lib/main*.dart`, `lib/core/**`, `lib/l10n/**`, `web/`, `android/`, `ios/`, `test/core/**`, `tool/` | 1 |
| Feature: auth + invites + context | `lib/features/auth/**`, `lib/features/invites/**`, `test/features/auth/**`, `test/features/invites/**` | 2 |
| Feature: session (facilitator board + member flow, offline) | `lib/features/session/**`, `lib/core/sync/**` (extend), `test/features/session/**` | 2 |
| Feature: admin + KPIs + audit | `lib/features/admin/**`, `lib/features/kpis/**`, `lib/features/audit/**`, tests | 2 |
| Feature: notifications + settings + home shell | `lib/features/notifications/**`, `lib/features/home/**`, `lib/features/settings/**`, tests | 2 |
| Docker / local stack | `docker/`, `docker-compose*.yml`, `scripts/`, `.env.example`, `README.md` (run instructions) | 3 |

## Local stack conventions (all phases must agree)
- Supabase local via Supabase CLI (`supabase start`): API `http://127.0.0.1:54321`, DB
  `postgresql://postgres:postgres@127.0.0.1:54322/postgres`, Studio `54323`.
- No PowerSync service (removed, ADR 0019): the app reads PostgREST under RLS and writes through
  Edge Functions. User tokens are ES256-signed (`/auth/v1/.well-known/jwks.json`), not HS256.
- Flutter web build served on `http://127.0.0.1:3000`.
- Config reaches the Flutter app only through `--dart-define` values: `SUPABASE_URL`,
  `SUPABASE_ANON_KEY`, `DEV_AUTH` (true only for local testing), `APP_ENV`.
- Social login (Google/Apple/Facebook) cannot be exercised locally without provider credentials.
  Local testing uses a **dev sign-in** (Supabase email+password users seeded per role) that is
  compiled in only when `DEV_AUTH=true`. The real provider buttons stay in the UI and call
  `signInWithOAuth`/native flows; document what credentials they need in the README.
- Seeded dev users (password `dev-password-123`): `admin@dev.local` (platform admin),
  `coord@dev.local` (coordinator of "Fundación Luz"), `facil@dev.local` (facilitator of
  "Mesa Esperanza 03"), `ana@dev.local`, `luis@dev.local`, `marta@dev.local` (members).

## Phases
1. Backend (schema, RLS, constraints, rollups, seed, edge functions, API
   contract) and Flutter foundation, in parallel.
2. Feature tracks in parallel, against the backend contract.
3. Docker/local stack, then end-to-end browser testing and fixes.
