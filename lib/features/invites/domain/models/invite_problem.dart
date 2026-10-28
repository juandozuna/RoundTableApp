/// Why an invite action failed, in the terms the screens explain.
enum InviteProblem {
  notFound,
  expired,
  revoked,
  alreadyUsed,

  /// The invited person is already bound to another account.
  linkedElsewhere,

  /// This account already has another person in that organization.
  identityLinkedElsewhere,
  personInactive,
  organizationInactive,
  tableFull,
  tableHasFacilitator,
  pendingExists,
  personAlreadyLinked,
  forbidden,

  /// The inviter's role cannot grant the chosen role (`invite_role_forbidden`).
  roleNotAllowed,

  /// A facilitator targeted a table that is not theirs (`invite_table_forbidden`).
  tableNotAllowed,
  offline,
  lockedOut,

  /// The server asked this device to slow down (HTTP 429).
  rateLimited,
  unauthenticated,
  validation,
  generic,
}

/// A failed invite call with a [problem] the UI can explain.
final class InviteFailure implements Exception {
  const InviteFailure(this.problem, {this.lockedUntil});

  final InviteProblem problem;

  /// Set for [InviteProblem.lockedOut].
  final DateTime? lockedUntil;

  @override
  String toString() => 'InviteFailure($problem)';
}
