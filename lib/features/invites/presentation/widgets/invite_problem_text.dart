import 'package:flutter/widgets.dart';

import '../../../../core/extensions/build_context_x.dart';
import '../../domain/models/invite_problem.dart';

/// Short, plain-language message for an [InviteProblem] (toasts, inline
/// errors). Full-screen outcomes have their own copy in the redeem page.
extension InviteProblemText on InviteProblem {
  String message(BuildContext context) {
    final l10n = context.l10n;
    return switch (this) {
      InviteProblem.notFound => l10n.invitesProblemNotFound,
      InviteProblem.expired => l10n.invitesProblemExpired,
      InviteProblem.revoked => l10n.invitesProblemRevoked,
      InviteProblem.alreadyUsed => l10n.invitesProblemAlreadyUsed,
      InviteProblem.linkedElsewhere => l10n.invitesProblemLinkedElsewhere,
      InviteProblem.identityLinkedElsewhere =>
        l10n.invitesProblemIdentityLinkedElsewhere,
      InviteProblem.personInactive ||
      InviteProblem.organizationInactive => l10n.invitesProblemUnavailable,
      InviteProblem.tableFull => l10n.invitesProblemTableFull,
      InviteProblem.tableHasFacilitator =>
        l10n.invitesProblemTableHasFacilitator,
      InviteProblem.pendingExists => l10n.invitesProblemPendingExists,
      InviteProblem.personAlreadyLinked =>
        l10n.invitesProblemPersonAlreadyLinked,
      InviteProblem.forbidden => l10n.errorForbidden,
      InviteProblem.roleNotAllowed => l10n.invitesProblemRoleNotAllowed,
      InviteProblem.tableNotAllowed => l10n.invitesProblemTableNotAllowed,
      InviteProblem.offline => l10n.invitesProblemOffline,
      InviteProblem.lockedOut => l10n.invitesCodeLocked,
      InviteProblem.rateLimited => l10n.invitesProblemRateLimited,
      InviteProblem.unauthenticated => l10n.errorUnauthorized,
      InviteProblem.validation => l10n.errorValidation,
      InviteProblem.generic => l10n.errorGeneric,
    };
  }
}
