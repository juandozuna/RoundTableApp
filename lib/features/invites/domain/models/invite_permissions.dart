import '../../../../core/models/user_role.dart';
import 'invite_role_kind.dart';

/// Who may invite whom (ADR 0006, api-contract.md §5 invites).
abstract final class InvitePermissions {
  /// Roles [inviter] can grant. Empty for members.
  static List<InviteRoleKind> grantableBy(UserRole inviter) =>
      switch (inviter) {
        UserRole.administrator || UserRole.coordinator => const [
          InviteRoleKind.member,
          InviteRoleKind.facilitator,
          InviteRoleKind.coordinator,
        ],
        UserRole.facilitator => const [InviteRoleKind.member],
        UserRole.member => const [],
      };

  static bool canInvite(UserRole inviter) => grantableBy(inviter).isNotEmpty;

  /// Only staff pick the organization; everyone else is fixed to theirs.
  static bool choosesOrganization(UserRole inviter) =>
      inviter == UserRole.administrator;

  /// A facilitator invites to their own table only.
  static bool choosesTable(UserRole inviter) =>
      inviter == UserRole.administrator || inviter == UserRole.coordinator;
}
