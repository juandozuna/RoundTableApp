import 'package:injectable/injectable.dart';

import '../../services/invite_attempts_service.dart';

@injectable
class GetRemainingAttemptsUseCase {
  const GetRemainingAttemptsUseCase(this._attempts);

  final InviteAttemptsService _attempts;

  int call() => _attempts.remainingAttempts;
}
