import 'package:injectable/injectable.dart';

import '../../../../../core/services/clock/clock_service.dart';
import '../../models/kpi_dimension.dart';
import '../../models/kpi_filters.dart';
import '../../models/report_data.dart';
import '../../models/report_filters.dart';
import '../../services/kpi_service.dart';

@injectable
class LoadReportUseCase {
  const LoadReportUseCase(this._kpis, this._clock);

  final KpiService _kpis;
  final ClockService _clock;

  Future<ReportData> call(ReportFilters filters) async {
    final kpi = filters.toKpiFilters(_clock.nowUtc());
    final summary = _kpis.summary(kpi);
    final weekly = _kpis.weeklySeries(kpi);
    final modules = _kpis.breakdown(KpiDimension.module, kpi);
    final organizations = _kpis.breakdown(KpiDimension.organization, kpi);
    final tables = _kpis.tables(_tableFilters(filters));
    return ReportData(
      summary: await summary,
      weekly: await weekly,
      modules: await modules,
      organizations: await organizations,
      tables: await tables,
    );
  }

  /// `kpi_tables` is not period-based and has no module filter.
  KpiFilters _tableFilters(ReportFilters filters) => KpiFilters(
    country: filters.country,
    organizationId: filters.organizationId,
    locationId: filters.locationId,
    roundTableId: filters.roundTableId,
    facilitatorPersonId: filters.facilitatorPersonId,
  );
}
