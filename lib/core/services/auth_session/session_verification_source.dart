/// Tells when the identity was confirmed with the server (sign-in or a
/// successful token refresh), independent of the auth SDK.
abstract interface class SessionVerificationSource {
  /// Emits each time the server accepted this session.
  Stream<void> get verifications;
}
