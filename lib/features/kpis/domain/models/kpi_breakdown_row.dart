import 'package:freezed_annotation/freezed_annotation.dart';

part 'kpi_breakdown_row.freezed.dart';
part 'kpi_breakdown_row.g.dart';

/// One row of `kpi_breakdown`. Table counts are null for module/value rows.
@freezed
abstract class KpiBreakdownRow with _$KpiBreakdownRow {
  const factory KpiBreakdownRow({
    required String key,
    required String label,
    @Default(0) int sessionsClosed,
    @Default(0) int valuesCompleted,
    @Default(0) int memberValuesCompleted,
    double? attendancePct,
    double? initialAvg,
    double? followUpAvg,
    double? improvementAvg,
    @Default(0) int improvementPairs,
    @Default(0) int syncedLateRows,
    int? tablesTotal,
    int? tablesActive,
    int? tablesDelayed,
    int? tablesInactive,
  }) = _KpiBreakdownRow;

  factory KpiBreakdownRow.fromJson(Map<String, dynamic> json) =>
      _$KpiBreakdownRowFromJson(json);
}
