import 'package:injectable/injectable.dart';

import '../../../../core/network/api_exception.dart';
import '../../../../core/services/logging/app_log.dart';
import '../../../../core/sync/data/sync_upload_batch.dart';
import '../../../../core/sync/data/sync_uploader.dart';
import '../datasources/session_remote_data_source.dart';
import '../models/sync_upload_response.dart';

/// Posts queued local changes to the `sync-upload` Edge Function.
///
/// The function answers 200 with a result per operation. Rejected operations
/// are permanent (the server copy syncs down and replaces the local row), so
/// they surface as [SyncUploadRejected]: the connector records them and
/// completes the transaction. Only transport failures, 401 and 5xx are
/// retried; they surface as thrown [ApiException]s that PowerSync retries
/// later (resending is safe: uploads are idempotent by id).
@LazySingleton(as: SyncUploader)
class SessionSyncUploader implements SyncUploader {
  SessionSyncUploader(this._remote);

  final SessionRemoteDataSource _remote;

  @override
  Future<void> upload(SyncUploadBatch batch) async {
    final operations = batch.operations;
    final rejections = <SyncRejection>[];
    for (
      var start = 0;
      start < operations.length;
      start += SessionRemoteDataSource.maxBatch
    ) {
      final end = (start + SessionRemoteDataSource.maxBatch).clamp(
        0,
        operations.length,
      );
      final chunk = operations.sublist(start, end);
      rejections.addAll(_rejectionsOf(chunk, await _send(chunk)));
    }
    if (rejections.isEmpty) return;
    throw SyncUploadRejected(
      '${rejections.length} change(s) refused by the server',
      rejections: rejections,
    );
  }

  Future<SyncUploadResponse> _send(List<SyncOperation> chunk) async {
    try {
      return await _remote.uploadBatch([
        for (final operation in chunk) _toJson(operation),
      ]);
    } on ApiException catch (error) {
      if (_isTransient(error)) rethrow;
      throw SyncUploadRejected(
        error.code ?? error.kind.name,
        rejections: [
          for (final operation in chunk)
            SyncRejection(
              table: operation.table,
              id: operation.id,
              code: error.code,
            ),
        ],
      );
    }
  }

  static bool _isTransient(ApiException error) =>
      error.isRetryable ||
      error.kind == ApiErrorKind.unauthorized ||
      error.kind == ApiErrorKind.cancelled;

  static Map<String, Object?> _toJson(SyncOperation operation) => {
    'op': switch (operation.type) {
      SyncOperationType.put => 'PUT',
      SyncOperationType.patch => 'PATCH',
      SyncOperationType.delete => 'DELETE',
    },
    'type': operation.table,
    'id': operation.id,
    'opData': operation.data,
  };

  static List<SyncRejection> _rejectionsOf(
    List<SyncOperation> chunk,
    SyncUploadResponse response,
  ) {
    final rejections = <SyncRejection>[];
    for (var i = 0; i < response.results.length && i < chunk.length; i++) {
      final result = response.results[i];
      if (!result.isRejected) continue;
      final operation = chunk[i];
      AppLog.warning(
        'sync',
        'Server rejected ${operation.table}/${operation.id}: ${result.code}',
      );
      rejections.add(
        SyncRejection(
          table: operation.table,
          id: operation.id,
          code: result.code,
          message: result.message,
        ),
      );
    }
    return rejections;
  }
}
