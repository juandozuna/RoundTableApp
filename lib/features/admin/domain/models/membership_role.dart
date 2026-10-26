import 'package:json_annotation/json_annotation.dart';

part 'membership_role.g.dart';

@JsonEnum(alwaysCreate: true)
enum MembershipRole {
  @JsonValue('facilitator')
  facilitator,
  @JsonValue('member')
  member;

  String get wireValue => _$MembershipRoleEnumMap[this]!;

  static MembershipRole? tryParse(String? raw) => $enumDecodeNullable(
    _$MembershipRoleEnumMap,
    raw,
    unknownValue: JsonKey.nullForUndefinedEnumValue,
  );
}
