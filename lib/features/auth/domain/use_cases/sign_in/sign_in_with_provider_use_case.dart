import 'package:injectable/injectable.dart';

import '../../../../../core/services/connectivity/connectivity_service.dart';
import '../../models/auth_failure.dart';
import '../../models/auth_provider.dart';
import '../../services/auth_service.dart';

@injectable
class SignInWithProviderUseCase {
  const SignInWithProviderUseCase(this._auth, this._connectivity);

  final AuthService _auth;
  final ConnectivityService _connectivity;

  /// Throws [AuthFailure] (`offline` without internet).
  Future<void> call(AuthProvider provider, {String? returnPath}) async {
    if (!await _connectivity.isOnline()) {
      throw const AuthFailure(AuthFailureKind.offline);
    }
    await _auth.signInWithProvider(provider, returnPath: returnPath);
  }
}
