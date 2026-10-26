import 'package:injectable/injectable.dart';

import '../../../../../core/models/user_role.dart';
import '../../../../../core/services/session_context/session_context.dart';
import '../../models/invite.dart';
import '../../models/invite_permissions.dart';
import '../../models/invite_problem.dart';
import '../../models/invite_scope.dart';
import '../../services/invite_service.dart';

@injectable
class ListInvitesUseCase {
  const ListInvitesUseCase(this._invites);

  final InviteService _invites;

  /// Invites [context] manages: everything for staff, the organization for a
  /// coordinator, the table for a facilitator. Throws `InviteFailure`.
  Future<List<Invite>> call(SessionContext context) {
    if (!InvitePermissions.canInvite(context.role)) {
      throw const InviteFailure(InviteProblem.forbidden);
    }
    final scope = switch (context.role) {
      UserRole.coordinator => InviteScope(
        organizationId: context.organizationId,
      ),
      UserRole.facilitator => InviteScope(roundTableId: context.tableId),
      UserRole.administrator || UserRole.member => const InviteScope(),
    };
    return _invites.list(scope);
  }
}
