import 'dart:convert';

import 'package:dio/dio.dart';

import '../constants/api_constants.dart';
import 'api_exception.dart';

/// Maps Dio failures to [ApiException], reading the Edge Function envelope
/// `{ "error": { "code", "message" } }` and the PostgREST body
/// `{ "code", "message", "details" }`.
abstract final class ApiErrorMapper {
  static ApiException fromDioException(DioException exception) {
    return switch (exception.type) {
      DioExceptionType.connectionTimeout ||
      DioExceptionType.sendTimeout ||
      DioExceptionType.receiveTimeout ||
      DioExceptionType.transformTimeout => const ApiException(
        kind: ApiErrorKind.timeout,
      ),
      DioExceptionType.connectionError => const ApiException(
        kind: ApiErrorKind.network,
      ),
      DioExceptionType.cancel => const ApiException(
        kind: ApiErrorKind.cancelled,
      ),
      DioExceptionType.badResponse => fromResponse(
        exception.response?.statusCode,
        exception.response?.data,
      ),
      DioExceptionType.badCertificate || DioExceptionType.unknown =>
        ApiException(kind: ApiErrorKind.network, message: exception.message),
    };
  }

  static ApiException fromResponse(int? statusCode, Object? body) {
    final (code, message) = _readEnvelope(body);
    return ApiException(
      kind: _kindForStatus(statusCode),
      code: code,
      message: message,
      statusCode: statusCode,
    );
  }

  static ApiErrorKind _kindForStatus(int? status) => switch (status) {
    400 || 422 => ApiErrorKind.validation,
    401 => ApiErrorKind.unauthorized,
    403 => ApiErrorKind.forbidden,
    404 => ApiErrorKind.notFound,
    409 => ApiErrorKind.conflict,
    408 => ApiErrorKind.timeout,
    final int s when s >= 500 => ApiErrorKind.server,
    _ => ApiErrorKind.unknown,
  };

  static (String?, String?) _readEnvelope(Object? body) {
    final decoded = body is String ? _tryDecode(body) : body;
    if (decoded is! Map) return (null, body is String ? body : null);

    final error = decoded[ApiErrorEnvelope.error];
    if (error is Map) {
      return (
        _asString(error[ApiErrorEnvelope.code]),
        _asString(error[ApiErrorEnvelope.message]),
      );
    }
    if (error is String) {
      return (null, error);
    }
    return (
      _asString(decoded[ApiErrorEnvelope.code]),
      _asString(decoded[ApiErrorEnvelope.message]),
    );
  }

  static Object? _tryDecode(String body) {
    try {
      return jsonDecode(body);
    } on FormatException {
      return null;
    }
  }

  static String? _asString(Object? value) => value?.toString();
}
