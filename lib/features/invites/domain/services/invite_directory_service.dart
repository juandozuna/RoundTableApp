import '../models/invite_target_organization.dart';
import '../models/invite_target_table.dart';

/// Read-only lookups the invite form needs (online, under RLS).
abstract interface class InviteDirectoryService {
  Future<List<InviteTargetOrganization>> organizations();

  /// Tables of [organizationId], or the single table [tableId]. Throws
  /// `InviteFailure`.
  Future<List<InviteTargetTable>> tables({
    String? organizationId,
    String? tableId,
  });
}
