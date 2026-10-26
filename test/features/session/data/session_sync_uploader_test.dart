import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/network/api_exception.dart';
import 'package:gold_roundtables/core/sync/data/sync_upload_batch.dart';
import 'package:gold_roundtables/core/sync/data/sync_uploader.dart';
import 'package:gold_roundtables/features/session/data/datasources/session_remote_data_source.dart';
import 'package:gold_roundtables/features/session/data/models/sync_upload_response.dart';
import 'package:gold_roundtables/features/session/data/services/session_sync_uploader.dart';
import 'package:mocktail/mocktail.dart';

class _MockRemote extends Mock implements SessionRemoteDataSource {}

SyncOperation op(
  int n, {
  SyncOperationType type = SyncOperationType.put,
  String table = 'member_answers',
}) => SyncOperation(
  type: type,
  table: table,
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
  late SessionSyncUploader uploader;

  setUp(() {
    remote = _MockRemote();
    uploader = SessionSyncUploader(remote);
  });

  test('posts the queued operations in PowerSync CrudEntry shape', () async {
    when(() => remote.uploadBatch(any())).thenAnswer((_) async => applied(2));

    await uploader.upload(
      SyncUploadBatch(
        operations: [
          op(1),
          op(2, type: SyncOperationType.patch),
        ],
      ),
    );

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

  test('splits a long transaction into batches of 500', () async {
    when(() => remote.uploadBatch(any())).thenAnswer((invocation) async {
      final batch = invocation.positionalArguments.first as List;
      return applied(batch.length);
    });

    await uploader.upload(
      SyncUploadBatch(operations: [for (var i = 0; i < 1100; i++) op(i)]),
    );

    final sizes = verify(
      () => remote.uploadBatch(captureAny()),
    ).captured.map((batch) => (batch as List).length).toList();
    expect(sizes, [500, 500, 100]);
  });

  test(
    'refused operations become a permanent rejection with the reason',
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
        uploader.upload(SyncUploadBatch(operations: [op(1), op(2)])),
        throwsA(
          isA<SyncUploadRejected>().having(
            (e) => e.rejections.map((r) => (r.id, r.code, r.message)).toList(),
            'rejections',
            [('id-2', 'session_closed', 'La sesión ya se cerró.')],
          ),
        ),
      );
    },
  );

  test('a rejected request (422) drops the whole batch', () async {
    when(() => remote.uploadBatch(any())).thenThrow(
      const ApiException(
        kind: ApiErrorKind.validation,
        code: 'validation_failed',
        statusCode: 422,
      ),
    );

    await expectLater(
      uploader.upload(SyncUploadBatch(operations: [op(1), op(2)])),
      throwsA(
        isA<SyncUploadRejected>().having(
          (e) => e.rejections.length,
          'rejections',
          2,
        ),
      ),
    );
  });

  for (final kind in [
    ApiErrorKind.network,
    ApiErrorKind.timeout,
    ApiErrorKind.server,
    ApiErrorKind.unauthorized,
  ]) {
    test('$kind is retried later, not dropped', () async {
      when(() => remote.uploadBatch(any())).thenThrow(ApiException(kind: kind));

      await expectLater(
        uploader.upload(SyncUploadBatch(operations: [op(1)])),
        throwsA(isA<ApiException>()),
      );
    });
  }
}
