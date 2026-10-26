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
import '../../features/auth/data/client/account_client.dart' as _i86;
import '../../features/auth/data/datasources/account_remote_data_source.dart'
    as _i393;
import '../../features/auth/data/services/access_session_service_impl.dart'
    as _i301;
import '../../features/auth/data/services/account_service_impl.dart' as _i958;
import '../../features/auth/data/services/auth_sign_out_service.dart' as _i854;
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
import '../../features/settings/data/client/settings_client.dart' as _i47;
import '../../features/settings/data/datasources/settings_remote_data_source.dart'
    as _i188;
import '../../features/settings/data/services/app_info_service_impl.dart'
    as _i90;
import '../../features/settings/data/services/profile_service_impl.dart'
    as _i945;
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
    final notificationsModule = _$NotificationsModule();
    final authSessionModule = _$AuthSessionModule();
    final networkModule = _$NetworkModule();
    final sessionDataModule = _$SessionDataModule();
    gh.factory<_i86.ParseInviteCodeUseCase>(
      () => const _i86.ParseInviteCodeUseCase(),
    );
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
    gh.lazySingleton<_i914.ClipboardService>(
      () => _i41.FlutterClipboardService(),
    );
    gh.lazySingleton<_i309.CsvExportService>(() => _i58.CsvExportServiceImpl());
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
    gh.lazySingleton<_i483.AppInfoService>(() => _i90.AppInfoServiceImpl());
    gh.factory<_i569.CreateDevAccountUseCase>(
      () => _i569.CreateDevAccountUseCase(gh<_i82.DevAuthService>()),
    );
    gh.factory<_i314.SignInWithDevPasswordUseCase>(
      () => _i314.SignInWithDevPasswordUseCase(gh<_i82.DevAuthService>()),
    );
    gh.lazySingleton<_i1068.FirebaseBootstrap>(
      () => _i326.FirebaseBootstrapImpl(gh<_i609.AppConfig>()),
    );
    gh.lazySingleton<_i59.AuthService>(
      () => _i738.SupabaseAuthService(gh<_i609.AppConfig>()),
    );
    gh.lazySingleton<_i795.NotificationPreferencesService>(
      () => _i99.NotificationPreferencesServiceImpl(
        gh<_i1034.NotificationsLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i162.ExternalLinkService>(
      () => _i146.ExternalLinkServiceImpl(),
    );
    gh.factory<_i228.ExportCsvUseCase>(
      () => _i228.ExportCsvUseCase(gh<_i309.CsvExportService>()),
    );
    gh.factory<_i752.LoadAppInfoUseCase>(
      () => _i752.LoadAppInfoUseCase(gh<_i483.AppInfoService>()),
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
    gh.factory<_i464.ShareInviteUseCase>(
      () => _i464.ShareInviteUseCase(gh<_i245.ShareService>()),
    );
    gh.factory<_i648.ShareInviteTextUseCase>(
      () => _i648.ShareInviteTextUseCase(gh<_i245.ShareService>()),
    );
    gh.lazySingleton<_i428.SignOutService>(
      () => _i854.AuthSignOutService(gh<_i59.AuthService>()),
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
    gh.lazySingleton<_i349.AdminReadClient>(
      () => _i349.AdminReadClient(gh<_i361.Dio>(instanceName: 'postgrestDio')),
    );
    gh.lazySingleton<_i800.AuditClient>(
      () => _i800.AuditClient(gh<_i361.Dio>(instanceName: 'postgrestDio')),
    );
    gh.lazySingleton<_i564.HomeClient>(
      () => _i564.HomeClient(gh<_i361.Dio>(instanceName: 'postgrestDio')),
    );
    gh.lazySingleton<_i111.InviteDirectoryClient>(
      () => _i111.InviteDirectoryClient(
        gh<_i361.Dio>(instanceName: 'postgrestDio'),
      ),
    );
    gh.lazySingleton<_i772.KpiClient>(
      () => _i772.KpiClient(gh<_i361.Dio>(instanceName: 'postgrestDio')),
    );
    gh.factory<_i939.ContextChipCubit>(
      () => _i939.ContextChipCubit(gh<_i434.WatchSessionContextUseCase>()),
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
    gh.lazySingleton<_i362.HomeRemoteDataSource>(
      () => _i362.HomeRemoteDataSource(
        gh<_i564.HomeClient>(),
        gh<_i84.AuthTokenProvider>(),
      ),
    );
    gh.lazySingleton<_i625.AuditRemoteDataSource>(
      () => _i625.AuditRemoteDataSource(gh<_i800.AuditClient>()),
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
    gh.lazySingleton<_i86.AccountClient>(
      () => _i86.AccountClient(gh<_i361.Dio>(instanceName: 'edgeFunctionsDio')),
    );
    gh.lazySingleton<_i956.InvitesClient>(
      () =>
          _i956.InvitesClient(gh<_i361.Dio>(instanceName: 'edgeFunctionsDio')),
    );
    gh.lazySingleton<_i559.AnswersRevealClient>(
      () => _i559.AnswersRevealClient(
        gh<_i361.Dio>(instanceName: 'edgeFunctionsDio'),
      ),
    );
    gh.lazySingleton<_i70.NotificationsClient>(
      () => _i70.NotificationsClient(
        gh<_i361.Dio>(instanceName: 'edgeFunctionsDio'),
      ),
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
    gh.lazySingleton<_i47.SettingsClient>(
      () =>
          _i47.SettingsClient(gh<_i361.Dio>(instanceName: 'edgeFunctionsDio')),
    );
    gh.lazySingleton<_i215.SessionRemoteDataSource>(
      () => _i215.SessionRemoteDataSource(
        gh<_i946.SessionSyncClient>(),
        gh<_i625.SessionControlClient>(),
      ),
    );
    gh.lazySingleton<_i838.InviteDirectoryService>(
      () => _i526.InviteDirectoryServiceImpl(
        gh<_i558.InviteDirectoryRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i393.AccountRemoteDataSource>(
      () => _i393.AccountRemoteDataSource(gh<_i86.AccountClient>()),
    );
    gh.lazySingleton<_i529.SyncUploader>(
      () => _i194.SessionSyncUploader(gh<_i215.SessionRemoteDataSource>()),
    );
    gh.lazySingleton<_i517.AdminRemoteDataSource>(
      () => _i517.AdminRemoteDataSource(
        gh<_i349.AdminReadClient>(),
        gh<_i78.AdminWriteClient>(),
        gh<_i1010.AdminInvitesClient>(),
      ),
    );
    gh.lazySingleton<_i951.NotificationsRemoteDataSource>(
      () => _i951.NotificationsRemoteDataSource(gh<_i70.NotificationsClient>()),
    );
    gh.lazySingleton<_i460.KpiRemoteDataSource>(
      () => _i460.KpiRemoteDataSource(
        gh<_i772.KpiClient>(),
        gh<_i559.AnswersRevealClient>(),
      ),
    );
    gh.lazySingleton<_i887.AccountService>(
      () => _i958.AccountServiceImpl(gh<_i393.AccountRemoteDataSource>()),
    );
    gh.lazySingleton<_i1045.AdminManagementService>(
      () => _i392.AdminManagementServiceImpl(gh<_i517.AdminRemoteDataSource>()),
    );
    gh.lazySingleton<_i723.InvitesRemoteDataSource>(
      () => _i723.InvitesRemoteDataSource(gh<_i956.InvitesClient>()),
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
    gh.lazySingleton<_i656.AccessSessionService>(
      () => _i301.AccessSessionServiceImpl(
        gh<_i997.AuthStateSource>(),
        gh<_i84.AuthTokenProvider>(),
        gh<_i887.AccountService>(),
        gh<_i869.AccessStore>(),
        gh<_i523.SessionContextService>(),
      ),
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
    gh.factory<_i816.LoadInviteTargetsUseCase>(
      () => _i816.LoadInviteTargetsUseCase(gh<_i838.InviteDirectoryService>()),
    );
    gh.factory<_i930.LoadOrganizationTablesUseCase>(
      () => _i930.LoadOrganizationTablesUseCase(
        gh<_i838.InviteDirectoryService>(),
      ),
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
    gh.lazySingleton<_i188.SettingsRemoteDataSource>(
      () => _i188.SettingsRemoteDataSource(gh<_i47.SettingsClient>()),
    );
    gh.lazySingleton<_i686.InviteService>(
      () => _i66.InviteServiceImpl(gh<_i723.InvitesRemoteDataSource>()),
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
    gh.lazySingleton<_i924.SyncDatabase>(
      () => _i405.PowerSyncSyncDatabase(
        gh<_i609.AppConfig>(),
        gh<_i915.SyncSchemaRegistry>(),
        gh<_i84.AuthTokenProvider>(),
        gh<_i529.SyncUploader>(),
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
    gh.lazySingleton<_i468.SessionSyncService>(
      () => _i1002.SessionSyncServiceImpl(gh<_i924.SyncDatabase>()),
    );
    gh.lazySingleton<_i585.KpiService>(
      () => _i970.KpiServiceImpl(gh<_i460.KpiRemoteDataSource>()),
    );
    gh.lazySingleton<_i298.SavedViewsService>(
      () => _i512.SavedViewsServiceImpl(gh<_i924.SyncDatabase>()),
    );
    gh.lazySingleton<_i1020.SyncStatusService>(
      () => _i858.PowerSyncSyncStatusService(
        gh<_i924.SyncDatabase>(),
        gh<_i609.AppConfig>(),
        gh<_i508.ClockService>(),
      ),
    );
    gh.lazySingleton<_i393.AccessRedirectGuard>(
      () => _i393.AccessRedirectGuard(
        gh<_i997.AuthStateSource>(),
        gh<_i656.AccessSessionService>(),
      ),
    );
    gh.lazySingleton<_i785.LocalDataService>(
      () => _i375.LocalDataServiceImpl(gh<_i924.SyncDatabase>()),
    );
    gh.lazySingleton<_i299.HomeLocalDataSource>(
      () => _i299.HomeLocalDataSource(gh<_i924.SyncDatabase>()),
    );
    gh.lazySingleton<_i895.ProfileService>(
      () => _i945.ProfileServiceImpl(gh<_i188.SettingsRemoteDataSource>()),
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
    gh.factory<_i289.RedeemInviteUseCase>(
      () => _i289.RedeemInviteUseCase(
        gh<_i686.InviteService>(),
        gh<_i656.AccessSessionService>(),
      ),
    );
    gh.factory<_i744.NotificationPreferencesCubit>(
      () => _i744.NotificationPreferencesCubit(
        gh<_i727.WatchNotificationSettingsUseCase>(),
        gh<_i553.UpdateNotificationPreferencesUseCase>(),
        gh<_i808.RequestNotificationPermissionUseCase>(),
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
    gh.factory<_i353.LocationFormCubit>(
      () => _i353.LocationFormCubit(
        gh<_i256.LoadLocationUseCase>(),
        gh<_i673.CreateLocationUseCase>(),
        gh<_i759.UpdateLocationUseCase>(),
      ),
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
    gh.factory<_i931.InvitesManagerCubit>(
      () => _i931.InvitesManagerCubit(
        gh<_i276.ListInvitesUseCase>(),
        gh<_i138.RevokeInviteUseCase>(),
        gh<_i569.RenewInviteUseCase>(),
        gh<_i434.WatchSessionContextUseCase>(),
        gh<_i17.WatchConnectivityUseCase>(),
      ),
    );
    gh.factory<_i411.SignOutAndEraseLocalDataUseCase>(
      () => _i411.SignOutAndEraseLocalDataUseCase(
        gh<_i59.AuthService>(),
        gh<_i785.LocalDataService>(),
      ),
    );
    gh.factory<_i596.SaveExplorerViewUseCase>(
      () => _i596.SaveExplorerViewUseCase(
        gh<_i298.SavedViewsService>(),
        gh<_i246.IdGenerator>(),
      ),
    );
    gh.factory<_i69.ScanCubit>(
      () => _i69.ScanCubit(
        gh<_i86.ParseInviteCodeUseCase>(),
        gh<_i641.PreviewInviteUseCase>(),
        gh<_i627.ReadClipboardTextUseCase>(),
      ),
    );
    gh.factory<_i869.LoadProfileUseCase>(
      () => _i869.LoadProfileUseCase(gh<_i895.ProfileService>()),
    );
    gh.factory<_i325.UpdateProfileUseCase>(
      () => _i325.UpdateProfileUseCase(gh<_i895.ProfileService>()),
    );
    gh.factory<_i318.WatchSyncStatusUseCase>(
      () => _i318.WatchSyncStatusUseCase(gh<_i1020.SyncStatusService>()),
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
    gh.lazySingleton<_i4.SessionDriftDatabase>(
      () => sessionDataModule.sessionDriftDatabase(gh<_i924.SyncDatabase>()),
    );
    gh.factory<_i933.InvitePersonCubit>(
      () => _i933.InvitePersonCubit(
        gh<_i108.LoadOrganizationsUseCase>(),
        gh<_i543.LoadTablesUseCase>(),
        gh<_i850.InvitePersonUseCase>(),
        gh<_i464.ShareInviteUseCase>(),
      ),
    );
    gh.factory<_i177.ProfileEditCubit>(
      () => _i177.ProfileEditCubit(
        gh<_i869.LoadProfileUseCase>(),
        gh<_i325.UpdateProfileUseCase>(),
      ),
    );
    gh.lazySingleton<_i751.SessionLocalDataSource>(
      () => _i751.SessionLocalDataSource(
        gh<_i4.SessionDriftDatabase>(),
        gh<_i924.SyncDatabase>(),
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
    gh.lazySingleton<_i677.HomeService>(
      () => _i481.HomeServiceImpl(
        gh<_i299.HomeLocalDataSource>(),
        gh<_i362.HomeRemoteDataSource>(),
        gh<_i508.ClockService>(),
      ),
    );
    gh.factory<_i185.SignOutUseCase>(
      () => _i185.SignOutUseCase(
        gh<_i233.UnregisterDeviceUseCase>(),
        gh<_i523.SessionContextService>(),
        gh<_i428.SignOutService>(),
      ),
    );
    gh.factory<_i106.CodeEntryCubit>(
      () => _i106.CodeEntryCubit(
        gh<_i641.PreviewInviteUseCase>(),
        gh<_i836.GetRemainingAttemptsUseCase>(),
      ),
    );
    gh.factory<_i659.AuditCubit>(
      () => _i659.AuditCubit(
        gh<_i936.LoadAuditEventsUseCase>(),
        gh<_i108.LoadOrganizationsUseCase>(),
        gh<_i228.ExportCsvUseCase>(),
      ),
    );
    gh.lazySingleton<_i620.AttendanceService>(
      () => _i1058.AttendanceServiceImpl(
        gh<_i751.SessionLocalDataSource>(),
        gh<_i508.ClockService>(),
        gh<_i246.IdGenerator>(),
      ),
    );
    gh.factory<_i497.DeleteExplorerViewUseCase>(
      () => _i497.DeleteExplorerViewUseCase(gh<_i298.SavedViewsService>()),
    );
    gh.factory<_i242.LoadSavedViewsUseCase>(
      () => _i242.LoadSavedViewsUseCase(gh<_i298.SavedViewsService>()),
    );
    gh.factory<_i81.OrganizationDetailCubit>(
      () => _i81.OrganizationDetailCubit(
        gh<_i739.LoadOrganizationDetailUseCase>(),
        gh<_i529.SetOrganizationStatusUseCase>(),
      ),
    );
    gh.factory<_i467.NotificationsHostCubit>(
      () => _i467.NotificationsHostCubit(
        gh<_i500.StartNotificationsUseCase>(),
        gh<_i98.WatchForegroundNotificationsUseCase>(),
        gh<_i654.WatchNotificationTargetsUseCase>(),
      ),
    );
    gh.factory<_i677.LoadInviteUseCase>(
      () => _i677.LoadInviteUseCase(gh<_i276.ListInvitesUseCase>()),
    );
    gh.factory<_i169.WatchUnsyncedAlertUseCase>(
      () => _i169.WatchUnsyncedAlertUseCase(
        gh<_i318.WatchSyncStatusUseCase>(),
        gh<_i795.NotificationPreferencesService>(),
      ),
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
    gh.factory<_i246.UnsyncedAlertCubit>(
      () => _i246.UnsyncedAlertCubit(gh<_i169.WatchUnsyncedAlertUseCase>()),
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
    gh.factory<_i911.CommandPaletteCubit>(
      () => _i911.CommandPaletteCubit(
        gh<_i108.LoadOrganizationsUseCase>(),
        gh<_i543.LoadTablesUseCase>(),
        gh<_i242.LoadSavedViewsUseCase>(),
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
    gh.lazySingleton<_i863.SyncLifecycle>(
      () => _i863.SyncLifecycle(
        gh<_i924.SyncDatabase>(),
        gh<_i383.PendingSinceTracker>(),
        gh<_i997.AuthStateSource>(),
      ),
      dispose: (i) => i.stop(),
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
    gh.lazySingleton<_i530.LiveSessionService>(
      () => _i635.LiveSessionServiceImpl(
        gh<_i751.SessionLocalDataSource>(),
        gh<_i1020.SyncStatusService>(),
        gh<_i508.ClockService>(),
      ),
    );
    gh.factory<_i327.SignOutCubit>(
      () => _i327.SignOutCubit(
        gh<_i318.WatchSyncStatusUseCase>(),
        gh<_i17.WatchConnectivityUseCase>(),
        gh<_i349.SignOutUseCase>(),
        gh<_i411.SignOutAndEraseLocalDataUseCase>(),
      ),
    );
    gh.factory<_i246.WatchHomeOverviewUseCase>(
      () => _i246.WatchHomeOverviewUseCase(
        gh<_i434.WatchSessionContextUseCase>(),
        gh<_i677.HomeService>(),
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
    gh.factory<_i995.ShareCubit>(
      () => _i995.ShareCubit(
        gh<_i677.LoadInviteUseCase>(),
        gh<_i790.CopyTextUseCase>(),
        gh<_i648.ShareInviteTextUseCase>(),
        gh<_i200.OpenWhatsAppUseCase>(),
        gh<_i434.WatchSessionContextUseCase>(),
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
    gh.factory<_i275.HomeCubit>(
      () => _i275.HomeCubit(
        gh<_i246.WatchHomeOverviewUseCase>(),
        gh<_i17.WatchConnectivityUseCase>(),
        gh<_i318.WatchSyncStatusUseCase>(),
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

class _$NotificationsModule extends _i166.NotificationsModule {}

class _$AuthSessionModule extends _i139.AuthSessionModule {}

class _$NetworkModule extends _i200.NetworkModule {}

class _$SessionDataModule extends _i129.SessionDataModule {}
