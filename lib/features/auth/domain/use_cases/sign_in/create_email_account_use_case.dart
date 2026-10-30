import 'package:injectable/injectable.dart';

import '../../../../../core/services/connectivity/connectivity_service.dart';
import '../../models/auth_failure.dart';
import '../../models/sign_up_outcome.dart';
import '../../services/email_auth_service.dart';

@injectable
class CreateEmailAccountUseCase {
  const CreateEmailAccountUseCase(this._email, this._connectivity);

  final EmailAuthService _email;
  final ConnectivityService _connectivity;

  /// Throws [AuthFailure] (`offline`, `emailAlreadyRegistered`,
  /// `weakPassword`, `rateLimited`).
  Future<SignUpOutcome> call(String email, String password) async {
    if (!await _connectivity.isOnline()) {
      throw const AuthFailure(AuthFailureKind.offline);
    }
    return _email.createAccount(email, password);
  }
}
