import 'package:json_annotation/json_annotation.dart';

part 'session_stage.g.dart';

/// Stages of a weekly session, in order (ADR 0013).
///
/// Wire values must match `docs/implementation/api-contract.md`.
@JsonEnum(alwaysCreate: true)
enum SessionStage {
  @JsonValue('open')
  open,
  @JsonValue('attendance')
  attendance,
  @JsonValue('follow_up')
  followUp,
  @JsonValue('current_value')
  currentValue,
  @JsonValue('commitment')
  commitment,
  @JsonValue('closing')
  closing;

  String get wireValue => _$SessionStageEnumMap[this]!;

  static SessionStage? tryParse(String? raw) => $enumDecodeNullable(
    _$SessionStageEnumMap,
    raw,
    unknownValue: JsonKey.nullForUndefinedEnumValue,
  );
}
