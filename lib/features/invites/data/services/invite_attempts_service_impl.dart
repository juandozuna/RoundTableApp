import 'package:injectable/injectable.dart';

import '../../../../core/services/clock/clock_service.dart';
import '../../domain/services/invite_attempts_service.dart';

/// In-memory: a restart clears the brake, which is fine for a speed bump.
@LazySingleton(as: InviteAttemptsService)
class InviteAttemptsServiceImpl implements InviteAttemptsService {
  InviteAttemptsServiceImpl(this._clock);

  final ClockService _clock;
  int _failures = 0;
  DateTime? _lockedUntil;

  @override
  DateTime? get lockedUntil {
    final until = _lockedUntil;
    if (until != null && !until.isAfter(_clock.nowUtc())) reset();
    return _lockedUntil;
  }

  @override
  int get remainingAttempts {
    lockedUntil; // clears an expired lock
    return (InviteAttemptsService.maxAttempts - _failures).clamp(
      0,
      InviteAttemptsService.maxAttempts,
    );
  }

  @override
  void recordFailure() {
    _failures++;
    if (_failures >= InviteAttemptsService.maxAttempts) {
      _lockedUntil = _clock.nowUtc().add(InviteAttemptsService.lockDuration);
    }
  }

  @override
  void reset() {
    _failures = 0;
    _lockedUntil = null;
  }
}
