import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/models/invite_preview.dart';
import '../../../../domain/models/invite_problem.dart';

part 'code_entry_state.freezed.dart';

enum CodeEntryStatus { idle, checking, failed, verified }

@freezed
abstract class CodeEntryState with _$CodeEntryState {
  const factory CodeEntryState({
    @Default(CodeEntryStatus.idle) CodeEntryStatus status,
    InviteProblem? problem,

    /// Last code that was checked.
    String? code,

    /// Typing is locked until this instant ([InviteProblem.lockedOut]).
    DateTime? lockedUntil,
    required int remainingAttempts,

    /// Set when [status] is verified; the page opens the confirm step.
    InvitePreview? verified,
  }) = _CodeEntryState;

  const CodeEntryState._();

  bool get isLocked => problem == InviteProblem.lockedOut;

  /// The code exists but cannot be used: a full screen explains it.
  bool get isUnusableInvite =>
      status == CodeEntryStatus.failed &&
      (problem == InviteProblem.expired ||
          problem == InviteProblem.revoked ||
          problem == InviteProblem.alreadyUsed);
}
