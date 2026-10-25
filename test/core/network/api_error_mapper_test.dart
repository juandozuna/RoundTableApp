import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/network/api_error_mapper.dart';
import 'package:gold_roundtables/core/network/api_error_messages.dart';
import 'package:gold_roundtables/core/network/api_exception.dart';
import 'package:gold_roundtables/core/network/api_guard.dart';
import 'package:gold_roundtables/l10n/gen/app_localizations_es.dart';

DioException badResponse(int status, Object? body) {
  final request = RequestOptions(path: '/invites-redeem');
  return DioException(
    requestOptions: request,
    type: DioExceptionType.badResponse,
    response: Response<Object?>(
      requestOptions: request,
      statusCode: status,
      data: body,
    ),
  );
}

void main() {
  test('reads the Edge Function error envelope', () {
    final error = ApiErrorMapper.fromDioException(
      badResponse(409, {
        'error': {'code': 'invite_expired', 'message': 'Invite expired'},
      }),
    );
    expect(error.kind, ApiErrorKind.conflict);
    expect(error.code, 'invite_expired');
    expect(error.message, 'Invite expired');
    expect(error.statusCode, 409);
  });

  test('reads a JSON string body', () {
    final error = ApiErrorMapper.fromDioException(
      badResponse(422, '{"error":{"code":"score_five","message":"no 5"}}'),
    );
    expect(error.kind, ApiErrorKind.validation);
    expect(error.code, 'score_five');
  });

  test('reads PostgREST top-level errors', () {
    final error = ApiErrorMapper.fromDioException(
      badResponse(403, {'code': '42501', 'message': 'permission denied'}),
    );
    expect(error.kind, ApiErrorKind.forbidden);
    expect(error.code, '42501');
  });

  test('maps status codes to kinds', () {
    final kinds = {
      400: ApiErrorKind.validation,
      401: ApiErrorKind.unauthorized,
      404: ApiErrorKind.notFound,
      500: ApiErrorKind.server,
      503: ApiErrorKind.server,
      418: ApiErrorKind.unknown,
    };
    kinds.forEach((status, kind) {
      expect(
        ApiErrorMapper.fromDioException(badResponse(status, null)).kind,
        kind,
        reason: '$status',
      );
    });
  });

  test('maps transport failures', () {
    final request = RequestOptions(path: '/x');
    ApiErrorKind kindOf(DioExceptionType type) =>
        ApiErrorMapper.fromDioException(
          DioException(requestOptions: request, type: type),
        ).kind;
    expect(kindOf(DioExceptionType.connectionError), ApiErrorKind.network);
    expect(kindOf(DioExceptionType.receiveTimeout), ApiErrorKind.timeout);
    expect(kindOf(DioExceptionType.cancel), ApiErrorKind.cancelled);
  });

  test('tolerates non-JSON bodies', () {
    final error = ApiErrorMapper.fromDioException(
      badResponse(502, '<html>Bad gateway</html>'),
    );
    expect(error.kind, ApiErrorKind.server);
    expect(error.code, isNull);
    expect(error.isRetryable, isTrue);
  });

  test('guardApiCall rethrows DioException as ApiException', () async {
    await expectLater(
      guardApiCall<void>(() async => throw badResponse(404, null)),
      throwsA(
        isA<ApiException>().having(
          (e) => e.kind,
          'kind',
          ApiErrorKind.notFound,
        ),
      ),
    );
  });

  test('every kind has Spanish user copy', () {
    final l10n = AppLocalizationsEs();
    for (final kind in ApiErrorKind.values) {
      expect(ApiException(kind: kind).userMessage(l10n), isNotEmpty);
    }
    expect(
      const ApiException(kind: ApiErrorKind.network).userMessage(l10n),
      l10n.errorNetwork,
    );
  });
}
