import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/models/auth_failure.dart';
import '../../../../domain/models/auth_provider.dart';
import '../../../../domain/use_cases/sign_in/create_dev_account_use_case.dart';
import '../../../../domain/use_cases/sign_in/sign_in_with_dev_password_use_case.dart';
import '../../../../domain/use_cases/sign_in/sign_in_with_provider_use_case.dart';
import '../../../../domain/use_cases/sign_in/watch_auth_failures_use_case.dart';
import 'sign_in_state.dart';

@injectable
class SignInCubit extends Cubit<SignInState> {
  SignInCubit(
    this._signInWithProvider,
    this._signInWithDevPassword,
    this._createDevAccount,
    this._watchFailures,
  ) : super(const SignInState()) {
    _failures = _watchFailures().listen(_onFailure);
  }

  final SignInWithProviderUseCase _signInWithProvider;
  final SignInWithDevPasswordUseCase _signInWithDevPassword;
  final CreateDevAccountUseCase _createDevAccount;
  final WatchAuthFailuresUseCase _watchFailures;
  late final StreamSubscription<AuthFailure> _failures;

  Future<void> signIn(AuthProvider provider, {String? returnPath}) async {
    if (state.isBusy) return;
    emit(SignInState(signingInWith: provider));
    try {
      await _signInWithProvider(provider, returnPath: returnPath);
    } on AuthFailure catch (failure) {
      _onFailure(failure);
    }
  }

  Future<void> signInAsDevUser(String email, String password) =>
      _runDev(() => _signInWithDevPassword(email, password));

  Future<void> signInAsNewDevAccount() => _runDev(_createDevAccount.call);

  /// Closes the "waiting for the provider" state, e.g. after the person
  /// dismissed the provider screen without returning.
  void cancel() => emit(const SignInState(notice: SignInNotice.cancelled));

  Future<void> _runDev(Future<Object?> Function() action) async {
    if (state.isBusy) return;
    emit(const SignInState(devBusy: true));
    try {
      await action();
      if (!isClosed) emit(const SignInState());
    } on AuthFailure catch (failure) {
      _onFailure(failure);
    }
  }

  void _onFailure(AuthFailure failure) {
    if (isClosed) return;
    emit(
      SignInState(
        notice: switch (failure.kind) {
          AuthFailureKind.cancelled => SignInNotice.cancelled,
          AuthFailureKind.offline => SignInNotice.offline,
          AuthFailureKind.invalidCredentials => SignInNotice.invalidCredentials,
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
