import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/sync/domain/sync_snapshot.dart';
import 'package:gold_roundtables/core/sync/domain/sync_status_service.dart';
import 'package:gold_roundtables/core/sync/domain/watch_sync_status_use_case.dart';
import 'package:gold_roundtables/features/notifications/domain/models/app_notification.dart';
import 'package:gold_roundtables/features/notifications/domain/models/notification_kind.dart';
import 'package:gold_roundtables/features/notifications/domain/models/notification_permission.dart';
import 'package:gold_roundtables/features/notifications/domain/models/notification_preferences.dart';
import 'package:gold_roundtables/features/notifications/domain/models/notification_target.dart';
import 'package:gold_roundtables/features/notifications/domain/models/unsynced_alert.dart';
import 'package:gold_roundtables/features/notifications/domain/services/notification_preferences_service.dart';
import 'package:gold_roundtables/features/notifications/domain/services/notification_service.dart';
import 'package:gold_roundtables/features/notifications/domain/use_cases/delivery/watch_foreground_notifications_use_case.dart';
import 'package:gold_roundtables/features/notifications/domain/use_cases/delivery/watch_notification_targets_use_case.dart';
import 'package:gold_roundtables/features/notifications/domain/use_cases/preferences/update_notification_preferences_use_case.dart';
import 'package:gold_roundtables/features/notifications/domain/use_cases/unsynced/watch_unsynced_alert_use_case.dart';

class _FakeNotifications implements NotificationService {
  final foreground = StreamController<AppNotification>.broadcast();
  final opened = StreamController<AppNotification>.broadcast();
  int registered = 0;
  int unregistered = 0;

  @override
  Future<void> start() async {}

  @override
  Future<NotificationPermission> permission() async =>
      NotificationPermission.granted;

  @override
  Future<NotificationPermission> requestPermission() async =>
      NotificationPermission.granted;

  @override
  Future<void> registerDevice() async => registered++;

  @override
  Future<void> unregisterDevice() async => unregistered++;

  @override
  Stream<AppNotification> get foregroundNotifications => foreground.stream;

  @override
  Stream<AppNotification> get openedNotifications => opened.stream;
}

class _FakePreferences implements NotificationPreferencesService {
  NotificationPreferences value = const NotificationPreferences();
  final changes = StreamController<NotificationPreferences>.broadcast();

  @override
  Future<NotificationPreferences> current() async => value;

  @override
  Future<void> save(NotificationPreferences preferences) async {
    value = preferences;
    changes.add(preferences);
  }

  @override
  Stream<NotificationPreferences> watch() async* {
    yield value;
    yield* changes.stream;
  }
}

class _FakeSync implements SyncStatusService {
  final controller = StreamController<SyncSnapshot>.broadcast();

  @override
  Stream<SyncSnapshot> watch() => controller.stream;
}

void main() {
  late _FakeNotifications notifications;
  late _FakePreferences preferences;

  setUp(() {
    notifications = _FakeNotifications();
    preferences = _FakePreferences();
  });

  group('WatchNotificationTargetsUseCase', () {
    Future<NotificationTarget> targetFor(AppNotification notification) async {
      final target = WatchNotificationTargetsUseCase(notifications)().first;
      notifications.opened.add(notification);
      return target;
    }

    test('a session reminder opens the session', () async {
      final target = await targetFor(
        const AppNotification(
          kind: NotificationKind.sessionReminder,
          sessionId: 's1',
          roundTableId: 't1',
        ),
      );
      expect(
        target,
        const NotificationTarget.session(roundTableId: 't1', sessionId: 's1'),
      );
    });

    test('stage opened opens the session', () async {
      final target = await targetFor(
        const AppNotification(
          kind: NotificationKind.stageOpened,
          sessionId: 's1',
          roundTableId: 't1',
          stage: 'value',
        ),
      );
      expect(target, isA<NotificationTargetSession>());
    });

    test('a commitment nudge opens the home', () async {
      final target = await targetFor(
        const AppNotification(
          kind: NotificationKind.commitmentNudge,
          sessionId: 's1',
          roundTableId: 't1',
        ),
      );
      expect(target, const NotificationTarget.home());
    });

    test('a session notification without ids falls back to the home', () async {
      final target = await targetFor(
        const AppNotification(kind: NotificationKind.sessionReminder),
      );
      expect(target, const NotificationTarget.home());
    });
  });

  group('WatchForegroundNotificationsUseCase', () {
    test('forwards pushes while foreground alerts are on', () async {
      final first = WatchForegroundNotificationsUseCase(
        notifications,
        preferences,
      )().first;
      notifications.foreground.add(
        const AppNotification(kind: NotificationKind.stageOpened),
      );
      expect((await first).kind, NotificationKind.stageOpened);
    });

    test('drops pushes when the user turned foreground alerts off', () async {
      preferences.value = const NotificationPreferences(
        foregroundAlerts: false,
      );
      final received = <AppNotification>[];
      final sub = WatchForegroundNotificationsUseCase(
        notifications,
        preferences,
      )().listen(received.add);
      notifications.foreground.add(
        const AppNotification(kind: NotificationKind.stageOpened),
      );
      await pumpEventQueue();
      expect(received, isEmpty);
      await sub.cancel();
    });
  });

  group('UpdateNotificationPreferencesUseCase', () {
    test('turning push off removes the device token', () async {
      await UpdateNotificationPreferencesUseCase(notifications, preferences)(
        const NotificationPreferences(pushEnabled: false),
      );
      expect(notifications.unregistered, 1);
      expect(preferences.value.pushEnabled, isFalse);
    });

    test('turning push on registers the device', () async {
      preferences.value = const NotificationPreferences(pushEnabled: false);
      await UpdateNotificationPreferencesUseCase(notifications, preferences)(
        const NotificationPreferences(),
      );
      expect(notifications.registered, 1);
    });

    test('other switches do not touch the token', () async {
      await UpdateNotificationPreferencesUseCase(notifications, preferences)(
        const NotificationPreferences(unsyncedAlert: false),
      );
      expect(notifications.registered + notifications.unregistered, 0);
    });
  });

  group('WatchUnsyncedAlertUseCase', () {
    late _FakeSync sync;
    late List<UnsyncedAlert?> emitted;
    StreamSubscription<UnsyncedAlert?>? subscription;
    final since = DateTime.utc(2026, 10, 24);

    setUp(() {
      sync = _FakeSync();
      emitted = [];
    });

    void listen() {
      subscription = WatchUnsyncedAlertUseCase(
        WatchSyncStatusUseCase(sync),
        preferences,
      )().listen(emitted.add);
    }

    tearDown(() => subscription?.cancel());

    SyncSnapshot snapshot({bool stale = false, int pending = 0}) =>
        SyncSnapshot(
          connection: SyncConnection.offline,
          pendingCount: pending,
          pendingSince: stale ? since : null,
          hasStalePending: stale,
        );

    test('alerts once pending data is older than 24 hours', () async {
      listen();
      sync.controller.add(snapshot(pending: 2));
      sync.controller.add(snapshot(stale: true, pending: 2));
      await pumpEventQueue();
      expect(emitted, [null, UnsyncedAlert(pendingCount: 2, since: since)]);
    });

    test('clears when everything uploads', () async {
      listen();
      sync.controller.add(snapshot(stale: true, pending: 2));
      sync.controller.add(snapshot());
      await pumpEventQueue();
      expect(emitted.last, isNull);
    });

    test('online-only status (nothing ever pending) never alerts', () async {
      listen();
      sync.controller
        ..add(const SyncSnapshot(connection: SyncConnection.connected))
        ..add(const SyncSnapshot(connection: SyncConnection.offline));
      await pumpEventQueue();
      expect(emitted.whereType<UnsyncedAlert>(), isEmpty);
    });

    test('stays silent when the user turned the alert off', () async {
      await preferences.save(
        const NotificationPreferences(unsyncedAlert: false),
      );
      listen();
      sync.controller.add(snapshot(stale: true, pending: 2));
      await pumpEventQueue();
      expect(emitted.whereType<UnsyncedAlert>(), isEmpty);
    });
  });
}
