import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/models/user_profile.dart';

part 'profile_edit_state.freezed.dart';

@freezed
sealed class ProfileEditState with _$ProfileEditState {
  const factory ProfileEditState.loading() = ProfileEditLoading;

  const factory ProfileEditState.editing({
    required UserProfile profile,
    @Default(false) bool saving,
    Object? error,
  }) = ProfileEditEditing;

  const factory ProfileEditState.saved(UserProfile profile) = ProfileEditSaved;

  /// No person is bound to this sign-in, or the profile could not be read.
  const factory ProfileEditState.unavailable({Object? error}) =
      ProfileEditUnavailable;
}
