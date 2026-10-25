import 'package:json_annotation/json_annotation.dart';

part 'health_status.g.dart';

/// Health of a table or organization in KPI views (ADR 0010).
///
/// Wire values must match `docs/implementation/api-contract.md`.
@JsonEnum(alwaysCreate: true)
enum HealthStatus {
  @JsonValue('on_track')
  onTrack,
  @JsonValue('at_risk')
  atRisk,
  @JsonValue('off_track')
  offTrack,
  @JsonValue('unknown')
  unknown;

  String get wireValue => _$HealthStatusEnumMap[this]!;

  static HealthStatus? tryParse(String? raw) => $enumDecodeNullable(
    _$HealthStatusEnumMap,
    raw,
    unknownValue: JsonKey.nullForUndefinedEnumValue,
  );
}
