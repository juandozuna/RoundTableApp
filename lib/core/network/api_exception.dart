/// Category of a failed remote call, used to pick user-facing copy and
/// recovery actions.
enum ApiErrorKind {
  network,
  timeout,
  cancelled,
  unauthorized,
  forbidden,
  notFound,
  conflict,
  validation,
  server,
  unknown,
}

/// A failed remote call, decoupled from Dio. Remote data sources throw this;
/// services and use cases may map it to feature-specific failures.
final class ApiException implements Exception {
  const ApiException({
    required this.kind,
    this.code,
    this.message,
    this.statusCode,
  });

  final ApiErrorKind kind;

  /// Machine-readable code from the error envelope, e.g. `invite_expired`.
  final String? code;

  /// Server message, for logs. Never show it to users verbatim.
  final String? message;

  final int? statusCode;

  bool get isRetryable =>
      kind == ApiErrorKind.network ||
      kind == ApiErrorKind.timeout ||
      kind == ApiErrorKind.server;

  @override
  String toString() =>
      'ApiException(kind: $kind, status: $statusCode, code: $code, message: $message)';
}
