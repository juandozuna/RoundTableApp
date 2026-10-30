import 'package:injectable/injectable.dart';

import '../../../../../core/services/connectivity/connectivity_service.dart';
import '../../models/auth_failure.dart';
import '../../services/email_auth_service.dart';

@injectable
class SetNewPasswordUseCase {
  const SetNewPasswordUseCase(this._email, this._connectivity);

  final EmailAuthService _email;
  final ConnectivityService _connectivity;

  /// Throws [AuthFailure] (`offline`, `weakPassword`, `linkExpired` when the
  /// recovery session is gone).
  Future<void> call(String newPassword) async {
    if (!await _connectivity.isOnline()) {
      throw const AuthFailure(AuthFailureKind.offline);
    }
    await _email.updatePassword(newPassword);
  }
}
