import 'package:injectable/injectable.dart';

import '../../services/notification_service.dart';

/// Removes this device's push token. Run before signing out (ADR 0009).
@injectable
class UnregisterDeviceUseCase {
  const UnregisterDeviceUseCase(this._notifications);

  final NotificationService _notifications;

  Future<void> call() => _notifications.unregisterDevice();
}
