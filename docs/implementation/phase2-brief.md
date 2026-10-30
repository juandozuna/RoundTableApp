# Phase 2 — shared brief for feature agents

You implement ONE feature track of the Flutter app, against the finished backend and foundation.
Read, in this order: `AGENTS.md` (architecture rules, mandatory), `docs/implementation/flutter-conventions.md`
(how to add a feature; follow its templates), `docs/implementation/api-contract.md` (routes, tables,
enums, error codes, dev users), `docs/implementation/PLAN.md`, and the prototype(s) named in your
task under `docs/design/prototypes/` (the UI spec: layout, states, copy, "Mesa en vivo" look; open
the HTML and read its markup/CSS/JS; use the shared widgets in `lib/core/widgets` instead of
re-creating components).

## Rules
- Stay inside the paths you own. Register your feature with ONE line each in
  `lib/app/feature_registry.dart` (router, sync schema). Other shared edits (core, pubspec, ARB):
  smallest change possible; list them in your report.
- Spanish UI strings in ARB only (`lib/l10n/app_es.arb`; put yours in a clearly commented block with
  a feature prefix on every key to avoid merge conflicts, e.g. `auth_...`).
- Generated files are committed; run `tool/codegen.sh` after changing annotated code. The parent
  re-runs codegen after merging, so conflicts in generated files are not your problem.
- Do not hand-edit generated files. Tests: bloc_test + mocktail for Cubits/use cases/services
  (Drift/PowerSync were removed in ADR 0019). `flutter analyze` must be clean and
  `flutter test` must pass before you finish.
- Online-only features show the shared OfflineBanner and disable writes when offline.
- No secrets. No new dependencies unless unavoidable (justify in the report).
- Commit in logical commits on your branch; do NOT push, open PRs, or merge — the parent merges.
- Do not stop at a skeleton: implement every screen/state in your prototype(s) end to end against the
  real backend contract (use the dev users). Where a real backend call is impossible locally
  (social providers, FCM) implement the real call behind the service contract and make the local
  dev path work.
- Verification: build web (`flutter build web --release` per conventions), and where the local
  stack is needed, you MAY run `supabase start` + `supabase db reset` (Docker is available; leave it
  stopped at the end) and drive the web build with headless Chrome (puppeteer-core installed outside
  the repo, e.g. in /tmp) to confirm your main flow with the seeded dev users. If the stack is
  unusable, say exactly what remains unverified.

## Report (concise)
Commits, what screens/flows are implemented vs prototype gaps, verification evidence, shared files
you touched, risks, anything other tracks must know.
