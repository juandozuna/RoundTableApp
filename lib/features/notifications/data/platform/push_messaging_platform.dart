/// Raw message as delivered by the push transport.
class PushMessage {
  const PushMessage({this.title, this.body, this.data = const {}});

  final String? title;
  final String? body;

  /// FCM `data` payload (all strings): `type`, `session_id`,
  /// `round_table_id`, `stage`, `commitment_id`, …
  final Map<String, String> data;
}

enum PushPermissionStatus { granted, denied, notDetermined, unsupported }

enum PushPlatform {
  android,
  ios,
  web;

  String get wireValue => name;
}

/// Thin seam over the push SDK so the service can be tested and so that
/// nothing but one implementation imports `firebase_messaging` (AGENTS.md §17).
abstract interface class PushMessagingPlatform {
  /// `false` when Firebase is not configured or the browser lacks push.
  Future<bool> isSupported();

  PushPlatform get platform;

  Future<PushPermissionStatus> permissionStatus();

  Future<PushPermissionStatus> requestPermission();

  Future<String?> token();

  Future<void> deleteToken();

  Stream<String> get onTokenRefresh;

  Stream<PushMessage> get onForegroundMessage;

  Stream<PushMessage> get onMessageOpened;

  /// The message that launched the app from a terminated state, if any.
  Future<PushMessage?> initialMessage();
}
