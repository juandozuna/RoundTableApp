import 'package:freezed_annotation/freezed_annotation.dart';

import 'notification_permission.dart';
import 'notification_preferences.dart';

part 'notification_settings.freezed.dart';

/// Everything the preferences screen shows.
@freezed
abstract class NotificationSettings with _$NotificationSettings {
  const factory NotificationSettings({
    required NotificationPermission permission,
    required NotificationPreferences preferences,
  }) = _NotificationSettings;
}
