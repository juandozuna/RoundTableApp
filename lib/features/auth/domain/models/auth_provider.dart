/// Identity providers allowed to sign in (ADR 0007). No phone/SMS login.
enum AuthProvider {
  google,
  apple,
  facebook;

  static AuthProvider? tryParse(String? raw) {
    for (final provider in values) {
      if (provider.name == raw) return provider;
    }
    return null;
  }
}
