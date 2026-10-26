/// Email/password sign-in for the seeded dev users. Only works in builds
/// compiled with `--dart-define=DEV_AUTH=true`.
abstract interface class DevAuthService {
  bool get isAvailable;

  Future<void> signIn(String email, String password);

  /// Creates and signs in a brand-new test account (stands in for a new
  /// provider identity when redeeming an invite locally). Returns its email.
  Future<String> createAccount();
}
