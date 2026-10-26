import '../../../../core/models/session_stage.dart';
import 'session_info.dart';
import 'session_status.dart';

/// The five stages on the facilitator's stage bar (ADR 0013). Commitment is
/// part of [value], and [closing] is "answers closed, session not yet
/// closed".
enum FacilitatorStage {
  open,
  attendance,
  followUp,
  value,
  closing;

  /// 1-based number shown on the stage bar.
  int get number => index + 1;

  /// Stage the board is in for [session]. A closed session reports
  /// [closing] and callers check [SessionInfo.isClosed].
  static FacilitatorStage of(SessionInfo session) {
    if (session.isFinal || session.answersClosed) return closing;
    if (session.status == SessionStatus.scheduled) return open;
    return switch (session.stage) {
      SessionStage.lobby => open,
      SessionStage.attendance => attendance,
      SessionStage.followUp => followUp,
      SessionStage.value || SessionStage.commitment => value,
      SessionStage.closed => closing,
    };
  }

  /// Next stage the dock button opens, or null when only closing remains.
  FacilitatorStage? get next =>
      index + 1 < FacilitatorStage.values.length
      ? FacilitatorStage.values[index + 1]
      : null;

  /// Server stage written when the facilitator opens this stage.
  SessionStage? get serverStage => switch (this) {
    open => SessionStage.lobby,
    attendance => SessionStage.attendance,
    followUp => SessionStage.followUp,
    value => SessionStage.value,
    closing => null,
  };
}
