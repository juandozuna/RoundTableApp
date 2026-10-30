import 'package:injectable/injectable.dart';

import '../../../../../core/services/connectivity/connectivity_service.dart';
import '../../models/auth_failure.dart';
import '../../services/email_auth_service.dart';

@injectable
class RequestPasswordResetUseCase {
  const RequestPasswordResetUseCase(this._email, this._connectivity);

  final EmailAuthService _email;
  final ConnectivityService _connectivity;

  /// Throws [AuthFailure] (`offline`, `rateLimited`). An email with no
  /// account is not an error: the server does not reveal which emails exist.
  Future<void> call(String email, {required String returnPath}) async {
    if (!await _connectivity.isOnline()) {
      throw const AuthFailure(AuthFailureKind.offline);
    }
    await _email.requestPasswordReset(email, returnPath: returnPath);
  }
}
