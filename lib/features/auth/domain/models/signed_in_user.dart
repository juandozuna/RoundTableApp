import 'auth_provider.dart';

/// The identity behind the current session. Contact data on it comes from
/// the provider and is only used to prefill forms.
class SignedInUser {
  const SignedInUser({
    required this.id,
    this.email,
    this.provider,
    this.firstName,
    this.lastName,
  });

  final String id;
  final String? email;

  /// `null` for dev email/password accounts.
  final AuthProvider? provider;
  final String? firstName;
  final String? lastName;

  /// Apple's "Ocultar mi correo" relay address.
  bool get hasHiddenEmail =>
      email != null && email!.endsWith('privaterelay.appleid.com');

  String get displayName {
    final full = [firstName, lastName].whereType<String>().join(' ').trim();
    if (full.isNotEmpty) return full;
    return email ?? '';
  }
}
