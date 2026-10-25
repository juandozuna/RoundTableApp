import 'sync_upload_batch.dart';

/// Sends a batch of queued local changes to the server, through the
/// `sync-upload` Edge Function (ADR 0004, 0008). The session feature
/// implements it.
///
/// Contract:
/// - Return normally only after the server committed the batch; the batch is
///   then removed from the queue. Uploads must be idempotent by UUID.
/// - Throw [SyncUploadRejected] when the server permanently refuses the
///   batch (validation); it is logged and dropped so it cannot block the
///   queue forever.
/// - Throw anything else for transient failures; the batch stays queued and
///   PowerSync retries later.
abstract interface class SyncUploader {
  Future<void> upload(SyncUploadBatch batch);
}

class SyncUploadRejected implements Exception {
  const SyncUploadRejected(this.reason);

  final String reason;

  @override
  String toString() => 'SyncUploadRejected($reason)';
}
