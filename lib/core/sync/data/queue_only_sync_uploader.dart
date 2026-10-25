import 'package:injectable/injectable.dart';

import '../../services/logging/app_log.dart';
import 'sync_upload_batch.dart';
import 'sync_uploader.dart';

/// Placeholder until the session feature provides the real uploader: keeps
/// every change queued. Delete this class (and its registration) when the
/// session feature registers its own [SyncUploader].
@LazySingleton(as: SyncUploader)
class QueueOnlySyncUploader implements SyncUploader {
  @override
  Future<void> upload(SyncUploadBatch batch) async {
    AppLog.warning(
      'sync',
      'No SyncUploader registered; ${batch.operations.length} change(s) stay queued.',
    );
    throw StateError('SyncUploader not implemented yet');
  }
}
