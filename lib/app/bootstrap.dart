import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../core/config/app_config.dart';
import '../core/config/injection.dart';
import '../core/routing/app_router.dart';
import '../core/services/clock/system_clock_service.dart';
import '../core/services/error_reporting/error_handlers.dart';
import '../core/services/error_reporting/error_reporter.dart';
import '../core/services/error_reporting/logging_error_reporter.dart';
import '../core/services/firebase/firebase_bootstrap.dart';
import '../core/services/logging/app_log.dart';
import 'app.dart';

/// Startup order: config → error handlers → Supabase Auth → DI → optional
/// Firebase → local database → UI. Missing optional configuration never
/// blocks startup.
Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();
  final config = AppConfig.fromEnvironment();

  // Errors before dependency injection is ready only reach the log; the
  // configured reporter replaces it right after `configureDependencies`.
  ErrorReporter reporter = LoggingErrorReporter(
    StaticErrorContextProvider(
      ErrorReportContext(environment: config.environment.name),
    ),
    const NoErrorReportSink(),
    const SystemClockService(),
  );
  installErrorHandlers(() => reporter);

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
  await getIt<ErrorContextProvider>().prepare();
  reporter = getIt<ErrorReporter>();
  await getIt<FirebaseBootstrap>().initialize();

  runApp(GoldRoundtablesApp(router: getIt<AppRouter>().config));
}
