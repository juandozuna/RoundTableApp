import 'package:dio/dio.dart';

import '../constants/api_constants.dart';
import 'auth_token_provider.dart';

/// Re-sends a request. Must not pass through this interceptor again.
typedef RequestRetrier = Future<Response<dynamic>> Function(RequestOptions);

/// Adds `apikey` and `Authorization: Bearer <jwt>`; on a 401 refreshes the
/// session once and retries the request (ADR 0008).
///
/// A [QueuedInterceptor] serializes error handling, so parallel 401s trigger
/// at most one refresh: later requests see the new token and only retry.
class AuthInterceptor extends QueuedInterceptor {
  AuthInterceptor({
    required String apiKey,
    required AuthTokenProvider tokenProvider,
    required RequestRetrier retry,
  }) : _apiKey = apiKey,
       _tokenProvider = tokenProvider,
       _retry = retry;

  final String _apiKey;
  final AuthTokenProvider _tokenProvider;
  final RequestRetrier _retry;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[ApiHeaders.apiKey] = _apiKey;
    final bearer = _tokenProvider.accessToken ?? _anonBearer;
    if (bearer != null) {
      options.headers[ApiHeaders.authorization] =
          '${ApiHeaders.bearerPrefix}$bearer';
    }
    handler.next(options);
  }

  /// Signed-out calls authenticate with the anon key only when it is a JWT
  /// (legacy keys); publishable `sb_` keys travel in `apikey` alone.
  String? get _anonBearer => _apiKey.split('.').length == 3 ? _apiKey : null;

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final request = err.requestOptions;
    final alreadyRetried =
        request.extra[ApiRequestExtras.retriedAfterRefresh] == true;
    if (err.response?.statusCode != 401 || alreadyRetried) {
      return handler.next(err);
    }

    final token = await _freshToken(request);
    if (token == null) return handler.next(err);

    request.headers[ApiHeaders.authorization] =
        '${ApiHeaders.bearerPrefix}$token';
    request.extra[ApiRequestExtras.retriedAfterRefresh] = true;
    try {
      handler.resolve(await _retry(request));
    } on DioException catch (retryError) {
      handler.next(retryError);
    }
  }

  /// Reuses a token another request already refreshed; otherwise refreshes.
  Future<String?> _freshToken(RequestOptions request) async {
    final sent = request.headers[ApiHeaders.authorization];
    final current = _tokenProvider.accessToken;
    if (current != null && sent != '${ApiHeaders.bearerPrefix}$current') {
      return current;
    }
    try {
      return await _tokenProvider.refreshAccessToken();
    } on Object {
      return null;
    }
  }
}
