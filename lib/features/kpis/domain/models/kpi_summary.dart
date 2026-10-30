import 'package:freezed_annotation/freezed_annotation.dart';

part 'kpi_summary.freezed.dart';
part 'kpi_summary.g.dart';

@freezed
abstract class KpiTableCounts with _$KpiTableCounts {
  const factory KpiTableCounts({
    @Default(0) int total,
    @Default(0) int active,
    @Default(0) int delayed,
    @Default(0) int inactive,
    @Default(0) int completed,
  }) = _KpiTableCounts;

  factory KpiTableCounts.fromJson(Map<String, dynamic> json) =>
      _$KpiTableCountsFromJson(json);
}

/// `kpi_summary` result: the headline numbers of a scope.
@freezed
abstract class KpiSummary with _$KpiSummary {
  const factory KpiSummary({
    @Default(0) int sessionsClosed,

    /// Closed sessions that skipped the answers stage (RF-50).
    @Default(0) int sessionsIncomplete,
    @Default(0) int valuesCompleted,
    @Default(0) int memberValuesCompleted,
    double? attendancePct,
    double? initialAvg,
    double? followUpAvg,
    double? improvementAvg,
    @Default(0) int improvementPairs,
    @Default(0) int syncedLateRows,
    @Default(0) int syncedLateSessions,
    @Default(KpiTableCounts()) KpiTableCounts tables,
    @Default(0) int peopleActive,
    double? programProgressPct,
    DateTime? computedAt,
  }) = _KpiSummary;

  factory KpiSummary.fromJson(Map<String, dynamic> json) =>
      _$KpiSummaryFromJson(json);
}
