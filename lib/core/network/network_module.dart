import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../config/app_config.dart';
import '../constants/api_constants.dart';
import 'auth_token_provider.dart';
import 'dio_factory.dart';

@module
abstract class NetworkModule {
  @Named(DioNames.edgeFunctions)
  @lazySingleton
  Dio edgeFunctionsDio(AppConfig config, AuthTokenProvider tokens) =>
      DioFactory.create(
        baseUrl: config.edgeFunctionsBaseUrl,
        apiKey: config.supabaseAnonKey,
        tokenProvider: tokens,
      );

  @Named(DioNames.postgrest)
  @lazySingleton
  Dio postgrestDio(AppConfig config, AuthTokenProvider tokens) =>
      DioFactory.create(
        baseUrl: config.postgrestBaseUrl,
        apiKey: config.supabaseAnonKey,
        tokenProvider: tokens,
      );
}
