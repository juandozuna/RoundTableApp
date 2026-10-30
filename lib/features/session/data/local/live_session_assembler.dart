import '../../../../core/models/assessment_kind.dart';
import '../../../../core/models/attendance_status.dart';
import '../../../../core/models/commitment_follow_up_status.dart';
import '../../../../core/models/sync_state.dart';
import '../../domain/models/attendance_source.dart';
import '../../domain/models/curriculum_value.dart';
import '../../domain/models/live_session.dart';
import '../../domain/models/my_responses.dart';
import '../../domain/models/previous_commitment.dart';
import '../../domain/models/session_activity.dart';
import '../../domain/models/session_participant.dart';
import '../../domain/models/session_table.dart';
import '../../domain/models/step_progress.dart';
import '../../domain/models/value_question.dart';
import 'local_session_data.dart';
import 'row_mappers.dart';
import 'session_drift_database.dart';

/// Turns local rows into the domain [LiveSession]. Pure: no database access,
/// so the sync-state rules are testable on their own.
abstract final class LiveSessionAssembler {
  /// Rejections older than this are no longer shown to the person.
  static const Duration rejectionRetention = Duration(hours: 48);

  static const int _activityLimit = 12;

  static LiveSession? assemble(
    LocalSessionData data, {
    required bool uploading,
    required DateTime now,
  }) {
    final session = data.selectedSession.toInfo();
    if (session == null) return null;
    final sessionId = session.id;

    final participants = _participants(data, sessionId, uploading);
    if (!participants.any((p) => p.personId == data.myPersonId)) return null;

    final followUpValue = data.followUpValue;
    return LiveSession(
      session: session,
      table: SessionTable(
        id: data.table.id,
        name: data.table.name ?? '',
        code: data.table.code,
        organizationName: data.organizationName,
        durationMinutes: data.table.durationMinutes ?? 30,
      ),
      value: _value(data.value),
      followUpValue: followUpValue == null ? null : _value(followUpValue),
      questions: [
        for (final q in data.questions)
          ValueQuestion(
            id: q.id,
            text: q.questionText ?? '',
            sortOrder: q.sortOrder ?? 0,
            responseType: QuestionResponseType.parse(q.responseType),
          ),
      ],
      participants: participants,
      myPersonId: data.myPersonId,
      isToday: data.isToday,
      previousCommitment: _previousCommitment(data, data.myPersonId),
      myResponses: _myResponses(data, sessionId),
      activity: _activity(data, participants),
      controlChangesPending: data.pendingRowIds.contains(sessionId),
      rejectedMessages: _rejectedMessages(data, now),
    );
  }

  static CurriculumValue _value(ValueRow row) => CurriculumValue(
    id: row.id,
    name: row.name ?? '',
    sequence: row.sequence ?? 0,
  );

  static List<SessionParticipant> _participants(
    LocalSessionData data,
    String sessionId,
    bool uploading,
  ) {
    final roster = [...data.roster]
      ..sort((a, b) {
        final aFac = a.role == 'facilitator';
        final bFac = b.role == 'facilitator';
        if (aFac != bFac) return aFac ? -1 : 1;
        return (a.firstName ?? '').compareTo(b.firstName ?? '');
      });
    final seen = <String>{};
    return [
      for (final member in roster)
        if (seen.add(member.personId!))
          _participant(data, member, sessionId, uploading),
    ];
  }

  static SessionParticipant _participant(
    LocalSessionData data,
    TableMemberRow member,
    String sessionId,
    bool uploading,
  ) {
    final personId = member.personId!;
    final attendance = _latest(
      data.attendance.where((a) => a.personId == personId),
      (a) => a.deviceModifiedAt ?? a.deviceCreatedAt,
    );
    final followUpScore = _assessment(data, personId, AssessmentKind.followUp);
    final initialScore = _assessment(data, personId, AssessmentKind.initial);
    final previous = _previousCommitmentRow(data, personId);
    final answers = data.answers.where((a) => a.personId == personId).toList();
    final commitment = data.commitments
        .where((c) => c.personId == personId)
        .firstOrNull;
    final followUpOnPrevious =
        previous != null && previous.followUpSessionId == sessionId;

    StepProgress progress(
      bool done,
      Iterable<String> ids,
      Iterable<bool?> late, [
      int? score,
    ]) {
      if (!done) return StepProgress.none;
      return StepProgress(
        isDone: true,
        score: score,
        syncState: _syncState(
          ids,
          late,
          pending: data.pendingRowIds,
          uploading: uploading,
        ),
      );
    }

    return SessionParticipant(
      personId: personId,
      firstName: member.firstName ?? '',
      lastName: member.lastName ?? '',
      isFacilitator: member.role == 'facilitator',
      isMe: personId == data.myPersonId,
      hasPreviousCommitment: previous != null,
      attendance: AttendanceStatus.tryParse(attendance?.status),
      attendanceAuto:
          AttendanceSource.tryParse(attendance?.source) ==
          AttendanceSource.autoSubmission,
      attendanceSyncedLate: attendance?.syncedLate ?? false,
      followUp: progress(
        followUpScore != null,
        [?followUpScore?.id, if (followUpOnPrevious) previous.id],
        [
          followUpScore?.syncedLate,
          if (followUpOnPrevious) previous.followUpSyncedLate,
        ],
        followUpScore?.score,
      ),
      reflection: progress(
        initialScore != null,
        [?initialScore?.id, for (final a in answers) a.id],
        [initialScore?.syncedLate, for (final a in answers) a.syncedLate],
        initialScore?.score,
      ),
      commitment: progress(
        (commitment?.actionText ?? '').isNotEmpty,
        [?commitment?.id],
        [commitment?.syncedLate],
      ),
    );
  }

  /// A row is pending while its change is queued (syncing while a batch
  /// uploads), then synced, or synced late when the server flagged it.
  static SyncState _syncState(
    Iterable<String> ids,
    Iterable<bool?> late, {
    required Set<String> pending,
    required bool uploading,
  }) {
    if (ids.any(pending.contains)) {
      return uploading ? SyncState.syncing : SyncState.pending;
    }
    return late.any((flag) => flag ?? false)
        ? SyncState.syncedLate
        : SyncState.synced;
  }

  static AssessmentRow? _assessment(
    LocalSessionData data,
    String personId,
    AssessmentKind kind,
  ) => _latest(
    data.assessments.where(
      (a) =>
          a.personId == personId && a.kind == kind.wireValue && a.score != null,
    ),
    (a) => a.deviceModifiedAt ?? a.deviceCreatedAt,
  );

  static CommitmentRow? _previousCommitmentRow(
    LocalSessionData data,
    String personId,
  ) => _latest(
    data.previousCommitments.where(
      (c) => c.personId == personId && (c.actionText ?? '').isNotEmpty,
    ),
    (c) => c.deviceCreatedAt,
  );

  static PreviousCommitment? _previousCommitment(
    LocalSessionData data,
    String personId,
  ) {
    final row = _previousCommitmentRow(data, personId);
    if (row == null) return null;
    return PreviousCommitment(
      id: row.id,
      actionText: row.actionText ?? '',
      measureText: row.measureText,
    );
  }

  static MyResponses _myResponses(LocalSessionData data, String sessionId) {
    final me = data.myPersonId;
    final followUpScore = _assessment(data, me, AssessmentKind.followUp);
    final previous = _previousCommitmentRow(data, me);
    final status = previous?.followUpSessionId == sessionId
        ? CommitmentFollowUpStatus.tryParse(previous?.followUpStatus)
        : null;
    final initial = _assessment(data, me, AssessmentKind.initial);
    final answers = {
      for (final a in data.answers)
        if (a.personId == me && a.questionId != null && a.answerText != null)
          a.questionId!: a.answerText!,
    };
    final commitment = data.commitments
        .where((c) => c.personId == me && (c.actionText ?? '').isNotEmpty)
        .firstOrNull;
    return MyResponses(
      followUp: followUpScore == null || status == null
          ? null
          : FollowUpResponse(
              status: status,
              score: followUpScore.score!,
              note: previous?.followUpNote,
            ),
      reflection: initial == null
          ? null
          : ReflectionResponse(answers: answers, score: initial.score!),
      commitment: commitment == null
          ? null
          : CommitmentResponse(
              actionText: commitment.actionText!,
              measureText: commitment.measureText,
            ),
    );
  }

  static List<SessionActivity> _activity(
    LocalSessionData data,
    List<SessionParticipant> participants,
  ) {
    final names = {for (final p in participants) p.personId: p.firstName};
    final events = <SessionActivity>[];

    void add(
      String? personId,
      SessionActivityKind kind,
      String? at,
      bool? late, {
      bool auto = false,
    }) {
      final name = names[personId];
      final time = parseTimestamp(at);
      if (name == null || time == null) return;
      events.add(
        SessionActivity(
          personName: name,
          kind: kind,
          at: time,
          syncedLate: late ?? false,
          autoAttendance: auto,
        ),
      );
    }

    for (final a in data.attendance) {
      add(
        a.personId,
        SessionActivityKind.attendance,
        a.deviceModifiedAt ?? a.deviceCreatedAt,
        a.syncedLate,
        auto: a.source == AttendanceSource.autoSubmission.wireValue,
      );
    }
    for (final a in data.assessments) {
      add(
        a.personId,
        a.kind == AssessmentKind.followUp.wireValue
            ? SessionActivityKind.followUp
            : SessionActivityKind.reflection,
        a.deviceModifiedAt ?? a.deviceCreatedAt,
        a.syncedLate,
      );
    }
    for (final c in data.commitments) {
      add(
        c.personId,
        SessionActivityKind.commitment,
        c.deviceModifiedAt ?? c.deviceCreatedAt,
        c.syncedLate,
      );
    }
    events.sort((a, b) => b.at.compareTo(a.at));
    return events.take(_activityLimit).toList();
  }

  static List<String> _rejectedMessages(LocalSessionData data, DateTime now) =>
      {
        for (final r in data.rejections)
          if ((r.message ?? '').isNotEmpty &&
              now.difference(parseTimestamp(r.rejectedAt) ?? now) <
                  rejectionRetention)
            r.message!,
      }.toList();

  static T? _latest<T>(Iterable<T> rows, String? Function(T) timestamp) {
    T? best;
    DateTime? bestAt;
    for (final row in rows) {
      final at = parseTimestamp(timestamp(row));
      if (best == null ||
          (at != null && (bestAt == null || at.isAfter(bestAt)))) {
        best = row;
        bestAt = at ?? bestAt;
      }
    }
    return best;
  }
}
