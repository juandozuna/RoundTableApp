import 'package:flutter_bloc/flutter_bloc.dart';

import 'error_reporter.dart';

/// Reports errors raised inside any Cubit or Bloc.
class ErrorReportingBlocObserver extends BlocObserver {
  ErrorReportingBlocObserver(this._reporter);

  final ErrorReporter Function() _reporter;

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    _reporter().report(
      source: ErrorSources.bloc,
      error: error,
      stackTrace: stackTrace,
    );
    super.onError(bloc, error, stackTrace);
  }
}
