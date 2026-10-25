import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'auth_interceptor.dart';
import 'auth_token_provider.dart';

/// Builds Dio instances for Supabase Edge Functions and PostgREST.
abstract final class DioFactory {
  static const Duration connectTimeout = Duration(seconds: 15);
  static const Duration receiveTimeout = Duration(seconds: 30);

  static Dio create({
    required String baseUrl,
    required String apiKey,
    required AuthTokenProvider tokenProvider,
  }) {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: connectTimeout,
        receiveTimeout: receiveTimeout,
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json,
      ),
    );
    // The retry goes through a twin client without interceptors: re-entering
    // the QueuedInterceptor from its own onError would deadlock.
    final retryClient = Dio(dio.options)
      ..httpClientAdapter = dio.httpClientAdapter;
    dio.interceptors.add(
      AuthInterceptor(
        apiKey: apiKey,
        tokenProvider: tokenProvider,
        retry: retryClient.fetch,
      ),
    );
    if (kDebugMode) {
      dio.interceptors.add(
        LogInterceptor(
          requestHeader: false,
          responseHeader: false,
          requestBody: true,
          responseBody: true,
          logPrint: (line) => debugPrint(line.toString()),
        ),
      );
    }
    return dio;
  }
}
