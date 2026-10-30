import '../models/sign_up_outcome.dart';

/// Email + password accounts (ADR 0018): sign in, create an account, reset a
/// forgotten password. Hides the auth SDK; every failure is an
/// `AuthFailure`.
abstract interface class EmailAuthService {
  Future<void> signIn(String email, String password);

  Future<SignUpOutcome> createAccount(String email, String password);

  /// Sends the "reset your password" email. [returnPath] is the in-app
  /// location the emailed link opens (the new-password page).
  Future<void> requestPasswordReset(String email, {required String returnPath});

  /// Sets the password of the signed-in (recovery) session.
  Future<void> updatePassword(String newPassword);

  /// A recovery link opened the app and the new password is not set yet.
  bool get isPasswordRecoveryPending;

  /// Emits whenever [isPasswordRecoveryPending] changes.
  Stream<bool> watchPasswordRecoveryPending();
}
