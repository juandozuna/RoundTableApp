import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/constants/api_constants.dart';

part 'admin_write_client.g.dart';

/// Administration writes and the identity lookup, through the `admin` Edge
/// Function (online only). Responses wrap the row, e.g. `{ "table": {...} }`.
@lazySingleton
@RestApi()
abstract class AdminWriteClient {
  @factoryMethod
  factory AdminWriteClient(@Named(DioNames.edgeFunctions) Dio dio) =
      _AdminWriteClient;

  @GET('/admin/me')
  Future<dynamic> me();

  @POST('/admin/organizations')
  Future<dynamic> createOrganization(@Body() Map<String, dynamic> body);

  @PATCH('/admin/organizations/{id}')
  Future<dynamic> updateOrganization(
    @Path('id') String id,
    @Body() Map<String, dynamic> body,
  );

  @POST('/admin/organizations/{id}/status')
  Future<dynamic> setOrganizationStatus(
    @Path('id') String id,
    @Body() Map<String, dynamic> body,
  );

  @POST('/admin/locations')
  Future<dynamic> createLocation(@Body() Map<String, dynamic> body);

  @PATCH('/admin/locations/{id}')
  Future<dynamic> updateLocation(
    @Path('id') String id,
    @Body() Map<String, dynamic> body,
  );

  @POST('/admin/tables')
  Future<dynamic> createTable(@Body() Map<String, dynamic> body);

  @PATCH('/admin/tables/{id}')
  Future<dynamic> updateTable(
    @Path('id') String id,
    @Body() Map<String, dynamic> body,
  );

  @POST('/admin/tables/{id}/facilitator')
  Future<dynamic> setFacilitator(
    @Path('id') String id,
    @Body() Map<String, dynamic> body,
  );

  @POST('/admin/tables/{id}/members')
  Future<dynamic> addMember(
    @Path('id') String id,
    @Body() Map<String, dynamic> body,
  );

  @POST('/admin/members/{id}/move')
  Future<dynamic> moveMember(
    @Path('id') String id,
    @Body() Map<String, dynamic> body,
  );

  @POST('/admin/members/{id}/deactivate')
  Future<dynamic> deactivateMember(
    @Path('id') String id,
    @Body() Map<String, dynamic> body,
  );

  @PATCH('/admin/people/{id}')
  Future<dynamic> updatePerson(
    @Path('id') String id,
    @Body() Map<String, dynamic> body,
  );
}
