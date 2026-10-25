import 'dart:developer' as developer;

/// Minimal structured logging for infrastructure code.
abstract final class AppLog {
  static void info(String scope, String message) =>
      developer.log(message, name: scope);

  static void warning(String scope, String message, [Object? error]) =>
      developer.log(message, name: scope, level: 900, error: error);

  static void error(
    String scope,
    String message, [
    Object? error,
    StackTrace? stackTrace,
  ]) => developer.log(
    message,
    name: scope,
    level: 1000,
    error: error,
    stackTrace: stackTrace,
  );
}
