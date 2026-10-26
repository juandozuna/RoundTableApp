import 'package:injectable/injectable.dart';

import '../../../../../core/services/clock/clock_service.dart';
import '../../../../kpis/domain/models/kpi_breakdown_row.dart';
import '../../../../kpis/domain/models/kpi_dimension.dart';
import '../../../../kpis/domain/models/kpi_filters.dart';
import '../../../../kpis/domain/services/kpi_service.dart';
import '../../models/admin_organization.dart';
import '../../models/admin_person.dart';
import '../../models/admin_table.dart';
import '../../models/explorer_data.dart';
import '../../models/explorer_organization.dart';
import '../../models/explorer_table.dart';
import '../../models/person_status.dart';
import '../../services/admin_directory_service.dart';

/// Loads the three Explorador grids: directory rows joined with KPI roll-ups.
@injectable
class LoadExplorerDataUseCase {
  const LoadExplorerDataUseCase(this._directory, this._kpis, this._clock);

  final AdminDirectoryService _directory;
  final KpiService _kpis;
  final ClockService _clock;

  Future<ExplorerData> call() async {
    final organizations = _directory.organizations();
    final tables = _directory.tables();
    final people = _directory.people();
    final kpiTables = _kpis.tables(KpiFilters.none);
    final rollups = _kpis.breakdown(KpiDimension.organization, KpiFilters.none);

    final orgList = await organizations;
    final tableList = await tables;
    final peopleList = await people;
    final kpiByTable = {
      for (final row in await kpiTables) row.roundTableId: row,
    };
    final rollupByOrg = {for (final row in await rollups) row.key: row};

    return ExplorerData(
      tables: [
        for (final table in tableList)
          ExplorerTable.merge(table, kpiByTable[table.id]),
      ],
      organizations: [
        for (final org in orgList)
          _organizationRow(org, rollupByOrg[org.id], tableList, peopleList),
      ],
      people: peopleList,
      loadedAt: _clock.nowUtc(),
    );
  }

  ExplorerOrganization _organizationRow(
    AdminOrganization org,
    KpiBreakdownRow? rollup,
    List<AdminTable> tables,
    List<AdminPerson> people,
  ) {
    final orgTables = tables.where((t) => t.organizationId == org.id);
    final coordinators = people.where(
      (p) =>
          p.organizationId == org.id &&
          p.isCoordinator &&
          p.status != PersonStatus.inactive,
    );
    final active = coordinators
        .where((p) => p.status == PersonStatus.active)
        .firstOrNull;
    return ExplorerOrganization(
      organization: org,
      tablesTotal: rollup?.tablesTotal ?? orgTables.length,
      tablesActive: rollup?.tablesActive ?? 0,
      tablesDelayed: rollup?.tablesDelayed ?? 0,
      tablesInactive: rollup?.tablesInactive ?? 0,
      people: orgTables.fold(0, (sum, t) => sum + t.activePeople),
      valuesCompleted: rollup?.valuesCompleted ?? 0,
      attendancePct: rollup?.attendancePct,
      improvementAvg: rollup?.improvementAvg,
      hasActiveCoordinator: active != null,
      coordinatorName: (active ?? coordinators.firstOrNull)?.fullName,
    );
  }
}
