# AGENTS.md — Gold Roundtables

Agent and contributor instructions for this repository. Decisions behind these rules are recorded
in [docs/adr](docs/adr/README.md). Requirements live in the RoundTables Obsidian vault (notes 00–07).

## 0. Project context

- One Flutter app for Android, iOS and web (ADR 0001), role-based navigation for Administrator,
  Coordinator, Facilitator and Member.
- Backend: Supabase — Postgres + RLS, Auth, Edge Functions (TypeScript), pg_cron (ADR 0002).
- Sign-in: Google, Apple and Facebook only; no phone/SMS login (ADR 0007).
- Offline-first only for the session domain; administration, invites and KPI dashboards are
  documented online-only exceptions (ADR 0003).
- Local persistence and sync: PowerSync + Drift on mobile and web (ADR 0004).
- Remote access: `supabase_flutter` for Auth only; Retrofit → Edge Functions for uploads and admin
  writes; Retrofit → PostgREST for online reads (ADR 0008).
- Push: Firebase Cloud Messaging (ADR 0009).
- Business invariants: score is an integer 1–10 and 5 is not allowed; a table has at most 9
  people including the facilitator, who also answers as a participant (ADR 0014); follow-up happens once, in the next session; organizations never see each
  other's data.

## 1. Architectural foundation

Use a feature-first, layered architecture.

Each feature is a vertical slice containing:
- Presentation: pages, widgets, Cubits, and presentation state.
- Domain: models, validation, use cases, and abstract service contracts.
- Data: service implementations, local data sources, remote data sources, and HTTP clients.

Place genuinely shared infrastructure and reusable UI in `lib/core`.

Runtime flow:

```
Widget
  → Cubit
    → Use case
      → Domain service contract
        → Data service implementation
          → Local data source (Drift over the PowerSync database)
          → Remote data source
            → Retrofit client
```

Distinguish runtime flow from source-code dependencies:
- Presentation depends on domain.
- Data implements contracts defined by domain.
- Domain does not depend on presentation or data implementations.
- The application composition root connects contracts to implementations.

The domain layer must remain independent of Flutter, Drift, PowerSync, Supabase, Dio, Retrofit,
and platform plugins.

Do not create repository interfaces or repository implementations. This architecture uses domain
service contracts and data service implementations instead.

## 2. Directory structure

```
lib/
  core/
    config/                 Dependency injection and application configuration
    constants/              Shared constants
    extensions/             Shared language and framework extensions
    form_rules/             Field kinds, validation, formatting, transformation
    gen/                    Generated asset references
    models/                 Genuinely shared models
    network/                Shared HTTP (Dio, interceptors) and connectivity infrastructure
    sync/                   PowerSync database, connector, sync status
    object_storage/         Shared storage infrastructure
    routing/                Router composition and transition helpers
    services/               Cross-cutting service abstractions and implementations
    theme/                  Colors, typography, theme configuration
    widgets/
      form_fields/          Shared FormBuilder controls
      ...                   Shared buttons, scaffolds, images, feedback

  features/
    <feature>/
      <feature>_routes.dart
      <feature>_router.dart

      presentation/
        pages/
          <page>/
            <page>_page.dart
            cubit/
              <page>_cubit.dart
              <page>_state.dart
            widgets/
        widgets/
        cubit/

      domain/
        models/
        services/
          <capability>_service.dart
        use_cases/
          <area>/
            <action>_use_case.dart

      data/
        client/
          <feature>_client.dart
        datasources/
          <feature>_local_data_source.dart
          <feature>_remote_data_source.dart
        services/
          <capability>_service_impl.dart

  l10n/
    <localization>.arb

test/
  core/
  features/
    <feature>/
      domain/
      data/
      presentation/

supabase/
  migrations/               SQL schema, RLS policies, constraints, rollups
  functions/                Edge Functions (TypeScript)
powersync/
  sync-rules.yaml           PowerSync sync rules (part of the security perimeter)
```

Keep small features small. Do not create empty abstractions or speculative infrastructure merely
to fill this tree.

## 3. Technology stack

- flutter_bloc with Cubit for presentation state.
- Freezed for domain/API models and Cubit state.
- json_serializable for JSON serialization.
- GetIt and injectable for dependency injection.
- Dio and Retrofit for HTTP.
- PowerSync for replication; Drift (drift_sqlite_async) for typed queries and reactive watches.
- supabase_flutter for authentication only.
- firebase_messaging for push.
- go_router for navigation.
- flutter_form_builder and shared form controls for forms.
- Flutter localization with ARB resources.
- A centralized responsive layout system: responsive_framework and flutter_screenutil.
- UUIDs for device-created entity identifiers.
- build_runner for generated code.
- flutter_test, bloc_test, and mocktail for tests.

Choose mutually compatible versions. Do not add unrelated dependencies.

## 4. Presentation and Cubit boundaries

Cubit is the application's presentation state-management method.

A Cubit constructor accepts use cases only.

A Cubit may:
- Manage presentation state.
- Guard presentation actions.
- Invoke use cases.
- Subscribe to use-case streams.
- Map results and failures into presentation state.
- Manage the lifetime of its subscriptions.

A Cubit must reach business rules, persistence, network calls, platform integrations, and domain
transformations through use cases.

Widgets:
- Obtain Cubits through BlocProvider.
- Invoke Cubit methods.
- Render state.
- Own UI actions such as navigation, opening dialogs, and displaying feedback.

Widgets must not resolve or call use cases, services, data sources, HTTP clients, or databases
directly. The only permitted service-locator use inside a widget is resolving a Cubit factory to
construct a BlocProvider.

Use BlocBuilder, BlocSelector, BlocListener, or BlocConsumer according to whether the widget needs
rendering, UI side effects, or both. Do not perform I/O from a build method.

## 5. Cubit state

- Keep each Cubit's state in a separate Freezed `*_state.dart` file
  (e.g. `session_capture_cubit.dart` + `session_capture_state.dart`).
- Use immutable state and descriptive fields or variants.
- Represent the loading, content, error, and action states the feature needs. Do not add state
  variants that have no actual behavior.
- Keep domain decisions out of state classes.
- Cancel owned stream subscriptions when the Cubit closes.

## 6. Use cases

Each use case represents exactly one action.
- Exactly one use case per file, one public `call(...)` entry point.
- Group related use cases by area under `domain/use_cases/`.
- Depend on a domain service contract or another use case.
- Do not depend on a repository, data source, Retrofit client, Drift/PowerSync database, or
  concrete data service implementation.
- Do not place unrelated helpers or mappers inside use-case files.

Prefer precise names: `WatchTableSessionsUseCase`, `SubmitCurrentValueScoreUseCase`,
`RecordAttendanceUseCase`, `RedeemInviteUseCase`. Do not create a `SessionUseCase` class containing
multiple unrelated operations.

A use-case boundary exception requires a concrete reason showing the abstraction is infeasible or
harmful. Keep it narrow and document its rationale next to the dependency.

## 7. Domain service contracts

Define abstract service contracts in `domain/services/`. A contract describes what a capability
does, without exposing infrastructure details (e.g. a stream of locally available sessions,
recording attendance, submitting a score, observing pending-sync state).

Its public interface must not expose Drift tables or row types, SQL, PowerSync types, Dio
responses or exceptions, Retrofit clients, Supabase types, or platform-plugin types.

Keep each contract focused on one capability. The implementation belongs in `data/services/` and
implements the domain contract.

## 8. Offline-first data flow (session domain)

The session domain (attendance, follow-up score, reflection answers, current score, commitment)
is offline-first. The local database supplies application data; the server synchronizes it.

PowerSync owns replication (ADR 0004). This replaces the hand-written `isSynced` /
merge-on-refresh orchestration:

Entity creation and writes:
1. Generate a UUID on the device.
2. Write locally through the Drift local data source, in a transaction for related rows.
3. Set `lastModified` / `device_created_at`.
4. The change is published through the existing Drift watch stream.
5. PowerSync queues the CRUD operation; pending state is read from PowerSync's queue and sync
   status, exposed through a domain contract — never as a widget concern.
6. When online, the PowerSync connector's `uploadData` calls the service implementation, which
   sends the batch through the remote data source (Retrofit → `sync-upload` Edge Function).
7. The server keeps the same entity ID; uploads are idempotent by UUID.

Reads:
- Return local data or a local watch stream immediately; PowerSync downloads server changes and
  the Drift watch stream emits them. Do not make the UI poll or reload after writes.

Conflict protection:
- A download must not overwrite local changes that are still waiting to upload.
- Late answers are accepted and flagged `synced_late`; a member's submission marks them present
  (ADR 0005).
- Keep sync and conflict policy in domain rules, data orchestration and the Edge Function — away
  from widgets.

Live-server-authoritative exceptions (documented in ADR 0003): administration (organizations,
locations, tables, users, roles), invites, and KPI dashboards. They call the server through remote
data sources and show an explicit offline state. Do not silently extend these exceptions to other
features.

## 9. Data-layer responsibilities

Remote data source:
- Calls the feature's Retrofit client (Edge Functions or PostgREST, ADR 0008).
- Does not access Drift or PowerSync.

Local data source:
- Reads and writes Drift over the PowerSync database.
- Exposes reactive list/detail queries with `watch()`.
- Does not make network requests.

Service implementation:
- Implements the domain service contract.
- Coordinates local and remote data sources; only it coordinates both.

Keep Drift↔domain mapping on focused entity extensions such as `toModel()` and `toDrift()`.
Keep database migrations, PowerSync sync rules, seeding and rollback paths documented and tested
when changed.

## 10. Models and serialization

Use Freezed for domain/API models: immutable properties, typed enums for finite domain values,
`@JsonValue` for serialized enum values, `fromJson`, `@JsonKey` where external field names
require it. Retrofit deserializes Freezed models directly; do not add a hand-written inbound DTO
plus mapper layer when the Freezed model can represent the contract.

Generated parts:

```dart
part '<file>.freezed.dart';
part '<file>.g.dart'; // only when JSON serialization is generated
```

No `.properties.dart` generator exists in this project; do not declare that part.

## 11. Dependency injection and code generation

Use injectable with GetIt. Register data service implementations against their domain service
contracts. Preserve constructor boundaries:
- Widget → Cubit.
- Cubit → use cases only.
- Use case → domain service contract or another use case.
- Data service implementation → relevant infrastructure collaborators.

Place each DI annotation directly above the class it configures; never insert another declaration
between an annotation and its class.

After modifying annotated classes or generated models:
1. Run the code-generation script `tool/codegen.sh` (build_runner; the old --delete-conflicting-outputs flag no longer exists).
2. Inspect generated DI registration for changed or added classes.
3. Confirm startup resolves the dependency graph.

Do not manually edit generated files.

## 12. Shared UI and design system

Create and reuse: `AppScaffold`, `AppButton`, `AppTextButton`, `AppIconButton`, shared FormBuilder
fields, shared snackbar/banner components, a shared stored-file image viewer, and a shared
sync-status indicator. Feature UI uses these instead of ad-hoc raw Material controls. For inline
actions support `fullWidth: false` and optional icons. Extend a shared control rather than
duplicating it per feature.

Centralize colors, typography, spacing and sizing, interaction states, loading and error
presentation, and responsive behavior. Verify foreground/background contrast; prefer `on*` colors.
Use TextTheme styles and font-size tokens, not raw `fontSize` values. Support phones, tablets and
desktop web, touch and pointer input. Users are non-technical: large targets, plain language,
guided steps (RNF-11..15).

For substantial visual or interaction design, consult product references (Mobbin) when available.

## 13. Widget composition

- Split large widget trees with private `_build...` methods (`_buildHeader()`, `_buildContent()`,
  `_buildActions()`, `_buildEmptyState()`).
- Do not add private StatelessWidget subclasses merely to split a local subtree.
- Create a separate public widget when it is reused across files or needs its own State.
- Extract multi-clause visibility/enablement expressions into named private getters
  (`_canSubmit`, `_showsRetry`, `_isEditingAllowed`).
- Use collection if/for/spread when it expresses composition clearly.

## 14. Forms and input rules

- Build every form with FormBuilder and shared controls: `AppTextFormField`,
  `AppDropdownFormField`, `AppCheckboxFormField`, `AppCounterFormField`, and a shared score picker
  that enforces 1–10 without 5.
- One form key per screen form; `saveAndValidate()` for explicit submissions.
- Centralize validators, formatters and transformers under `lib/core/form_rules/`, selected through
  an `AppFieldKind` abstraction. No screen-specific regexes, formatters or repeated validators.
- Phone numbers are international (multiple countries) contact data, not a login: store E.164
  unverified, format per country centrally.
- Autosave and draft persistence must not be blocked by final-submission validation unless the
  feature requires it.

## 15. Routing and exit behavior

- go_router. Feature routes in `*_router.dart`; paths and parameter keys in a feature `*Routes`
  class; shared transitions under `lib/core/routing/`.
- Typed `extra` objects, not ad-hoc maps.
- Every destination has an explicit way to leave (scaffold back, close on dialogs/sheets, return
  from overlays) with localized tooltips, and a sensible fallback when there is nothing to pop.
- Verify exit behavior as part of navigation testing.

## 16. Constants and localization

- Do not inline repeatable identifiers that producers and consumers must match (route and query
  keys, storage keys, JSON field references, event and notification names, protocol ids). Update
  every producer and consumer.
- All user-facing text lives in ARB resources (Spanish first, ADR 0011).
- Retrofit annotation values (`@GET`, `@POST`, `@Query`, `@Path`, `@Headers`, `@Field`, …) may stay
  inline.

## 17. Files, media, and platform services

Hide platform plugins and external services behind focused abstractions, reached through
Widget → Cubit → Use case → service. Keep FCM transport, background workers, Supabase and REST
details out of presentation and domain. Keep raw network-image rendering inside the shared image
viewer.

## 18. Clean code and SOLID

- One responsibility per class and function; small functions named for intent.
- Guard clauses and early exits; a flat happy path; precise domain names.
- Reuse before adding abstractions; no duplicated services, controls or use cases.
- No vague names (`process`, `do`, `handle`) when a domain verb exists; no comments that repeat the
  code; keep comments that explain intent, constraints or trade-offs.
- Apply SOLID: separate UI, use cases, network, persistence and sync; extend abstractions instead of
  duplicating them; implementations satisfy their contracts; focused contracts; outer layers
  depend on domain abstractions.

## 19. Scope and agent workflow

- Do the requested task and its required implementation and verification steps; no unrelated
  cleanups, broad refactors, dependency upgrades or formatting changes. Ask before editing outside
  the requested scope.
- Before adding a type, search for an existing abstraction that can carry the behavior.
- If `graphify-out/` exists, use `graphify query|path|explain` before raw searching, read exact
  source to verify, and run `graphify update .` after changes.
- Delivery workflow: this repository has no ticket system and does not use pull requests. Commit
  small, coherent changes with clear messages and push them directly to `main`. Short-lived
  local branches or worktrees are fine for parallel work, but merge them into `main` locally and
  push; do not open PRs.

## 20. Verification and definition of done

Do not claim implementation is complete until the application is proven to build and start.
1. Regenerate code after changing DI annotations, Freezed models, Retrofit clients or JSON models.
2. Confirm changed/added dependencies appear in generated DI registration.
3. Run `flutter analyze` and resolve errors.
4. Run tests for the touched behavior (bloc_test with deterministic fixtures for Cubits).
5. Build at least one target (`flutter build apk --debug`, `flutter build ios --debug --no-codesign`,
   `flutter build web`).
6. Launch the app and confirm startup completes with no GetIt errors.
7. Verify the changed user flow, including exit/back behavior.
8. For Supabase changes: test RLS and PowerSync sync rules per role, so no cross-tenant read is
   possible.
9. Update Graphify last when the project uses it.

Test meaningful behavior: use-case and service contracts, local persistence and reactive emissions,
protection of pending local changes, sync success and failure, late-sync flagging, migrations,
navigation, and platform integrations with fakes or mocks.

If a required check cannot run, state exactly what remains unverified.

## 21. Execution and delivery

Establish the relevant existing structure first, implement the smallest complete feature slice,
preserve every boundary above, add shared foundations only when required, complete generation,
tests, build and startup checks, and report what changed, how it was verified and any remaining
limitations.
