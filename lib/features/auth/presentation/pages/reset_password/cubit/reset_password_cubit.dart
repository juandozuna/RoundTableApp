import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/models/auth_failure.dart';
import '../../../../domain/use_cases/sign_in/set_new_password_use_case.dart';
import '../../../../domain/use_cases/sign_out/sign_out_use_case.dart';
import 'reset_password_state.dart';

@injectable
class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit(this._setNewPassword, this._signOut)
    : super(const ResetPasswordState());

  final SetNewPasswordUseCase _setNewPassword;
  final SignOutUseCase _signOut;

  Future<void> save(String newPassword) async {
    if (state.saving) return;
    emit(const ResetPasswordState(saving: true));
    try {
      await _setNewPassword(newPassword);
      if (!isClosed) emit(const ResetPasswordState(done: true));
    } on AuthFailure catch (failure) {
      if (isClosed) return;
      emit(
        ResetPasswordState(
          notice: switch (failure.kind) {
            AuthFailureKind.offline => ResetPasswordNotice.offline,
            AuthFailureKind.weakPassword => ResetPasswordNotice.weakPassword,
            AuthFailureKind.linkExpired => ResetPasswordNotice.linkExpired,
            AuthFailureKind.rateLimited => ResetPasswordNotice.rateLimited,
            _ => ResetPasswordNotice.failed,
          },
        ),
      );
    }
  }

  /// Leaves without setting a password: ends the recovery session so the
  /// person lands on the sign-in page.
  Future<void> cancel() async {
    if (state.saving) return;
    try {
      await _signOut();
    } on AuthFailure {
      // The router still leaves the page once the session is gone; if
      // sign-out failed there is nothing more to do here.
    }
  }
}
