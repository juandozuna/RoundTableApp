import 'package:injectable/injectable.dart';

import '../../../settings/domain/services/sign_out_service.dart';
import '../../domain/services/auth_service.dart';

/// The settings feature's sign-out, delegated to the auth feature so there
/// is a single place that ends a session.
@LazySingleton(as: SignOutService)
class AuthSignOutService implements SignOutService {
  AuthSignOutService(this._auth);

  final AuthService _auth;

  @override
  Future<void> signOut() => _auth.signOut();
}
