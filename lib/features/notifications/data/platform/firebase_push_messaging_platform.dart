// ignore_for_file: deprecated_member_use

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/config/app_config.dart';
import '../../../../core/services/firebase/firebase_bootstrap.dart';
import '../../../../core/services/logging/app_log.dart';
import 'push_messaging_platform.dart';

/// FCM implementation.
///
/// Uses `getToken`/`deleteToken`/`onTokenRefresh`, which firebase_messaging 17
/// deprecates in favour of `register()`, because those return the FCM
/// registration token the server's FCM HTTP v1 sender targets; the
/// replacement returns a Firebase Installation ID for direct send, which the
/// `notifications` function does not use. When Firebase is not configured every call degrades
/// to a logged no-op so local development works without a Firebase project.
@LazySingleton(as: PushMessagingPlatform)
class FirebasePushMessagingPlatform implements PushMessagingPlatform {
  FirebasePushMessagingPlatform(this._firebase, this._config);

  final FirebaseBootstrap _firebase;
  final AppConfig _config;
  bool _loggedUnavailable = false;

  bool get _available {
    final available = _firebase.isAvailable;
    if (!available && !_loggedUnavailable) {
      _loggedUnavailable = true;
      AppLog.info('push', 'Firebase not configured; push is a no-op.');
    }
    return available;
  }

  FirebaseMessaging get _messaging => FirebaseMessaging.instance;

  @override
  PushPlatform get platform {
    if (kIsWeb) return PushPlatform.web;
    return defaultTargetPlatform == TargetPlatform.iOS
        ? PushPlatform.ios
        : PushPlatform.android;
  }

  @override
  Future<bool> isSupported() async {
    if (!_available) return false;
    try {
      return await _messaging.isSupported();
    } on Object catch (error) {
      AppLog.warning('push', 'Push support check failed', error);
      return false;
    }
  }

  @override
  Future<PushPermissionStatus> permissionStatus() async {
    if (!await isSupported()) return PushPermissionStatus.unsupported;
    return _map(
      (await _messaging.getNotificationSettings()).authorizationStatus,
    );
  }

  @override
  Future<PushPermissionStatus> requestPermission() async {
    if (!await isSupported()) return PushPermissionStatus.unsupported;
    final settings = await _messaging.requestPermission();
    return _map(settings.authorizationStatus);
  }

  @override
  Future<String?> token() async {
    if (!await isSupported()) return null;
    try {
      return await _messaging.getToken(
        vapidKey: kIsWeb && _config.firebase.vapidKey.isNotEmpty
            ? _config.firebase.vapidKey
            : null,
      );
    } on Object catch (error) {
      AppLog.warning('push', 'Could not read the push token', error);
      return null;
    }
  }

  @override
  Future<void> deleteToken() async {
    if (!await isSupported()) return;
    try {
      await _messaging.deleteToken();
    } on Object catch (error) {
      AppLog.warning('push', 'Could not delete the push token', error);
    }
  }

  @override
  Stream<String> get onTokenRefresh =>
      _available ? _messaging.onTokenRefresh : const Stream.empty();

  @override
  Stream<PushMessage> get onForegroundMessage => _available
      ? FirebaseMessaging.onMessage.map(_toMessage)
      : const Stream.empty();

  @override
  Stream<PushMessage> get onMessageOpened => _available
      ? FirebaseMessaging.onMessageOpenedApp.map(_toMessage)
      : const Stream.empty();

  @override
  Future<PushMessage?> initialMessage() async {
    if (!await isSupported()) return null;
    final message = await _messaging.getInitialMessage();
    return message == null ? null : _toMessage(message);
  }

  static PushMessage _toMessage(RemoteMessage message) => PushMessage(
    title: message.notification?.title,
    body: message.notification?.body,
    data: {
      for (final entry in message.data.entries) entry.key: '${entry.value}',
    },
  );

  static PushPermissionStatus _map(AuthorizationStatus status) =>
      switch (status) {
        AuthorizationStatus.authorized ||
        AuthorizationStatus.provisional => PushPermissionStatus.granted,
        AuthorizationStatus.denied ||
        AuthorizationStatus.deniedPermanently => PushPermissionStatus.denied,
        AuthorizationStatus.notDetermined => PushPermissionStatus.notDetermined,
      };
}
