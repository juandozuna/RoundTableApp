import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/models/notification_preferences.dart';

/// Device-local notification state: preferences and the registered token.
@lazySingleton
class NotificationsLocalDataSource {
  NotificationsLocalDataSource(this._store);

  static const String _pushKey = 'notifications.push_enabled';
  static const String _foregroundKey = 'notifications.foreground_alerts';
  static const String _unsyncedKey = 'notifications.unsynced_alert';
  static const String _tokenKey = 'notifications.registered_token';

  final SharedPreferencesAsync _store;

  Future<NotificationPreferences> readPreferences() async {
    const defaults = NotificationPreferences();
    return NotificationPreferences(
      pushEnabled: await _store.getBool(_pushKey) ?? defaults.pushEnabled,
      foregroundAlerts:
          await _store.getBool(_foregroundKey) ?? defaults.foregroundAlerts,
      unsyncedAlert:
          await _store.getBool(_unsyncedKey) ?? defaults.unsyncedAlert,
    );
  }

  Future<void> writePreferences(NotificationPreferences preferences) async {
    await _store.setBool(_pushKey, preferences.pushEnabled);
    await _store.setBool(_foregroundKey, preferences.foregroundAlerts);
    await _store.setBool(_unsyncedKey, preferences.unsyncedAlert);
  }

  Future<String?> readToken() => _store.getString(_tokenKey);

  Future<void> writeToken(String token) => _store.setString(_tokenKey, token);

  Future<void> clearToken() => _store.remove(_tokenKey);
}
