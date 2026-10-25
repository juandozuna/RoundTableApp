/// Supplies the signed-in user's access token to the HTTP and sync layers
/// without exposing the auth SDK.
abstract interface class AuthTokenProvider {
  /// Current access token (JWT), or `null` when signed out.
  String? get accessToken;

  /// Id of the signed-in user, or `null` when signed out.
  String? get userId;

  /// Refreshes the session and returns the new access token, or `null` when
  /// the session can no longer be refreshed.
  Future<String?> refreshAccessToken();
}
