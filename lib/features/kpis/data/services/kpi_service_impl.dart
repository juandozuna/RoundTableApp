import 'package:injectable/injectable.dart';

import '../../domain/models/kpi_breakdown_row.dart';
import '../../domain/models/kpi_dimension.dart';
import '../../domain/models/kpi_filters.dart';
import '../../domain/models/kpi_member_detail.dart';
import '../../domain/models/kpi_summary.dart';
import '../../domain/models/kpi_table_row.dart';
import '../../domain/models/kpi_weekly_point.dart';
import '../../domain/models/revealed_answers.dart';
import '../../domain/services/kpi_service.dart';
import '../datasources/kpi_remote_data_source.dart';

@LazySingleton(as: KpiService)
class KpiServiceImpl implements KpiService {
  KpiServiceImpl(this._remote);

  final KpiRemoteDataSource _remote;

  @override
  Future<KpiSummary> summary(KpiFilters filters) => _remote.summary(filters);

  @override
  Future<List<KpiBreakdownRow>> breakdown(
    KpiDimension dimension,
    KpiFilters filters,
  ) => _remote.breakdown(dimension, filters);

  @override
  Future<List<KpiWeeklyPoint>> weeklySeries(KpiFilters filters) =>
      _remote.weeklySeries(filters);

  @override
  Future<List<KpiTableRow>> tables(KpiFilters filters) =>
      _remote.tables(filters);

  @override
  Future<List<KpiMemberDetail>> memberDetail(String roundTableId) =>
      _remote.memberDetail(roundTableId);

  @override
  Future<RevealedAnswers> revealAnswers({
    required String roundTableId,
    String? personId,
  }) => _remote.revealAnswers(roundTableId: roundTableId, personId: personId);
}
