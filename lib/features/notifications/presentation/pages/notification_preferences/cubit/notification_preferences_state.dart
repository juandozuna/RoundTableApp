import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/models/notification_settings.dart';

part 'notification_preferences_state.freezed.dart';

@freezed
sealed class NotificationPreferencesState with _$NotificationPreferencesState {
  const factory NotificationPreferencesState.loading() =
      NotificationPreferencesLoading;

  const factory NotificationPreferencesState.ready({
    required NotificationSettings settings,
    @Default(false) bool busy,
  }) = NotificationPreferencesReady;

  const factory NotificationPreferencesState.failure() =
      NotificationPreferencesFailure;
}
