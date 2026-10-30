import 'auth_provider.dart';

/// The sign-in methods a build offers (ADR 0018). Social providers stay
/// implemented; a build turns each one on with `AUTH_METHODS`.
class EnabledAuthMethods {
  const EnabledAuthMethods({this.email = true, this.providers = const []});

  /// Email and password: sign in, create account, reset password.
  final bool email;
  final List<AuthProvider> providers;

  /// Parses a comma-separated list such as `email,google`. Unknown names are
  /// ignored; an empty or fully unknown list falls back to email only so the
  /// sign-in screen is never empty.
  factory EnabledAuthMethods.parse(String raw) {
    final names = raw
        .split(',')
        .map((name) => name.trim().toLowerCase())
        .where((name) => name.isNotEmpty)
        .toSet();
    final providers = [
      for (final provider in AuthProvider.values)
        if (names.contains(provider.name)) provider,
    ];
    final email = names.contains(emailName);
    if (!email && providers.isEmpty) return const EnabledAuthMethods();
    return EnabledAuthMethods(email: email, providers: providers);
  }

  static const String emailName = 'email';

  bool get hasProviders => providers.isNotEmpty;
}
