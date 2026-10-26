import 'package:freezed_annotation/freezed_annotation.dart';

import 'membership_role.dart';
import 'record_status.dart';

part 'table_membership.freezed.dart';
part 'table_membership.g.dart';

/// A row of `table_members`: current and past seats, so history is kept.
@freezed
abstract class TableMembership with _$TableMembership {
  const TableMembership._();

  const factory TableMembership({
    required String id,
    required String personId,
    @JsonKey(unknownEnumValue: MembershipRole.member)
    @Default(MembershipRole.member)
    MembershipRole role,
    DateTime? joinedAt,
    DateTime? leftAt,
    String? leftReason,
    String? movedToRoundTableId,
    @JsonKey(unknownEnumValue: RecordStatus.inactive)
    @Default(RecordStatus.active)
    RecordStatus status,
    @Default('') String firstName,
    @Default('') String lastName,
  }) = _TableMembership;

  factory TableMembership.fromJson(Map<String, dynamic> json) =>
      _$TableMembershipFromJson(json);

  String get fullName => '$firstName $lastName'.trim();

  bool get isActive => status == RecordStatus.active;
}
