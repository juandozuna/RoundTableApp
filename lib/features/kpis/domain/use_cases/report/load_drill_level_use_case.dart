import 'package:injectable/injectable.dart';

import '../../../../../core/services/clock/clock_service.dart';
import '../../models/drill_level.dart';
import '../../models/kpi_breakdown_row.dart';
import '../../models/kpi_dimension.dart';
import '../../models/kpi_filters.dart';
import '../../models/kpi_member_detail.dart';
import '../../models/kpi_table_row.dart';
import '../../models/report_filters.dart';
import '../../services/kpi_service.dart';

/// One level of the drill-down: group → organization → table → member.
@injectable
class LoadDrillLevelUseCase {
  const LoadDrillLevelUseCase(this._kpis, this._clock);

  final KpiService _kpis;
  final ClockService _clock;

  /// [group] is the root grouping (country, organization or facilitator);
  /// [path] the steps already taken.
  Future<DrillLevel> call({
    required ReportFilters filters,
    required DrillKind group,
    required List<DrillStep> path,
  }) async {
    final kpi = filters.toKpiFilters(_clock.nowUtc());
    if (path.isEmpty) return _rootLevel(group, kpi);
    final last = path.last;
    return switch (last.kind) {
      DrillKind.country => _organizations(kpi, last.id),
      DrillKind.organization => _tables(
        KpiFilters(organizationId: last.id, country: filters.country),
      ),
      DrillKind.facilitator => _tables(
        KpiFilters(facilitatorPersonId: last.id),
      ),
      DrillKind.table => _members(last.id),
      DrillKind.member => const DrillLevel(kind: DrillKind.member, rows: []),
    };
  }

  Future<DrillLevel> _rootLevel(DrillKind group, KpiFilters kpi) async {
    final dimension = switch (group) {
      DrillKind.country => KpiDimension.country,
      DrillKind.facilitator => KpiDimension.facilitator,
      _ => KpiDimension.organization,
    };
    final rows = await _kpis.breakdown(dimension, kpi);
    return DrillLevel(kind: group, rows: rows.map(_breakdownRow).toList());
  }

  Future<DrillLevel> _organizations(KpiFilters kpi, String country) async {
    final rows = await _kpis.breakdown(
      KpiDimension.organization,
      kpi.copyWith(country: country),
    );
    return DrillLevel(
      kind: DrillKind.organization,
      rows: rows.map(_breakdownRow).toList(),
    );
  }

  Future<DrillLevel> _tables(KpiFilters filters) async {
    final rows = await _kpis.tables(filters);
    return DrillLevel(
      kind: DrillKind.table,
      rows: rows.map(_tableRow).toList(),
    );
  }

  Future<DrillLevel> _members(String roundTableId) async {
    final rows = await _kpis.memberDetail(roundTableId);
    return DrillLevel(
      kind: DrillKind.member,
      rows: rows.map(_memberRow).toList(),
    );
  }

  DrillRow _breakdownRow(KpiBreakdownRow row) => DrillRow(
    id: row.key,
    label: row.label,
    tablesCount: row.tablesTotal,
    attendancePct: row.attendancePct,
    valuesCompleted: row.valuesCompleted,
    improvementAvg: row.improvementAvg,
    syncedLate: row.syncedLateRows,
  );

  DrillRow _tableRow(KpiTableRow row) => DrillRow(
    id: row.roundTableId,
    label: '${row.code} · ${row.name}',
    sublabel: row.locationName,
    tablesCount: 1,
    attendancePct: row.attendancePct,
    valuesCompleted: row.valuesCompleted,
    improvementAvg: row.improvementAvg,
    syncedLate: row.syncedLateRows,
  );

  DrillRow _memberRow(KpiMemberDetail row) => DrillRow(
    id: row.personId,
    label: row.fullName,
    sublabel: row.role,
    attendancePct: row.attendancePct,
    valuesCompleted: row.valuesCompleted,
    improvementAvg: row.improvementAvg,
    syncedLate: row.syncedLateSessions,
  );
}
