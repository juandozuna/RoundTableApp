import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/features/notifications/domain/models/app_notification.dart';
import 'package:gold_roundtables/features/notifications/domain/models/notification_kind.dart';
import 'package:gold_roundtables/features/notifications/domain/models/notification_permission.dart';
import 'package:gold_roundtables/features/notifications/domain/models/notification_preferences.dart';
import 'package:gold_roundtables/features/notifications/domain/models/notification_settings.dart';
import 'package:gold_roundtables/features/notifications/domain/models/notification_target.dart';
import 'package:gold_roundtables/features/notifications/domain/use_cases/delivery/request_notification_permission_use_case.dart';
import 'package:gold_roundtables/features/notifications/domain/use_cases/delivery/start_notifications_use_case.dart';
import 'package:gold_roundtables/features/notifications/domain/use_cases/delivery/watch_foreground_notifications_use_case.dart';
import 'package:gold_roundtables/features/notifications/domain/use_cases/delivery/watch_notification_targets_use_case.dart';
import 'package:gold_roundtables/features/notifications/domain/use_cases/preferences/update_notification_preferences_use_case.dart';
import 'package:gold_roundtables/features/notifications/domain/use_cases/preferences/watch_notification_settings_use_case.dart';
import 'package:gold_roundtables/features/notifications/presentation/cubit/notifications_host_cubit.dart';
import 'package:gold_roundtables/features/notifications/presentation/cubit/notifications_host_state.dart';
import 'package:gold_roundtables/features/notifications/presentation/pages/notification_preferences/cubit/notification_preferences_cubit.dart';
import 'package:gold_roundtables/features/notifications/presentation/pages/notification_preferences/cubit/notification_preferences_state.dart';
import 'package:mocktail/mocktail.dart';

class _MockStart extends Mock implements StartNotificationsUseCase {}

class _MockForeground extends Mock
    implements WatchForegroundNotificationsUseCase {}

class _MockTargets extends Mock implements WatchNotificationTargetsUseCase {}

class _MockSettings extends Mock implements WatchNotificationSettingsUseCase {}

class _MockUpdate extends Mock
    implements UpdateNotificationPreferencesUseCase {}

class _MockRequest extends Mock
    implements RequestNotificationPermissionUseCase {}

class _FakePreferences extends Fake implements NotificationPreferences {}

void main() {
  setUpAll(() => registerFallbackValue(_FakePreferences()));

  group('NotificationsHostCubit', () {
    late _MockStart start;
    late _MockForeground foreground;
    late _MockTargets targets;
    late StreamController<AppNotification> foregroundController;
    late StreamController<NotificationTarget> targetController;

    setUp(() {
      start = _MockStart();
      foreground = _MockForeground();
      targets = _MockTargets();
      foregroundController = StreamController<AppNotification>();
      targetController = StreamController<NotificationTarget>();
      when(() => start()).thenAnswer((_) async {});
      when(() => foreground()).thenAnswer((_) => foregroundController.stream);
      when(() => targets()).thenAnswer((_) => targetController.stream);
    });

    blocTest<NotificationsHostCubit, NotificationsHostState>(
      'starts notifications and turns pushes into toast and navigation events',
      build: () => NotificationsHostCubit(start, foreground, targets),
      act: (cubit) async {
        await cubit.start();
        foregroundController.add(
          const AppNotification(kind: NotificationKind.stageOpened),
        );
        await pumpEventQueue();
        targetController.add(const NotificationTarget.home());
      },
      verify: (_) => verify(() => start()).called(1),
      expect: () => const [
        NotificationsHostState(
          sequence: 1,
          foreground: AppNotification(kind: NotificationKind.stageOpened),
        ),
        NotificationsHostState(sequence: 2, target: NotificationTarget.home()),
      ],
    );
  });

  group('NotificationPreferencesCubit', () {
    late _MockSettings watchSettings;
    late _MockUpdate update;
    late _MockRequest request;
    late StreamController<NotificationSettings> settings;
    const granted = NotificationSettings(
      permission: NotificationPermission.granted,
      preferences: NotificationPreferences(),
    );

    setUp(() {
      watchSettings = _MockSettings();
      update = _MockUpdate();
      request = _MockRequest();
      settings = StreamController<NotificationSettings>();
      when(() => watchSettings()).thenAnswer((_) => settings.stream);
      when(() => update(any())).thenAnswer((_) async {});
      when(
        () => request(),
      ).thenAnswer((_) async => NotificationPermission.granted);
    });

    NotificationPreferencesCubit build() =>
        NotificationPreferencesCubit(watchSettings, update, request);

    blocTest<NotificationPreferencesCubit, NotificationPreferencesState>(
      'load shows the settings',
      build: build,
      act: (cubit) async {
        await cubit.load();
        settings.add(granted);
      },
      expect: () => const [
        NotificationPreferencesState.loading(),
        NotificationPreferencesState.ready(settings: granted),
      ],
    );

    blocTest<NotificationPreferencesCubit, NotificationPreferencesState>(
      'a stream error becomes a failure',
      build: build,
      act: (cubit) async {
        await cubit.load();
        settings.addError(StateError('boom'));
      },
      expect: () => const [
        NotificationPreferencesState.loading(),
        NotificationPreferencesState.failure(),
      ],
    );

    blocTest<NotificationPreferencesCubit, NotificationPreferencesState>(
      'switches save the changed preference only',
      build: build,
      act: (cubit) async {
        await cubit.load();
        settings.add(granted);
        await pumpEventQueue();
        await cubit.setPushEnabled(false);
      },
      verify: (_) => verify(
        () => update(const NotificationPreferences(pushEnabled: false)),
      ).called(1),
    );

    blocTest<NotificationPreferencesCubit, NotificationPreferencesState>(
      'allowing notifications asks for permission and reloads',
      build: build,
      act: (cubit) => cubit.allowNotifications(),
      verify: (_) {
        verify(() => request()).called(1);
        verify(() => watchSettings()).called(1);
      },
    );
  });
}
