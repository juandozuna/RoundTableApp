/// Seeded users of the local stack (api-contract.md §1). Referenced only from
/// code guarded by `AppConfig.devAuthCompiledIn`, so release builds drop them.
abstract final class DevUsers {
  // Folded at compile time: release builds (DEV_AUTH unset) contain no password.
  static const String password = bool.fromEnvironment('DEV_AUTH')
      ? 'dev-password-123'
      : '';

  static const List<DevUser> accounts = [
    DevUser(email: 'admin@dev.local', label: 'Administrador'),
    DevUser(email: 'coord@dev.local', label: 'Coordinador · Miembro'),
    DevUser(email: 'facil@dev.local', label: 'Facilitador'),
    DevUser(email: 'ana@dev.local', label: 'Miembro (Ana)'),
    DevUser(email: 'luis@dev.local', label: 'Miembro (Luis)'),
    DevUser(email: 'marta@dev.local', label: 'Miembro (Marta)'),
  ];
}

class DevUser {
  const DevUser({required this.email, required this.label});

  final String email;
  final String label;
}
