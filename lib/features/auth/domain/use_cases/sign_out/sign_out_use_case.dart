import 'package:injectable/injectable.dart';

import '../../services/auth_service.dart';

/// Signs out and keeps local data: unsent changes upload when the same
/// person signs in again (ADR 0004).
@injectable
class SignOutUseCase {
  const SignOutUseCase(this._auth);

  final AuthService _auth;

  Future<void> call() => _auth.signOut();
}
