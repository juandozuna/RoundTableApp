import 'package:freezed_annotation/freezed_annotation.dart';
import '../../models/user_role.dart';

part 'table_member_record.freezed.dart';
part 'table_member_record.g.dart';

/// Row of `table_members`. `firstName` and `lastName` are real columns
/// denormalized from `people` by trigger (migration 100300), so a roster read
/// needs no embed. `auth_user_id` is also a real column but is not mapped.
@freezed
abstract class TableMemberRecord with _$TableMemberRecord {
  const factory TableMemberRecord({
    required String id,
    required String organizationId,
    required String roundTableId,
    required String personId,
    required UserRole role,
    required DateTime joinedAt,
    DateTime? leftAt,
    String? leftReason,
    required String status,
    @Default('') String firstName,
    @Default('') String lastName,
  }) = _TableMemberRecord;

  factory TableMemberRecord.fromJson(Map<String, dynamic> json) =>
      _$TableMemberRecordFromJson(json);
}
