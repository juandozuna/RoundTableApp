import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_kpi_summary.freezed.dart';
part 'home_kpi_summary.g.dart';

/// Tables by health, as returned inside `kpi_summary`.
@freezed
abstract class HomeTableHealthCounts with _$HomeTableHealthCounts {
  const factory HomeTableHealthCounts({
    @Default(0) int total,
    @Default(0) int active,
    @Default(0) int delayed,
    @Default(0) int inactive,
    @Default(0) int completed,
  }) = _HomeTableHealthCounts;

  factory HomeTableHealthCounts.fromJson(Map<String, dynamic> json) =>
      _$HomeTableHealthCountsFromJson(json);
}

/// Compact KPI strip for coordinators and administrators: the subset of the
/// `kpi_summary` RPC the home shows.
@freezed
abstract class HomeKpiSummary with _$HomeKpiSummary {
  const factory HomeKpiSummary({
    @Default(0) int valuesCompleted,
    double? attendancePct,
    double? improvementAvg,
    @Default(0) int syncedLateRows,
    @Default(HomeTableHealthCounts()) HomeTableHealthCounts tables,
    DateTime? computedAt,
  }) = _HomeKpiSummary;

  factory HomeKpiSummary.fromJson(Map<String, dynamic> json) =>
      _$HomeKpiSummaryFromJson(json);
}
