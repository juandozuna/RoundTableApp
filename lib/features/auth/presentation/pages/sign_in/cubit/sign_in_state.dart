import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/models/auth_provider.dart';

part 'sign_in_state.freezed.dart';

/// Message shown above the sign-in form after something went wrong or
/// finished (e.g. the reset email was sent).
enum SignInNotice {
  none,
  cancelled,
  offline,
  invalidCredentials,
  emailAlreadyRegistered,
  weakPassword,
  rateLimited,
  emailNotConfirmed,
  linkExpired,
  confirmEmailSent,
  resetEmailSent,
  notConfigured,
  failed,
}

/// Which email form the sign-in page shows.
enum SignInMode { signIn, createAccount, resetPassword }

@freezed
abstract class SignInState with _$SignInState {
  const factory SignInState({
    /// Email + password form is offered (`AUTH_METHODS` contains `email`).
    @Default(true) bool emailEnabled,

    /// Social providers offered by this build.
    @Default(<AuthProvider>[]) List<AuthProvider> providers,
    @Default(SignInMode.signIn) SignInMode mode,

    /// The provider flow is open (waiting for the person or the redirect).
    AuthProvider? signingInWith,
    @Default(false) bool emailBusy,
    @Default(false) bool devBusy,
    @Default(SignInNotice.none) SignInNotice notice,
  }) = _SignInState;

  const SignInState._();

  bool get isBusy => signingInWith != null || emailBusy || devBusy;
}
