import 'package:injectable/injectable.dart';

import '../../models/app_notification.dart';
import '../../models/notification_kind.dart';
import '../../models/notification_target.dart';
import '../../services/notification_service.dart';

/// Where each tapped notification leads (ADR 0009): session reminders and
/// opened stages go to the session; everything else to the home.
@injectable
class WatchNotificationTargetsUseCase {
  const WatchNotificationTargetsUseCase(this._notifications);

  final NotificationService _notifications;

  Stream<NotificationTarget> call() =>
      _notifications.openedNotifications.map(_targetFor);

  NotificationTarget _targetFor(AppNotification notification) {
    final sessionId = notification.sessionId;
    final tableId = notification.roundTableId;
    final opensSession =
        notification.kind == NotificationKind.sessionReminder ||
        notification.kind == NotificationKind.stageOpened;
    if (opensSession && sessionId != null && tableId != null) {
      return NotificationTarget.session(
        roundTableId: tableId,
        sessionId: sessionId,
      );
    }
    return const NotificationTarget.home();
  }
}
