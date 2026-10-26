import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/models/health_status.dart';
import '../../../kpis/domain/models/kpi_table_row.dart';
import 'admin_table.dart';
import 'round_table_status.dart';

part 'explorer_table.freezed.dart';

/// A table as the Explorador shows it: schedule and seats from `admin_tables`
/// joined with KPIs and health from `kpi_tables`.
@freezed
abstract class ExplorerTable with _$ExplorerTable {
  const ExplorerTable._();

  const factory ExplorerTable({
    required String id,
    required String code,
    required String name,
    required String organizationId,
    required String organizationName,
    String? countryCode,
    String? locationId,
    String? locationName,
    required int weekday,
    required String startTime,
    required String timezone,
    required RoundTableStatus status,
    required HealthStatus health,
    String? facilitatorPersonId,
    String? facilitatorName,
    required int activePeople,
    required int maxPeople,
    @Default(0) int valuesCompleted,
    double? attendancePct,
    double? improvementAvg,
    @Default(0) int syncedLateRows,
    DateTime? lastSessionAt,
    String? currentValueLabel,
  }) = _ExplorerTable;

  factory ExplorerTable.merge(AdminTable table, KpiTableRow? kpi) =>
      ExplorerTable(
        id: table.id,
        code: table.code,
        name: table.name,
        organizationId: table.organizationId,
        organizationName: table.organizationName,
        countryCode: kpi?.countryCode,
        locationId: table.locationId,
        locationName: table.locationName,
        weekday: table.weekday,
        startTime: table.startTimeShort,
        timezone: table.timezone,
        status: table.status,
        health: kpi?.health ?? _healthFromStatus(table.status),
        facilitatorPersonId: table.facilitatorPersonId,
        facilitatorName: table.facilitatorName,
        activePeople: table.activePeople,
        maxPeople: table.maxPeople,
        valuesCompleted: kpi?.valuesCompleted ?? 0,
        attendancePct: kpi?.attendancePct,
        improvementAvg: kpi?.improvementAvg,
        syncedLateRows: kpi?.syncedLateRows ?? 0,
        lastSessionAt: kpi?.lastSessionAt,
        currentValueLabel:
            kpi?.currentValueLabel ??
            (table.currentValueSequence == null
                ? null
                : 'Valor ${table.currentValueSequence} · '
                      '${table.currentValueName ?? ''}'),
      );

  static HealthStatus _healthFromStatus(RoundTableStatus status) =>
      switch (status) {
        RoundTableStatus.active => HealthStatus.active,
        RoundTableStatus.completed => HealthStatus.completed,
        RoundTableStatus.paused ||
        RoundTableStatus.closed => HealthStatus.inactive,
      };

  /// Attendance under this percentage flags a table as "Baja asistencia".
  static const double lowAttendanceThreshold = 70;

  bool get hasLowAttendance =>
      attendancePct != null && attendancePct! < lowAttendanceThreshold;

  bool get hasSessions => lastSessionAt != null || valuesCompleted > 0;
}
