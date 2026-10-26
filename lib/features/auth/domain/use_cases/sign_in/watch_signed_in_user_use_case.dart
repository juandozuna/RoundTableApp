import 'package:injectable/injectable.dart';

import '../../models/signed_in_user.dart';
import '../../services/auth_service.dart';

@injectable
class WatchSignedInUserUseCase {
  const WatchSignedInUserUseCase(this._auth);

  final AuthService _auth;

  SignedInUser? get current => _auth.currentUser;

  Stream<SignedInUser?> call() => _auth.watchUser();
}
