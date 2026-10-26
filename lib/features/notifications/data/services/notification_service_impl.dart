import 'dart:async';

import 'package:injectable/injectable.dart';

import '../../../../core/network/api_exception.dart';
import '../../../../core/services/auth_session/auth_state_source.dart';
import '../../../../core/services/auth_session/auth_status.dart';
import '../../../../core/services/logging/app_log.dart';
import '../../domain/models/app_notification.dart';
import '../../domain/models/notification_kind.dart';
import '../../domain/models/notification_permission.dart';
import '../../domain/services/notification_preferences_service.dart';
import '../../domain/services/notification_service.dart';
import '../datasources/notifications_local_data_source.dart';
import '../datasources/notifications_remote_data_source.dart';
import '../platform/push_messaging_platform.dart';

@LazySingleton(as: NotificationService)
class NotificationServiceImpl implements NotificationService {
  NotificationServiceImpl(
    this._platform,
    this._remote,
    this._local,
    this._preferences,
    this._auth,
  );

  final PushMessagingPlatform _platform;
  final NotificationsRemoteDataSource _remote;
  final NotificationsLocalDataSource _local;
  final NotificationPreferencesService _preferences;
  final AuthStateSource _auth;

  final StreamController<AppNotification> _opened =
      StreamController<AppNotification>.broadcast();
  final List<StreamSubscription<Object?>> _subscriptions = [];
  Future<void>? _starting;

  @override
  Future<void> start() => _starting ??= _start();

  Future<void> _start() async {
    try {
      if (!await _platform.isSupported()) return;
      _subscriptions
        ..add(_auth.statusChanges.listen(_onAuthChanged))
        ..add(_platform.onTokenRefresh.listen((_) => _registerIfAllowed()))
        ..add(
          _platform.onMessageOpened.listen(
            (message) => _opened.add(_toNotification(message)),
          ),
        );
      final initial = await _platform.initialMessage();
      if (initial != null) _opened.add(_toNotification(initial));
      await _onAuthChanged(_auth.status);
    } on Object catch (error, stackTrace) {
      AppLog.error('push', 'Notifications failed to start', error, stackTrace);
    }
  }

  Future<void> _onAuthChanged(AuthStatus status) async {
    if (status == AuthStatus.authenticated) await _registerIfAllowed();
  }

  Future<void> _registerIfAllowed() async {
    if (_auth.status != AuthStatus.authenticated) return;
    final preferences = await _preferences.current();
    if (!preferences.pushEnabled) return;
    if (await permission() != NotificationPermission.granted) return;
    await registerDevice();
  }

  @override
  Future<NotificationPermission> permission() async =>
      _toPermission(await _platform.permissionStatus());

  @override
  Future<NotificationPermission> requestPermission() async {
    final result = _toPermission(await _platform.requestPermission());
    if (result == NotificationPermission.granted) await registerDevice();
    return result;
  }

  @override
  Future<void> registerDevice() async {
    try {
      final token = await _platform.token();
      if (token == null) return;
      await _remote.registerToken(
        token: token,
        platform: _platform.platform.wireValue,
      );
      await _local.writeToken(token);
    } on ApiException catch (error) {
      AppLog.warning('push', 'Device registration failed', error);
    }
  }

  @override
  Future<void> unregisterDevice() async {
    final token = await _local.readToken() ?? await _platform.token();
    if (token == null) return;
    try {
      await _remote.removeToken(token);
    } on ApiException catch (error) {
      AppLog.warning('push', 'Device token removal failed', error);
    }
    await _local.clearToken();
    await _platform.deleteToken();
  }

  @override
  Stream<AppNotification> get foregroundNotifications =>
      _platform.onForegroundMessage.map(_toNotification);

  @override
  Stream<AppNotification> get openedNotifications => _opened.stream;

  static NotificationPermission _toPermission(PushPermissionStatus status) =>
      switch (status) {
        PushPermissionStatus.granted => NotificationPermission.granted,
        PushPermissionStatus.denied => NotificationPermission.denied,
        PushPermissionStatus.notDetermined =>
          NotificationPermission.notDetermined,
        PushPermissionStatus.unsupported => NotificationPermission.unsupported,
      };

  static AppNotification _toNotification(PushMessage message) {
    final data = message.data;
    return AppNotification(
      kind: NotificationKind.tryParse(data['type']),
      title: message.title,
      body: message.body,
      sessionId: data['session_id'],
      roundTableId: data['round_table_id'],
      stage: data['stage'],
      commitmentId: data['commitment_id'],
    );
  }
}
