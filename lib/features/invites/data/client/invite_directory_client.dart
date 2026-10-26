import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/constants/api_constants.dart';
import '../../domain/models/invite_target_organization.dart';
import '../../domain/models/invite_target_table.dart';

part 'invite_directory_client.g.dart';

/// PostgREST reads under RLS (api-contract.md §6). Filter values carry their
/// operator, e.g. `eq.<uuid>`.
@lazySingleton
@RestApi()
abstract class InviteDirectoryClient {
  @factoryMethod
  factory InviteDirectoryClient(@Named(DioNames.postgrest) Dio dio) =
      _InviteDirectoryClient;

  @GET('/admin_tables')
  Future<List<InviteTargetTable>> tables({
    @Query('select') required String select,
    @Query('status') required String status,
    @Query('order') required String order,
    @Query('organization_id') String? organizationId,
    @Query('id') String? id,
  });

  @GET('/organizations')
  Future<List<InviteTargetOrganization>> organizations({
    @Query('select') required String select,
    @Query('status') required String status,
    @Query('order') required String order,
  });
}
