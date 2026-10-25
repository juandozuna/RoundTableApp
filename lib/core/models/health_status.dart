import 'package:json_annotation/json_annotation.dart';

part 'health_status.g.dart';

/// Health of a table or organization in KPI views (ADR 0010).
///
/// Wire values must match `docs/implementation/api-contract.md`.
@JsonEnum(alwaysCreate: true)
enum HealthStatus {
  @JsonValue('active')
  active,
  @JsonValue('delayed')
  delayed,
  @JsonValue('inactive')
  inactive,
  @JsonValue('completed')
  completed;

  String get wireValue => _$HealthStatusEnumMap[this]!;

  static HealthStatus? tryParse(String? raw) => $enumDecodeNullable(
    _$HealthStatusEnumMap,
    raw,
    unknownValue: JsonKey.nullForUndefinedEnumValue,
  );
}
