import 'dart:async';

import 'package:injectable/injectable.dart';

import '../../models/notification_settings.dart';
import '../../services/notification_preferences_service.dart';
import '../../services/notification_service.dart';

@injectable
class WatchNotificationSettingsUseCase {
  const WatchNotificationSettingsUseCase(
    this._notifications,
    this._preferences,
  );

  final NotificationService _notifications;
  final NotificationPreferencesService _preferences;

  /// Re-reads the permission whenever preferences change, which also covers
  /// the user returning from a permission prompt.
  Stream<NotificationSettings> call() => _preferences.watch().asyncMap(
    (preferences) async => NotificationSettings(
      permission: await _notifications.permission(),
      preferences: preferences,
    ),
  );
}
