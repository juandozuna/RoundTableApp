import 'package:json_annotation/json_annotation.dart';

part 'user_role.g.dart';

/// Role a person holds in one context (ADR 0006).
///
/// Wire values must match `docs/implementation/api-contract.md`.
@JsonEnum(alwaysCreate: true)
enum UserRole {
  @JsonValue('administrator')
  administrator,
  @JsonValue('coordinator')
  coordinator,
  @JsonValue('facilitator')
  facilitator,
  @JsonValue('member')
  member;

  String get wireValue => _$UserRoleEnumMap[this]!;

  static UserRole? tryParse(String? raw) => $enumDecodeNullable(
    _$UserRoleEnumMap,
    raw,
    unknownValue: JsonKey.nullForUndefinedEnumValue,
  );
}
