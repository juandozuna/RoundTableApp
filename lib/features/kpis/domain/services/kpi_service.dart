import '../models/kpi_breakdown_row.dart';
import '../models/kpi_dimension.dart';
import '../models/kpi_filters.dart';
import '../models/kpi_member_detail.dart';
import '../models/kpi_summary.dart';
import '../models/kpi_table_row.dart';
import '../models/kpi_weekly_point.dart';
import '../models/revealed_answers.dart';

/// Reads KPI rollups scoped to the signed-in user (platform admin: all,
/// coordinator: own organization). Online only (ADR 0003 / 0010).
abstract interface class KpiService {
  Future<KpiSummary> summary(KpiFilters filters);

  Future<List<KpiBreakdownRow>> breakdown(
    KpiDimension dimension,
    KpiFilters filters,
  );

  Future<List<KpiWeeklyPoint>> weeklySeries(KpiFilters filters);

  Future<List<KpiTableRow>> tables(KpiFilters filters);

  /// Scores per member of a table (sensitive).
  Future<List<KpiMemberDetail>> memberDetail(String roundTableId);

  /// Individual answers. The server logs an `answers.revealed` audit event.
  Future<RevealedAnswers> revealAnswers({
    required String roundTableId,
    String? personId,
  });
}
