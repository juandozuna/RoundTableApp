import '../core/config/app_config.dart';
import '../core/routing/feature_router.dart';
import '../features/admin/admin_router.dart';
import '../features/audit/audit_router.dart';
import '../features/auth/auth_router.dart';
import '../features/calendar/calendar_router.dart';
import '../features/curriculum/curriculum_router.dart';
import '../features/history/history_router.dart';
import '../features/home/home_router.dart';
import '../features/home/home_routes.dart';
import '../features/invites/invites_router.dart';
import '../features/kpis/kpis_router.dart';
import '../features/notifications/notifications_router.dart';
import '../features/session/session_router.dart';
import '../features/settings/settings_router.dart';
import '../features/shell/shell_router.dart';

// Composition root for features. Each feature adds ONE line to each list it
// needs; nothing else in lib/app or lib/core changes when a feature lands.

/// Where the app starts and where "Ir al inicio" goes.
const String appHomeLocation = HomeRoutes.home;

/// Routes, destinations and public locations of every feature.
List<FeatureRouter> buildFeatureRouters(AppConfig config) => [
  ShellFeatureRouter(includeComponentGallery: !config.isProduction),
  const AuthFeatureRouter(homeLocation: appHomeLocation),
  const InvitesFeatureRouter(),
  const AdminFeatureRouter(),
  const KpisFeatureRouter(),
  const AuditFeatureRouter(),
  const CurriculumFeatureRouter(),
  HomeFeatureRouter(includeComponentGallery: !config.isProduction),
  const NotificationsFeatureRouter(),
  const SettingsFeatureRouter(),
  const SessionFeatureRouter(),
  const HistoryFeatureRouter(),
  const CalendarFeatureRouter(),
];
