import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:powersync/powersync.dart';

import '../../config/app_config.dart';
import '../../constants/app_constants.dart';
import '../../services/clock/clock_service.dart';
import '../domain/sync_snapshot.dart';
import '../domain/sync_status_service.dart';
import 'sync_database.dart';
import 'sync_schema.dart';

@LazySingleton(as: SyncStatusService)
class PowerSyncSyncStatusService implements SyncStatusService {
  PowerSyncSyncStatusService(this._database, this._config, this._clock);

  /// Staleness depends on time passing, so re-evaluate periodically.
  static const Duration staleCheckInterval = Duration(minutes: 5);

  static const String _queueSql =
      'SELECT (SELECT COUNT(*) FROM ps_crud) AS pending, '
      '(SELECT ${CoreSyncTables.valueColumn} FROM '
      '${CoreSyncTables.localSyncState} WHERE id = ?) AS since';

  final SyncDatabase _database;
  final AppConfig _config;
  final ClockService _clock;

  @override
  Stream<SyncSnapshot> watch() {
    if (!_database.isOpen) return Stream.value(SyncSnapshot.unavailable);

    final powerSync = _database.powerSync;
    var status = powerSync.currentStatus;
    var pending = 0;
    DateTime? since;
    final subscriptions = <StreamSubscription<Object?>>[];
    Timer? ticker;
    late final StreamController<SyncSnapshot> controller;

    void emit() => controller.add(_snapshot(status, pending, since));

    controller = StreamController<SyncSnapshot>(
      onListen: () {
        emit();
        subscriptions
          ..add(
            powerSync.statusStream.listen((next) {
              status = next;
              emit();
            }, onError: controller.addError),
          )
          ..add(
            powerSync
                .watch(
                  _queueSql,
                  parameters: const [CoreSyncTables.pendingSinceKey],
                  triggerOnTables: const [
                    'ps_crud',
                    CoreSyncTables.localSyncState,
                  ],
                )
                .listen((rows) {
                  final row = rows.first;
                  pending = row['pending'] as int;
                  since = DateTime.tryParse(row['since'] as String? ?? '');
                  emit();
                }, onError: controller.addError),
          );
        ticker = Timer.periodic(staleCheckInterval, (_) => emit());
      },
      onCancel: () async {
        ticker?.cancel();
        for (final subscription in subscriptions) {
          await subscription.cancel();
        }
      },
    );
    return controller.stream;
  }

  SyncSnapshot _snapshot(SyncStatus status, int pending, DateTime? since) {
    final pendingSince = pending > 0 ? since : null;
    return SyncSnapshot(
      connection: _connectionOf(status),
      uploading: status.uploading,
      downloading: status.downloading,
      pendingCount: pending,
      lastSyncedAt: status.lastSyncedAt,
      pendingSince: pendingSince,
      hasStalePending:
          pendingSince != null &&
          _clock.nowUtc().difference(pendingSince) >=
              AppLimits.unsyncedWarningAfter,
      hasError: status.anyError != null,
    );
  }

  SyncConnection _connectionOf(SyncStatus status) {
    if (!_config.hasPowerSync) return SyncConnection.unavailable;
    if (status.connected) return SyncConnection.connected;
    if (status.connecting) return SyncConnection.connecting;
    return SyncConnection.offline;
  }
}
