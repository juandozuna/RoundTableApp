import 'package:json_annotation/json_annotation.dart';

part 'commitment_follow_up_status.g.dart';

/// How a member reports last week's commitment went.
///
/// Wire values must match `docs/implementation/api-contract.md`.
@JsonEnum(alwaysCreate: true)
enum CommitmentFollowUpStatus {
  @JsonValue('kept')
  kept,
  @JsonValue('partial')
  partial,
  @JsonValue('not_kept')
  notKept;

  String get wireValue => _$CommitmentFollowUpStatusEnumMap[this]!;

  static CommitmentFollowUpStatus? tryParse(String? raw) => $enumDecodeNullable(
    _$CommitmentFollowUpStatusEnumMap,
    raw,
    unknownValue: JsonKey.nullForUndefinedEnumValue,
  );
}
