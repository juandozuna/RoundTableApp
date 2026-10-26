import 'package:injectable/injectable.dart';

import '../../models/kpi_dimension.dart';
import '../../models/kpi_filters.dart';
import '../../models/report_options.dart';
import '../../services/kpi_service.dart';

/// Builds the filter bar choices from the user's unfiltered scope.
@injectable
class LoadReportOptionsUseCase {
  const LoadReportOptionsUseCase(this._kpis);

  final KpiService _kpis;

  Future<ReportOptions> call() async {
    final tablesFuture = _kpis.tables(KpiFilters.none);
    final countriesFuture = _kpis.breakdown(
      KpiDimension.country,
      KpiFilters.none,
    );
    final modulesFuture = _kpis.breakdown(KpiDimension.module, KpiFilters.none);
    final tables = await tablesFuture;
    final countries = await countriesFuture;
    final modules = await modulesFuture;

    final organizations = <String, ReportOption>{};
    final locations = <String, ReportOption>{};
    final facilitators = <String, ReportOption>{};
    for (final table in tables) {
      organizations[table.organizationId] = ReportOption(
        id: table.organizationId,
        label: table.organizationName,
        parentId: table.countryCode,
      );
      final locationId = table.locationId;
      if (locationId != null) {
        locations[locationId] = ReportOption(
          id: locationId,
          label: table.locationName ?? locationId,
          parentId: table.organizationId,
        );
      }
      final facilitatorId = table.facilitatorPersonId;
      if (facilitatorId != null) {
        facilitators[facilitatorId] = ReportOption(
          id: facilitatorId,
          label: table.facilitatorName ?? facilitatorId,
          parentId: table.organizationId,
        );
      }
    }
    return ReportOptions(
      countries: [
        for (final row in countries)
          ReportOption(id: row.key, label: row.label),
      ],
      organizations: organizations.values.toList(),
      locations: locations.values.toList(),
      tables: [
        for (final table in tables)
          ReportOption(
            id: table.roundTableId,
            label: '${table.code} · ${table.name}',
            parentId: table.organizationId,
          ),
      ],
      facilitators: facilitators.values.toList(),
      modules: [
        for (final row in modules) ReportOption(id: row.key, label: row.label),
      ],
    );
  }
}
