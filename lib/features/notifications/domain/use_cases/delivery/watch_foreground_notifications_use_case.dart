import 'package:injectable/injectable.dart';

import '../../models/app_notification.dart';
import '../../services/notification_preferences_service.dart';
import '../../services/notification_service.dart';

/// Pushes received while the app is open, unless the user turned those
/// alerts off.
@injectable
class WatchForegroundNotificationsUseCase {
  const WatchForegroundNotificationsUseCase(
    this._notifications,
    this._preferences,
  );

  final NotificationService _notifications;
  final NotificationPreferencesService _preferences;

  Stream<AppNotification> call() => _notifications.foregroundNotifications
      .asyncMap((notification) async {
        final preferences = await _preferences.current();
        return preferences.foregroundAlerts ? notification : null;
      })
      .where((notification) => notification != null)
      .cast<AppNotification>();
}
