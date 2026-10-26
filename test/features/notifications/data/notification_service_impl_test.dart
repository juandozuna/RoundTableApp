import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/network/api_exception.dart';
import 'package:gold_roundtables/core/services/auth_session/auth_state_source.dart';
import 'package:gold_roundtables/core/services/auth_session/auth_status.dart';
import 'package:gold_roundtables/features/notifications/data/datasources/notifications_local_data_source.dart';
import 'package:gold_roundtables/features/notifications/data/datasources/notifications_remote_data_source.dart';
import 'package:gold_roundtables/features/notifications/data/platform/push_messaging_platform.dart';
import 'package:gold_roundtables/features/notifications/data/services/notification_preferences_service_impl.dart';
import 'package:gold_roundtables/features/notifications/data/services/notification_service_impl.dart';
import 'package:gold_roundtables/features/notifications/domain/models/notification_kind.dart';
import 'package:gold_roundtables/features/notifications/domain/models/notification_permission.dart';
import 'package:gold_roundtables/features/notifications/domain/models/notification_preferences.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_platform_interface/in_memory_shared_preferences_async.dart';
import 'package:shared_preferences_platform_interface/shared_preferences_async_platform_interface.dart';

class _MockRemote extends Mock implements NotificationsRemoteDataSource {}

class _FakeAuth implements AuthStateSource {
  _FakeAuth(this.status);

  @override
  AuthStatus status;

  final controller = StreamController<AuthStatus>.broadcast();

  @override
  Stream<AuthStatus> get statusChanges => controller.stream;
}

class _FakePlatform implements PushMessagingPlatform {
  bool supported = true;
  PushPermissionStatus permissionValue = PushPermissionStatus.granted;
  String? tokenValue = 'fcm-token-1';
  bool deleted = false;
  PushMessage? initial;
  final refresh = StreamController<String>.broadcast();
  final foreground = StreamController<PushMessage>.broadcast();
  final opened = StreamController<PushMessage>.broadcast();

  @override
  Future<bool> isSupported() async => supported;

  @override
  PushPlatform get platform => PushPlatform.web;

  @override
  Future<PushPermissionStatus> permissionStatus() async => permissionValue;

  @override
  Future<PushPermissionStatus> requestPermission() async => permissionValue;

  @override
  Future<String?> token() async => tokenValue;

  @override
  Future<void> deleteToken() async => deleted = true;

  @override
  Stream<String> get onTokenRefresh => refresh.stream;

  @override
  Stream<PushMessage> get onForegroundMessage => foreground.stream;

  @override
  Stream<PushMessage> get onMessageOpened => opened.stream;

  @override
  Future<PushMessage?> initialMessage() async => initial;
}

void main() {
  late _MockRemote remote;
  late _FakePlatform platform;
  late _FakeAuth auth;
  late NotificationsLocalDataSource local;
  late NotificationPreferencesServiceImpl preferences;
  late NotificationServiceImpl service;

  setUp(() {
    SharedPreferencesAsyncPlatform.instance =
        InMemorySharedPreferencesAsync.empty();
    remote = _MockRemote();
    platform = _FakePlatform();
    auth = _FakeAuth(AuthStatus.authenticated);
    local = NotificationsLocalDataSource(SharedPreferencesAsync());
    preferences = NotificationPreferencesServiceImpl(local);
    service = NotificationServiceImpl(
      platform,
      remote,
      local,
      preferences,
      auth,
    );
    when(
      () => remote.registerToken(
        token: any(named: 'token'),
        platform: any(named: 'platform'),
      ),
    ).thenAnswer((_) async {});
    when(() => remote.removeToken(any())).thenAnswer((_) async {});
  });

  void verifyRegistered([String token = 'fcm-token-1', int times = 1]) =>
      verify(
        () => remote.registerToken(token: token, platform: 'web'),
      ).called(times);

  test('start registers the device when signed in and allowed', () async {
    await service.start();
    verifyRegistered();
    expect(await local.readToken(), 'fcm-token-1');
  });

  test('start does nothing when push is unsupported (no Firebase)', () async {
    platform.supported = false;
    await service.start();
    verifyNever(
      () => remote.registerToken(
        token: any(named: 'token'),
        platform: any(named: 'platform'),
      ),
    );
    expect(await service.permission(), NotificationPermission.granted);
  });

  test(
    'start does not register while signed out, but does after sign-in',
    () async {
      auth.status = AuthStatus.unauthenticated;
      await service.start();
      verifyNever(
        () => remote.registerToken(
          token: any(named: 'token'),
          platform: any(named: 'platform'),
        ),
      );
      auth.status = AuthStatus.authenticated;
      auth.controller.add(AuthStatus.authenticated);
      await pumpEventQueue();
      verifyRegistered();
    },
  );

  test('does not register without permission or when push is off', () async {
    platform.permissionValue = PushPermissionStatus.notDetermined;
    await service.start();
    await preferences.save(const NotificationPreferences(pushEnabled: false));
    platform.refresh.add('new');
    await pumpEventQueue();
    verifyNever(
      () => remote.registerToken(
        token: any(named: 'token'),
        platform: any(named: 'platform'),
      ),
    );
  });

  test('a refreshed token is registered again', () async {
    await service.start();
    platform.tokenValue = 'fcm-token-2';
    platform.refresh.add('fcm-token-2');
    await pumpEventQueue();
    verifyRegistered('fcm-token-2');
  });

  test('requestPermission registers the device when granted', () async {
    platform.permissionValue = PushPermissionStatus.granted;
    final result = await service.requestPermission();
    expect(result, NotificationPermission.granted);
    verifyRegistered();
  });

  test('requestPermission does not register when denied', () async {
    platform.permissionValue = PushPermissionStatus.denied;
    final result = await service.requestPermission();
    expect(result, NotificationPermission.denied);
    verifyNever(
      () => remote.registerToken(
        token: any(named: 'token'),
        platform: any(named: 'platform'),
      ),
    );
  });

  test('a failed registration is logged, not thrown', () async {
    when(
      () => remote.registerToken(
        token: any(named: 'token'),
        platform: any(named: 'platform'),
      ),
    ).thenThrow(const ApiException(kind: ApiErrorKind.network));
    await service.registerDevice();
    expect(await local.readToken(), isNull);
  });

  test('unregister removes the stored token on server and device', () async {
    await service.registerDevice();
    await service.unregisterDevice();
    verify(() => remote.removeToken('fcm-token-1')).called(1);
    expect(await local.readToken(), isNull);
    expect(platform.deleted, isTrue);
  });

  test('unregister still clears the device when offline', () async {
    await service.registerDevice();
    when(
      () => remote.removeToken(any()),
    ).thenThrow(const ApiException(kind: ApiErrorKind.network));
    await service.unregisterDevice();
    expect(await local.readToken(), isNull);
    expect(platform.deleted, isTrue);
  });

  test('maps pushes to notifications, foreground and opened', () async {
    final foreground = service.foregroundNotifications.first;
    await service.start();
    platform.foreground.add(
      const PushMessage(
        title: 'Hoy',
        data: {
          'type': 'stage_opened',
          'session_id': 's1',
          'round_table_id': 't1',
          'stage': 'follow_up',
        },
      ),
    );
    final notification = await foreground;
    expect(notification.kind, NotificationKind.stageOpened);
    expect(notification.sessionId, 's1');
    expect(notification.roundTableId, 't1');
    expect(notification.stage, 'follow_up');
    expect(notification.title, 'Hoy');
  });

  test(
    'the notification that launched the app is delivered as tapped',
    () async {
      platform.initial = const PushMessage(
        data: {
          'type': 'session_reminder',
          'session_id': 's1',
          'round_table_id': 't1',
        },
      );
      final opened = service.openedNotifications.first;
      await service.start();
      expect((await opened).kind, NotificationKind.sessionReminder);
    },
  );

  test('unknown push types keep a null kind', () async {
    final foreground = service.foregroundNotifications.first;
    platform.foreground.add(const PushMessage(data: {'type': 'future_kind'}));
    expect((await foreground).kind, isNull);
  });
}
