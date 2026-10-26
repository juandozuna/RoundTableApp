import 'package:freezed_annotation/freezed_annotation.dart';

part 'kpi_weekly_point.freezed.dart';
part 'kpi_weekly_point.g.dart';

/// One week of `kpi_weekly_series`.
@freezed
abstract class KpiWeeklyPoint with _$KpiWeeklyPoint {
  const factory KpiWeeklyPoint({
    required DateTime weekStart,
    @Default(0) int sessionsClosed,
    @Default(0) int valuesCompleted,
    double? attendancePct,
    double? initialAvg,
    double? improvementAvg,
    @Default(0) int syncedLateRows,
  }) = _KpiWeeklyPoint;

  factory KpiWeeklyPoint.fromJson(Map<String, dynamic> json) =>
      _$KpiWeeklyPointFromJson(json);
}
