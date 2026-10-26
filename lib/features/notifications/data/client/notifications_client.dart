import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/constants/api_constants.dart';

part 'notifications_client.g.dart';

/// `notifications` Edge Function: device token registration
/// (`docs/implementation/api-contract.md` §5).
@lazySingleton
@RestApi()
abstract class NotificationsClient {
  @factoryMethod
  factory NotificationsClient(@Named(DioNames.edgeFunctions) Dio dio) =
      _NotificationsClient;

  @POST('/notifications/device-tokens')
  Future<void> registerToken(@Body() Map<String, dynamic> body);

  @DELETE('/notifications/device-tokens')
  Future<void> removeToken(@Body() Map<String, dynamic> body);
}
