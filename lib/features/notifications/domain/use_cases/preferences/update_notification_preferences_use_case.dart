import 'package:injectable/injectable.dart';

import '../../models/notification_preferences.dart';
import '../../services/notification_preferences_service.dart';
import '../../services/notification_service.dart';

/// Saves the preferences and, when the push switch changed, registers or
/// removes this device's token.
@injectable
class UpdateNotificationPreferencesUseCase {
  const UpdateNotificationPreferencesUseCase(
    this._notifications,
    this._preferences,
  );

  final NotificationService _notifications;
  final NotificationPreferencesService _preferences;

  Future<void> call(NotificationPreferences next) async {
    final previous = await _preferences.current();
    await _preferences.save(next);
    if (previous.pushEnabled == next.pushEnabled) return;
    if (next.pushEnabled) {
      await _notifications.registerDevice();
    } else {
      await _notifications.unregisterDevice();
    }
  }
}
