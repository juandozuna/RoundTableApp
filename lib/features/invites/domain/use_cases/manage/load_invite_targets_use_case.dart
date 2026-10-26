import 'package:injectable/injectable.dart';

import '../../../../../core/models/user_role.dart';
import '../../../../../core/services/session_context/session_context.dart';
import '../../models/invite_permissions.dart';
import '../../models/invite_problem.dart';
import '../../models/invite_targets.dart';
import '../../services/invite_directory_service.dart';

@injectable
class LoadInviteTargetsUseCase {
  const LoadInviteTargetsUseCase(this._directory);

  final InviteDirectoryService _directory;

  /// What [context] can invite to. Members cannot: throws
  /// `InviteFailure(forbidden)`.
  Future<InviteTargets> call(SessionContext context) async {
    final role = context.role;
    if (!InvitePermissions.canInvite(role)) {
      throw const InviteFailure(InviteProblem.forbidden);
    }
    if (role == UserRole.administrator) {
      final organizations = await _directory.organizations();
      final first = organizations.firstOrNull?.id;
      return InviteTargets(
        organizations: organizations,
        organizationId: first,
        tables: first == null
            ? const []
            : await _directory.tables(organizationId: first),
      );
    }
    if (role == UserRole.coordinator) {
      final organizationId = context.organizationId;
      return InviteTargets(
        organizationId: organizationId,
        tables: organizationId == null
            ? const []
            : await _directory.tables(organizationId: organizationId),
      );
    }
    return InviteTargets(
      organizationId: context.organizationId,
      tables: context.tableId == null
          ? const []
          : await _directory.tables(tableId: context.tableId),
    );
  }
}
