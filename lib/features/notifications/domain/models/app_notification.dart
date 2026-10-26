import 'package:freezed_annotation/freezed_annotation.dart';

import 'notification_kind.dart';

part 'app_notification.freezed.dart';

/// A notification received by the device, free of FCM types.
@freezed
abstract class AppNotification with _$AppNotification {
  const factory AppNotification({
    /// `null` for a type this version does not know.
    NotificationKind? kind,
    String? title,
    String? body,
    String? sessionId,
    String? roundTableId,

    /// Stage that was opened (`stage_opened`).
    String? stage,
    String? commitmentId,
  }) = _AppNotification;
}
