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
import '../../features/admin/data/client/admin_invites_client.dart' as _i1010;
import '../../features/admin/data/client/admin_read_client.dart' as _i349;
import '../../features/admin/data/client/admin_write_client.dart' as _i78;
import '../../features/admin/data/datasources/admin_remote_data_source.dart'
    as _i517;
import '../../features/admin/data/services/admin_directory_service_impl.dart'
    as _i882;
import '../../features/admin/data/services/admin_invite_service_impl.dart'
    as _i984;
import '../../features/admin/data/services/admin_management_service_impl.dart'
    as _i392;
import '../../features/admin/data/services/admin_scope_service_impl.dart'
    as _i531;
import '../../features/admin/data/services/saved_views_service_impl.dart'
    as _i512;
import '../../features/admin/domain/services/admin_directory_service.dart'
    as _i680;
import '../../features/admin/domain/services/admin_invite_service.dart'
    as _i429;
import '../../features/admin/domain/services/admin_management_service.dart'
    as _i1045;
import '../../features/admin/domain/services/admin_scope_service.dart' as _i705;
import '../../features/admin/domain/services/saved_views_service.dart' as _i298;
import '../../features/admin/domain/use_cases/directory/load_explorer_data_use_case.dart'
    as _i1038;
import '../../features/admin/domain/use_cases/directory/load_location_use_case.dart'
    as _i256;
import '../../features/admin/domain/use_cases/directory/load_organization_detail_use_case.dart'
    as _i739;
import '../../features/admin/domain/use_cases/directory/load_organization_use_case.dart'
    as _i592;
import '../../features/admin/domain/use_cases/directory/load_organizations_use_case.dart'
    as _i108;
import '../../features/admin/domain/use_cases/directory/load_person_detail_use_case.dart'
    as _i985;
import '../../features/admin/domain/use_cases/directory/load_table_detail_use_case.dart'
    as _i1005;
import '../../features/admin/domain/use_cases/directory/load_table_form_data_use_case.dart'
    as _i239;
import '../../features/admin/domain/use_cases/directory/load_tables_use_case.dart'
    as _i543;
import '../../features/admin/domain/use_cases/invites/invite_person_use_case.dart'
    as _i850;
import '../../features/admin/domain/use_cases/invites/share_invite_use_case.dart'
    as _i464;
import '../../features/admin/domain/use_cases/locations/create_location_use_case.dart'
    as _i673;
import '../../features/admin/domain/use_cases/locations/update_location_use_case.dart'
    as _i759;
import '../../features/admin/domain/use_cases/organizations/create_organization_use_case.dart'
    as _i465;
import '../../features/admin/domain/use_cases/organizations/set_organization_status_use_case.dart'
    as _i529;
import '../../features/admin/domain/use_cases/organizations/update_organization_use_case.dart'
    as _i558;
import '../../features/admin/domain/use_cases/people/update_person_use_case.dart'
    as _i479;
import '../../features/admin/domain/use_cases/scope/watch_admin_scope_use_case.dart'
    as _i615;
import '../../features/admin/domain/use_cases/tables/add_member_to_table_use_case.dart'
    as _i508;
import '../../features/admin/domain/use_cases/tables/change_facilitator_use_case.dart'
    as _i882;
import '../../features/admin/domain/use_cases/tables/create_table_use_case.dart'
    as _i756;
import '../../features/admin/domain/use_cases/tables/deactivate_member_use_case.dart'
    as _i230;
import '../../features/admin/domain/use_cases/tables/move_member_use_case.dart'
    as _i20;
import '../../features/admin/domain/use_cases/tables/update_table_use_case.dart'
    as _i610;
import '../../features/admin/domain/use_cases/views/delete_explorer_view_use_case.dart'
    as _i497;
import '../../features/admin/domain/use_cases/views/load_saved_views_use_case.dart'
    as _i242;
import '../../features/admin/domain/use_cases/views/save_explorer_view_use_case.dart'
    as _i596;
import '../../features/admin/presentation/cubit/admin_access_cubit.dart'
    as _i475;
import '../../features/admin/presentation/pages/command_palette/cubit/command_palette_cubit.dart'
    as _i911;
import '../../features/admin/presentation/pages/explorer/cubit/explorer_cubit.dart'
    as _i640;
import '../../features/admin/presentation/pages/invite_person/cubit/invite_person_cubit.dart'
    as _i933;
import '../../features/admin/presentation/pages/location_form/cubit/location_form_cubit.dart'
    as _i353;
import '../../features/admin/presentation/pages/organization_detail/cubit/organization_detail_cubit.dart'
    as _i81;
import '../../features/admin/presentation/pages/organization_form/cubit/organization_form_cubit.dart'
    as _i760;
import '../../features/admin/presentation/pages/person_detail/cubit/person_detail_cubit.dart'
    as _i422;
import '../../features/admin/presentation/pages/table_detail/cubit/table_detail_cubit.dart'
    as _i844;
import '../../features/admin/presentation/pages/table_form/cubit/table_form_cubit.dart'
    as _i710;
import '../../features/audit/data/client/audit_client.dart' as _i800;
import '../../features/audit/data/datasources/audit_remote_data_source.dart'
    as _i625;
import '../../features/audit/data/services/audit_service_impl.dart' as _i1007;
import '../../features/audit/domain/services/audit_service.dart' as _i542;
import '../../features/audit/domain/use_cases/load_audit_events_use_case.dart'
    as _i936;
import '../../features/audit/presentation/pages/audit/cubit/audit_cubit.dart'
    as _i659;
import '../../features/kpis/data/client/answers_reveal_client.dart' as _i559;
import '../../features/kpis/data/client/kpi_client.dart' as _i772;
import '../../features/kpis/data/datasources/kpi_remote_data_source.dart'
    as _i460;
import '../../features/kpis/data/services/csv_export_service_impl.dart' as _i58;
import '../../features/kpis/data/services/kpi_service_impl.dart' as _i970;
import '../../features/kpis/domain/services/csv_export_service.dart' as _i309;
import '../../features/kpis/domain/services/kpi_service.dart' as _i585;
import '../../features/kpis/domain/use_cases/export/export_csv_use_case.dart'
    as _i228;
import '../../features/kpis/domain/use_cases/members/load_member_detail_use_case.dart'
    as _i2;
import '../../features/kpis/domain/use_cases/members/reveal_member_answers_use_case.dart'
    as _i303;
import '../../features/kpis/domain/use_cases/report/load_drill_level_use_case.dart'
    as _i84;
import '../../features/kpis/domain/use_cases/report/load_report_options_use_case.dart'
    as _i354;
import '../../features/kpis/domain/use_cases/report/load_report_use_case.dart'
    as _i289;
import '../../features/kpis/presentation/pages/member_detail/cubit/member_detail_cubit.dart'
    as _i131;
import '../../features/kpis/presentation/pages/reports/cubit/reports_cubit.dart'
    as _i578;
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
    final authSessionModule = _$AuthSessionModule();
    final networkModule = _$NetworkModule();
    gh.singleton<_i609.AppConfig>(() => servicesModule.appConfig);
    gh.lazySingleton<_i915.SyncSchemaRegistry>(
      () => appCompositionModule.syncSchemaRegistry,
    );
    gh.lazySingleton<_i895.Connectivity>(() => servicesModule.connectivity);
    gh.lazySingleton<_i309.CsvExportService>(() => _i58.CsvExportServiceImpl());
    gh.lazySingleton<_i508.ClockService>(() => _i799.SystemClockService());
    gh.lazySingleton<_i245.ShareService>(() => _i827.ShareServiceImpl());
    gh.lazySingleton<_i1068.FirebaseBootstrap>(
      () => _i326.FirebaseBootstrapImpl(gh<_i609.AppConfig>()),
    );
    gh.lazySingleton<_i529.SyncUploader>(() => _i495.QueueOnlySyncUploader());
    gh.lazySingleton<_i162.ExternalLinkService>(
      () => _i146.ExternalLinkServiceImpl(),
    );
    gh.lazySingleton<_i523.SessionContextService>(
      () => _i1004.InMemorySessionContextService(),
    );
    gh.factory<_i228.ExportCsvUseCase>(
      () => _i228.ExportCsvUseCase(gh<_i309.CsvExportService>()),
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
    gh.factory<_i464.ShareInviteUseCase>(
      () => _i464.ShareInviteUseCase(gh<_i245.ShareService>()),
    );
    gh.lazySingleton<_i361.Dio>(
      () => networkModule.postgrestDio(
        gh<_i609.AppConfig>(),
        gh<_i84.AuthTokenProvider>(),
      ),
      instanceName: 'postgrestDio',
    );
    gh.lazySingleton<_i349.AdminReadClient>(
      () => _i349.AdminReadClient(gh<_i361.Dio>(instanceName: 'postgrestDio')),
    );
    gh.lazySingleton<_i800.AuditClient>(
      () => _i800.AuditClient(gh<_i361.Dio>(instanceName: 'postgrestDio')),
    );
    gh.lazySingleton<_i772.KpiClient>(
      () => _i772.KpiClient(gh<_i361.Dio>(instanceName: 'postgrestDio')),
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
    gh.lazySingleton<_i298.SavedViewsService>(
      () => _i512.SavedViewsServiceImpl(gh<_i924.SyncDatabase>()),
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
    gh.lazySingleton<_i383.PendingSinceTracker>(
      () => _i383.PendingSinceTracker(
        gh<_i924.SyncDatabase>(),
        gh<_i508.ClockService>(),
      ),
      dispose: (i) => i.stop(),
    );
    gh.lazySingleton<_i625.AuditRemoteDataSource>(
      () => _i625.AuditRemoteDataSource(gh<_i800.AuditClient>()),
    );
    gh.factory<_i596.SaveExplorerViewUseCase>(
      () => _i596.SaveExplorerViewUseCase(
        gh<_i298.SavedViewsService>(),
        gh<_i246.IdGenerator>(),
      ),
    );
    gh.factory<_i318.WatchSyncStatusUseCase>(
      () => _i318.WatchSyncStatusUseCase(gh<_i1020.SyncStatusService>()),
    );
    gh.lazySingleton<_i1010.AdminInvitesClient>(
      () => _i1010.AdminInvitesClient(
        gh<_i361.Dio>(instanceName: 'edgeFunctionsDio'),
      ),
    );
    gh.lazySingleton<_i78.AdminWriteClient>(
      () => _i78.AdminWriteClient(
        gh<_i361.Dio>(instanceName: 'edgeFunctionsDio'),
      ),
    );
    gh.lazySingleton<_i559.AnswersRevealClient>(
      () => _i559.AnswersRevealClient(
        gh<_i361.Dio>(instanceName: 'edgeFunctionsDio'),
      ),
    );
    gh.factory<_i497.DeleteExplorerViewUseCase>(
      () => _i497.DeleteExplorerViewUseCase(gh<_i298.SavedViewsService>()),
    );
    gh.factory<_i242.LoadSavedViewsUseCase>(
      () => _i242.LoadSavedViewsUseCase(gh<_i298.SavedViewsService>()),
    );
    gh.lazySingleton<_i517.AdminRemoteDataSource>(
      () => _i517.AdminRemoteDataSource(
        gh<_i349.AdminReadClient>(),
        gh<_i78.AdminWriteClient>(),
        gh<_i1010.AdminInvitesClient>(),
      ),
    );
    gh.factory<_i1048.HomeCubit>(
      () => _i1048.HomeCubit(
        gh<_i17.WatchConnectivityUseCase>(),
        gh<_i318.WatchSyncStatusUseCase>(),
      ),
    );
    gh.lazySingleton<_i460.KpiRemoteDataSource>(
      () => _i460.KpiRemoteDataSource(
        gh<_i772.KpiClient>(),
        gh<_i559.AnswersRevealClient>(),
      ),
    );
    gh.lazySingleton<_i1045.AdminManagementService>(
      () => _i392.AdminManagementServiceImpl(gh<_i517.AdminRemoteDataSource>()),
    );
    gh.lazySingleton<_i429.AdminInviteService>(
      () => _i984.AdminInviteServiceImpl(gh<_i517.AdminRemoteDataSource>()),
    );
    gh.lazySingleton<_i680.AdminDirectoryService>(
      () => _i882.AdminDirectoryServiceImpl(gh<_i517.AdminRemoteDataSource>()),
    );
    gh.lazySingleton<_i542.AuditService>(
      () => _i1007.AuditServiceImpl(gh<_i625.AuditRemoteDataSource>()),
    );
    gh.factory<_i673.CreateLocationUseCase>(
      () => _i673.CreateLocationUseCase(gh<_i1045.AdminManagementService>()),
    );
    gh.factory<_i759.UpdateLocationUseCase>(
      () => _i759.UpdateLocationUseCase(gh<_i1045.AdminManagementService>()),
    );
    gh.factory<_i465.CreateOrganizationUseCase>(
      () =>
          _i465.CreateOrganizationUseCase(gh<_i1045.AdminManagementService>()),
    );
    gh.factory<_i529.SetOrganizationStatusUseCase>(
      () => _i529.SetOrganizationStatusUseCase(
        gh<_i1045.AdminManagementService>(),
      ),
    );
    gh.factory<_i558.UpdateOrganizationUseCase>(
      () =>
          _i558.UpdateOrganizationUseCase(gh<_i1045.AdminManagementService>()),
    );
    gh.factory<_i479.UpdatePersonUseCase>(
      () => _i479.UpdatePersonUseCase(gh<_i1045.AdminManagementService>()),
    );
    gh.factory<_i508.AddMemberToTableUseCase>(
      () => _i508.AddMemberToTableUseCase(gh<_i1045.AdminManagementService>()),
    );
    gh.factory<_i882.ChangeFacilitatorUseCase>(
      () => _i882.ChangeFacilitatorUseCase(gh<_i1045.AdminManagementService>()),
    );
    gh.factory<_i756.CreateTableUseCase>(
      () => _i756.CreateTableUseCase(gh<_i1045.AdminManagementService>()),
    );
    gh.factory<_i230.DeactivateMemberUseCase>(
      () => _i230.DeactivateMemberUseCase(gh<_i1045.AdminManagementService>()),
    );
    gh.factory<_i20.MoveMemberUseCase>(
      () => _i20.MoveMemberUseCase(gh<_i1045.AdminManagementService>()),
    );
    gh.factory<_i610.UpdateTableUseCase>(
      () => _i610.UpdateTableUseCase(gh<_i1045.AdminManagementService>()),
    );
    gh.lazySingleton<_i863.SyncLifecycle>(
      () => _i863.SyncLifecycle(
        gh<_i924.SyncDatabase>(),
        gh<_i383.PendingSinceTracker>(),
        gh<_i997.AuthStateSource>(),
      ),
      dispose: (i) => i.stop(),
    );
    gh.factory<_i936.LoadAuditEventsUseCase>(
      () => _i936.LoadAuditEventsUseCase(gh<_i542.AuditService>()),
    );
    gh.lazySingleton<_i705.AdminScopeService>(
      () => _i531.AdminScopeServiceImpl(
        gh<_i523.SessionContextService>(),
        gh<_i517.AdminRemoteDataSource>(),
      ),
    );
    gh.factory<_i256.LoadLocationUseCase>(
      () => _i256.LoadLocationUseCase(gh<_i680.AdminDirectoryService>()),
    );
    gh.factory<_i592.LoadOrganizationUseCase>(
      () => _i592.LoadOrganizationUseCase(gh<_i680.AdminDirectoryService>()),
    );
    gh.factory<_i108.LoadOrganizationsUseCase>(
      () => _i108.LoadOrganizationsUseCase(gh<_i680.AdminDirectoryService>()),
    );
    gh.factory<_i985.LoadPersonDetailUseCase>(
      () => _i985.LoadPersonDetailUseCase(gh<_i680.AdminDirectoryService>()),
    );
    gh.factory<_i239.LoadTableFormDataUseCase>(
      () => _i239.LoadTableFormDataUseCase(gh<_i680.AdminDirectoryService>()),
    );
    gh.factory<_i543.LoadTablesUseCase>(
      () => _i543.LoadTablesUseCase(gh<_i680.AdminDirectoryService>()),
    );
    gh.lazySingleton<_i585.KpiService>(
      () => _i970.KpiServiceImpl(gh<_i460.KpiRemoteDataSource>()),
    );
    gh.factory<_i850.InvitePersonUseCase>(
      () => _i850.InvitePersonUseCase(gh<_i429.AdminInviteService>()),
    );
    gh.factory<_i422.PersonDetailCubit>(
      () => _i422.PersonDetailCubit(
        gh<_i985.LoadPersonDetailUseCase>(),
        gh<_i479.UpdatePersonUseCase>(),
      ),
    );
    gh.factory<_i710.TableFormCubit>(
      () => _i710.TableFormCubit(
        gh<_i239.LoadTableFormDataUseCase>(),
        gh<_i756.CreateTableUseCase>(),
        gh<_i610.UpdateTableUseCase>(),
      ),
    );
    gh.factory<_i1038.LoadExplorerDataUseCase>(
      () => _i1038.LoadExplorerDataUseCase(
        gh<_i680.AdminDirectoryService>(),
        gh<_i585.KpiService>(),
        gh<_i508.ClockService>(),
      ),
    );
    gh.factory<_i1005.LoadTableDetailUseCase>(
      () => _i1005.LoadTableDetailUseCase(
        gh<_i680.AdminDirectoryService>(),
        gh<_i585.KpiService>(),
      ),
    );
    gh.factory<_i911.CommandPaletteCubit>(
      () => _i911.CommandPaletteCubit(
        gh<_i108.LoadOrganizationsUseCase>(),
        gh<_i543.LoadTablesUseCase>(),
        gh<_i242.LoadSavedViewsUseCase>(),
      ),
    );
    gh.factory<_i353.LocationFormCubit>(
      () => _i353.LocationFormCubit(
        gh<_i256.LoadLocationUseCase>(),
        gh<_i673.CreateLocationUseCase>(),
        gh<_i759.UpdateLocationUseCase>(),
      ),
    );
    gh.factory<_i2.LoadMemberDetailUseCase>(
      () => _i2.LoadMemberDetailUseCase(gh<_i585.KpiService>()),
    );
    gh.factory<_i303.RevealMemberAnswersUseCase>(
      () => _i303.RevealMemberAnswersUseCase(gh<_i585.KpiService>()),
    );
    gh.factory<_i354.LoadReportOptionsUseCase>(
      () => _i354.LoadReportOptionsUseCase(gh<_i585.KpiService>()),
    );
    gh.factory<_i739.LoadOrganizationDetailUseCase>(
      () => _i739.LoadOrganizationDetailUseCase(
        gh<_i680.AdminDirectoryService>(),
        gh<_i585.KpiService>(),
        gh<_i542.AuditService>(),
      ),
    );
    gh.factory<_i131.MemberDetailCubit>(
      () => _i131.MemberDetailCubit(
        gh<_i2.LoadMemberDetailUseCase>(),
        gh<_i303.RevealMemberAnswersUseCase>(),
      ),
    );
    gh.factory<_i615.WatchAdminScopeUseCase>(
      () => _i615.WatchAdminScopeUseCase(gh<_i705.AdminScopeService>()),
    );
    gh.factory<_i84.LoadDrillLevelUseCase>(
      () => _i84.LoadDrillLevelUseCase(
        gh<_i585.KpiService>(),
        gh<_i508.ClockService>(),
      ),
    );
    gh.factory<_i289.LoadReportUseCase>(
      () => _i289.LoadReportUseCase(
        gh<_i585.KpiService>(),
        gh<_i508.ClockService>(),
      ),
    );
    gh.factory<_i640.ExplorerCubit>(
      () => _i640.ExplorerCubit(
        gh<_i1038.LoadExplorerDataUseCase>(),
        gh<_i242.LoadSavedViewsUseCase>(),
        gh<_i596.SaveExplorerViewUseCase>(),
        gh<_i497.DeleteExplorerViewUseCase>(),
        gh<_i228.ExportCsvUseCase>(),
      ),
    );
    gh.factory<_i475.AdminAccessCubit>(
      () => _i475.AdminAccessCubit(
        gh<_i615.WatchAdminScopeUseCase>(),
        gh<_i17.WatchConnectivityUseCase>(),
      ),
    );
    gh.factory<_i760.OrganizationFormCubit>(
      () => _i760.OrganizationFormCubit(
        gh<_i592.LoadOrganizationUseCase>(),
        gh<_i465.CreateOrganizationUseCase>(),
        gh<_i558.UpdateOrganizationUseCase>(),
        gh<_i850.InvitePersonUseCase>(),
      ),
    );
    gh.factory<_i933.InvitePersonCubit>(
      () => _i933.InvitePersonCubit(
        gh<_i108.LoadOrganizationsUseCase>(),
        gh<_i543.LoadTablesUseCase>(),
        gh<_i850.InvitePersonUseCase>(),
        gh<_i464.ShareInviteUseCase>(),
      ),
    );
    gh.factory<_i578.ReportsCubit>(
      () => _i578.ReportsCubit(
        gh<_i289.LoadReportUseCase>(),
        gh<_i354.LoadReportOptionsUseCase>(),
        gh<_i84.LoadDrillLevelUseCase>(),
        gh<_i228.ExportCsvUseCase>(),
        gh<_i615.WatchAdminScopeUseCase>(),
      ),
    );
    gh.factory<_i659.AuditCubit>(
      () => _i659.AuditCubit(
        gh<_i936.LoadAuditEventsUseCase>(),
        gh<_i108.LoadOrganizationsUseCase>(),
        gh<_i228.ExportCsvUseCase>(),
      ),
    );
    gh.factory<_i81.OrganizationDetailCubit>(
      () => _i81.OrganizationDetailCubit(
        gh<_i739.LoadOrganizationDetailUseCase>(),
        gh<_i529.SetOrganizationStatusUseCase>(),
      ),
    );
    gh.factory<_i844.TableDetailCubit>(
      () => _i844.TableDetailCubit(
        gh<_i1005.LoadTableDetailUseCase>(),
        gh<_i882.ChangeFacilitatorUseCase>(),
        gh<_i508.AddMemberToTableUseCase>(),
        gh<_i20.MoveMemberUseCase>(),
        gh<_i230.DeactivateMemberUseCase>(),
      ),
    );
    return this;
  }
}

class _$ServicesModule extends _i553.ServicesModule {}

class _$AppCompositionModule extends _i431.AppCompositionModule {}

class _$AuthSessionModule extends _i139.AuthSessionModule {}

class _$NetworkModule extends _i200.NetworkModule {}
