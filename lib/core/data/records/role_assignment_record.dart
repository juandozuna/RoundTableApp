import 'package:freezed_annotation/freezed_annotation.dart';
import '../../models/user_role.dart';

part 'role_assignment_record.freezed.dart';
part 'role_assignment_record.g.dart';

/// Row of `role_assignments`: only `platform_admin` and `coordinator` roles are
/// stored here; facilitator and member come from `table_members`.
@freezed
abstract class RoleAssignmentRecord with _$RoleAssignmentRecord {
  const factory RoleAssignmentRecord({
    required String id,
    required String personId,
    required UserRole role,
    String? organizationId,
    String? locationId,
    required String status,
  }) = _RoleAssignmentRecord;

  factory RoleAssignmentRecord.fromJson(Map<String, dynamic> json) =>
      _$RoleAssignmentRecordFromJson(json);
}
