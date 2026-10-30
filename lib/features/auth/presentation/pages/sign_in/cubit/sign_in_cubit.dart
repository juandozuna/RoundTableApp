import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/models/auth_failure.dart';
import '../../../../domain/models/auth_provider.dart';
import '../../../../domain/models/sign_up_outcome.dart';
import '../../../../domain/use_cases/sign_in/create_dev_account_use_case.dart';
import '../../../../domain/use_cases/sign_in/create_email_account_use_case.dart';
import '../../../../domain/use_cases/sign_in/get_enabled_auth_methods_use_case.dart';
import '../../../../domain/use_cases/sign_in/request_password_reset_use_case.dart';
import '../../../../domain/use_cases/sign_in/sign_in_with_dev_password_use_case.dart';
import '../../../../domain/use_cases/sign_in/sign_in_with_email_use_case.dart';
import '../../../../domain/use_cases/sign_in/sign_in_with_provider_use_case.dart';
import '../../../../domain/use_cases/sign_in/watch_auth_failures_use_case.dart';
import 'sign_in_state.dart';

@injectable
class SignInCubit extends Cubit<SignInState> {
  SignInCubit(
    this._signInWithProvider,
    this._signInWithEmail,
    this._createEmailAccount,
    this._requestPasswordReset,
    this._signInWithDevPassword,
    this._createDevAccount,
    this._watchFailures,
    GetEnabledAuthMethodsUseCase getEnabledMethods,
  ) : super(_initial(getEnabledMethods)) {
    _failures = _watchFailures().listen(_onFailure);
  }

  final SignInWithProviderUseCase _signInWithProvider;
  final SignInWithEmailUseCase _signInWithEmail;
  final CreateEmailAccountUseCase _createEmailAccount;
  final RequestPasswordResetUseCase _requestPasswordReset;
  final SignInWithDevPasswordUseCase _signInWithDevPassword;
  final CreateDevAccountUseCase _createDevAccount;
  final WatchAuthFailuresUseCase _watchFailures;
  late final StreamSubscription<AuthFailure> _failures;

  static SignInState _initial(GetEnabledAuthMethodsUseCase getEnabledMethods) {
    final methods = getEnabledMethods();
    return SignInState(
      emailEnabled: methods.email,
      providers: methods.providers,
    );
  }

  Future<void> signIn(AuthProvider provider, {String? returnPath}) async {
    if (state.isBusy) return;
    emit(_idle().copyWith(signingInWith: provider));
    try {
      await _signInWithProvider(provider, returnPath: returnPath);
    } on AuthFailure catch (failure) {
      _onFailure(failure);
    }
  }

  void showMode(SignInMode mode) {
    if (state.isBusy) return;
    emit(_idle().copyWith(mode: mode));
  }

  Future<void> signInWithEmail(String email, String password) =>
      _runEmail(() async {
        await _signInWithEmail(email, password);
        return SignInNotice.none;
      });

  Future<void> createAccount(String email, String password) =>
      _runEmail(() async {
        final outcome = await _createEmailAccount(email, password);
        return outcome == SignUpOutcome.confirmationPending
            ? SignInNotice.confirmEmailSent
            : SignInNotice.none;
      });

  /// [returnPath] is the location the emailed link opens.
  Future<void> requestPasswordReset(
    String email, {
    required String returnPath,
  }) => _runEmail(() async {
    await _requestPasswordReset(email, returnPath: returnPath);
    return SignInNotice.resetEmailSent;
  }, afterSuccess: SignInMode.signIn);

  Future<void> signInAsDevUser(String email, String password) =>
      _runDev(() => _signInWithDevPassword(email, password));

  Future<void> signInAsNewDevAccount() => _runDev(_createDevAccount.call);

  /// Closes the "waiting for the provider" state, e.g. after the person
  /// dismissed the provider screen without returning.
  void cancel() => emit(_idle(notice: SignInNotice.cancelled));

  Future<void> _runEmail(
    Future<SignInNotice> Function() action, {
    SignInMode? afterSuccess,
  }) async {
    if (state.isBusy) return;
    emit(_idle().copyWith(emailBusy: true));
    try {
      final notice = await action();
      if (isClosed) return;
      emit(_idle(notice: notice).copyWith(mode: afterSuccess ?? state.mode));
    } on AuthFailure catch (failure) {
      _onFailure(failure);
    }
  }

  Future<void> _runDev(Future<Object?> Function() action) async {
    if (state.isBusy) return;
    emit(_idle().copyWith(devBusy: true));
    try {
      await action();
      if (!isClosed) emit(_idle());
    } on AuthFailure catch (failure) {
      _onFailure(failure);
    }
  }

  /// The current state with every "in progress" flag cleared.
  SignInState _idle({SignInNotice notice = SignInNotice.none}) =>
      state.copyWith(
        signingInWith: null,
        emailBusy: false,
        devBusy: false,
        notice: notice,
      );

  void _onFailure(AuthFailure failure) {
    if (isClosed) return;
    emit(
      _idle(
        notice: switch (failure.kind) {
          AuthFailureKind.cancelled => SignInNotice.cancelled,
          AuthFailureKind.offline => SignInNotice.offline,
          AuthFailureKind.invalidCredentials => SignInNotice.invalidCredentials,
          AuthFailureKind.emailAlreadyRegistered =>
            SignInNotice.emailAlreadyRegistered,
          AuthFailureKind.weakPassword => SignInNotice.weakPassword,
          AuthFailureKind.rateLimited => SignInNotice.rateLimited,
          AuthFailureKind.emailNotConfirmed => SignInNotice.emailNotConfirmed,
          AuthFailureKind.linkExpired => SignInNotice.linkExpired,
          AuthFailureKind.notConfigured => SignInNotice.notConfigured,
          AuthFailureKind.unknown => SignInNotice.failed,
        },
      ),
    );
  }

  @override
  Future<void> close() async {
    await _failures.cancel();
    return super.close();
  }
}
