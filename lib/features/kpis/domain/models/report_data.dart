import 'package:freezed_annotation/freezed_annotation.dart';

import 'kpi_breakdown_row.dart';
import 'kpi_summary.dart';
import 'kpi_table_row.dart';
import 'kpi_weekly_point.dart';

part 'report_data.freezed.dart';

/// Everything the Informes dashboards draw for one set of filters.
@freezed
abstract class ReportData with _$ReportData {
  const factory ReportData({
    required KpiSummary summary,
    required List<KpiWeeklyPoint> weekly,
    required List<KpiBreakdownRow> modules,
    required List<KpiBreakdownRow> organizations,
    required List<KpiTableRow> tables,
  }) = _ReportData;
}
