import 'package:gold_roundtables/core/models/attendance_status.dart';
import 'package:gold_roundtables/core/models/session_stage.dart';
import 'package:gold_roundtables/core/models/session_status.dart';
import 'package:gold_roundtables/core/models/sync_state.dart';
import 'package:gold_roundtables/features/session/domain/models/curriculum_value.dart';
import 'package:gold_roundtables/features/session/domain/models/live_session.dart';
import 'package:gold_roundtables/features/session/domain/models/previous_commitment.dart';
import 'package:gold_roundtables/features/session/domain/models/session_info.dart';
import 'package:gold_roundtables/features/session/domain/models/session_participant.dart';
import 'package:gold_roundtables/features/session/domain/models/session_table.dart';
import 'package:gold_roundtables/features/session/domain/models/step_progress.dart';
import 'package:gold_roundtables/features/session/domain/models/value_question.dart';

StepProgress done([SyncState state = SyncState.synced, int? score]) =>
    StepProgress(isDone: true, syncState: state, score: score);

SessionParticipant person(
  String id, {
  bool facilitator = false,
  bool me = false,
  bool previous = true,
  AttendanceStatus? attendance,
  StepProgress followUp = StepProgress.none,
  StepProgress reflection = StepProgress.none,
  StepProgress commitment = StepProgress.none,
  bool auto = false,
}) => SessionParticipant(
  personId: id,
  firstName: id[0].toUpperCase() + id.substring(1),
  lastName: 'Prueba',
  isFacilitator: facilitator,
  isMe: me,
  hasPreviousCommitment: previous,
  attendance: attendance,
  attendanceAuto: auto,
  followUp: followUp,
  reflection: reflection,
  commitment: commitment,
);

/// A session of Mesa Esperanza 03 with [participants]; the device user is the
/// one flagged `me`.
LiveSession liveSession({
  required List<SessionParticipant> participants,
  SessionStatus status = SessionStatus.open,
  SessionStage stage = SessionStage.followUp,
  DateTime? answersClosedAt,
  DateTime? endedAt,
  bool isToday = true,
  bool hasFollowUp = true,
  List<String> rejected = const [],
  bool pending = false,
}) {
  final me = participants.firstWhere((p) => p.isMe);
  return LiveSession(
    session: SessionInfo(
      id: 'session-4',
      tableId: 'table-1',
      status: status,
      stage: stage,
      scheduledAt: DateTime.utc(2026, 10, 29, 23),
      valueId: 'value-4',
      followUpValueId: hasFollowUp ? 'value-3' : null,
      startedAt: status == SessionStatus.scheduled
          ? null
          : DateTime.utc(2026, 10, 29, 23),
      answersClosedAt: answersClosedAt,
      endedAt: endedAt,
    ),
    table: const SessionTable(
      id: 'table-1',
      name: 'Mesa Esperanza 03',
      organizationName: 'Fundación Luz',
      durationMinutes: 30,
    ),
    value: const CurriculumValue(
      id: 'value-4',
      name: 'Responsabilidad',
      sequence: 4,
    ),
    followUpValue: hasFollowUp
        ? const CurriculumValue(id: 'value-3', name: 'Honestidad', sequence: 3)
        : null,
    questions: const [
      ValueQuestion(id: 'q1', text: '¿Quién es un ejemplo?', sortOrder: 1),
      ValueQuestion(id: 'q2', text: '¿Por qué ese puntaje?', sortOrder: 2),
    ],
    participants: participants,
    myPersonId: me.personId,
    isToday: isToday,
    previousCommitment: me.hasPreviousCommitment
        ? const PreviousCommitment(
            id: 'commit-prev',
            actionText: 'Llamar a mi mamá 3 veces',
          )
        : null,
    controlChangesPending: pending,
    rejectedMessages: rejected,
  );
}
