import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/constants/api_constants.dart';
import '../../domain/models/my_account.dart';

part 'settings_client.g.dart';

/// `admin/me`: read and edit the caller's own person rows
/// (`docs/implementation/api-contract.md` §5).
@lazySingleton
@RestApi()
abstract class SettingsClient {
  @factoryMethod
  factory SettingsClient(@Named(DioNames.edgeFunctions) Dio dio) =
      _SettingsClient;

  @GET('/admin/me')
  Future<MyAccount> me();

  @PATCH('/admin/me')
  Future<MyAccount> updateMe(@Body() Map<String, dynamic> body);
}
