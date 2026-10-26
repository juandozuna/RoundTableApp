import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/models/app_notification.dart';
import '../../domain/models/notification_target.dart';

part 'notifications_host_state.freezed.dart';

/// The latest notification event the host widget must react to. `sequence`
/// makes two identical events distinct states.
@freezed
abstract class NotificationsHostState with _$NotificationsHostState {
  const factory NotificationsHostState({
    @Default(0) int sequence,

    /// A push that arrived while the app is open: show a toast.
    AppNotification? foreground,

    /// A tapped notification: navigate.
    NotificationTarget? target,
  }) = _NotificationsHostState;
}
