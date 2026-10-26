import 'dart:async';

import 'package:injectable/injectable.dart';

import '../../domain/models/notification_preferences.dart';
import '../../domain/services/notification_preferences_service.dart';
import '../datasources/notifications_local_data_source.dart';

@LazySingleton(as: NotificationPreferencesService)
class NotificationPreferencesServiceImpl
    implements NotificationPreferencesService {
  NotificationPreferencesServiceImpl(this._local);

  final NotificationsLocalDataSource _local;
  final StreamController<NotificationPreferences> _changes =
      StreamController<NotificationPreferences>.broadcast();

  @override
  Future<NotificationPreferences> current() => _local.readPreferences();

  @override
  Stream<NotificationPreferences> watch() {
    StreamSubscription<NotificationPreferences>? changes;
    late final StreamController<NotificationPreferences> controller;
    controller = StreamController<NotificationPreferences>(
      onListen: () async {
        // Subscribe before reading so a save during the read is not lost.
        var changed = false;
        changes = _changes.stream.listen((value) {
          changed = true;
          controller.add(value);
        });
        final initial = await current();
        if (!changed && !controller.isClosed) controller.add(initial);
      },
      onCancel: () => changes?.cancel(),
    );
    return controller.stream;
  }

  @override
  Future<void> save(NotificationPreferences preferences) async {
    await _local.writePreferences(preferences);
    _changes.add(preferences);
  }
}
