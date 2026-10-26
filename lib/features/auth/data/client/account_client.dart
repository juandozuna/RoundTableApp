import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/constants/api_constants.dart';
import '../../domain/models/account.dart';

part 'account_client.g.dart';

@lazySingleton
@RestApi()
abstract class AccountClient {
  @factoryMethod
  factory AccountClient(@Named(DioNames.edgeFunctions) Dio dio) =
      _AccountClient;

  @GET('/admin/me')
  Future<Account> me();
}
