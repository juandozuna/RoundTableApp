import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../core/config/app_config.dart';
import '../core/config/injection.dart';
import '../core/routing/app_router.dart';
import '../core/services/firebase/firebase_bootstrap.dart';
import '../core/services/logging/app_log.dart';
import '../core/sync/data/sync_lifecycle.dart';
import 'app.dart';

/// Startup order: config → Supabase Auth → DI → optional Firebase → local
/// database → UI. Missing optional configuration never blocks startup.
Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    AppLog.error(
      'flutter',
      details.exceptionAsString(),
      details.exception,
      details.stack,
    );
  };
  PlatformDispatcher.instance.onError = (error, stackTrace) {
    AppLog.error('app', 'Uncaught error', error, stackTrace);
    return true;
  };

  final config = AppConfig.fromEnvironment();
  if (config.hasSupabase) {
    await Supabase.initialize(
      url: config.supabaseUrl,
      publishableKey: config.supabaseAnonKey,
    );
  } else {
    AppLog.warning(
      'bootstrap',
      'SUPABASE_URL/SUPABASE_ANON_KEY not set; '
          'auth and remote calls are disabled.',
    );
  }

  configureDependencies();
  await getIt<FirebaseBootstrap>().initialize();
  await getIt<SyncLifecycle>().start();

  runApp(GoldRoundtablesApp(router: getIt<AppRouter>().config));
}
