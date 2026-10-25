import 'package:injectable/injectable.dart';

import '../core/config/app_config.dart';
import '../core/routing/feature_router.dart';
import '../core/sync/data/sync_schema.dart';
import 'feature_registry.dart';

@module
abstract class AppCompositionModule {
  @lazySingleton
  FeatureRouterRegistry featureRouterRegistry(AppConfig config) =>
      FeatureRouterRegistry(
        routers: buildFeatureRouters(config),
        homeLocation: appHomeLocation,
      );

  @lazySingleton
  SyncSchemaRegistry get syncSchemaRegistry =>
      const SyncSchemaRegistry(syncSchemaContributions);
}
