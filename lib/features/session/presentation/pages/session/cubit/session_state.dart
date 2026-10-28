import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../core/models/session_stage.dart';
import '../../../../../../core/models/session_status.dart';
import '../../../../../../core/sync/domain/sync_snapshot.dart';
import '../../../../domain/models/facilitator_stage.dart';
import '../../../../domain/models/live_session.dart';
import '../../../../domain/models/member_step.dart';

part 'session_state.freezed.dart';

@freezed
sealed class SessionState with _$SessionState {
  const factory SessionState.loading() = SessionLoading;

  /// The device holds no table or session yet (first login never synced).
  const factory SessionState.unavailable() = SessionUnavailable;

  const factory SessionState.failure(Object error) = SessionFailure;

  const factory SessionState.ready(SessionView view) = SessionReady;
}

/// Everything the live session screens render.
@freezed
abstract class SessionView with _$SessionView {
  const factory SessionView({
    required LiveSession session,
    required bool isOnline,
    required SyncSnapshot sync,
    @Default(false) bool isBusy,
    SessionPrompt? prompt,
    SessionProblem? problem,
    SessionNotice? notice,
  }) = _SessionView;

  const SessionView._();

  /// Online and replicating: the facilitator's stage reaches every phone
  /// live. Otherwise the room runs self-paced (ADR 0003).
  bool get isLive => isOnline && _replicates;

  bool get _replicates => sync.connection == SyncConnection.connected;

  FacilitatorStage get stage => FacilitatorStage.of(session.session);
}

/// A confirmation the facilitator must answer before a control runs.
@freezed
sealed class SessionPrompt with _$SessionPrompt {
  /// Moving on while people have not answered yet.
  const factory SessionPrompt.confirmAdvance({
    required FacilitatorStage next,

    /// First names of members who have not answered.
    required List<String> pendingNames,

    /// The facilitator's own unanswered steps.
    required List<MemberStep> myMissingSteps,
  }) = ConfirmAdvancePrompt;

  const factory SessionPrompt.confirmClose({
    /// People with incomplete answers.
    required int incomplete,
  }) = ConfirmClosePrompt;
}

@freezed
sealed class SessionProblem with _$SessionProblem {
  /// "Falta marcar asistencia": the people still without a mark.
  const factory SessionProblem.attendanceIncomplete(List<String> personIds) =
      AttendanceIncompleteProblem;

  const factory SessionProblem.failed(Object error) = ControlFailedProblem;
}

/// One-shot messages for toasts; cleared with `consumeNotice`.
enum SessionNotice {
  /// The control was saved on this phone (no connection).
  savedOnDevice,

  /// The connection came back and sync restarted.
  reconnected,
}

/// What the server will report once a control the facilitator just sent
/// online has replicated back. Shown meanwhile so the board answers at once.
@freezed
abstract class ControlOverride with _$ControlOverride {
  const factory ControlOverride({
    SessionStatus? status,
    SessionStage? stage,
    DateTime? answersClosedAt,
    DateTime? endedAt,
  }) = _ControlOverride;
}
