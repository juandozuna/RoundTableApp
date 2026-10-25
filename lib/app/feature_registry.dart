import '../core/config/app_config.dart';
import '../core/routing/feature_router.dart';
import '../core/sync/data/sync_schema.dart';
import '../features/shell/shell_router.dart';
import '../features/shell/shell_routes.dart';

// Composition root for features. Each feature adds ONE line to each list it
// needs; nothing else in lib/app or lib/core changes when a feature lands.

/// Where the app starts and where "Ir al inicio" goes.
const String appHomeLocation = ShellRoutes.home;

/// Routes, destinations and public locations of every feature.
List<FeatureRouter> buildFeatureRouters(AppConfig config) => [
  ShellFeatureRouter(includeComponentGallery: !config.isProduction),
];

/// PowerSync tables of every offline-first feature (session).
const List<SyncSchemaContribution> syncSchemaContributions = [];
