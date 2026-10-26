import '../../../../core/models/session_stage.dart';
import 'live_session.dart';
import 'member_step.dart';
import 'session_participant.dart';
import 'session_status.dart';

/// What a participant can do with one step right now.
enum StepAccess {
  /// Captured already.
  done,

  /// Can be answered now.
  open,

  /// Answers were closed (or the session ended) before it was captured.
  closed,

  /// The facilitator has not opened it yet.
  notYet,

  /// Nothing to review (no previous commitment).
  skipped,
}

/// Which screen a participant sees.
enum MemberScreen {
  lobby,
  attendance,
  followUp,
  reflection,
  commitment,
  recap,
  summary,
  notToday,
  cancelled,
}

/// Pure rules that decide a participant's screen and what is unlocked.
///
/// - Live (online and replicating): the facilitator's synced stage drives
///   the screen; earlier steps stay open until answers are closed.
/// - Self-paced (no connection): steps are walked in order on the device.
/// - The facilitator is always "live" for their own answers: they control
///   the stage on their own phone (ADR 0014).
class MemberFlow {
  MemberFlow(
    this.session, {
    required bool live,
    this.noPreviousAcknowledged = false,
  }) : _live = live || session.iAmFacilitator;

  final LiveSession session;
  final bool _live;

  /// The person saw the "no previous commitment" screen and continued.
  final bool noPreviousAcknowledged;

  bool get isLive => _live;

  SessionParticipant get _me => session.me;

  bool get _sessionEnded => session.session.isFinal;

  /// Position of the server stage: lobby 0, attendance 1, follow-up 2,
  /// value/commitment 3, closed 4.
  int get _stageRank => switch (session.session.stage) {
    SessionStage.lobby => 0,
    SessionStage.attendance => 1,
    SessionStage.followUp => 2,
    SessionStage.value || SessionStage.commitment => 3,
    SessionStage.closed => 4,
  };

  static int _stepRank(MemberStep step) => switch (step) {
    MemberStep.followUp => 2,
    MemberStep.reflection || MemberStep.commitment => 3,
  };

  bool applies(MemberStep step) => session.appliesTo(_me, step);

  bool isDone(MemberStep step) => LiveSession.progressOf(_me, step).isDone;

  StepAccess accessOf(MemberStep step) {
    if (!applies(step)) return StepAccess.skipped;
    if (isDone(step)) return StepAccess.done;
    if (_sessionEnded || session.session.answersClosed) {
      return StepAccess.closed;
    }
    if (_live) {
      final opened =
          session.session.status != SessionStatus.scheduled &&
          _stageRank >= _stepRank(step);
      return opened ? StepAccess.open : StepAccess.notYet;
    }
    return _selfPacedUnlocked(step) ? StepAccess.open : StepAccess.notYet;
  }

  /// Offline, follow-up is always first; value and commitment follow once it
  /// is done or not applicable.
  bool _selfPacedUnlocked(MemberStep step) {
    if (step == MemberStep.followUp) return true;
    return !applies(MemberStep.followUp) || isDone(MemberStep.followUp);
  }

  /// Steps whose chip can be tapped (done or open).
  bool canView(MemberStep step) {
    final access = accessOf(step);
    return access == StepAccess.done || access == StepAccess.open;
  }

  /// The screen to show, honoring an explicit [chosen] step when allowed.
  MemberScreen screen({MemberStep? chosen}) {
    final info = session.session;
    if (info.isCancelled) return MemberScreen.cancelled;
    if (info.isClosed) return MemberScreen.summary;
    if (!session.isToday && !info.isOpen) return MemberScreen.notToday;
    if (chosen != null && canView(chosen)) return _screenOf(chosen);
    return _live ? _liveScreen() : _selfPacedScreen();
  }

  MemberScreen _liveScreen() {
    final info = session.session;
    if (info.status == SessionStatus.scheduled) return MemberScreen.lobby;
    if (info.answersClosed) return MemberScreen.recap;
    return switch (info.stage) {
      SessionStage.lobby => MemberScreen.lobby,
      SessionStage.attendance => MemberScreen.attendance,
      SessionStage.followUp => MemberScreen.followUp,
      SessionStage.value || SessionStage.commitment => _valueScreen(),
      SessionStage.closed => MemberScreen.summary,
    };
  }

  MemberScreen _valueScreen() => isDone(MemberStep.reflection)
      ? MemberScreen.commitment
      : MemberScreen.reflection;

  MemberScreen _selfPacedScreen() {
    if (applies(MemberStep.followUp)) {
      if (!isDone(MemberStep.followUp)) return MemberScreen.followUp;
    } else if (!noPreviousAcknowledged) {
      return MemberScreen.followUp;
    }
    if (!isDone(MemberStep.reflection)) return MemberScreen.reflection;
    if (!isDone(MemberStep.commitment)) return MemberScreen.commitment;
    return MemberScreen.recap;
  }

  static MemberScreen _screenOf(MemberStep step) => switch (step) {
    MemberStep.followUp => MemberScreen.followUp,
    MemberStep.reflection => MemberScreen.reflection,
    MemberStep.commitment => MemberScreen.commitment,
  };

  /// Every step the person owes today is captured.
  bool get isFinished =>
      MemberStep.values.every((step) => !applies(step) || isDone(step));
}
