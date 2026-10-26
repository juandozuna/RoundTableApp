import 'package:injectable/injectable.dart';

import '../../models/auth_failure.dart';
import '../../services/auth_service.dart';

@injectable
class WatchAuthFailuresUseCase {
  const WatchAuthFailuresUseCase(this._auth);

  final AuthService _auth;

  Stream<AuthFailure> call() => _auth.failures;
}
