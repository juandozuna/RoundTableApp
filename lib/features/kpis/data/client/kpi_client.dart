import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/constants/api_constants.dart';
import '../../domain/models/kpi_breakdown_row.dart';
import '../../domain/models/kpi_member_detail.dart';
import '../../domain/models/kpi_summary.dart';
import '../../domain/models/kpi_table_row.dart';
import '../../domain/models/kpi_weekly_point.dart';

part 'kpi_client.g.dart';

/// KPI rollups through PostgREST RPCs (ADR 0008, ADR 0010).
@lazySingleton
@RestApi()
abstract class KpiClient {
  @factoryMethod
  factory KpiClient(@Named(DioNames.postgrest) Dio dio) = _KpiClient;

  @POST('/rpc/kpi_summary')
  Future<KpiSummary> summary(@Body() Map<String, dynamic> params);

  @POST('/rpc/kpi_breakdown')
  Future<List<KpiBreakdownRow>> breakdown(@Body() Map<String, dynamic> params);

  @POST('/rpc/kpi_weekly_series')
  Future<List<KpiWeeklyPoint>> weeklySeries(
    @Body() Map<String, dynamic> params,
  );

  @POST('/rpc/kpi_tables')
  Future<List<KpiTableRow>> tables(@Body() Map<String, dynamic> params);

  @POST('/rpc/kpi_member_detail')
  Future<List<KpiMemberDetail>> memberDetail(
    @Body() Map<String, dynamic> params,
  );
}
