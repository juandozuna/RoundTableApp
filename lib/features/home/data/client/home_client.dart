import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/constants/api_constants.dart';
import '../../domain/models/home_kpi_summary.dart';

part 'home_client.g.dart';

/// PostgREST reads used by the home: the online fallback of the table
/// overview, and the KPI strip and invite count of coordinators and
/// administrators (ADR 0008). Row shapes are documented in
/// `docs/implementation/api-contract.md` §6–7. Rows are returned untyped
/// because retrofit_generator cannot decode `List<Map<String, dynamic>>`;
/// the remote data source casts them.
@lazySingleton
@RestApi()
abstract class HomeClient {
  @factoryMethod
  factory HomeClient(@Named(DioNames.postgrest) Dio dio) = _HomeClient;

  @GET('/admin_tables')
  Future<dynamic> tables(
    @Query('id') String idFilter,
    @Query('select') String select,
  );

  @POST('/rpc/kpi_tables')
  Future<dynamic> kpiTables(@Body() Map<String, dynamic> body);

  @GET('/people')
  Future<dynamic> people(
    @Query('auth_user_id') String authUserFilter,
    @Query('select') String select,
  );

  @GET('/member_commitments')
  Future<dynamic> commitments(
    @Query('person_id') String personFilter,
    @Query('select') String select,
    @Query('order') String order,
    @Query('limit') int limit,
  );

  @GET('/member_assessments')
  Future<dynamic> assessments(
    @Query('person_id') String personFilter,
    @Query('kind') String kindFilter,
    @Query('select') String select,
  );

  @GET('/curriculum_values')
  Future<dynamic> values(@Query('select') String select);

  @GET('/curriculum_modules')
  Future<dynamic> modules(
    @Query('select') String select,
    @Query('order') String order,
  );

  @POST('/rpc/kpi_summary')
  Future<HomeKpiSummary> kpiSummary(@Body() Map<String, dynamic> body);

  @GET('/admin_invites')
  Future<dynamic> invites(
    @Query('status') String statusFilter,
    @Query('select') String select,
    @Query('organization_id') String? organizationFilter,
  );
}
