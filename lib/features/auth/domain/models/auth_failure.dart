enum AuthFailureKind {
  /// No internet: first sign-in needs a connection.
  offline,

  /// The person closed the provider's screen or denied access.
  cancelled,

  /// The backend is not configured in this build.
  notConfigured,

  /// Wrong email/password (dev sign-in only).
  invalidCredentials,

  unknown,
}

/// A sign-in or sign-out failure, free of any auth SDK type.
final class AuthFailure implements Exception {
  const AuthFailure(this.kind, {this.message});

  final AuthFailureKind kind;

  /// Provider or SDK detail, for logs only.
  final String? message;

  @override
  String toString() => 'AuthFailure($kind, $message)';
}
