/// Where an error came from. Becomes the `logger` of the report.
abstract final class ErrorSources {
  static const String flutter = 'flutter';
  static const String platform = 'platform';
  static const String bloc = 'bloc';
  static const String startup = 'startup';
}

/// Situation the error happened in. Deliberately free of personal data: no
/// names, emails, ids, answers or query strings (RNF-23/25).
class ErrorReportContext {
  const ErrorReportContext({
    this.role,
    this.route,
    this.appVersion = unknown,
    this.environment = unknown,
    this.platform = unknown,
  });

  static const String unknown = 'unknown';

  /// Active role (`administrator`, `coordinator`, …) or `null` when signed out.
  final String? role;

  /// Current location without query string, ids replaced by `:id`.
  final String? route;
  final String appVersion;
  final String environment;
  final String platform;
}

/// One error occurrence, already scrubbed and ready to leave the device.
class ErrorReport {
  const ErrorReport({
    required this.source,
    required this.errorType,
    required this.message,
    required this.occurredAt,
    required this.context,
    this.stackTrace,
    this.fatal = false,
  });

  final String source;
  final String errorType;
  final String message;
  final String? stackTrace;
  final bool fatal;
  final DateTime occurredAt;
  final ErrorReportContext context;

  /// Same error seen again shortly after is reported once.
  String get fingerprint => '$source|$errorType|$message';

  /// Sentry event shape (`exception.values`, `tags`, `release`), so the URL
  /// can point at a Sentry-compatible relay without client changes.
  Map<String, Object?> toJson() => {
    'timestamp': occurredAt.toUtc().toIso8601String(),
    'level': fatal ? 'fatal' : 'error',
    'platform': 'dart',
    'logger': source,
    'release': context.appVersion,
    'environment': context.environment,
    'tags': {
      'role': context.role ?? 'none',
      'route': context.route ?? 'none',
      'device_platform': context.platform,
      'source': source,
    },
    'exception': {
      'values': [
        {'type': errorType, 'value': message},
      ],
    },
    if (stackTrace != null) 'extra': {'stack': stackTrace},
  };
}

/// Records unexpected errors for incident investigation (RNF-23, RNF-25).
/// Implementations must never throw and never block the caller.
abstract interface class ErrorReporter {
  void report({
    required String source,
    required Object error,
    StackTrace? stackTrace,
    bool fatal = false,
  });
}

/// Supplies the [ErrorReportContext] at the moment an error happens.
abstract interface class ErrorContextProvider {
  /// Loads build metadata that needs async platform access. Never throws.
  Future<void> prepare();

  ErrorReportContext read();
}

/// Optional off-device transport (HTTP relay, Sentry, …). May fail freely:
/// the reporter swallows its errors.
abstract interface class ErrorReportSink {
  Future<void> send(ErrorReport report);
}

/// Sink used when no transport is configured.
class NoErrorReportSink implements ErrorReportSink {
  const NoErrorReportSink();

  @override
  Future<void> send(ErrorReport report) async {}
}

/// Fixed context, used before dependency injection is ready and in tests.
class StaticErrorContextProvider implements ErrorContextProvider {
  const StaticErrorContextProvider(this._context);

  final ErrorReportContext _context;

  @override
  Future<void> prepare() async {}

  @override
  ErrorReportContext read() => _context;
}
