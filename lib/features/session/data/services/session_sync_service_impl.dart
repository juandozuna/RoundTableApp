import 'package:injectable/injectable.dart';

import '../../../../core/sync/data/sync_database.dart';
import '../../domain/services/session_sync_service.dart';

@LazySingleton(as: SessionSyncService)
class SessionSyncServiceImpl implements SessionSyncService {
  SessionSyncServiceImpl(this._database);

  final SyncDatabase _database;

  /// PowerSync uploads queued changes on its own while connected; this only
  /// restarts replication when the connection was lost.
  @override
  Future<void> requestSync() async {
    if (!_database.isOpen || _database.powerSync.currentStatus.connected) {
      return;
    }
    await _database.connect();
  }
}
