import '../../../../core/models/assessment_kind.dart';
import '../../../../core/models/attendance_status.dart';
import '../../../../core/models/commitment_follow_up_status.dart';
import '../../../../core/network/postgrest/postgrest.dart';
import 'session_write_operation.dart';

/// Payload keys of `sync-upload` that PostgREST column names do not cover
/// (api-contract.md §4). The server owns organization, table and value ids,
/// so they are never sent.
abstract final class SessionWriteColumns {
  static const String score = 'score';
  static const String justification = 'justification';
  static const String answerText = 'answer_text';
  static const String answerPersonId = 'answer_person_id';
  static const String actionText = 'action_text';
  static const String measureText = 'measure_text';
  static const String followUpStatus = 'follow_up_status';
  static const String followUpNote = 'follow_up_note';
  static const String followUpDeviceAt = 'follow_up_device_at';
  static const String deviceModifiedAt = 'device_modified_at';
}

/// Builds the operations of each session write. A row that exists is patched
/// by its id; a new one is put under a device-generated id (the server merges
/// a put into the row already holding the same session, person and question).
abstract final class SessionWriteOperations {
  static SessionWriteOperation attendance({
    required String? existingId,
    required String Function() newId,
    required String sessionId,
    required String personId,
    required AttendanceStatus status,
    required String nowIso,
  }) => existingId == null
      ? SessionWriteOperation.put(
          table: PostgrestTables.sessionAttendance,
          id: newId(),
          data: {
            PostgrestColumns.sessionId: sessionId,
            PostgrestColumns.personId: personId,
            PostgrestColumns.status: status.wireValue,
            PostgrestColumns.deviceCreatedAt: nowIso,
          },
        )
      : SessionWriteOperation.patch(
          table: PostgrestTables.sessionAttendance,
          id: existingId,
          data: {
            PostgrestColumns.status: status.wireValue,
            SessionWriteColumns.deviceModifiedAt: nowIso,
          },
        );

  static SessionWriteOperation assessment({
    required String? existingId,
    required String Function() newId,
    required String sessionId,
    required String personId,
    required AssessmentKind kind,
    required int score,
    required String? justification,
    required String nowIso,
  }) => existingId == null
      ? SessionWriteOperation.put(
          table: PostgrestTables.memberAssessments,
          id: newId(),
          data: {
            PostgrestColumns.sessionId: sessionId,
            PostgrestColumns.personId: personId,
            PostgrestColumns.kind: kind.wireValue,
            SessionWriteColumns.score: score,
            SessionWriteColumns.justification: justification,
            PostgrestColumns.deviceCreatedAt: nowIso,
          },
        )
      : SessionWriteOperation.patch(
          table: PostgrestTables.memberAssessments,
          id: existingId,
          data: {
            SessionWriteColumns.score: score,
            SessionWriteColumns.justification: justification,
            SessionWriteColumns.deviceModifiedAt: nowIso,
          },
        );

  /// [pickedPersonId] null clears a previously picked person.
  static SessionWriteOperation answer({
    required String? existingId,
    required String Function() newId,
    required String sessionId,
    required String personId,
    required String questionId,
    required String text,
    required String? pickedPersonId,
    required String nowIso,
  }) => existingId == null
      ? SessionWriteOperation.put(
          table: PostgrestTables.memberAnswers,
          id: newId(),
          data: {
            PostgrestColumns.sessionId: sessionId,
            PostgrestColumns.personId: personId,
            PostgrestColumns.questionId: questionId,
            SessionWriteColumns.answerText: text,
            SessionWriteColumns.answerPersonId: pickedPersonId,
            PostgrestColumns.deviceCreatedAt: nowIso,
          },
        )
      : SessionWriteOperation.patch(
          table: PostgrestTables.memberAnswers,
          id: existingId,
          data: {
            SessionWriteColumns.answerText: text,
            SessionWriteColumns.answerPersonId: pickedPersonId,
            SessionWriteColumns.deviceModifiedAt: nowIso,
          },
        );

  static SessionWriteOperation commitment({
    required String? existingId,
    required String Function() newId,
    required String sessionId,
    required String personId,
    required String actionText,
    required String measureText,
    required String nowIso,
  }) => existingId == null
      ? SessionWriteOperation.put(
          table: PostgrestTables.memberCommitments,
          id: newId(),
          data: {
            PostgrestColumns.sessionId: sessionId,
            PostgrestColumns.personId: personId,
            SessionWriteColumns.actionText: actionText,
            SessionWriteColumns.measureText: measureText,
            PostgrestColumns.deviceCreatedAt: nowIso,
          },
        )
      : SessionWriteOperation.patch(
          table: PostgrestTables.memberCommitments,
          id: existingId,
          data: {
            SessionWriteColumns.actionText: actionText,
            SessionWriteColumns.measureText: measureText,
            SessionWriteColumns.deviceModifiedAt: nowIso,
          },
        );

  /// Review of last week's commitment, written on that commitment's row.
  static SessionWriteOperation followUpReview({
    required String previousCommitmentId,
    required String sessionId,
    required CommitmentFollowUpStatus status,
    required String? note,
    required String nowIso,
  }) => SessionWriteOperation.patch(
    table: PostgrestTables.memberCommitments,
    id: previousCommitmentId,
    data: {
      PostgrestColumns.followUpSessionId: sessionId,
      SessionWriteColumns.followUpStatus: status.wireValue,
      SessionWriteColumns.followUpNote: note,
      SessionWriteColumns.followUpDeviceAt: nowIso,
      SessionWriteColumns.deviceModifiedAt: nowIso,
    },
  );
}
