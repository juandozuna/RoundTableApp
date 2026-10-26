import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_target.freezed.dart';

/// Where tapping a notification should lead, decided by the domain and
/// translated into a route by the presentation layer.
@freezed
sealed class NotificationTarget with _$NotificationTarget {
  const factory NotificationTarget.session({
    required String roundTableId,
    required String sessionId,
  }) = NotificationTargetSession;

  const factory NotificationTarget.home() = NotificationTargetHome;
}
