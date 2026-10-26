import 'dart:async';

import 'package:injectable/injectable.dart';

import '../../../../../core/sync/domain/sync_snapshot.dart';
import '../../../../../core/sync/domain/watch_sync_status_use_case.dart';
import '../../models/notification_preferences.dart';
import '../../models/unsynced_alert.dart';
import '../../services/notification_preferences_service.dart';

/// Emits an alert while session data has been unsynced for more than 24 hours
/// (ADR 0009 #3) and the user keeps that alert on; `null` otherwise.
@injectable
class WatchUnsyncedAlertUseCase {
  const WatchUnsyncedAlertUseCase(this._watchSyncStatus, this._preferences);

  final WatchSyncStatusUseCase _watchSyncStatus;
  final NotificationPreferencesService _preferences;

  Stream<UnsyncedAlert?> call() {
    SyncSnapshot? snapshot;
    NotificationPreferences? preferences;
    final subscriptions = <StreamSubscription<Object?>>[];
    late final StreamController<UnsyncedAlert?> controller;

    void emit() {
      final sync = snapshot;
      final prefs = preferences;
      if (sync == null || prefs == null) return;
      final show = prefs.unsyncedAlert && sync.hasStalePending;
      controller.add(
        show
            ? UnsyncedAlert(
                pendingCount: sync.pendingCount,
                since: sync.pendingSince,
              )
            : null,
      );
    }

    controller = StreamController<UnsyncedAlert?>(
      onListen: () {
        subscriptions
          ..add(
            _watchSyncStatus().listen((value) {
              snapshot = value;
              emit();
            }, onError: controller.addError),
          )
          ..add(
            _preferences.watch().listen((value) {
              preferences = value;
              emit();
            }, onError: controller.addError),
          );
      },
      onCancel: () async {
        for (final subscription in subscriptions) {
          await subscription.cancel();
        }
      },
    );
    return controller.stream.distinct();
  }
}
