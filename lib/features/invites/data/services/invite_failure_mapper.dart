import '../../../../core/network/api_exception.dart';
import '../../domain/models/invite_problem.dart';

/// Maps the stable error codes of api-contract.md §2 to [InviteProblem]s.
abstract final class InviteFailureMapper {
  static InviteFailure fromApi(ApiException error) =>
      InviteFailure(_problemFor(error));

  static InviteProblem _problemFor(ApiException error) {
    switch (error.code) {
      case 'invite_not_found':
        return InviteProblem.notFound;
      case 'invite_expired':
        return InviteProblem.expired;
      case 'invite_revoked':
        return InviteProblem.revoked;
      case 'invite_already_used':
        return InviteProblem.alreadyUsed;
      case 'person_linked_elsewhere':
        return InviteProblem.linkedElsewhere;
      case 'identity_linked_elsewhere':
        return InviteProblem.identityLinkedElsewhere;
      case 'person_inactive':
        return InviteProblem.personInactive;
      case 'organization_inactive':
        return InviteProblem.organizationInactive;
      case 'table_full':
        return InviteProblem.tableFull;
      case 'table_has_facilitator':
        return InviteProblem.tableHasFacilitator;
      case 'invite_pending_exists':
        return InviteProblem.pendingExists;
      case 'person_already_linked':
        return InviteProblem.personAlreadyLinked;
      case 'rate_limited':
        return InviteProblem.rateLimited;
      case 'invite_role_forbidden':
        return InviteProblem.roleNotAllowed;
      case 'invite_table_forbidden':
        return InviteProblem.tableNotAllowed;
      case 'forbidden':
        return InviteProblem.forbidden;
      case 'unauthenticated':
        return InviteProblem.unauthenticated;
      case 'validation_failed':
        return InviteProblem.validation;
    }
    return switch (error.kind) {
      ApiErrorKind.network || ApiErrorKind.timeout => InviteProblem.offline,
      ApiErrorKind.forbidden => InviteProblem.forbidden,
      ApiErrorKind.unauthorized => InviteProblem.unauthenticated,
      ApiErrorKind.validation => InviteProblem.validation,
      _ => InviteProblem.generic,
    };
  }
}
