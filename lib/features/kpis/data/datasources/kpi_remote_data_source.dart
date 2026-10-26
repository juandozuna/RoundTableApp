import 'package:injectable/injectable.dart';

import '../../../../core/network/api_exception.dart';
import '../../../../core/network/api_guard.dart';
import '../../domain/models/kpi_breakdown_row.dart';
import '../../domain/models/kpi_dimension.dart';
import '../../domain/models/kpi_filters.dart';
import '../../domain/models/kpi_member_detail.dart';
import '../../domain/models/kpi_summary.dart';
import '../../domain/models/kpi_table_row.dart';
import '../../domain/models/kpi_weekly_point.dart';
import '../../domain/models/revealed_answers.dart';
import '../client/answers_reveal_client.dart';
import '../client/kpi_client.dart';

@lazySingleton
class KpiRemoteDataSource {
  KpiRemoteDataSource(this._kpis, this._reveal);

  final KpiClient _kpis;
  final AnswersRevealClient _reveal;

  Future<KpiSummary> summary(KpiFilters filters) =>
      _guard(() => _kpis.summary(filters.toParams()));

  Future<List<KpiBreakdownRow>> breakdown(
    KpiDimension dimension,
    KpiFilters filters,
  ) => _guard(
    () => _kpis.breakdown({
      'p_dimension': dimension.wireValue,
      ...filters.toParams(),
    }),
  );

  Future<List<KpiWeeklyPoint>> weeklySeries(KpiFilters filters) =>
      _guard(() => _kpis.weeklySeries(filters.toParams()));

  Future<List<KpiTableRow>> tables(KpiFilters filters) =>
      _guard(() => _kpis.tables(filters.toTableParams()));

  Future<List<KpiMemberDetail>> memberDetail(String roundTableId) =>
      _guard(() => _kpis.memberDetail({'p_round_table_id': roundTableId}));

  Future<RevealedAnswers> revealAnswers({
    required String roundTableId,
    String? personId,
  }) => guardApiCall(
    () => _reveal.reveal({
      'round_table_id': roundTableId,
      'person_id': ?personId,
    }),
  );

  /// PostgREST reports `raise exception 'forbidden'` as HTTP 400 with the
  /// code in `message`; surface it as a permission failure.
  Future<T> _guard<T>(Future<T> Function() call) async {
    try {
      return await guardApiCall(call);
    } on ApiException catch (error) {
      if (error.message == 'forbidden') {
        throw ApiException(
          kind: ApiErrorKind.forbidden,
          code: 'forbidden',
          statusCode: 403,
          message: error.message,
        );
      }
      rethrow;
    }
  }
}
