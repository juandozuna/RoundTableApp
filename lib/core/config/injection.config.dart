// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

import '../../app/app_module.dart' as _i431;
import '../../features/auth/data/auth_data_module.dart' as _i468;
import '../../features/auth/data/client/account_client.dart' as _i86;
import '../../features/auth/data/datasources/account_remote_data_source.dart'
    as _i393;
import '../../features/auth/data/services/access_session_service_impl.dart'
    as _i301;
import '../../features/auth/data/services/account_service_impl.dart' as _i958;
import '../../features/auth/data/services/dev_auth_service_impl.dart' as _i43;
import '../../features/auth/data/services/local_data_service_impl.dart'
    as _i375;
import '../../features/auth/data/services/persisted_session_context_service.dart'
    as _i561;
import '../../features/auth/data/services/shared_prefs_access_store.dart'
    as _i481;
import '../../features/auth/data/services/supabase_auth_service.dart' as _i738;
import '../../features/auth/domain/services/access_session_service.dart'
    as _i656;
import '../../features/auth/domain/services/access_store.dart' as _i869;
import '../../features/auth/domain/services/account_service.dart' as _i887;
import '../../features/auth/domain/services/auth_service.dart' as _i59;
import '../../features/auth/domain/services/dev_auth_service.dart' as _i82;
import '../../features/auth/domain/services/local_data_service.dart' as _i785;
import '../../features/auth/domain/use_cases/access/refresh_access_use_case.dart'
    as _i648;
import '../../features/auth/domain/use_cases/access/select_context_use_case.dart'
    as _i62;
import '../../features/auth/domain/use_cases/access/watch_access_state_use_case.dart'
    as _i662;
import '../../features/auth/domain/use_cases/sign_in/create_dev_account_use_case.dart'
    as _i569;
import '../../features/auth/domain/use_cases/sign_in/sign_in_with_dev_password_use_case.dart'
    as _i314;
import '../../features/auth/domain/use_cases/sign_in/sign_in_with_provider_use_case.dart'
    as _i492;
import '../../features/auth/domain/use_cases/sign_in/watch_auth_failures_use_case.dart'
    as _i563;
import '../../features/auth/domain/use_cases/sign_in/watch_signed_in_user_use_case.dart'
    as _i411;
import '../../features/auth/domain/use_cases/sign_out/sign_out_and_erase_local_data_use_case.dart'
    as _i411;
import '../../features/auth/domain/use_cases/sign_out/sign_out_use_case.dart'
    as _i349;
import '../../features/auth/presentation/cubit/access_cubit.dart' as _i660;
import '../../features/auth/presentation/pages/sign_in/cubit/sign_in_cubit.dart'
    as _i596;
import '../../features/auth/presentation/pages/sign_out/cubit/sign_out_cubit.dart'
    as _i327;
import '../../features/auth/presentation/routing/access_redirect_guard.dart'
    as _i393;
import '../../features/invites/data/client/invite_directory_client.dart'
    as _i111;
import '../../features/invites/data/client/invites_client.dart' as _i956;
import '../../features/invites/data/datasources/invite_directory_remote_data_source.dart'
    as _i558;
import '../../features/invites/data/datasources/invites_remote_data_source.dart'
    as _i723;
import '../../features/invites/data/services/flutter_clipboard_service.dart'
    as _i41;
import '../../features/invites/data/services/invite_attempts_service_impl.dart'
    as _i291;
import '../../features/invites/data/services/invite_directory_service_impl.dart'
    as _i526;
import '../../features/invites/data/services/invite_service_impl.dart' as _i66;
import '../../features/invites/domain/services/clipboard_service.dart' as _i914;
import '../../features/invites/domain/services/invite_attempts_service.dart'
    as _i160;
import '../../features/invites/domain/services/invite_directory_service.dart'
    as _i838;
import '../../features/invites/domain/services/invite_service.dart' as _i686;
import '../../features/invites/domain/use_cases/manage/create_invite_use_case.dart'
    as _i532;
import '../../features/invites/domain/use_cases/manage/list_invites_use_case.dart'
    as _i276;
import '../../features/invites/domain/use_cases/manage/load_invite_targets_use_case.dart'
    as _i816;
import '../../features/invites/domain/use_cases/manage/load_organization_tables_use_case.dart'
    as _i930;
import '../../features/invites/domain/use_cases/manage/renew_invite_use_case.dart'
    as _i569;
import '../../features/invites/domain/use_cases/manage/revoke_invite_use_case.dart'
    as _i138;
import '../../features/invites/domain/use_cases/redeem/get_remaining_attempts_use_case.dart'
    as _i836;
import '../../features/invites/domain/use_cases/redeem/parse_invite_code_use_case.dart'
    as _i86;
import '../../features/invites/domain/use_cases/redeem/preview_invite_use_case.dart'
    as _i641;
import '../../features/invites/domain/use_cases/redeem/redeem_invite_use_case.dart'
    as _i289;
import '../../features/invites/domain/use_cases/share/copy_text_use_case.dart'
    as _i790;
import '../../features/invites/domain/use_cases/share/load_invite_use_case.dart'
    as _i677;
import '../../features/invites/domain/use_cases/share/open_whatsapp_use_case.dart'
    as _i200;
import '../../features/invites/domain/use_cases/share/read_clipboard_text_use_case.dart'
    as _i627;
import '../../features/invites/domain/use_cases/share/share_invite_text_use_case.dart'
    as _i648;
import '../../features/invites/presentation/pages/code_entry/cubit/code_entry_cubit.dart'
    as _i106;
import '../../features/invites/presentation/pages/form/cubit/invite_form_cubit.dart'
    as _i174;
import '../../features/invites/presentation/pages/manager/cubit/invites_manager_cubit.dart'
    as _i931;
import '../../features/invites/presentation/pages/redeem/cubit/redeem_cubit.dart'
    as _i832;
import '../../features/invites/presentation/pages/scan/cubit/scan_cubit.dart'
    as _i69;
import '../../features/invites/presentation/pages/share/cubit/share_cubit.dart'
    as _i995;
import '../../features/shell/presentation/pages/home/cubit/home_cubit.dart'
    as _i1048;
import '../network/auth_token_provider.dart' as _i84;
import '../network/network_module.dart' as _i200;
import '../routing/app_router.dart' as _i282;
import '../routing/app_shell/cubit/app_shell_cubit.dart' as _i1002;
import '../routing/feature_router.dart' as _i878;
import '../services/auth_session/auth_session_module.dart' as _i139;
import '../services/auth_session/auth_state_source.dart' as _i997;
import '../services/auth_session/supabase_auth_session.dart' as _i171;
import '../services/clock/clock_service.dart' as _i508;
import '../services/clock/system_clock_service.dart' as _i799;
import '../services/connectivity/connectivity_service.dart' as _i1015;
import '../services/connectivity/connectivity_service_impl.dart' as _i916;
import '../services/connectivity/watch_connectivity_use_case.dart' as _i17;
import '../services/external_links/external_link_service.dart' as _i162;
import '../services/external_links/external_link_service_impl.dart' as _i146;
import '../services/firebase/firebase_bootstrap.dart' as _i1068;
import '../services/firebase/firebase_bootstrap_impl.dart' as _i326;
import '../services/id/id_generator.dart' as _i246;
import '../services/id/uuid_id_generator.dart' as _i766;
import '../services/services_module.dart' as _i553;
import '../services/session_context/session_context_service.dart' as _i523;
import '../services/session_context/watch_session_context_use_case.dart'
    as _i434;
import '../services/share/share_service.dart' as _i245;
import '../services/share/share_service_impl.dart' as _i827;
import '../sync/data/pending_since_tracker.dart' as _i383;
import '../sync/data/powersync_sync_database.dart' as _i405;
import '../sync/data/powersync_sync_status_service.dart' as _i858;
import '../sync/data/queue_only_sync_uploader.dart' as _i495;
import '../sync/data/sync_database.dart' as _i924;
import '../sync/data/sync_lifecycle.dart' as _i863;
import '../sync/data/sync_schema.dart' as _i915;
import '../sync/data/sync_uploader.dart' as _i529;
import '../sync/domain/sync_status_service.dart' as _i1020;
import '../sync/domain/watch_sync_status_use_case.dart' as _i318;
import 'app_config.dart' as _i609;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final servicesModule = _$ServicesModule();
    final appCompositionModule = _$AppCompositionModule();
    final authDataModule = _$AuthDataModule();
    final authSessionModule = _$AuthSessionModule();
    final networkModule = _$NetworkModule();
    gh.factory<_i86.ParseInviteCodeUseCase>(
      () => const _i86.ParseInviteCodeUseCase(),
    );
    gh.singleton<_i609.AppConfig>(() => servicesModule.appConfig);
    gh.lazySingleton<_i915.SyncSchemaRegistry>(
      () => appCompositionModule.syncSchemaRegistry,
    );
    gh.lazySingleton<_i895.Connectivity>(() => servicesModule.connectivity);
    gh.lazySingleton<_i460.SharedPreferencesAsync>(
      () => authDataModule.sharedPreferences,
    );
    gh.lazySingleton<_i914.ClipboardService>(
      () => _i41.FlutterClipboardService(),
    );
    gh.lazySingleton<_i523.SessionContextService>(
      () => _i561.PersistedSessionContextService(
        gh<_i460.SharedPreferencesAsync>(),
      ),
    );
    gh.lazySingleton<_i869.AccessStore>(
      () => _i481.SharedPrefsAccessStore(gh<_i460.SharedPreferencesAsync>()),
    );
    gh.lazySingleton<_i82.DevAuthService>(
      () => _i43.DevAuthServiceImpl(gh<_i609.AppConfig>()),
    );
    gh.lazySingleton<_i508.ClockService>(() => _i799.SystemClockService());
    gh.lazySingleton<_i245.ShareService>(() => _i827.ShareServiceImpl());
    gh.factory<_i569.CreateDevAccountUseCase>(
      () => _i569.CreateDevAccountUseCase(gh<_i82.DevAuthService>()),
    );
    gh.factory<_i314.SignInWithDevPasswordUseCase>(
      () => _i314.SignInWithDevPasswordUseCase(gh<_i82.DevAuthService>()),
    );
    gh.lazySingleton<_i1068.FirebaseBootstrap>(
      () => _i326.FirebaseBootstrapImpl(gh<_i609.AppConfig>()),
    );
    gh.lazySingleton<_i529.SyncUploader>(() => _i495.QueueOnlySyncUploader());
    gh.lazySingleton<_i59.AuthService>(
      () => _i738.SupabaseAuthService(gh<_i609.AppConfig>()),
    );
    gh.lazySingleton<_i162.ExternalLinkService>(
      () => _i146.ExternalLinkServiceImpl(),
    );
    gh.lazySingleton<_i246.IdGenerator>(() => _i766.UuidIdGenerator());
    gh.factory<_i563.WatchAuthFailuresUseCase>(
      () => _i563.WatchAuthFailuresUseCase(gh<_i59.AuthService>()),
    );
    gh.factory<_i411.WatchSignedInUserUseCase>(
      () => _i411.WatchSignedInUserUseCase(gh<_i59.AuthService>()),
    );
    gh.factory<_i349.SignOutUseCase>(
      () => _i349.SignOutUseCase(gh<_i59.AuthService>()),
    );
    gh.lazySingleton<_i878.FeatureRouterRegistry>(
      () => appCompositionModule.featureRouterRegistry(gh<_i609.AppConfig>()),
    );
    gh.lazySingleton<_i454.SupabaseClient>(
      () => authSessionModule.supabaseClient(gh<_i609.AppConfig>()),
    );
    gh.lazySingleton<_i171.SupabaseAuthSession>(
      () => authSessionModule.supabaseAuthSession(gh<_i609.AppConfig>()),
    );
    gh.factory<_i434.WatchSessionContextUseCase>(
      () => _i434.WatchSessionContextUseCase(gh<_i523.SessionContextService>()),
    );
    gh.lazySingleton<_i997.AuthStateSource>(
      () => authSessionModule.authStateSource(gh<_i171.SupabaseAuthSession>()),
    );
    gh.lazySingleton<_i84.AuthTokenProvider>(
      () =>
          authSessionModule.authTokenProvider(gh<_i171.SupabaseAuthSession>()),
    );
    gh.lazySingleton<_i1015.ConnectivityService>(
      () => _i916.ConnectivityServiceImpl(gh<_i895.Connectivity>()),
    );
    gh.factory<_i790.CopyTextUseCase>(
      () => _i790.CopyTextUseCase(gh<_i914.ClipboardService>()),
    );
    gh.factory<_i627.ReadClipboardTextUseCase>(
      () => _i627.ReadClipboardTextUseCase(gh<_i914.ClipboardService>()),
    );
    gh.factory<_i200.OpenWhatsAppUseCase>(
      () => _i200.OpenWhatsAppUseCase(gh<_i162.ExternalLinkService>()),
    );
    gh.factory<_i492.SignInWithProviderUseCase>(
      () => _i492.SignInWithProviderUseCase(
        gh<_i59.AuthService>(),
        gh<_i1015.ConnectivityService>(),
      ),
    );
    gh.factory<_i648.ShareInviteTextUseCase>(
      () => _i648.ShareInviteTextUseCase(gh<_i245.ShareService>()),
    );
    gh.lazySingleton<_i160.InviteAttemptsService>(
      () => _i291.InviteAttemptsServiceImpl(gh<_i508.ClockService>()),
    );
    gh.lazySingleton<_i361.Dio>(
      () => networkModule.postgrestDio(
        gh<_i609.AppConfig>(),
        gh<_i84.AuthTokenProvider>(),
      ),
      instanceName: 'postgrestDio',
    );
    gh.lazySingleton<_i111.InviteDirectoryClient>(
      () => _i111.InviteDirectoryClient(
        gh<_i361.Dio>(instanceName: 'postgrestDio'),
      ),
    );
    gh.factory<_i17.WatchConnectivityUseCase>(
      () => _i17.WatchConnectivityUseCase(gh<_i1015.ConnectivityService>()),
    );
    gh.lazySingleton<_i924.SyncDatabase>(
      () => _i405.PowerSyncSyncDatabase(
        gh<_i609.AppConfig>(),
        gh<_i915.SyncSchemaRegistry>(),
        gh<_i84.AuthTokenProvider>(),
        gh<_i529.SyncUploader>(),
      ),
    );
    gh.lazySingleton<_i361.Dio>(
      () => networkModule.edgeFunctionsDio(
        gh<_i609.AppConfig>(),
        gh<_i84.AuthTokenProvider>(),
      ),
      instanceName: 'edgeFunctionsDio',
    );
    gh.lazySingleton<_i282.AppRouter>(
      () => _i282.AppRouter(
        gh<_i997.AuthStateSource>(),
        gh<_i878.FeatureRouterRegistry>(),
      ),
    );
    gh.factory<_i836.GetRemainingAttemptsUseCase>(
      () =>
          _i836.GetRemainingAttemptsUseCase(gh<_i160.InviteAttemptsService>()),
    );
    gh.factory<_i1002.AppShellCubit>(
      () => _i1002.AppShellCubit(gh<_i434.WatchSessionContextUseCase>()),
    );
    gh.factory<_i596.SignInCubit>(
      () => _i596.SignInCubit(
        gh<_i492.SignInWithProviderUseCase>(),
        gh<_i314.SignInWithDevPasswordUseCase>(),
        gh<_i569.CreateDevAccountUseCase>(),
        gh<_i563.WatchAuthFailuresUseCase>(),
      ),
    );
    gh.lazySingleton<_i558.InviteDirectoryRemoteDataSource>(
      () => _i558.InviteDirectoryRemoteDataSource(
        gh<_i111.InviteDirectoryClient>(),
      ),
    );
    gh.lazySingleton<_i1020.SyncStatusService>(
      () => _i858.PowerSyncSyncStatusService(
        gh<_i924.SyncDatabase>(),
        gh<_i609.AppConfig>(),
        gh<_i508.ClockService>(),
      ),
    );
    gh.lazySingleton<_i785.LocalDataService>(
      () => _i375.LocalDataServiceImpl(gh<_i924.SyncDatabase>()),
    );
    gh.lazySingleton<_i383.PendingSinceTracker>(
      () => _i383.PendingSinceTracker(
        gh<_i924.SyncDatabase>(),
        gh<_i508.ClockService>(),
      ),
      dispose: (i) => i.stop(),
    );
    gh.factory<_i411.SignOutAndEraseLocalDataUseCase>(
      () => _i411.SignOutAndEraseLocalDataUseCase(
        gh<_i59.AuthService>(),
        gh<_i785.LocalDataService>(),
      ),
    );
    gh.factory<_i318.WatchSyncStatusUseCase>(
      () => _i318.WatchSyncStatusUseCase(gh<_i1020.SyncStatusService>()),
    );
    gh.lazySingleton<_i86.AccountClient>(
      () => _i86.AccountClient(gh<_i361.Dio>(instanceName: 'edgeFunctionsDio')),
    );
    gh.lazySingleton<_i956.InvitesClient>(
      () =>
          _i956.InvitesClient(gh<_i361.Dio>(instanceName: 'edgeFunctionsDio')),
    );
    gh.lazySingleton<_i838.InviteDirectoryService>(
      () => _i526.InviteDirectoryServiceImpl(
        gh<_i558.InviteDirectoryRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i393.AccountRemoteDataSource>(
      () => _i393.AccountRemoteDataSource(gh<_i86.AccountClient>()),
    );
    gh.factory<_i1048.HomeCubit>(
      () => _i1048.HomeCubit(
        gh<_i17.WatchConnectivityUseCase>(),
        gh<_i318.WatchSyncStatusUseCase>(),
      ),
    );
    gh.lazySingleton<_i887.AccountService>(
      () => _i958.AccountServiceImpl(gh<_i393.AccountRemoteDataSource>()),
    );
    gh.lazySingleton<_i723.InvitesRemoteDataSource>(
      () => _i723.InvitesRemoteDataSource(gh<_i956.InvitesClient>()),
    );
    gh.lazySingleton<_i656.AccessSessionService>(
      () => _i301.AccessSessionServiceImpl(
        gh<_i997.AuthStateSource>(),
        gh<_i84.AuthTokenProvider>(),
        gh<_i887.AccountService>(),
        gh<_i869.AccessStore>(),
        gh<_i523.SessionContextService>(),
      ),
    );
    gh.factory<_i816.LoadInviteTargetsUseCase>(
      () => _i816.LoadInviteTargetsUseCase(gh<_i838.InviteDirectoryService>()),
    );
    gh.factory<_i930.LoadOrganizationTablesUseCase>(
      () => _i930.LoadOrganizationTablesUseCase(
        gh<_i838.InviteDirectoryService>(),
      ),
    );
    gh.lazySingleton<_i863.SyncLifecycle>(
      () => _i863.SyncLifecycle(
        gh<_i924.SyncDatabase>(),
        gh<_i383.PendingSinceTracker>(),
        gh<_i997.AuthStateSource>(),
      ),
      dispose: (i) => i.stop(),
    );
    gh.lazySingleton<_i686.InviteService>(
      () => _i66.InviteServiceImpl(gh<_i723.InvitesRemoteDataSource>()),
    );
    gh.factory<_i327.SignOutCubit>(
      () => _i327.SignOutCubit(
        gh<_i318.WatchSyncStatusUseCase>(),
        gh<_i17.WatchConnectivityUseCase>(),
        gh<_i349.SignOutUseCase>(),
        gh<_i411.SignOutAndEraseLocalDataUseCase>(),
      ),
    );
    gh.lazySingleton<_i393.AccessRedirectGuard>(
      () => _i393.AccessRedirectGuard(
        gh<_i997.AuthStateSource>(),
        gh<_i656.AccessSessionService>(),
      ),
    );
    gh.factory<_i641.PreviewInviteUseCase>(
      () => _i641.PreviewInviteUseCase(
        gh<_i686.InviteService>(),
        gh<_i160.InviteAttemptsService>(),
        gh<_i508.ClockService>(),
      ),
    );
    gh.factory<_i648.RefreshAccessUseCase>(
      () => _i648.RefreshAccessUseCase(gh<_i656.AccessSessionService>()),
    );
    gh.factory<_i62.SelectContextUseCase>(
      () => _i62.SelectContextUseCase(gh<_i656.AccessSessionService>()),
    );
    gh.factory<_i662.WatchAccessStateUseCase>(
      () => _i662.WatchAccessStateUseCase(gh<_i656.AccessSessionService>()),
    );
    gh.factory<_i289.RedeemInviteUseCase>(
      () => _i289.RedeemInviteUseCase(
        gh<_i686.InviteService>(),
        gh<_i656.AccessSessionService>(),
      ),
    );
    gh.factory<_i532.CreateInviteUseCase>(
      () => _i532.CreateInviteUseCase(gh<_i686.InviteService>()),
    );
    gh.factory<_i276.ListInvitesUseCase>(
      () => _i276.ListInvitesUseCase(gh<_i686.InviteService>()),
    );
    gh.factory<_i569.RenewInviteUseCase>(
      () => _i569.RenewInviteUseCase(gh<_i686.InviteService>()),
    );
    gh.factory<_i138.RevokeInviteUseCase>(
      () => _i138.RevokeInviteUseCase(gh<_i686.InviteService>()),
    );
    gh.factory<_i174.InviteFormCubit>(
      () => _i174.InviteFormCubit(
        gh<_i816.LoadInviteTargetsUseCase>(),
        gh<_i930.LoadOrganizationTablesUseCase>(),
        gh<_i532.CreateInviteUseCase>(),
        gh<_i434.WatchSessionContextUseCase>(),
        gh<_i17.WatchConnectivityUseCase>(),
      ),
    );
    gh.factory<_i931.InvitesManagerCubit>(
      () => _i931.InvitesManagerCubit(
        gh<_i276.ListInvitesUseCase>(),
        gh<_i138.RevokeInviteUseCase>(),
        gh<_i569.RenewInviteUseCase>(),
        gh<_i434.WatchSessionContextUseCase>(),
        gh<_i17.WatchConnectivityUseCase>(),
      ),
    );
    gh.factory<_i69.ScanCubit>(
      () => _i69.ScanCubit(
        gh<_i86.ParseInviteCodeUseCase>(),
        gh<_i641.PreviewInviteUseCase>(),
        gh<_i627.ReadClipboardTextUseCase>(),
      ),
    );
    gh.factory<_i106.CodeEntryCubit>(
      () => _i106.CodeEntryCubit(
        gh<_i641.PreviewInviteUseCase>(),
        gh<_i836.GetRemainingAttemptsUseCase>(),
      ),
    );
    gh.factory<_i677.LoadInviteUseCase>(
      () => _i677.LoadInviteUseCase(gh<_i276.ListInvitesUseCase>()),
    );
    gh.factory<_i660.AccessCubit>(
      () => _i660.AccessCubit(
        gh<_i662.WatchAccessStateUseCase>(),
        gh<_i411.WatchSignedInUserUseCase>(),
        gh<_i648.RefreshAccessUseCase>(),
        gh<_i62.SelectContextUseCase>(),
      ),
    );
    gh.factory<_i832.RedeemCubit>(
      () => _i832.RedeemCubit(
        gh<_i641.PreviewInviteUseCase>(),
        gh<_i289.RedeemInviteUseCase>(),
        gh<_i492.SignInWithProviderUseCase>(),
        gh<_i349.SignOutUseCase>(),
        gh<_i411.WatchSignedInUserUseCase>(),
        gh<_i563.WatchAuthFailuresUseCase>(),
        gh<_i17.WatchConnectivityUseCase>(),
      ),
    );
    gh.factory<_i995.ShareCubit>(
      () => _i995.ShareCubit(
        gh<_i677.LoadInviteUseCase>(),
        gh<_i790.CopyTextUseCase>(),
        gh<_i648.ShareInviteTextUseCase>(),
        gh<_i200.OpenWhatsAppUseCase>(),
        gh<_i434.WatchSessionContextUseCase>(),
      ),
    );
    return this;
  }
}

class _$ServicesModule extends _i553.ServicesModule {}

class _$AppCompositionModule extends _i431.AppCompositionModule {}

class _$AuthDataModule extends _i468.AuthDataModule {}

class _$AuthSessionModule extends _i139.AuthSessionModule {}

class _$NetworkModule extends _i200.NetworkModule {}
