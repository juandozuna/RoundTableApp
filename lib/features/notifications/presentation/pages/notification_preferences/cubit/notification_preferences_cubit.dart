import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/models/notification_preferences.dart';
import '../../../../domain/models/notification_settings.dart';
import '../../../../domain/use_cases/delivery/request_notification_permission_use_case.dart';
import '../../../../domain/use_cases/preferences/update_notification_preferences_use_case.dart';
import '../../../../domain/use_cases/preferences/watch_notification_settings_use_case.dart';
import 'notification_preferences_state.dart';

@injectable
class NotificationPreferencesCubit extends Cubit<NotificationPreferencesState> {
  NotificationPreferencesCubit(
    this._watchSettings,
    this._updatePreferences,
    this._requestPermission,
  ) : super(const NotificationPreferencesState.loading());

  final WatchNotificationSettingsUseCase _watchSettings;
  final UpdateNotificationPreferencesUseCase _updatePreferences;
  final RequestNotificationPermissionUseCase _requestPermission;
  StreamSubscription<NotificationSettings>? _subscription;

  Future<void> load() async {
    await _subscription?.cancel();
    emit(const NotificationPreferencesState.loading());
    _subscription = _watchSettings().listen(
      (settings) =>
          emit(NotificationPreferencesState.ready(settings: settings)),
      onError: (Object _) => emit(const NotificationPreferencesState.failure()),
    );
  }

  Future<void> setPushEnabled(bool value) =>
      _update((p) => p.copyWith(pushEnabled: value));

  Future<void> setForegroundAlerts(bool value) =>
      _update((p) => p.copyWith(foregroundAlerts: value));

  Future<void> setUnsyncedAlert(bool value) =>
      _update((p) => p.copyWith(unsyncedAlert: value));

  /// Asks for permission and refreshes the screen with the answer.
  Future<void> allowNotifications() async {
    await _requestPermission();
    await load();
  }

  Future<void> _update(
    NotificationPreferences Function(NotificationPreferences) change,
  ) async {
    final current = state;
    if (current is! NotificationPreferencesReady) return;
    await _updatePreferences(change(current.settings.preferences));
  }

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    return super.close();
  }
}
