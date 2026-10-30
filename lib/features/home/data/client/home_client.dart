import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/constants/api_constants.dart';
import '../../domain/models/home_kpi_summary.dart';

part 'home_client.g.dart';

/// Server-side reads of the coordinators' and administrators' home: the KPI
/// strip, the table alerts and the invite count (ADR 0008). The table and
/// member overview reads go through `TableReadsClient`. Row shapes are documented in
/// `docs/implementation/api-contract.md` §6–7. Rows are returned untyped
/// because retrofit_generator cannot decode `List<Map<String, dynamic>>`;
/// the remote data source casts them.
@lazySingleton
@RestApi()
abstract class HomeClient {
  @factoryMethod
  factory HomeClient(@Named(DioNames.postgrest) Dio dio) = _HomeClient;

  @POST('/rpc/kpi_tables')
  Future<dynamic> kpiTables(@Body() Map<String, dynamic> body);

  @POST('/rpc/kpi_summary')
  Future<HomeKpiSummary> kpiSummary(@Body() Map<String, dynamic> body);

  @GET('/admin_invites')
  Future<dynamic> invites(
    @Query('status') String statusFilter,
    @Query('select') String select,
    @Query('organization_id') String? organizationFilter,
  );
}
