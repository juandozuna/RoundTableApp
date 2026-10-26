import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/constants/api_constants.dart';

part 'admin_invites_client.g.dart';

/// Creates invites from the administration screens (`POST /invites`).
@lazySingleton
@RestApi()
abstract class AdminInvitesClient {
  @factoryMethod
  factory AdminInvitesClient(@Named(DioNames.edgeFunctions) Dio dio) =
      _AdminInvitesClient;

  @POST('/invites')
  Future<dynamic> create(@Body() Map<String, dynamic> body);
}
