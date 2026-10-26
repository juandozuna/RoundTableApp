import 'dart:async';

import 'package:powersync/powersync.dart';

import '../../network/auth_token_provider.dart';
import '../../services/logging/app_log.dart';
import 'sync_schema.dart';
import 'sync_upload_batch.dart';
import 'sync_uploader.dart';

/// Authenticates PowerSync with the Supabase JWT and hands queued changes to
/// the [SyncUploader].
class SupabasePowerSyncConnector extends PowerSyncBackendConnector {
  SupabasePowerSyncConnector({
    required String endpoint,
    required AuthTokenProvider tokens,
    required SyncUploader uploader,
  }) : _endpoint = endpoint,
       _tokens = tokens,
       _uploader = uploader;

  final String _endpoint;
  final AuthTokenProvider _tokens;
  final SyncUploader _uploader;

  @override
  Future<PowerSyncCredentials?> fetchCredentials() async {
    final token = _tokens.accessToken;
    if (token == null) return null;
    return PowerSyncCredentials(
      endpoint: _endpoint,
      token: token,
      userId: _tokens.userId,
    );
  }

  @override
  void invalidateCredentials() {
    super.invalidateCredentials();
    unawaited(
      _tokens.refreshAccessToken().catchError((Object error) {
        AppLog.warning('sync', 'Token refresh for PowerSync failed', error);
        return null;
      }),
    );
  }

  @override
  Future<void> uploadData(PowerSyncDatabase database) async {
    final transaction = await database.getNextCrudTransaction();
    if (transaction == null) return;

    final batch = SyncUploadBatch(
      transactionId: transaction.transactionId,
      operations: [for (final entry in transaction.crud) _toOperation(entry)],
    );
    try {
      await _uploader.upload(batch);
    } on SyncUploadRejected catch (rejection) {
      AppLog.error(
        'sync',
        'Server rejected part of transaction ${transaction.transactionId}; '
            'dropping it.',
        rejection,
      );
      await _recordRejections(database, rejection.rejections);
    }
    await transaction.complete();
  }

  Future<void> _recordRejections(
    PowerSyncDatabase database,
    List<SyncRejection> rejections,
  ) async {
    for (final rejection in rejections) {
      await database.execute(
        'INSERT INTO ${CoreSyncTables.uploadRejections} '
        '(id, table_name, row_id, code, message, rejected_at) '
        "VALUES (uuid(), ?, ?, ?, ?, strftime('%Y-%m-%dT%H:%M:%SZ', 'now'))",
        [
          rejection.table,
          rejection.id,
          rejection.code,
          rejection.message,
        ],
      );
    }
  }

  static SyncOperation _toOperation(CrudEntry entry) => SyncOperation(
    type: switch (entry.op) {
      UpdateType.put => SyncOperationType.put,
      UpdateType.patch => SyncOperationType.patch,
      UpdateType.delete => SyncOperationType.delete,
    },
    table: entry.table,
    id: entry.id,
    data: Map<String, Object?>.of(entry.opData ?? const {}),
  );
}
