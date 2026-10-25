import 'package:json_annotation/json_annotation.dart';

part 'assessment_kind.g.dart';

/// The two scored assessments of a session.
///
/// Wire values must match `docs/implementation/api-contract.md`.
@JsonEnum(alwaysCreate: true)
enum AssessmentKind {
  @JsonValue('follow_up')
  followUp,
  @JsonValue('current_value')
  currentValue;

  String get wireValue => _$AssessmentKindEnumMap[this]!;

  static AssessmentKind? tryParse(String? raw) => $enumDecodeNullable(
    _$AssessmentKindEnumMap,
    raw,
    unknownValue: JsonKey.nullForUndefinedEnumValue,
  );
}
