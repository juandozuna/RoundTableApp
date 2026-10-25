import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

import '../config/app_config.dart';

/// Third-party singletons and configuration.
@module
abstract class ServicesModule {
  @singleton
  AppConfig get appConfig => AppConfig.fromEnvironment();

  @lazySingleton
  Connectivity get connectivity => Connectivity();
}
