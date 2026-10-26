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
  offline,
  lockedOut,
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
