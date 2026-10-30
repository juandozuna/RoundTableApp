import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_password_state.freezed.dart';

enum ResetPasswordNotice {
  none,
  offline,
  weakPassword,
  linkExpired,
  rateLimited,
  failed,
}

@freezed
abstract class ResetPasswordState with _$ResetPasswordState {
  const factory ResetPasswordState({
    @Default(false) bool saving,

    /// The new password is set; the page offers to continue.
    @Default(false) bool done,
    @Default(ResetPasswordNotice.none) ResetPasswordNotice notice,
  }) = _ResetPasswordState;
}
