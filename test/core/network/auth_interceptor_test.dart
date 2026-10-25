import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/network/auth_interceptor.dart';
import 'package:gold_roundtables/core/network/auth_token_provider.dart';
import 'package:mocktail/mocktail.dart';

class MockTokenProvider extends Mock implements AuthTokenProvider {}

/// Replies 401 until the request carries [validToken], then 200.
class FakeAdapter implements HttpClientAdapter {
  FakeAdapter(this.validToken);

  String validToken;
  final List<RequestOptions> requests = [];

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    requests.add(options);
    final authorized = options.headers['Authorization'] == 'Bearer $validToken';
    return ResponseBody.fromString(
      jsonEncode(
        authorized
            ? {'ok': true}
            : {
                'error': {'code': 'jwt_expired'},
              },
      ),
      authorized ? 200 : 401,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

void main() {
  late MockTokenProvider tokens;
  late FakeAdapter adapter;
  late Dio dio;

  setUp(() {
    tokens = MockTokenProvider();
    adapter = FakeAdapter('fresh');
    dio = Dio(BaseOptions(baseUrl: 'http://127.0.0.1:54321/functions/v1'))
      ..httpClientAdapter = adapter;
    final retryClient = Dio(dio.options)..httpClientAdapter = adapter;
    dio.interceptors.add(
      AuthInterceptor(
        apiKey: 'anon-key',
        tokenProvider: tokens,
        retry: retryClient.fetch,
      ),
    );
  });

  test('adds apikey and bearer token', () async {
    when(() => tokens.accessToken).thenReturn('fresh');
    await dio.get<Object?>('/ping');
    final sent = adapter.requests.single.headers;
    expect(sent['apikey'], 'anon-key');
    expect(sent['Authorization'], 'Bearer fresh');
  });

  test('refreshes once on 401 and retries with the new token', () async {
    var current = 'stale';
    when(() => tokens.accessToken).thenAnswer((_) => current);
    when(() => tokens.refreshAccessToken()).thenAnswer((_) async {
      current = 'fresh';
      return current;
    });

    final response = await dio.get<Map<String, dynamic>>('/ping');

    expect(response.statusCode, 200);
    expect(adapter.requests, hasLength(2));
    expect(adapter.requests.last.headers['Authorization'], 'Bearer fresh');
    verify(() => tokens.refreshAccessToken()).called(1);
  });

  test(
    'gives up after one retry when the refreshed token is still rejected',
    () async {
      adapter.validToken = 'never';
      when(() => tokens.accessToken).thenReturn('stale');
      when(
        () => tokens.refreshAccessToken(),
      ).thenAnswer((_) async => 'stale-2');

      await expectLater(
        dio.get<Object?>('/ping'),
        throwsA(
          isA<DioException>().having(
            (e) => e.response?.statusCode,
            'status',
            401,
          ),
        ),
      );
      expect(adapter.requests, hasLength(2));
      verify(() => tokens.refreshAccessToken()).called(1);
    },
  );

  test('passes the 401 through when the session cannot refresh', () async {
    when(() => tokens.accessToken).thenReturn('stale');
    when(() => tokens.refreshAccessToken()).thenAnswer((_) async => null);

    await expectLater(dio.get<Object?>('/ping'), throwsA(isA<DioException>()));
    expect(adapter.requests, hasLength(1));
  });

  test('signed out with a non-JWT key sends only apikey', () async {
    when(() => tokens.accessToken).thenReturn(null);
    adapter.validToken = 'irrelevant';
    await expectLater(dio.get<Object?>('/ping'), throwsA(isA<DioException>()));
    expect(
      adapter.requests.first.headers.containsKey('Authorization'),
      isFalse,
    );
    expect(adapter.requests.first.headers['apikey'], 'anon-key');
  });
}
