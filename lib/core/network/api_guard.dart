import 'package:dio/dio.dart';

import 'api_error_mapper.dart';

/// Runs a Retrofit call and rethrows Dio failures as `ApiException`.
/// Remote data sources wrap every client call with it.
Future<T> guardApiCall<T>(Future<T> Function() call) async {
  try {
    return await call();
  } on DioException catch (exception) {
    throw ApiErrorMapper.fromDioException(exception);
  }
}
