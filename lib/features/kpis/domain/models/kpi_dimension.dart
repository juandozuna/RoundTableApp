import 'package:json_annotation/json_annotation.dart';

part 'kpi_dimension.g.dart';

/// Grouping accepted by the `kpi_breakdown` RPC (`p_dimension`).
@JsonEnum(alwaysCreate: true)
enum KpiDimension {
  @JsonValue('country')
  country,
  @JsonValue('organization')
  organization,
  @JsonValue('location')
  location,
  @JsonValue('round_table')
  roundTable,
  @JsonValue('facilitator')
  facilitator,
  @JsonValue('module')
  module,
  @JsonValue('value')
  value;

  String get wireValue => _$KpiDimensionEnumMap[this]!;
}
