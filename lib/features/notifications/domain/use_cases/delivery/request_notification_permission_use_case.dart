import 'package:injectable/injectable.dart';

import '../../models/notification_permission.dart';
import '../../services/notification_service.dart';

@injectable
class RequestNotificationPermissionUseCase {
  const RequestNotificationPermissionUseCase(this._notifications);

  final NotificationService _notifications;

  Future<NotificationPermission> call() => _notifications.requestPermission();
}
