import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/models/health_status.dart';

part 'kpi_table_row.freezed.dart';
part 'kpi_table_row.g.dart';

/// One row of `kpi_tables`: a table with its KPIs and computed health.
@freezed
abstract class KpiTableRow with _$KpiTableRow {
  const factory KpiTableRow({
    required String roundTableId,
    required String code,
    required String name,
    required String organizationId,
    required String organizationName,
    String? countryCode,
    String? locationId,
    String? locationName,
    String? facilitatorPersonId,
    String? facilitatorName,
    String? status,
    @JsonKey(unknownEnumValue: HealthStatus.inactive)
    @Default(HealthStatus.active)
    HealthStatus health,
    @Default(0) int activePeople,
    @Default(0) int valuesCompleted,
    String? currentValueId,
    String? currentValueLabel,
    double? attendancePct,
    double? improvementAvg,
    @Default(0) int syncedLateRows,
    DateTime? lastSessionAt,
    DateTime? pendingSessionAt,
  }) = _KpiTableRow;

  factory KpiTableRow.fromJson(Map<String, dynamic> json) =>
      _$KpiTableRowFromJson(json);
}
