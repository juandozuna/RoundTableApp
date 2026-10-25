import 'dart:async';

import 'package:injectable/injectable.dart';

import '../../services/clock/clock_service.dart';
import '../../services/logging/app_log.dart';
import 'sync_database.dart';
import 'sync_schema.dart';

/// Persists when local changes first started waiting to upload, so the
/// "unsynced for more than 24 hours" warning survives app restarts
/// (ADR 0009). Cleared as soon as the upload queue is empty.
@lazySingleton
class PendingSinceTracker {
  PendingSinceTracker(this._database, this._clock);

  static const String _countSql = 'SELECT COUNT(*) AS n FROM ps_crud';

  final SyncDatabase _database;
  final ClockService _clock;
  StreamSubscription<void>? _subscription;

  void start() {
    if (_subscription != null || !_database.isOpen) return;
    _subscription = _database.powerSync
        .watch(_countSql, triggerOnTables: const ['ps_crud'])
        .asyncMap((rows) => _record(rows.first['n'] as int))
        .listen(
          (_) {},
          onError: (Object error) =>
              AppLog.warning('sync', 'Pending tracker failed', error),
        );
  }

  Future<void> _record(int pendingCount) async {
    await _database.powerSync.writeTransaction((tx) async {
      final existing = await tx.getOptional(
        'SELECT ${CoreSyncTables.valueColumn} FROM '
        '${CoreSyncTables.localSyncState} WHERE id = ?',
        [CoreSyncTables.pendingSinceKey],
      );
      if (pendingCount == 0 && existing != null) {
        await tx.execute(
          'DELETE FROM ${CoreSyncTables.localSyncState} WHERE id = ?',
          [CoreSyncTables.pendingSinceKey],
        );
      } else if (pendingCount > 0 && existing == null) {
        await tx.execute(
          'INSERT INTO ${CoreSyncTables.localSyncState} '
          '(id, ${CoreSyncTables.keyColumn}, ${CoreSyncTables.valueColumn}) '
          'VALUES (?, ?, ?)',
          [
            CoreSyncTables.pendingSinceKey,
            CoreSyncTables.pendingSinceKey,
            _clock.nowUtc().toIso8601String(),
          ],
        );
      }
    });
  }

  @disposeMethod
  Future<void> stop() async {
    await _subscription?.cancel();
    _subscription = null;
  }
}
