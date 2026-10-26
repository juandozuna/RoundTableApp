import 'package:injectable/injectable.dart';

import '../../services/dev_auth_service.dart';

@injectable
class SignInWithDevPasswordUseCase {
  const SignInWithDevPasswordUseCase(this._dev);

  final DevAuthService _dev;

  bool get isAvailable => _dev.isAvailable;

  Future<void> call(String email, String password) =>
      _dev.signIn(email, password);
}
