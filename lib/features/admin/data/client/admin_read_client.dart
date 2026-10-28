import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/constants/api_constants.dart';
import '../../domain/models/admin_location.dart';
import '../../domain/models/admin_organization.dart';
import '../../domain/models/admin_person.dart';
import '../../domain/models/admin_table.dart';
import '../../domain/models/program_value.dart';
import '../../domain/models/schedule_version.dart';
import '../../domain/models/table_membership.dart';

part 'admin_read_client.g.dart';

/// Directory reads through PostgREST under the caller's RLS (ADR 0008).
/// Filters use PostgREST syntax in [query], e.g. `{'id': 'eq.<uuid>'}`.
@lazySingleton
@RestApi()
abstract class AdminReadClient {
  @factoryMethod
  factory AdminReadClient(@Named(DioNames.postgrest) Dio dio) =
      _AdminReadClient;

  @GET('/organizations')
  Future<List<AdminOrganization>> organizations(
    @Queries() Map<String, dynamic> query,
  );

  @GET('/locations')
  Future<List<AdminLocation>> locations(@Queries() Map<String, dynamic> query);

  @GET('/admin_tables')
  Future<List<AdminTable>> tables(@Queries() Map<String, dynamic> query);

  @GET('/admin_people')
  Future<List<AdminPerson>> people(@Queries() Map<String, dynamic> query);

  @GET('/curriculum_values')
  Future<List<ProgramValue>> programValues(
    @Queries() Map<String, dynamic> query,
  );

  @GET('/table_members')
  Future<List<TableMembership>> memberships(
    @Queries() Map<String, dynamic> query,
  );

  @GET('/table_schedule_versions')
  Future<List<ScheduleVersion>> scheduleVersions(
    @Queries() Map<String, dynamic> query,
  );
}
