import 'package:json_annotation/json_annotation.dart';

part 'attendance_source.g.dart';

/// Who set an attendance row: the facilitator, or the server when the
/// person submitted answers (auto-attendance, ADR 0005).
///
/// Wire values must match `docs/implementation/api-contract.md`.
@JsonEnum(alwaysCreate: true)
enum AttendanceSource {
  @JsonValue('facilitator')
  facilitator,
  @JsonValue('auto_submission')
  autoSubmission;

  String get wireValue => _$AttendanceSourceEnumMap[this]!;

  static AttendanceSource? tryParse(String? raw) => $enumDecodeNullable(
    _$AttendanceSourceEnumMap,
    raw,
    unknownValue: JsonKey.nullForUndefinedEnumValue,
  );
}
