import '../models/admin_scope.dart';

/// Resolves what the signed-in user may administer from the active context.
abstract interface class AdminScopeService {
  /// Emits the scope now and whenever the context changes; null when the
  /// user has no administrative role.
  Stream<AdminScope?> watch();
}
