import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'error_reporter.dart';
import 'error_reporting_observer.dart';

/// Routes framework, platform and Cubit/Bloc errors to the reporter. Takes a
/// getter so the reporter can be swapped once dependency injection is ready.
void installErrorHandlers(ErrorReporter Function() reporter) {
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    reporter().report(
      source: ErrorSources.flutter,
      error: details.exception,
      stackTrace: details.stack,
    );
  };
  PlatformDispatcher.instance.onError = (error, stackTrace) {
    reporter().report(
      source: ErrorSources.platform,
      error: error,
      stackTrace: stackTrace,
      fatal: true,
    );
    return true;
  };
  Bloc.observer = ErrorReportingBlocObserver(reporter);
}
