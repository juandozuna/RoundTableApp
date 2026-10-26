import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/models/auth_provider.dart';

part 'sign_in_state.freezed.dart';

/// Message shown above the provider buttons after something went wrong.
enum SignInNotice {
  none,
  cancelled,
  offline,
  invalidCredentials,
  notConfigured,
  failed,
}

@freezed
abstract class SignInState with _$SignInState {
  const factory SignInState({
    /// The provider flow is open (waiting for the person or the redirect).
    AuthProvider? signingInWith,
    @Default(false) bool devBusy,
    @Default(SignInNotice.none) SignInNotice notice,
  }) = _SignInState;

  const SignInState._();

  bool get isBusy => signingInWith != null || devBusy;
}
