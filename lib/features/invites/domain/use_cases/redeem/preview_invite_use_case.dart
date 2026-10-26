import 'package:injectable/injectable.dart';

import '../../../../../core/services/clock/clock_service.dart';
import '../../models/invite_code.dart';
import '../../models/invite_preview.dart';
import '../../models/invite_problem.dart';
import '../../services/invite_attempts_service.dart';
import '../../services/invite_service.dart';

@injectable
class PreviewInviteUseCase {
  const PreviewInviteUseCase(this._invites, this._attempts, this._clock);

  final InviteService _invites;
  final InviteAttemptsService _attempts;
  final ClockService _clock;

  /// [typed] codes count against the 5-attempt brake; scanned or linked
  /// codes do not. Throws `InviteFailure`.
  Future<InvitePreview> call(String code, {bool typed = false}) async {
    final normalized = InviteCode.normalize(code);
    if (typed) {
      final lockedUntil = _attempts.lockedUntil;
      if (lockedUntil != null && lockedUntil.isAfter(_clock.nowUtc())) {
        throw InviteFailure(InviteProblem.lockedOut, lockedUntil: lockedUntil);
      }
    }
    try {
      final preview = await _invites.preview(normalized);
      if (typed) _attempts.reset();
      return preview;
    } on InviteFailure catch (failure) {
      if (typed && failure.problem == InviteProblem.notFound) {
        _attempts.recordFailure();
        final lockedUntil = _attempts.lockedUntil;
        if (lockedUntil != null) {
          throw InviteFailure(
            InviteProblem.lockedOut,
            lockedUntil: lockedUntil,
          );
        }
      }
      rethrow;
    }
  }
}
