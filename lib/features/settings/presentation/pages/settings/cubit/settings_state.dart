import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../core/services/session_context/session_context.dart';
import '../../../../../../core/sync/domain/sync_snapshot.dart';
import '../../../../domain/models/app_info.dart';
import '../../../../domain/models/user_profile.dart';

part 'settings_state.freezed.dart';

enum ProfileStatus { loading, ready, unavailable }

enum SignOutStatus { idle, inProgress, done, failed }

@freezed
abstract class SettingsState with _$SettingsState {
  const factory SettingsState({
    SessionContext? context,
    UserProfile? profile,
    @Default(ProfileStatus.loading) ProfileStatus profileStatus,
    AppInfo? appInfo,
    @Default(true) bool online,
    @Default(SyncSnapshot.unavailable) SyncSnapshot sync,
    @Default(SignOutStatus.idle) SignOutStatus signOutStatus,
  }) = _SettingsState;
}
