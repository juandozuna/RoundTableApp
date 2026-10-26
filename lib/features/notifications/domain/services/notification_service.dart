import '../models/app_notification.dart';
import '../models/notification_permission.dart';

/// Push notification capability of this device (ADR 0009). No FCM, HTTP or
/// platform types appear here.
abstract interface class NotificationService {
  /// Starts listening for sign-in and token changes and registers this device
  /// when the user is signed in, allowed notifications and keeps pushes on.
  /// Safe to call more than once; never throws.
  Future<void> start();

  Future<NotificationPermission> permission();

  /// Asks the user for permission, then registers the device when granted.
  Future<NotificationPermission> requestPermission();

  /// Registers this device's token for the signed-in user. A no-op when push
  /// is unsupported.
  Future<void> registerDevice();

  /// Removes this device's token from the server and the device. Best effort:
  /// a failed server call never blocks sign-out.
  Future<void> unregisterDevice();

  /// Pushes that arrive while the app is open.
  Stream<AppNotification> get foregroundNotifications;

  /// Notifications the user tapped, including the one that launched the app.
  Stream<AppNotification> get openedNotifications;
}
