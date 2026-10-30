# Flutter conventions

How to build a feature on the Gold Roundtables Flutter foundation. [AGENTS.md](../../AGENTS.md)
holds the architecture rules; this document shows how they map onto the code in `lib/core` and
`lib/app`. Read both before writing code.

## 1. Daily commands

```bash
flutter pub get
./tool/codegen.sh          # gen-l10n + build_runner (freezed, json, injectable, retrofit, drift)
./tool/check.sh            # flutter analyze + flutter test (must pass before every commit)
./tool/setup_web.sh        # only after upgrading powersync / sqlite_async / sqlite3_web
```

Run against the local stack (ports from [PLAN.md](PLAN.md)):

```bash
flutter run -d chrome --web-port 3000 \
  --dart-define=SUPABASE_URL=http://127.0.0.1:54321 \
  --dart-define=SUPABASE_ANON_KEY=<anon or publishable key from `supabase status`> \
  --dart-define=POWERSYNC_URL=http://127.0.0.1:8080 \
  --dart-define=DEV_AUTH=true \
  --dart-define=APP_ENV=local
```

Every define is optional. Without `SUPABASE_*` the app starts signed out and remote calls fail
with a clear `StateError`. Without `POWERSYNC_URL` the local database still opens, but nothing
replicates. Firebase push (all platforms) needs `FIREBASE_API_KEY`, `FIREBASE_MESSAGING_SENDER_ID`,
`FIREBASE_PROJECT_ID`, the platform's app id (`FIREBASE_WEB_APP_ID`, `FIREBASE_ANDROID_APP_ID`,
`FIREBASE_IOS_APP_ID`) and, on web, `FIREBASE_VAPID_KEY` (details in `mobile.md`). Without them push is off and the app still
starts (`FirebaseBootstrap.isAvailable == false`).

`AppConfig` (`lib/core/config/app_config.dart`) is the only reader of `--dart-define`. Use
`AppConfig.devAuthCompiledIn` (a compile-time constant) to guard the dev sign-in, so builds without
`DEV_AUTH=true` drop that code.

## 2. What the foundation provides

| Area | Location | Use it for |
|---|---|---|
| DI | `core/config/injection.dart` | `getIt`, `configureDependencies()` (generated `injection.config.dart`) |
| Config | `core/config/app_config.dart` | Supabase/PowerSync URLs, env, dev-auth flag |
| Constants | `core/constants/` | `AppLimits` (9 seats, invite code length, 24 h unsynced), API header/envelope keys, `DioNames` |
| Shared models | `core/models/` | `UserRole`, `SessionStage`, `AttendanceStatus`, `AssessmentKind`, `SyncState`, `HealthStatus` (`@JsonValue` + `wireValue` / `tryParse`), `ScoreRules` |
| Form rules | `core/form_rules/` | `AppFieldKind`, `FieldValidators`, `FieldTransformers`, `FieldFormatters`, `PhoneDisplayFormatter`, `FieldError` |
| Network | `core/network/` | Named Dio instances, `AuthInterceptor`, `ApiException`, `guardApiCall`, `ApiException.userMessage(l10n)` |
| Routing | `core/routing/` | `FeatureRouter`, `ShellDestination`, `AuthRedirectGuard`, `AppRouter`, `AppPageTransitions`, `context.popOrGo`, `RouteQueryKeys` |
| Services | `core/services/` | `ClockService`, `IdGenerator`, `ConnectivityService`, `SessionContextService`, `AuthStateSource`, `AuthTokenProvider`, `FirebaseBootstrap`, `ExternalLinkService`, `ShareService`, `AppLog` |
| Sync | `core/sync/` | `SyncDatabase`, `SyncSchemaContribution`, `SyncUploader`, `SyncStatusService`, `WatchSyncStatusUseCase`, `PowerSyncDriftMigration` |
| Theme | `core/theme/` | `AppTheme.light/dark`, `AppColors`, `StatusColors`, `AppTextStyles`, `AppSpacing`, `AppRadii`, `AppSizes`, `AppLayout`, `Contrast` |
| Widgets | `core/widgets/` | See §9 |
| Extensions | `core/extensions/` | `context.l10n/colors/statusColors/textStyles/textTheme/layout`, `String.initials`, `GoRouterState.extraAs<T>()` |
| Composition root | `lib/app/` | `bootstrap.dart`, `app.dart`, `app_module.dart`, `feature_registry.dart` |

Shared use cases already exist: `WatchConnectivityUseCase`, `WatchSyncStatusUseCase`,
`WatchSessionContextUseCase`. Cubits inject them like any other use case.

## 3. Adding a feature

### 3.1 Folder template

```
lib/features/<feature>/
  <feature>_routes.dart              paths, param keys, query keys
  <feature>_router.dart              class <Feature>FeatureRouter extends FeatureRouter
  presentation/pages/<page>/
    <page>_page.dart
    cubit/<page>_cubit.dart
    cubit/<page>_state.dart
    widgets/                         page-only public widgets
  domain/
    models/                          Freezed models
    services/<capability>_service.dart     abstract interface class
    use_cases/<area>/<action>_use_case.dart
  data/
    client/<feature>_client.dart     Retrofit
    datasources/<feature>_remote_data_source.dart
    datasources/<feature>_local_data_source.dart   (offline-first features only)
    services/<capability>_service_impl.dart
test/features/<feature>/{domain,data,presentation}/
```

Create only the folders you need.

### 3.2 Register the feature (the only edit outside your folder)

`lib/app/feature_registry.dart` is the composition root for features. Add one line per list:

```dart
List<FeatureRouter> buildFeatureRouters(AppConfig config) => [
  ShellFeatureRouter(includeComponentGallery: !config.isProduction),
  const InvitesFeatureRouter(),            // ← your line
];

const List<SyncSchemaContribution> syncSchemaContributions = [
  SessionSyncSchema(),                     // ← session feature only
];
```

The home feature replaces `appHomeLocation` and the shell placeholder's home route. When it does,
delete `lib/features/shell/presentation/pages/home` and keep the dev gallery route.

### 3.3 Routes and router

```dart
abstract final class InvitesRoutes {
  static const String redeem = '/invitacion';
  static const String codeParam = 'code';
  static const String redeemWithCode = '$redeem/:$codeParam';
}

class InvitesFeatureRouter extends FeatureRouter {
  const InvitesFeatureRouter();

  @override
  List<RouteBase> get routes => [
    GoRoute(
      path: InvitesRoutes.redeemWithCode,
      pageBuilder: (context, state) => AppPageTransitions.slideUp(
        state: state,
        child: BlocProvider(
          create: (_) => getIt<RedeemInviteCubit>()
            ..load(state.pathParameters[InvitesRoutes.codeParam]!),
          child: const RedeemInvitePage(),
        ),
      ),
    ),
  ];

  @override
  List<String> get publicLocations => [InvitesRoutes.redeem];
}
```

- `shellRoutes` render inside the app shell. `AppScaffold` shows the bottom bar (phone), the
  rail (tablet) or the sidebar (desktop) automatically when two or more destinations are visible.
  `routes` are full-screen, outside the shell.
- `destinations` add navigation entries. Use `roles: {UserRole.coordinator}` to limit them to a
  role and `order` to position them. The shell filters by the active `SessionContext` role.
- `publicLocations` stay reachable while signed out. Sub-paths match too.
- **Auth feature only:** override `signInLocation`. Until a router declares it, the guard lets
  everything through. Once it is declared, signed-out users go to
  `<signIn>?from=<location>`, and after sign-in they return to `from` (same-app paths only) or
  home. Read `RouteQueryKeys.from`.
- Pass typed objects as `extra` and read them with `state.extraAs<MyExtra>()`. Extras are lost on
  a browser refresh, so always fall back to path or query parameters.
- Every page needs a way out. `AppScaffold(backFallbackLocation: ...)` shows a back button that
  pops or goes to the fallback. Full-screen flows use `AppCloseButton`; sheets made with
  `AppDialogs.showSheet` already include one.

### 3.4 Cubit and state

```dart
// redeem_invite_state.dart
@freezed
sealed class RedeemInviteState with _$RedeemInviteState {
  const factory RedeemInviteState.loading() = RedeemInviteLoading;
  const factory RedeemInviteState.preview(InvitePreview invite) = RedeemInvitePreview;
  const factory RedeemInviteState.failure(ApiException error) = RedeemInviteFailure;
}

// redeem_invite_cubit.dart
@injectable
class RedeemInviteCubit extends Cubit<RedeemInviteState> {
  RedeemInviteCubit(this._previewInvite) : super(const RedeemInviteState.loading());

  final PreviewInviteUseCase _previewInvite;   // use cases only

  Future<void> load(String code) async {
    emit(const RedeemInviteState.loading());
    try {
      emit(RedeemInviteState.preview(await _previewInvite(code)));
    } on ApiException catch (error) {
      emit(RedeemInviteState.failure(error));
    }
  }
}
```

Cancel owned `StreamSubscription`s in `close()`; `HomeCubit` in `lib/features/shell` is the
reference. Cubits are `@injectable` factories, and routes resolve them with `getIt<...>()` inside
`BlocProvider(create: ...)`. That is the only service-locator call allowed in widgets.

In widgets, show errors with `error.userMessage(context.l10n)` or with feature-specific copy for
known `error.code`s.

### 3.5 Use case

```dart
@injectable
class PreviewInviteUseCase {
  const PreviewInviteUseCase(this._invites);

  final InviteService _invites;

  Future<InvitePreview> call(String code) => _invites.preview(code);
}
```

### 3.6 Domain service contract and data implementation

```dart
// domain/services/invite_service.dart — no Dio/Retrofit/Supabase/Drift types
abstract interface class InviteService {
  Future<InvitePreview> preview(String code);
}

// data/services/invite_service_impl.dart
@LazySingleton(as: InviteService)
class InviteServiceImpl implements InviteService {
  InviteServiceImpl(this._remote);

  final InvitesRemoteDataSource _remote;

  @override
  Future<InvitePreview> preview(String code) => _remote.preview(code);
}
```

Do not put `@disposeMethod` on a class registered `as:` an interface. The generated code calls
the method on the interface type and the web build fails.

### 3.7 Retrofit client and remote data source

```dart
// data/client/invites_client.dart
@lazySingleton
@RestApi()
abstract class InvitesClient {
  @factoryMethod
  factory InvitesClient(@Named(DioNames.edgeFunctions) Dio dio) = _InvitesClient;

  @POST('/invites-preview')
  Future<InvitePreview> preview(@Body() Map<String, dynamic> body);
}

// data/datasources/invites_remote_data_source.dart
@lazySingleton
class InvitesRemoteDataSource {
  InvitesRemoteDataSource(this._client);

  final InvitesClient _client;

  Future<InvitePreview> preview(String code) =>
      guardApiCall(() => _client.preview({'code': code}));
}
```

- `DioNames.edgeFunctions` → `<SUPABASE_URL>/functions/v1`; `DioNames.postgrest` →
  `<SUPABASE_URL>/rest/v1`. Both send `apikey` and `Authorization: Bearer <jwt>`, and on a 401 they
  refresh once and retry.
- `guardApiCall` turns `DioException` into `ApiException` (`kind`, `code`, `message`,
  `statusCode`). It reads the Edge Function envelope `{ "error": { "code", "message" } }` and
  PostgREST's `{ "code", "message" }`.
- Keep Freezed models, Retrofit clients and Drift databases in separate files (as in the
  folder template). A Drift database and a `json_serializable` model in one library break
  generation ("Could not resolve annotation").
- Retrofit deserializes Freezed models directly. JSON is snake_case by default (`build.yaml`), so
  `@JsonKey` is needed only for exceptions.
- Online-only screens (admin, invites, KPIs) show `OfflineBanner(detail:
  l10n.offlineDetailOnlineOnly, onRetry: ...)` when `WatchConnectivityUseCase` reports offline.

### 3.8 Offline-first data (session feature)

There is one PowerSync database. Feature Drift databases are typed views onto it.

1. Declare the PowerSync tables. Never declare `id`; PowerSync adds it as a text UUID.

   ```dart
   class SessionSyncSchema implements SyncSchemaContribution {
     const SessionSyncSchema();

     @override
     List<Table> get tables => const [
       Table('attendance', [
         Column.text('session_id'),
         Column.text('member_id'),
         Column.text('status'),            // AttendanceStatus.wireValue
         Column.text('device_created_at'),
         Column.integer('synced_late'),    // 0/1
       ]),
     ];
   }
   ```

   Then add `SessionSyncSchema()` to `syncSchemaContributions`.

2. Declare a Drift database over the same tables. Drift must not create tables:

   ```dart
   @DriftDatabase(tables: [AttendanceRows])
   class SessionDriftDatabase extends _$SessionDriftDatabase {
     SessionDriftDatabase(SyncDatabase db) : super(db.createDriftConnection());

     @override
     int get schemaVersion => 1;            // always 1; schema lives in PowerSync

     @override
     MigrationStrategy get migration => PowerSyncDriftMigration.strategy;
   }
   ```

   Register it with a `@module` (`@lazySingleton SessionDriftDatabase db(SyncDatabase s) => ...`)
   and use it only from the local data source. `SyncDatabase.open()` runs at bootstrap before
   any UI, so `createDriftConnection()` is safe from then on.

3. Writes: create the UUID with `IdGenerator`, set `device_created_at` with
   `ClockService.nowUtc()`, write in a Drift transaction, and let watch streams update the UI.
   PowerSync queues the CRUD operation.

4. Uploads: implement `SyncUploader` in the session data layer
   (`@LazySingleton(as: SyncUploader)`), sending the batch to `sync-upload` through Retrofit, and
   **delete `lib/core/sync/data/queue_only_sync_uploader.dart`**. The session feature co-owns
   `lib/core/sync/**`. Contract: return normally only after the server commits. Throw
   `SyncUploadRejected` for permanent validation failures (logged and dropped so they cannot
   block the queue). Throw anything else to retry later.

5. Pending state: `SyncStatusService.watch()` → `SyncSnapshot` (`connection`, `uploading`,
   `downloading`, `pendingCount`, `lastSyncedAt`, `pendingSince`, `hasStalePending` after 24 h,
   `aggregateState`). `pendingSince` lives in the local-only table `local_sync_state`, so it
   survives restarts.

6. Sign-in/out lifecycle (`SyncLifecycle`): when signed out, sync **disconnects but keeps**
   local data and unsent changes, which upload when the same user signs in again. When a
   **different** user signs in, the device is cleared first (`local_sync_state.owner_user_id`),
   so one user's data is never shown to another. An explicit "remove my data from this device"
   action may call `SyncDatabase.disconnect(clearLocalData: true)` through a use case. That
   deletes unsent changes too, so confirm first when `pendingCount > 0`.

### 3.9 Auth, context and sessions

- `supabase_flutter` is initialized in `bootstrap.dart`. The auth feature uses the injected
  `SupabaseClient` for sign-in and sign-out (OAuth, dev email/password), behind its own
  `AuthService` contract.
- `SupabaseAuthSession` (core) observes the Supabase session and exposes it as
  `AuthStateSource` (drives the router guard and `SyncLifecycle`) and `AuthTokenProvider` (Dio and
  PowerSync). The auth feature does not need to touch these classes.
- `SessionContextService` holds the active role/context, and `AppShellCubit` filters
  destinations by its role. The default `InMemorySessionContextService` does not persist. The
  auth/context feature may replace it: add a persisted `@LazySingleton(as:
  SessionContextService)` implementation in its own folder and remove the annotation from the
  in-memory class (a one-line edit in core; report it).

### 3.10 Localization

- Add strings to `lib/l10n/app_es.arb` (the only locale and the template), then run
  `./tool/codegen.sh`. Use `context.l10n.myKey`. Plurals and placeholders use ICU syntax; see
  `syncPendingCount`.
- Prefix keys by feature (`invitesRedeemTitle`, `sessionStageOpenCta`). Common keys (`action*`,
  `error*`, `sync*`, `role*`, `stage*`, `attendance*`, `score*`, `validation*`) are already defined.
- To keep ARB merges easy, add your keys as one contiguous block at the end of the file.

### 3.11 Forms

```dart
FormBuilder(
  key: _formKey,                            // one key per screen form
  child: Column(children: [
    AppTextFormField(name: 'name', label: l10n.fieldName,
        kind: AppFieldKind.personName, required: true),
    AppTextFormField(name: 'phone', label: l10n.fieldPhone, kind: AppFieldKind.phone),
    AppDropdownFormField<String>(name: 'country', label: ..., items: [...]),
    AppCounterFormField(name: 'seats', label: ..., min: 2, max: AppLimits.maxTableSeats),
    AppScoreFormField(name: 'score', label: l10n.scoreLabel),
    AppCheckboxFormField(name: 'consent', label: ..., mustBeChecked: true),
  ]),
)
// submit: if (_formKey.currentState!.saveAndValidate()) cubit.submit(_formKey.currentState!.value);
```

Saved values are already normalized by the kind (lower-case email, E.164 phone, uppercase invite
code). Never write regexes or validators in screens. Extend `AppFieldKind` / `FieldValidators`
instead and add a test in `test/core/form_rules`.

### 3.12 Testing

- Cubits: `bloc_test` with fake services or fake use cases and deterministic streams. See
  `test/features/shell/home_cubit_test.dart` and `test/core/routing/app_shell_cubit_test.dart`.
- Mocks: `mocktail` (`class MockInviteService extends Mock implements InviteService {}`).
- Widgets: `import '../../core/helpers/pump_app.dart';` then `await tester.pumpApp(widget)`.
  It wraps the widget in the themed, Spanish app.
- Remote data sources: a Dio instance with a fake `HttpClientAdapter`, as in
  `test/core/network/auth_interceptor_test.dart`.
- `test/core/config/injection_test.dart` resolves the DI graph. Add your key types there if you
  change the bootstrap path.

## 4. Naming

- Files are `snake_case`. One public class per file, except a Freezed union and its variants.
- `<Action>UseCase` (`RecordAttendanceUseCase`), `<Capability>Service` +
  `<Capability>ServiceImpl`, `<Feature>RemoteDataSource`, `<Feature>LocalDataSource`,
  `<Feature>Client`, `<Page>Page`, `<Page>Cubit`, `<Page>State`, `<Feature>Routes`,
  `<Feature>FeatureRouter`.
- Route paths are Spanish and user-facing (`/invitacion`, `/mesas/:tableId`). Identifiers in code
  are English.
- No repositories (AGENTS.md §1).

## 5. Generated code policy

Generated files **are committed**: `*.g.dart`, `*.freezed.dart`,
`lib/core/config/injection.config.dart` and `lib/l10n/gen/*`. That way every agent and CI can build
right after checkout. Never edit them by hand.

On a merge conflict in a generated file, accept either side, then run `./tool/codegen.sh` and
commit the result. `injection.config.dart` is regenerated from the annotations, so the merged
sources always win.

`build_runner` ≥ 2.15 replaces conflicting outputs on its own (the old
`--delete-conflicting-outputs` flag was removed), so `tool/codegen.sh` does not pass it.

## 6. Theme and responsive rules

- Colours come from `context.colors` (surfaces, ink, accent, border) and `context.statusColors`
  (`of(StatusTone)`). Never write hex values in features.
- Text comes from `context.textTheme` (heavy headings: `displaySmall` 30/900 for screen titles,
  `headlineMedium` 26/900, `titleLarge` 20/900; body 16/14; `bodySmall` muted) and
  `context.textStyles` (`kicker`, `pill`, `number` / `numberLarge` with tabular figures,
  `primaryAction`). Never use raw `fontSize`.
- Spacing uses `AppSpacing` (4-point scale plus page paddings), radii use `AppRadii`, and sizes
  use `AppSizes` (44 px minimum target, 48 px controls, 56 px primary action).
- Layout: `context.layout` → `AppLayout.phone` (< 600) / `tablet` (600–1024) / `desktop`
  (> 1024). `ResponsiveBreakpoints` is configured with the same values (`AppBreakpoints`).
  `flutter_screenutil` is initialized with a 390×844 design frame but is reserved for the rare
  geometric layouts (e.g. the RoundTable seat ring). Do not scale text or spacing with `.sp/.w`.
- Status is never colour-only: pair each `StatusTone` with its line style (`tone.lineStyle`:
  dotted pending, dashed offline/late, double error) and an icon. `StatusBorderPainter` draws
  dashed, dotted and double borders and rings.
- Contrast: `test/core/theme/contrast_test.dart` checks the key token pairs in both themes. Add
  a pair when you introduce a new foreground/background combination.

## 7. Web specifics

- PowerSync on web needs `web/sqlite3.wasm` and `web/powersync_db.worker.js`. Both are committed.
  The worker is **compiled from our lockfile** (`tool/setup_web.sh` → `tool/web/powersync_db_worker.dart`).
  The prebuilt worker from the PowerSync 2.5.0 release spoke an older `sqlite_async` protocol and
  failed with `No enum value with that name: "installBroadcastUpdates"`. Re-run the script after
  any sqlite/powersync upgrade.
- The local database file is `gold_roundtables.db` (OPFS on web).
- URLs use Flutter's default hash strategy (`/#/dev/galeria`), so any static server works
  without SPA rewrites. Switching to path URLs needs a server fallback to `index.html`.
- Web push needs a `firebase-messaging-sw.js` service worker. The notifications feature adds it.

## 8. Dev component gallery

`/#/dev/galeria` (`?tema=oscuro|claro` forces a theme) lists every shared widget. It is
registered only when `APP_ENV` is not `production`, and it is public so reviewers can open it
without signing in. When you add or extend a shared widget, add it to the gallery.

## 9. Shared widgets

| Widget | Use | Snippet |
|---|---|---|
| `AppScaffold` | Every page: app bar, back button, responsive shell navigation, `banner`, `bottomBar` dock | `AppScaffold(title: l10n.x, backFallbackLocation: '/', body: ...)` |
| `AppButton` | Main and secondary actions; variants `primary` (gradient), `secondary`, `danger`, `offline`, `ghost`; sizes small/medium/large; `fullWidth`, `icon`, `loading` | `AppButton(label: l10n.actionContinue, onPressed: cubit.next)` |
| `AppTextButton` | Low-emphasis actions and links | `AppTextButton(label: l10n.actionRetry, onPressed: ...)` |
| `AppIconButton` | Icon-only actions; `tooltip` is required (it is the accessible label); `filled` variant for docks | `AppIconButton(icon: Icons.share_rounded, tooltip: l10n.actionShare, onPressed: ...)` |
| `AppBackButton` / `AppCloseButton` | Exits with localized tooltips | `AppCloseButton(onPressed: () => context.popOrGo(home))` |
| `AppCard` | Surface container, optional `onTap`, `highlighted` | `AppCard(child: ...)` |
| `AppAvatar` | Initials with a stable colour; optional `ringTone` for seat status | `AppAvatar(name: m.name, size: 60, ringTone: StatusTone.offline)` |
| `StatusPill` | Status label: tinted fill, line style, icon | `StatusPill(tone: StatusTone.pending, label: l10n.syncPending)` |
| `SyncPill` | Pending / syncing / synced / synced late, with an optional detail line; `.compact` | `SyncPill(state: snapshot.aggregateState, detail: l10n.syncPendingCount(n))` |
| `RoleChip` | Role icon and name; `RoleChip.labelFor(context, role)` | `RoleChip(role: UserRole.facilitator)` |
| `ContextChip` | Header context switcher (static when `onTap` is null) | `ContextChip(role: ctx.role, contextName: ctx.tableName!, onTap: ...)` |
| `AppChip` | Filter / saved-view chip with optional count | `AppChip(label: ..., selected: s, count: 3, onSelected: cubit.toggle)` |
| `SeatPips` | Seat meter n/9 (over capacity in red) | `SeatPips(taken: 7)` |
| `ScoreGrid` | 1–10 picker, 5 locked and explained, 54 px keys | `ScoreGrid(value: v, onChanged: cubit.pick)` |
| `OfflineBanner` | "Sin conexión · …" + Reintentar; pass as `AppScaffold.banner` | `OfflineBanner(detail: l10n.offlineDetailOnlineOnly, onRetry: cubit.retry)` |
| `AppMessage` | Inline info / warning / error box | `AppMessage(tone: StatusTone.info, title: l10n.x)` |
| `AppToast` | Brief confirmation or error (from a `BlocListener`) | `AppToast.show(context, l10n.toastSaved, kind: AppToastKind.success)` |
| `AppDialogs` | `confirm(...)` → `Future<bool>`; `showSheet(...)` with title and close | `if (await AppDialogs.confirm(context, message: ..., destructive: true)) ...` |
| `Skeleton` / `SkeletonList` | Loading placeholders (respect reduced motion) | `const SkeletonList(count: 3)` |
| `EmptyState` / `ErrorState` | Empty lists and load failures with an action / Reintentar | `ErrorState(message: e.userMessage(l10n), onRetry: cubit.load)` |
| `AppDataTable<T>` | Sortable admin grid with row selection; cards on phone | `AppDataTable(columns: [...], rows: rows, phoneCardBuilder: ...)` |
| `NotFoundPage` | Router fallback (already wired) | — |
| Form fields | `AppTextFormField`, `AppDropdownFormField`, `AppCheckboxFormField`, `AppCounterFormField`, `AppScoreFormField` | §3.11 |

Import everything with `import 'package:gold_roundtables/core/widgets/widgets.dart';` or import
single files. Extend a shared widget instead of forking it into a feature.

## 10. Decisions and deviations

- **Composition lists instead of multi-registration DI.** Routers and sync schema contributions
  are listed in `lib/app/feature_registry.dart`. injectable 3 can enable GetIt multi-registration,
  but that would silently accept duplicate registrations of every type (for example a second
  `SyncUploader`).
- **Core use cases.** Cross-cutting use cases (`Watch*UseCase`) sit next to their contract in
  `lib/core` because several features' Cubits need them.
- **`AppShellCubit` in core.** The shell needs the active role, so it follows the Cubit → use case
  rule inside `core/routing/app_shell`.
- **`form_builder_validators` not added.** All validation is centralized in
  `core/form_rules` with localized messages, so the package would be unused.
- **Shared enum wire values** (`administrator`, `follow_up`, `synced_late`, …) are provisional.
  Reconcile them with `docs/implementation/api-contract.md` when the backend lands.
- **QR scanning.** `qr_flutter` renders codes everywhere. `mobile_scanner` 7 is installed for
  camera scanning; it also has a web implementation. The invites feature should still offer the
  code-entry path on web and desktop, where cameras are unreliable, and handle permission denial.

## 11. Auth & context (auth + invites features)

**Reading the active context (all tracks).** `SessionContextService` (core) is the one contract:
`current` / `watch()` / `WatchSessionContextUseCase`. `SessionContext` carries `role`, `personId`
(the `people.id` to use as `person_id` in session writes), `organizationId/Name`, `tableId/Name`.
The app registers `PersistedSessionContextService` (auth feature, SharedPreferences): the choice
survives restarts and works offline (the account is cached per user). Never write to it from other
features; the auth feature sets it on sign-in and clears it on sign-out. `AuthTokenProvider.userId`
is the auth user id. Prefer `watch()`: `current` is `null` for a moment right after launch.

**Sign-in redirect.** The auth feature declares `signInLocation = /ingresar`. After the core guard,
`AuthFeatureRouter.redirect` (new `FeatureRouter.redirect` / `redirectRefreshStreams` hook) sends a
signed-in identity by `AccessState`: loading or blocked (no role, deactivated, unknown account,
offline first sign-in) → `/acceso`; several roles and no remembered choice → `/contexto`;
`ready` → the wanted location (`?from=`) or `appHomeLocation`. `/invitacion/**` and `/dev/**` are
exempt so the invite flow can finish. Do not add your own sign-in checks.

**Routes owned here.** `/ingresar`, `/acceso`, `/contexto`, `/cuenta` (no nav entry; settings has
the sign-out), `/invitacion` (code), `/invitacion/escanear`, `/invitacion/<code>` (deep link;
`/invite/<code>` redirects), `/invitaciones` (manager, destination for admin/coordinator/facilitator),
`/invitaciones/nueva`, `/invitaciones/<id>/compartir`. Prefer `context.go` over `push` when leaving
the sign-in area: pushed pages do not move the redirect guard's base location.

**Widgets.** `ContextSwitcher` (auth/presentation/widgets) is the header chip: bottom sheet on
phones, anchored menu on tablet/desktop, static with one context. Put it in `AppScaffold.actions`.
`showSignOutSheet(context)` runs the unsynced-data warning (sync first / keep / erase); settings'
`SignOutService` delegates to `AuthService.signOut`.

**Sign-in methods.** `--dart-define=AUTH_METHODS=email,google,…` (default `email`, ADR 0018)
chooses what the gate shows: an email + password form (sign in, "Crear cuenta", "¿Olvidaste tu
contraseña?") and/or the provider buttons. Email flows go through `EmailAuthService`; the reset
email links to `/#/nueva-contrasena` (`ResetPasswordPage`), which the access guard keeps the person
on while a recovery is pending.

**Dev sign-in.** With `--dart-define=DEV_AUTH=true` the gate shows chips for the seeded users and
"Crear cuenta de prueba nueva" (a fresh email/password account that stands in for a new provider
identity when redeeming invites locally). Real provider buttons use `signInWithOAuth`; they need the
credentials listed in api-contract.md §1 and these redirect URLs allowed in Supabase:
`<app origin>/**` (web) and `io.goldroundtables.app://login-callback` (mobile).

**Testing.** Tests that build the DI graph must set
`SharedPreferencesAsyncPlatform.instance = InMemorySharedPreferencesAsync.empty()`.
