import 'package:injectable/injectable.dart';

import '../../../../kpis/domain/models/kpi_filters.dart';
import '../../../../kpis/domain/models/kpi_table_row.dart';
import '../../../../kpis/domain/services/kpi_service.dart';
import '../../models/table_detail.dart';
import '../../services/admin_directory_service.dart';

/// A table with its seats (current and past), the org's other tables (move
/// targets) and the people who could become facilitator.
@injectable
class LoadTableDetailUseCase {
  const LoadTableDetailUseCase(this._directory, this._kpis);

  final AdminDirectoryService _directory;
  final KpiService _kpis;

  Future<TableDetail> call(String tableId) async {
    final table = await _directory.table(tableId);
    final memberships = _directory.memberships(tableId);
    final siblings = _directory.tables(organizationId: table.organizationId);
    final people = _directory.people(organizationId: table.organizationId);
    final kpi = _kpi(tableId);
    return TableDetail(
      table: table,
      memberships: await memberships,
      organizationTables: (await siblings)
          .where((t) => t.id != tableId)
          .toList(),
      organizationPeople: await people,
      kpi: await kpi,
    );
  }

  Future<KpiTableRow?> _kpi(String tableId) async {
    final rows = await _kpis.tables(KpiFilters(roundTableId: tableId));
    return rows.firstOrNull;
  }
}
