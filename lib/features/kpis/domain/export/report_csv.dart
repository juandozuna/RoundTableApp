import '../models/csv_document.dart';
import '../models/drill_level.dart';
import '../models/kpi_breakdown_row.dart';
import '../models/kpi_summary.dart';
import '../models/kpi_table_row.dart';
import '../models/kpi_weekly_point.dart';

/// Builds the CSV documents behind each chart's "Tabla" view. Column titles
/// are passed in already localized by the caller.
abstract final class ReportCsv {
  static String _n(num? value) => value == null ? '' : value.toString();

  static String _date(DateTime value) {
    final utc = value.toUtc();
    final month = utc.month.toString().padLeft(2, '0');
    final day = utc.day.toString().padLeft(2, '0');
    return '${utc.year}-$month-$day';
  }

  static CsvDocument weekly({
    required String filename,
    required List<String> headers,
    required List<KpiWeeklyPoint> points,
  }) => CsvDocument(
    filename: filename,
    headers: headers,
    rows: [
      for (final p in points)
        [
          _date(p.weekStart),
          '${p.sessionsClosed}',
          '${p.valuesCompleted}',
          _n(p.attendancePct),
          _n(p.initialAvg),
          _n(p.improvementAvg),
          '${p.syncedLateRows}',
        ],
    ],
  );

  static CsvDocument breakdown({
    required String filename,
    required List<String> headers,
    required List<KpiBreakdownRow> rows,
  }) => CsvDocument(
    filename: filename,
    headers: headers,
    rows: [
      for (final r in rows)
        [
          r.label,
          '${r.sessionsClosed}',
          '${r.valuesCompleted}',
          _n(r.attendancePct),
          _n(r.initialAvg),
          _n(r.followUpAvg),
          _n(r.improvementAvg),
          '${r.syncedLateRows}',
          _n(r.tablesTotal),
          _n(r.tablesActive),
          _n(r.tablesDelayed),
          _n(r.tablesInactive),
        ],
    ],
  );

  static CsvDocument tables({
    required String filename,
    required List<String> headers,
    required List<KpiTableRow> rows,
  }) => CsvDocument(
    filename: filename,
    headers: headers,
    rows: [
      for (final r in rows)
        [
          r.code,
          r.name,
          r.organizationName,
          r.locationName ?? '',
          r.facilitatorName ?? '',
          r.health.wireValue,
          '${r.activePeople}',
          '${r.valuesCompleted}',
          _n(r.attendancePct),
          _n(r.improvementAvg),
          '${r.syncedLateRows}',
          r.lastSessionAt == null ? '' : _date(r.lastSessionAt!),
        ],
    ],
  );

  static CsvDocument drill({
    required String filename,
    required List<String> headers,
    required DrillLevel level,
  }) => CsvDocument(
    filename: filename,
    headers: headers,
    rows: [
      for (final r in level.rows)
        [
          r.label,
          _n(r.tablesCount),
          _n(r.attendancePct),
          '${r.valuesCompleted}',
          _n(r.improvementAvg),
          '${r.syncedLate}',
        ],
    ],
  );

  static CsvDocument summary({
    required String filename,
    required List<String> headers,
    required List<String> labels,
    required KpiSummary summary,
  }) => CsvDocument(
    filename: filename,
    headers: headers,
    rows: [
      [labels[0], '${summary.valuesCompleted}'],
      [labels[1], _n(summary.improvementAvg)],
      [labels[2], _n(summary.attendancePct)],
      [labels[3], '${summary.tables.active}'],
      [labels[4], '${summary.tables.delayed}'],
      [labels[5], '${summary.tables.inactive}'],
      [labels[6], '${summary.syncedLateRows}'],
    ],
  );
}
