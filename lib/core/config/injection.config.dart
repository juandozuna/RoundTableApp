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
import '../../features/home/data/client/home_client.dart' as _i564;
import '../../features/home/data/datasources/home_local_data_source.dart'
    as _i299;
import '../../features/home/data/datasources/home_remote_data_source.dart'
    as _i362;
import '../../features/home/data/services/home_service_impl.dart' as _i481;
import '../../features/home/domain/services/home_service.dart' as _i677;
import '../../features/home/domain/use_cases/overview/watch_home_overview_use_case.dart'
    as _i246;
import '../../features/home/presentation/pages/home/cubit/home_cubit.dart'
    as _i275;
import '../../features/notifications/data/client/notifications_client.dart'
    as _i70;
import '../../features/notifications/data/datasources/notifications_local_data_source.dart'
    as _i1034;
import '../../features/notifications/data/datasources/notifications_module.dart'
    as _i166;
import '../../features/notifications/data/datasources/notifications_remote_data_source.dart'
    as _i951;
import '../../features/notifications/data/platform/firebase_push_messaging_platform.dart'
    as _i618;
import '../../features/notifications/data/platform/push_messaging_platform.dart'
    as _i295;
import '../../features/notifications/data/services/notification_preferences_service_impl.dart'
    as _i99;
import '../../features/notifications/data/services/notification_service_impl.dart'
    as _i566;
import '../../features/notifications/domain/services/notification_preferences_service.dart'
    as _i795;
import '../../features/notifications/domain/services/notification_service.dart'
    as _i569;
import '../../features/notifications/domain/use_cases/delivery/request_notification_permission_use_case.dart'
    as _i808;
import '../../features/notifications/domain/use_cases/delivery/start_notifications_use_case.dart'
    as _i500;
import '../../features/notifications/domain/use_cases/delivery/unregister_device_use_case.dart'
    as _i233;
import '../../features/notifications/domain/use_cases/delivery/watch_foreground_notifications_use_case.dart'
    as _i98;
import '../../features/notifications/domain/use_cases/delivery/watch_notification_targets_use_case.dart'
    as _i654;
import '../../features/notifications/domain/use_cases/preferences/update_notification_preferences_use_case.dart'
    as _i553;
import '../../features/notifications/domain/use_cases/preferences/watch_notification_settings_use_case.dart'
    as _i727;
import '../../features/notifications/domain/use_cases/unsynced/watch_unsynced_alert_use_case.dart'
    as _i169;
import '../../features/notifications/presentation/cubit/notifications_host_cubit.dart'
    as _i467;
import '../../features/notifications/presentation/cubit/unsynced_alert_cubit.dart'
    as _i246;
import '../../features/notifications/presentation/pages/notification_preferences/cubit/notification_preferences_cubit.dart'
    as _i744;
import '../../features/settings/data/client/settings_client.dart' as _i47;
import '../../features/settings/data/datasources/settings_remote_data_source.dart'
    as _i188;
import '../../features/settings/data/services/app_info_service_impl.dart'
    as _i90;
import '../../features/settings/data/services/profile_service_impl.dart'
    as _i945;
import '../../features/settings/data/services/supabase_sign_out_service.dart'
    as _i1071;
import '../../features/settings/domain/services/app_info_service.dart' as _i483;
import '../../features/settings/domain/services/profile_service.dart' as _i895;
import '../../features/settings/domain/services/sign_out_service.dart' as _i428;
import '../../features/settings/domain/use_cases/account/sign_out_use_case.dart'
    as _i185;
import '../../features/settings/domain/use_cases/profile/load_app_info_use_case.dart'
    as _i752;
import '../../features/settings/domain/use_cases/profile/load_profile_use_case.dart'
    as _i869;
import '../../features/settings/domain/use_cases/profile/update_profile_use_case.dart'
    as _i325;
import '../../features/settings/presentation/pages/profile_edit/cubit/profile_edit_cubit.dart'
    as _i177;
import '../../features/settings/presentation/pages/settings/cubit/settings_cubit.dart'
    as _i152;
import '../../features/shell/presentation/cubit/context_chip_cubit.dart'
    as _i939;
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
import '../services/session_context/in_memory_session_context_service.dart'
    as _i1004;
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
    final notificationsModule = _$NotificationsModule();
    final authSessionModule = _$AuthSessionModule();
    final networkModule = _$NetworkModule();
    gh.singleton<_i609.AppConfig>(() => servicesModule.appConfig);
    gh.lazySingleton<_i915.SyncSchemaRegistry>(
      () => appCompositionModule.syncSchemaRegistry,
    );
    gh.lazySingleton<_i895.Connectivity>(() => servicesModule.connectivity);
    gh.lazySingleton<_i460.SharedPreferencesAsync>(
      () => notificationsModule.sharedPreferences,
    );
    gh.lazySingleton<_i1034.NotificationsLocalDataSource>(
      () => _i1034.NotificationsLocalDataSource(
        gh<_i460.SharedPreferencesAsync>(),
      ),
    );
    gh.lazySingleton<_i508.ClockService>(() => _i799.SystemClockService());
    gh.lazySingleton<_i245.ShareService>(() => _i827.ShareServiceImpl());
    gh.lazySingleton<_i483.AppInfoService>(() => _i90.AppInfoServiceImpl());
    gh.lazySingleton<_i428.SignOutService>(
      () => _i1071.SupabaseSignOutService(gh<_i609.AppConfig>()),
    );
    gh.lazySingleton<_i1068.FirebaseBootstrap>(
      () => _i326.FirebaseBootstrapImpl(gh<_i609.AppConfig>()),
    );
    gh.lazySingleton<_i529.SyncUploader>(() => _i495.QueueOnlySyncUploader());
    gh.lazySingleton<_i795.NotificationPreferencesService>(
      () => _i99.NotificationPreferencesServiceImpl(
        gh<_i1034.NotificationsLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i162.ExternalLinkService>(
      () => _i146.ExternalLinkServiceImpl(),
    );
    gh.lazySingleton<_i523.SessionContextService>(
      () => _i1004.InMemorySessionContextService(),
    );
    gh.factory<_i752.LoadAppInfoUseCase>(
      () => _i752.LoadAppInfoUseCase(gh<_i483.AppInfoService>()),
    );
    gh.lazySingleton<_i246.IdGenerator>(() => _i766.UuidIdGenerator());
    gh.lazySingleton<_i878.FeatureRouterRegistry>(
      () => appCompositionModule.featureRouterRegistry(gh<_i609.AppConfig>()),
    );
    gh.lazySingleton<_i454.SupabaseClient>(
      () => authSessionModule.supabaseClient(gh<_i609.AppConfig>()),
    );
    gh.lazySingleton<_i171.SupabaseAuthSession>(
      () => authSessionModule.supabaseAuthSession(gh<_i609.AppConfig>()),
    );
    gh.lazySingleton<_i295.PushMessagingPlatform>(
      () => _i618.FirebasePushMessagingPlatform(
        gh<_i1068.FirebaseBootstrap>(),
        gh<_i609.AppConfig>(),
      ),
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
    gh.lazySingleton<_i361.Dio>(
      () => networkModule.postgrestDio(
        gh<_i609.AppConfig>(),
        gh<_i84.AuthTokenProvider>(),
      ),
      instanceName: 'postgrestDio',
    );
    gh.lazySingleton<_i564.HomeClient>(
      () => _i564.HomeClient(gh<_i361.Dio>(instanceName: 'postgrestDio')),
    );
    gh.factory<_i939.ContextChipCubit>(
      () => _i939.ContextChipCubit(gh<_i434.WatchSessionContextUseCase>()),
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
    gh.factory<_i1002.AppShellCubit>(
      () => _i1002.AppShellCubit(gh<_i434.WatchSessionContextUseCase>()),
    );
    gh.lazySingleton<_i1020.SyncStatusService>(
      () => _i858.PowerSyncSyncStatusService(
        gh<_i924.SyncDatabase>(),
        gh<_i609.AppConfig>(),
        gh<_i508.ClockService>(),
      ),
    );
    gh.lazySingleton<_i362.HomeRemoteDataSource>(
      () => _i362.HomeRemoteDataSource(
        gh<_i564.HomeClient>(),
        gh<_i84.AuthTokenProvider>(),
      ),
    );
    gh.lazySingleton<_i299.HomeLocalDataSource>(
      () => _i299.HomeLocalDataSource(gh<_i924.SyncDatabase>()),
    );
    gh.lazySingleton<_i383.PendingSinceTracker>(
      () => _i383.PendingSinceTracker(
        gh<_i924.SyncDatabase>(),
        gh<_i508.ClockService>(),
      ),
      dispose: (i) => i.stop(),
    );
    gh.factory<_i318.WatchSyncStatusUseCase>(
      () => _i318.WatchSyncStatusUseCase(gh<_i1020.SyncStatusService>()),
    );
    gh.lazySingleton<_i70.NotificationsClient>(
      () => _i70.NotificationsClient(
        gh<_i361.Dio>(instanceName: 'edgeFunctionsDio'),
      ),
    );
    gh.lazySingleton<_i47.SettingsClient>(
      () =>
          _i47.SettingsClient(gh<_i361.Dio>(instanceName: 'edgeFunctionsDio')),
    );
    gh.lazySingleton<_i677.HomeService>(
      () => _i481.HomeServiceImpl(
        gh<_i299.HomeLocalDataSource>(),
        gh<_i362.HomeRemoteDataSource>(),
        gh<_i508.ClockService>(),
      ),
    );
    gh.lazySingleton<_i951.NotificationsRemoteDataSource>(
      () => _i951.NotificationsRemoteDataSource(gh<_i70.NotificationsClient>()),
    );
    gh.factory<_i169.WatchUnsyncedAlertUseCase>(
      () => _i169.WatchUnsyncedAlertUseCase(
        gh<_i318.WatchSyncStatusUseCase>(),
        gh<_i795.NotificationPreferencesService>(),
      ),
    );
    gh.factory<_i246.UnsyncedAlertCubit>(
      () => _i246.UnsyncedAlertCubit(gh<_i169.WatchUnsyncedAlertUseCase>()),
    );
    gh.lazySingleton<_i569.NotificationService>(
      () => _i566.NotificationServiceImpl(
        gh<_i295.PushMessagingPlatform>(),
        gh<_i951.NotificationsRemoteDataSource>(),
        gh<_i1034.NotificationsLocalDataSource>(),
        gh<_i795.NotificationPreferencesService>(),
        gh<_i997.AuthStateSource>(),
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
    gh.lazySingleton<_i188.SettingsRemoteDataSource>(
      () => _i188.SettingsRemoteDataSource(gh<_i47.SettingsClient>()),
    );
    gh.factory<_i246.WatchHomeOverviewUseCase>(
      () => _i246.WatchHomeOverviewUseCase(
        gh<_i434.WatchSessionContextUseCase>(),
        gh<_i677.HomeService>(),
      ),
    );
    gh.factory<_i808.RequestNotificationPermissionUseCase>(
      () => _i808.RequestNotificationPermissionUseCase(
        gh<_i569.NotificationService>(),
      ),
    );
    gh.factory<_i500.StartNotificationsUseCase>(
      () => _i500.StartNotificationsUseCase(gh<_i569.NotificationService>()),
    );
    gh.factory<_i233.UnregisterDeviceUseCase>(
      () => _i233.UnregisterDeviceUseCase(gh<_i569.NotificationService>()),
    );
    gh.factory<_i654.WatchNotificationTargetsUseCase>(
      () => _i654.WatchNotificationTargetsUseCase(
        gh<_i569.NotificationService>(),
      ),
    );
    gh.lazySingleton<_i895.ProfileService>(
      () => _i945.ProfileServiceImpl(gh<_i188.SettingsRemoteDataSource>()),
    );
    gh.factory<_i98.WatchForegroundNotificationsUseCase>(
      () => _i98.WatchForegroundNotificationsUseCase(
        gh<_i569.NotificationService>(),
        gh<_i795.NotificationPreferencesService>(),
      ),
    );
    gh.factory<_i553.UpdateNotificationPreferencesUseCase>(
      () => _i553.UpdateNotificationPreferencesUseCase(
        gh<_i569.NotificationService>(),
        gh<_i795.NotificationPreferencesService>(),
      ),
    );
    gh.factory<_i727.WatchNotificationSettingsUseCase>(
      () => _i727.WatchNotificationSettingsUseCase(
        gh<_i569.NotificationService>(),
        gh<_i795.NotificationPreferencesService>(),
      ),
    );
    gh.factory<_i744.NotificationPreferencesCubit>(
      () => _i744.NotificationPreferencesCubit(
        gh<_i727.WatchNotificationSettingsUseCase>(),
        gh<_i553.UpdateNotificationPreferencesUseCase>(),
        gh<_i808.RequestNotificationPermissionUseCase>(),
      ),
    );
    gh.factory<_i275.HomeCubit>(
      () => _i275.HomeCubit(
        gh<_i246.WatchHomeOverviewUseCase>(),
        gh<_i17.WatchConnectivityUseCase>(),
        gh<_i318.WatchSyncStatusUseCase>(),
      ),
    );
    gh.factory<_i869.LoadProfileUseCase>(
      () => _i869.LoadProfileUseCase(gh<_i895.ProfileService>()),
    );
    gh.factory<_i325.UpdateProfileUseCase>(
      () => _i325.UpdateProfileUseCase(gh<_i895.ProfileService>()),
    );
    gh.factory<_i177.ProfileEditCubit>(
      () => _i177.ProfileEditCubit(
        gh<_i869.LoadProfileUseCase>(),
        gh<_i325.UpdateProfileUseCase>(),
      ),
    );
    gh.factory<_i185.SignOutUseCase>(
      () => _i185.SignOutUseCase(
        gh<_i233.UnregisterDeviceUseCase>(),
        gh<_i523.SessionContextService>(),
        gh<_i428.SignOutService>(),
      ),
    );
    gh.factory<_i467.NotificationsHostCubit>(
      () => _i467.NotificationsHostCubit(
        gh<_i500.StartNotificationsUseCase>(),
        gh<_i98.WatchForegroundNotificationsUseCase>(),
        gh<_i654.WatchNotificationTargetsUseCase>(),
      ),
    );
    gh.factory<_i152.SettingsCubit>(
      () => _i152.SettingsCubit(
        gh<_i434.WatchSessionContextUseCase>(),
        gh<_i17.WatchConnectivityUseCase>(),
        gh<_i318.WatchSyncStatusUseCase>(),
        gh<_i869.LoadProfileUseCase>(),
        gh<_i752.LoadAppInfoUseCase>(),
        gh<_i185.SignOutUseCase>(),
      ),
    );
    return this;
  }
}

class _$ServicesModule extends _i553.ServicesModule {}

class _$AppCompositionModule extends _i431.AppCompositionModule {}

class _$NotificationsModule extends _i166.NotificationsModule {}

class _$AuthSessionModule extends _i139.AuthSessionModule {}

class _$NetworkModule extends _i200.NetworkModule {}
