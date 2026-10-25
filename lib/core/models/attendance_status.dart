import 'package:json_annotation/json_annotation.dart';

part 'attendance_status.g.dart';

/// Attendance recorded for one member in one session.
///
/// Wire values must match `docs/implementation/api-contract.md`.
@JsonEnum(alwaysCreate: true)
enum AttendanceStatus {
  @JsonValue('present')
  present,
  @JsonValue('late')
  late,
  @JsonValue('excused')
  excused,
  @JsonValue('absent')
  absent;

  String get wireValue => _$AttendanceStatusEnumMap[this]!;

  static AttendanceStatus? tryParse(String? raw) => $enumDecodeNullable(
    _$AttendanceStatusEnumMap,
    raw,
    unknownValue: JsonKey.nullForUndefinedEnumValue,
  );
}
