import '../models/notification_preferences.dart';

abstract interface class NotificationPreferencesService {
  /// Current preferences first, then every change.
  Stream<NotificationPreferences> watch();

  Future<NotificationPreferences> current();

  Future<void> save(NotificationPreferences preferences);
}
