import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/data/data_change_signal.dart';
import 'package:gold_roundtables/core/data/data_scope.dart';
import 'package:gold_roundtables/core/network/api_exception.dart';
import 'package:gold_roundtables/features/session/data/datasources/session_remote_data_source.dart';
import 'package:gold_roundtables/features/session/data/models/session_write_operation.dart';
import 'package:gold_roundtables/features/session/data/models/sync_upload_response.dart';
import 'package:gold_roundtables/features/session/data/services/session_write_gateway.dart';
import 'package:gold_roundtables/features/session/domain/models/session_write_failure.dart';
import 'package:mocktail/mocktail.dart';

import '../support/fake_connectivity.dart';
import '../support/fake_session_reads.dart';

class _MockRemote extends Mock implements SessionRemoteDataSource {}

SessionWriteOperation op(
  int n, {
  SessionWriteType type = SessionWriteType.put,
}) => SessionWriteOperation(
  type: type,
  table: 'member_answers',
  id: 'id-$n',
  data: {'answer_text': 'respuesta $n'},
);

SyncUploadResponse applied(int count) => SyncUploadResponse(
  applied: count,
  results: [
    for (var i = 0; i < count; i++) const SyncUploadResult(status: 'applied'),
  ],
);

void main() {
  late _MockRemote remote;
  late FakeConnectivity connectivity;
  late DataChangeSignal signal;
  late List<DataScope> notified;
  late FakeSessionReads reads;
  late SessionWriteGateway gateway;

  setUp(() {
    remote = _MockRemote();
    connectivity = FakeConnectivity();
    signal = DataChangeSignal();
    notified = [];
    signal.changes.listen(notified.add);
    reads = FakeSessionReads();
    gateway = SessionWriteGateway(remote, reads, connectivity, signal);
  });

  tearDown(() => signal.dispose());

  test('posts the operations in the sync-upload shape', () async {
    when(() => remote.uploadBatch(any())).thenAnswer((_) async => applied(2));

    await gateway.upload([op(1), op(2, type: SessionWriteType.patch)]);

    final sent =
        verify(() => remote.uploadBatch(captureAny())).captured.single
            as List<Map<String, Object?>>;
    expect(sent, [
      {
        'op': 'PUT',
        'type': 'member_answers',
        'id': 'id-1',
        'opData': {'answer_text': 'respuesta 1'},
      },
      {
        'op': 'PATCH',
        'type': 'member_answers',
        'id': 'id-2',
        'opData': {'answer_text': 'respuesta 2'},
      },
    ]);
  });

  test('tells the live session once the server accepted the batch', () async {
    when(() => remote.uploadBatch(any())).thenAnswer((_) async => applied(1));

    await gateway.upload([op(1)]);
    await pumpEventQueue();

    expect(notified, [DataScope.session]);
  });

  test('sends nothing for an empty batch', () async {
    await gateway.upload(const []);
    verifyZeroInteractions(remote);
  });

  test('splits a long batch into requests of 500', () async {
    when(() => remote.uploadBatch(any())).thenAnswer((invocation) async {
      final batch = invocation.positionalArguments.first as List;
      return applied(batch.length);
    });

    await gateway.upload([for (var i = 0; i < 1100; i++) op(i)]);

    final sizes = verify(
      () => remote.uploadBatch(captureAny()),
    ).captured.map((batch) => (batch as List).length).toList();
    expect(sizes, [500, 500, 100]);
  });

  test('offline: fails right away, sends nothing, notifies nothing', () async {
    connectivity.online = false;

    await expectLater(
      gateway.upload([op(1)]),
      throwsA(
        isA<SessionWriteFailure>().having((e) => e.isOffline, 'offline', true),
      ),
    );
    await pumpEventQueue();

    verifyZeroInteractions(remote);
    expect(notified, isEmpty);
  });

  for (final kind in [ApiErrorKind.network, ApiErrorKind.timeout]) {
    test('$kind is an offline failure, nothing is queued', () async {
      when(() => remote.uploadBatch(any())).thenThrow(ApiException(kind: kind));

      await expectLater(
        gateway.upload([op(1)]),
        throwsA(
          isA<SessionWriteFailure>().having(
            (e) => e.isOffline,
            'offline',
            true,
          ),
        ),
      );
      await pumpEventQueue();
      expect(notified, isEmpty);
    });
  }

  test(
    'refused operations fail with the reasons, applied ones refresh',
    () async {
      when(() => remote.uploadBatch(any())).thenAnswer(
        (_) async => const SyncUploadResponse(
          applied: 1,
          rejected: 1,
          results: [
            SyncUploadResult(status: 'applied'),
            SyncUploadResult(
              status: 'rejected',
              code: 'session_closed',
              message: 'La sesión ya se cerró.',
            ),
          ],
        ),
      );

      await expectLater(
        gateway.upload([op(1), op(2)]),
        throwsA(
          isA<SessionWriteFailure>()
              .having((e) => e.isOffline, 'offline', false)
              .having((e) => e.messages, 'messages', [
                'La sesión ya se cerró.',
              ]),
        ),
      );
      await pumpEventQueue();
      expect(notified, [DataScope.session]);
    },
  );

  test('a refusal without a message is still a failure', () async {
    when(() => remote.uploadBatch(any())).thenAnswer(
      (_) async => const SyncUploadResponse(
        rejected: 1,
        results: [SyncUploadResult(status: 'rejected', code: 'forbidden')],
      ),
    );

    await expectLater(
      gateway.upload([op(1)]),
      throwsA(isA<SessionWriteFailure>()),
    );
  });

  for (final kind in [
    ApiErrorKind.server,
    ApiErrorKind.unauthorized,
    ApiErrorKind.validation,
  ]) {
    test('$kind from the server reaches the caller as it is', () async {
      when(() => remote.uploadBatch(any())).thenThrow(ApiException(kind: kind));

      await expectLater(
        gateway.upload([op(1)]),
        throwsA(isA<ApiException>().having((e) => e.kind, 'kind', kind)),
      );
    });
  }

  group('run', () {
    test('returns the result and notifies after success', () async {
      final result = await gateway.run(() async => 7);
      await pumpEventQueue();
      expect(result, 7);
      expect(notified, [DataScope.session]);
    });

    test('offline never calls the server', () async {
      connectivity.online = false;
      var called = false;
      await expectLater(
        gateway.run(() async => called = true),
        throwsA(isA<SessionWriteFailure>()),
      );
      expect(called, isFalse);
    });
  });

  test(
    'fewer results than operations is a rejection, not an offline',
    () async {
      when(() => remote.uploadBatch(any())).thenAnswer((_) async => applied(1));

      await expectLater(
        gateway.upload([op(1), op(2)]),
        throwsA(
          isA<SessionWriteFailure>()
              .having((f) => f.kind, 'kind', SessionWriteFailureKind.rejected)
              .having((f) => f.isOffline, 'isOffline', isFalse),
        ),
      );
    },
  );

  test(
    'a write refused for authorization forgets the remembered seat',
    () async {
      when(() => remote.uploadBatch(any())).thenThrow(
        const ApiException(kind: ApiErrorKind.forbidden, statusCode: 403),
      );

      await expectLater(gateway.upload([op(1)]), throwsA(isA<ApiException>()));

      expect(reads.cacheClears, 1);
    },
  );

  test('a rejected result for authorization forgets it too', () async {
    when(() => remote.uploadBatch(any())).thenAnswer(
      (_) async => const SyncUploadResponse(
        rejected: 1,
        results: [SyncUploadResult(status: 'rejected', code: 'forbidden')],
      ),
    );

    await expectLater(
      gateway.upload([op(1)]),
      throwsA(isA<SessionWriteFailure>()),
    );

    expect(reads.cacheClears, 1);
  });

  test('other failures keep the remembered seat', () async {
    when(() => remote.uploadBatch(any())).thenAnswer(
      (_) async => const SyncUploadResponse(
        rejected: 1,
        results: [
          SyncUploadResult(status: 'rejected', code: 'validation_failed'),
        ],
      ),
    );

    await expectLater(
      gateway.upload([op(1)]),
      throwsA(isA<SessionWriteFailure>()),
    );

    expect(reads.cacheClears, 0);
  });
}
