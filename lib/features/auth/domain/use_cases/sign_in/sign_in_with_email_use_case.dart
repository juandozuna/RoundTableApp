import 'package:injectable/injectable.dart';

import '../../../../../core/services/connectivity/connectivity_service.dart';
import '../../models/auth_failure.dart';
import '../../services/email_auth_service.dart';

@injectable
class SignInWithEmailUseCase {
  const SignInWithEmailUseCase(this._email, this._connectivity);

  final EmailAuthService _email;
  final ConnectivityService _connectivity;

  /// Throws [AuthFailure] (`offline` without internet, `invalidCredentials`
  /// for a wrong email or password).
  Future<void> call(String email, String password) async {
    if (!await _connectivity.isOnline()) {
      throw const AuthFailure(AuthFailureKind.offline);
    }
    await _email.signIn(email, password);
  }
}
