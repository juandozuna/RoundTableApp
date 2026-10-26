import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_preferences.freezed.dart';

/// Device-local notification choices.
@freezed
abstract class NotificationPreferences with _$NotificationPreferences {
  const factory NotificationPreferences({
    /// This device is registered to receive pushes (reminders, stage opened).
    @Default(true) bool pushEnabled,

    /// Show pushes that arrive while the app is open as a toast.
    @Default(true) bool foregroundAlerts,

    /// Warn when session data has been unsynced for more than 24 hours.
    @Default(true) bool unsyncedAlert,
  }) = _NotificationPreferences;
}
