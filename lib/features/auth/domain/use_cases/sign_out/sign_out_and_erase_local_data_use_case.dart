import 'package:injectable/injectable.dart';

import '../../services/auth_service.dart';
import '../../services/local_data_service.dart';

/// Signs out and deletes this device's session data, including unsent
/// changes. Only after the person confirmed losing them.
@injectable
class SignOutAndEraseLocalDataUseCase {
  const SignOutAndEraseLocalDataUseCase(this._auth, this._localData);

  final AuthService _auth;
  final LocalDataService _localData;

  Future<void> call() async {
    await _localData.eraseLocalData();
    await _auth.signOut();
  }
}
