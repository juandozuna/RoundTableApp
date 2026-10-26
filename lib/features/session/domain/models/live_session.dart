import 'package:freezed_annotation/freezed_annotation.dart';

import 'curriculum_value.dart';
import 'member_step.dart';
import 'my_responses.dart';
import 'previous_commitment.dart';
import 'session_activity.dart';
import 'session_info.dart';
import 'session_participant.dart';
import 'session_table.dart';
import 'step_progress.dart';
import 'value_question.dart';

part 'live_session.freezed.dart';

/// Everything the live session screens need, assembled from local data.
/// Facilitators see every participant's progress; members see only their own
/// rows plus who is at the table.
@freezed
abstract class LiveSession with _$LiveSession {
  const factory LiveSession({
    required SessionInfo session,
    required SessionTable table,
    required CurriculumValue value,
    required List<ValueQuestion> questions,

    /// Facilitator first, then members by name.
    required List<SessionParticipant> participants,
    required String myPersonId,

    /// The session is within its meeting window (or already open), so
    /// answers can be captured.
    required bool isToday,
    CurriculumValue? followUpValue,
    PreviousCommitment? previousCommitment,
    @Default(MyResponses()) MyResponses myResponses,
    @Default([]) List<SessionActivity> activity,

    /// Local session-row changes (stage, status) still waiting to upload.
    @Default(false) bool controlChangesPending,

    /// Spanish messages for captured rows the server refused permanently
    /// (for example, "La sesión ya se cerró").
    @Default([]) List<String> rejectedMessages,
  }) = _LiveSession;

  const LiveSession._();

  SessionParticipant get me =>
      participants.firstWhere((p) => p.personId == myPersonId);

  bool get iAmFacilitator => me.isFacilitator;

  SessionParticipant? get facilitator =>
      participants.where((p) => p.isFacilitator).firstOrNull;

  int get seatCount => participants.length;

  List<SessionParticipant> get members =>
      participants.where((p) => !p.isFacilitator).toList();

  bool get allAttendanceMarked => participants.every((p) => p.hasAttendance);

  List<SessionParticipant> get unmarkedParticipants =>
      participants.where((p) => !p.hasAttendance).toList();

  /// Participants still expected to answer [step].
  List<SessionParticipant> pendingFor(MemberStep step) => participants
      .where((p) => appliesTo(p, step) && !progressOf(p, step).isDone)
      .toList();

  bool appliesTo(SessionParticipant participant, MemberStep step) =>
      step != MemberStep.followUp ||
      (session.hasFollowUp && participant.hasPreviousCommitment);

  static StepProgress progressOf(
    SessionParticipant participant,
    MemberStep step,
  ) => switch (step) {
    MemberStep.followUp => participant.followUp,
    MemberStep.reflection => participant.reflection,
    MemberStep.commitment => participant.commitment,
  };
}
