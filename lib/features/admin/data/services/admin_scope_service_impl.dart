import 'package:injectable/injectable.dart';

import '../../../../core/models/user_role.dart';
import '../../../../core/services/session_context/session_context.dart';
import '../../../../core/services/session_context/session_context_service.dart';
import '../../domain/models/admin_scope.dart';
import '../../domain/services/admin_scope_service.dart';
import '../datasources/admin_remote_data_source.dart';

/// Derives the administrative scope from the active [SessionContext]. While no
/// context has been chosen yet (the context feature is still starting) it asks
/// the server who the user is, so the screens work on their own.
@LazySingleton(as: AdminScopeService)
class AdminScopeServiceImpl implements AdminScopeService {
  AdminScopeServiceImpl(this._context, this._remote);

  final SessionContextService _context;
  final AdminRemoteDataSource _remote;

  @override
  Stream<AdminScope?> watch() async* {
    await for (final context in _context.watch()) {
      yield context == null ? await _fromServer() : _fromContext(context);
    }
  }

  AdminScope? _fromContext(SessionContext context) => switch (context.role) {
    UserRole.administrator => const AdminScope(isAdministrator: true),
    UserRole.coordinator when context.organizationId != null => AdminScope(
      isAdministrator: false,
      organizationId: context.organizationId,
      organizationName: context.organizationName,
    ),
    _ => null,
  };

  Future<AdminScope?> _fromServer() async {
    final me = await _remote.me();
    if (me['is_platform_admin'] == true) {
      return const AdminScope(isAdministrator: true);
    }
    final contexts = me['contexts'];
    if (contexts is! List) return null;
    for (final raw in contexts) {
      if (raw is Map && raw['kind'] == 'coordinator') {
        return AdminScope(
          isAdministrator: false,
          organizationId: raw['organization_id'] as String?,
          organizationName: raw['organization_name'] as String?,
        );
      }
    }
    return null;
  }
}
