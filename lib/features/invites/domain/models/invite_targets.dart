import 'invite_target_organization.dart';
import 'invite_target_table.dart';

/// What the invite form can pick from for the current inviter.
class InviteTargets {
  const InviteTargets({
    this.organizations = const [],
    this.tables = const [],
    this.organizationId,
  });

  /// Only filled for platform administrators, who choose the organization.
  final List<InviteTargetOrganization> organizations;

  /// Tables of [organizationId] (all of them), or the facilitator's own.
  final List<InviteTargetTable> tables;

  /// Organization the tables belong to.
  final String? organizationId;
}
