/// Whether the user allowed the app to show notifications.
enum NotificationPermission {
  granted,
  denied,
  notDetermined,

  /// No push on this build (Firebase not configured) or this browser.
  unsupported,
}
