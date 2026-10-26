import 'package:injectable/injectable.dart';

import '../../../../../core/network/api_exception.dart';
import '../../../../audit/domain/models/audit_event.dart';
import '../../../../audit/domain/models/audit_query.dart';
import '../../../../audit/domain/services/audit_service.dart';
import '../../../../kpis/domain/models/kpi_breakdown_row.dart';
import '../../../../kpis/domain/models/kpi_dimension.dart';
import '../../../../kpis/domain/models/kpi_filters.dart';
import '../../../../kpis/domain/services/kpi_service.dart';
import '../../models/organization_detail.dart';
import '../../services/admin_directory_service.dart';

/// An organization with its locations, tables, people and KPI roll-up.
@injectable
class LoadOrganizationDetailUseCase {
  const LoadOrganizationDetailUseCase(this._directory, this._kpis, this._audit);

  final AdminDirectoryService _directory;
  final KpiService _kpis;
  final AuditService _audit;

  Future<OrganizationDetail> call(String organizationId) async {
    final organization = _directory.organization(organizationId);
    final locations = _directory.locations(organizationId: organizationId);
    final tables = _directory.tables(organizationId: organizationId);
    final people = _directory.people(organizationId: organizationId);
    final rollup = _rollup(organizationId);
    final activity = _recentActivity(organizationId);
    return OrganizationDetail(
      organization: await organization,
      locations: await locations,
      tables: await tables,
      people: await people,
      rollup: await rollup,
      recentActivity: await activity,
    );
  }

  Future<KpiBreakdownRow?> _rollup(String organizationId) async {
    final rows = await _kpis.breakdown(
      KpiDimension.organization,
      KpiFilters(organizationId: organizationId),
    );
    return rows.where((r) => r.key == organizationId).firstOrNull;
  }

  /// The activity panel is secondary: if it cannot load, the page still shows.
  Future<List<AuditEvent>> _recentActivity(String organizationId) async {
    try {
      return await _audit.events(
        AuditQuery(organizationId: organizationId, limit: 4),
      );
    } on ApiException {
      return const [];
    }
  }
}
