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
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

import '../../app/app_module.dart' as _i431;
import '../../features/session/data/client/session_control_client.dart'
    as _i625;
import '../../features/session/data/client/session_sync_client.dart' as _i946;
import '../../features/session/data/datasources/session_local_data_source.dart'
    as _i751;
import '../../features/session/data/datasources/session_remote_data_source.dart'
    as _i215;
import '../../features/session/data/local/session_drift_database.dart' as _i4;
import '../../features/session/data/services/attendance_service_impl.dart'
    as _i1058;
import '../../features/session/data/services/live_session_service_impl.dart'
    as _i635;
import '../../features/session/data/services/responses_service_impl.dart'
    as _i716;
import '../../features/session/data/services/session_control_service_impl.dart'
    as _i260;
import '../../features/session/data/services/session_sync_service_impl.dart'
    as _i1002;
import '../../features/session/data/services/session_sync_uploader.dart'
    as _i194;
import '../../features/session/data/session_data_module.dart' as _i129;
import '../../features/session/domain/services/attendance_service.dart'
    as _i620;
import '../../features/session/domain/services/live_session_service.dart'
    as _i530;
import '../../features/session/domain/services/responses_service.dart' as _i307;
import '../../features/session/domain/services/session_control_service.dart'
    as _i728;
import '../../features/session/domain/services/session_sync_service.dart'
    as _i468;
import '../../features/session/domain/use_cases/attendance/mark_attendance_use_case.dart'
    as _i307;
import '../../features/session/domain/use_cases/attendance/mark_everyone_present_use_case.dart'
    as _i23;
import '../../features/session/domain/use_cases/control/close_answers_use_case.dart'
    as _i126;
import '../../features/session/domain/use_cases/control/close_session_use_case.dart'
    as _i995;
import '../../features/session/domain/use_cases/control/open_session_use_case.dart'
    as _i545;
import '../../features/session/domain/use_cases/control/set_session_stage_use_case.dart'
    as _i736;
import '../../features/session/domain/use_cases/live/watch_live_session_use_case.dart'
    as _i975;
import '../../features/session/domain/use_cases/responses/submit_commitment_use_case.dart'
    as _i1002;
import '../../features/session/domain/use_cases/responses/submit_follow_up_use_case.dart'
    as _i833;
import '../../features/session/domain/use_cases/responses/submit_reflection_use_case.dart'
    as _i58;
import '../../features/session/domain/use_cases/sync/request_sync_use_case.dart'
    as _i659;
import '../../features/session/presentation/pages/facilitator_board/cubit/facilitator_board_cubit.dart'
    as _i1059;
import '../../features/session/presentation/pages/member_flow/cubit/member_flow_cubit.dart'
    as _i174;
import '../../features/session/presentation/pages/session/cubit/session_cubit.dart'
    as _i817;
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
    final authSessionModule = _$AuthSessionModule();
    final networkModule = _$NetworkModule();
    final sessionDataModule = _$SessionDataModule();
    gh.singleton<_i609.AppConfig>(() => servicesModule.appConfig);
    gh.lazySingleton<_i915.SyncSchemaRegistry>(
      () => appCompositionModule.syncSchemaRegistry,
    );
    gh.lazySingleton<_i895.Connectivity>(() => servicesModule.connectivity);
    gh.lazySingleton<_i508.ClockService>(() => _i799.SystemClockService());
    gh.lazySingleton<_i245.ShareService>(() => _i827.ShareServiceImpl());
    gh.lazySingleton<_i1068.FirebaseBootstrap>(
      () => _i326.FirebaseBootstrapImpl(gh<_i609.AppConfig>()),
    );
    gh.lazySingleton<_i162.ExternalLinkService>(
      () => _i146.ExternalLinkServiceImpl(),
    );
    gh.lazySingleton<_i523.SessionContextService>(
      () => _i1004.InMemorySessionContextService(),
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
    gh.factory<_i17.WatchConnectivityUseCase>(
      () => _i17.WatchConnectivityUseCase(gh<_i1015.ConnectivityService>()),
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
    gh.lazySingleton<_i625.SessionControlClient>(
      () => _i625.SessionControlClient(
        gh<_i361.Dio>(instanceName: 'edgeFunctionsDio'),
      ),
    );
    gh.lazySingleton<_i946.SessionSyncClient>(
      () => _i946.SessionSyncClient(
        gh<_i361.Dio>(instanceName: 'edgeFunctionsDio'),
      ),
    );
    gh.lazySingleton<_i215.SessionRemoteDataSource>(
      () => _i215.SessionRemoteDataSource(
        gh<_i946.SessionSyncClient>(),
        gh<_i625.SessionControlClient>(),
      ),
    );
    gh.lazySingleton<_i529.SyncUploader>(
      () => _i194.SessionSyncUploader(gh<_i215.SessionRemoteDataSource>()),
    );
    gh.lazySingleton<_i924.SyncDatabase>(
      () => _i405.PowerSyncSyncDatabase(
        gh<_i609.AppConfig>(),
        gh<_i915.SyncSchemaRegistry>(),
        gh<_i84.AuthTokenProvider>(),
        gh<_i529.SyncUploader>(),
      ),
    );
    gh.lazySingleton<_i468.SessionSyncService>(
      () => _i1002.SessionSyncServiceImpl(gh<_i924.SyncDatabase>()),
    );
    gh.lazySingleton<_i1020.SyncStatusService>(
      () => _i858.PowerSyncSyncStatusService(
        gh<_i924.SyncDatabase>(),
        gh<_i609.AppConfig>(),
        gh<_i508.ClockService>(),
      ),
    );
    gh.factory<_i659.RequestSyncUseCase>(
      () => _i659.RequestSyncUseCase(gh<_i468.SessionSyncService>()),
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
    gh.lazySingleton<_i4.SessionDriftDatabase>(
      () => sessionDataModule.sessionDriftDatabase(gh<_i924.SyncDatabase>()),
    );
    gh.lazySingleton<_i751.SessionLocalDataSource>(
      () => _i751.SessionLocalDataSource(
        gh<_i4.SessionDriftDatabase>(),
        gh<_i924.SyncDatabase>(),
      ),
    );
    gh.lazySingleton<_i620.AttendanceService>(
      () => _i1058.AttendanceServiceImpl(
        gh<_i751.SessionLocalDataSource>(),
        gh<_i508.ClockService>(),
        gh<_i246.IdGenerator>(),
      ),
    );
    gh.factory<_i1048.HomeCubit>(
      () => _i1048.HomeCubit(
        gh<_i17.WatchConnectivityUseCase>(),
        gh<_i318.WatchSyncStatusUseCase>(),
      ),
    );
    gh.factory<_i307.MarkAttendanceUseCase>(
      () => _i307.MarkAttendanceUseCase(gh<_i620.AttendanceService>()),
    );
    gh.factory<_i23.MarkEveryonePresentUseCase>(
      () => _i23.MarkEveryonePresentUseCase(gh<_i620.AttendanceService>()),
    );
    gh.lazySingleton<_i307.ResponsesService>(
      () => _i716.ResponsesServiceImpl(
        gh<_i751.SessionLocalDataSource>(),
        gh<_i508.ClockService>(),
        gh<_i246.IdGenerator>(),
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
    gh.lazySingleton<_i530.LiveSessionService>(
      () => _i635.LiveSessionServiceImpl(
        gh<_i751.SessionLocalDataSource>(),
        gh<_i1020.SyncStatusService>(),
        gh<_i508.ClockService>(),
      ),
    );
    gh.lazySingleton<_i728.SessionControlService>(
      () => _i260.SessionControlServiceImpl(
        gh<_i751.SessionLocalDataSource>(),
        gh<_i215.SessionRemoteDataSource>(),
        gh<_i1015.ConnectivityService>(),
        gh<_i508.ClockService>(),
      ),
    );
    gh.factory<_i1059.FacilitatorBoardCubit>(
      () => _i1059.FacilitatorBoardCubit(
        gh<_i307.MarkAttendanceUseCase>(),
        gh<_i23.MarkEveryonePresentUseCase>(),
      ),
    );
    gh.factory<_i975.WatchLiveSessionUseCase>(
      () => _i975.WatchLiveSessionUseCase(gh<_i530.LiveSessionService>()),
    );
    gh.factory<_i1002.SubmitCommitmentUseCase>(
      () => _i1002.SubmitCommitmentUseCase(gh<_i307.ResponsesService>()),
    );
    gh.factory<_i833.SubmitFollowUpUseCase>(
      () => _i833.SubmitFollowUpUseCase(gh<_i307.ResponsesService>()),
    );
    gh.factory<_i58.SubmitReflectionUseCase>(
      () => _i58.SubmitReflectionUseCase(gh<_i307.ResponsesService>()),
    );
    gh.factory<_i174.MemberFlowCubit>(
      () => _i174.MemberFlowCubit(
        gh<_i833.SubmitFollowUpUseCase>(),
        gh<_i58.SubmitReflectionUseCase>(),
        gh<_i1002.SubmitCommitmentUseCase>(),
      ),
    );
    gh.factory<_i126.CloseAnswersUseCase>(
      () => _i126.CloseAnswersUseCase(gh<_i728.SessionControlService>()),
    );
    gh.factory<_i995.CloseSessionUseCase>(
      () => _i995.CloseSessionUseCase(gh<_i728.SessionControlService>()),
    );
    gh.factory<_i545.OpenSessionUseCase>(
      () => _i545.OpenSessionUseCase(gh<_i728.SessionControlService>()),
    );
    gh.factory<_i736.SetSessionStageUseCase>(
      () => _i736.SetSessionStageUseCase(gh<_i728.SessionControlService>()),
    );
    gh.factory<_i817.SessionCubit>(
      () => _i817.SessionCubit(
        gh<_i975.WatchLiveSessionUseCase>(),
        gh<_i17.WatchConnectivityUseCase>(),
        gh<_i318.WatchSyncStatusUseCase>(),
        gh<_i545.OpenSessionUseCase>(),
        gh<_i736.SetSessionStageUseCase>(),
        gh<_i126.CloseAnswersUseCase>(),
        gh<_i995.CloseSessionUseCase>(),
        gh<_i659.RequestSyncUseCase>(),
      ),
    );
    return this;
  }
}

class _$ServicesModule extends _i553.ServicesModule {}

class _$AppCompositionModule extends _i431.AppCompositionModule {}

class _$AuthSessionModule extends _i139.AuthSessionModule {}

class _$NetworkModule extends _i200.NetworkModule {}

class _$SessionDataModule extends _i129.SessionDataModule {}
