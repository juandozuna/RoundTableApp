import 'package:injectable/injectable.dart';

import '../../services/notification_service.dart';

@injectable
class StartNotificationsUseCase {
  const StartNotificationsUseCase(this._notifications);

  final NotificationService _notifications;

  Future<void> call() => _notifications.start();
}
