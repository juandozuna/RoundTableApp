import 'package:json_annotation/json_annotation.dart';

part 'health_reason.g.dart';

/// Why an active table needs attention (`kpi_tables.health_reasons`, RF-25).
///
/// Wire values must match `docs/implementation/api-contract.md`.
@JsonEnum(alwaysCreate: true)
enum HealthReason {
  @JsonValue('low_attendance')
  lowAttendance,
  @JsonValue('few_people')
  fewPeople;

  static HealthReason? tryParse(String? raw) => $enumDecodeNullable(
    _$HealthReasonEnumMap,
    raw,
    unknownValue: JsonKey.nullForUndefinedEnumValue,
  );

  /// Decodes the `health_reasons` array, ignoring reasons this app version
  /// does not know yet.
  static List<HealthReason> listFromJson(Object? raw) => [
    if (raw is List<dynamic>)
      for (final value in raw) ?tryParse(value as String?),
  ];
}
