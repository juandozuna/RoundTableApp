import 'session_drift_database.dart';

/// Rows read from the local database for one session, before they are
/// assembled into the domain `LiveSession`. Data-layer only: Drift row types
/// never leave `data/`.
class LocalSessionData {
  const LocalSessionData({
    required this.myPersonId,
    required this.table,
    required this.organizationName,
    required this.selectedSession,
    required this.isToday,
    required this.value,
    required this.followUpValue,
    required this.questions,
    required this.roster,
    required this.attendance,
    required this.assessments,
    required this.answers,
    required this.commitments,
    required this.previousCommitments,
    required this.pendingRowIds,
    required this.rejections,
  });

  final String myPersonId;
  final RoundTableRow table;
  final String organizationName;
  final SessionRow selectedSession;
  final bool isToday;
  final ValueRow value;
  final ValueRow? followUpValue;
  final List<QuestionRow> questions;
  final List<TableMemberRow> roster;
  final List<AttendanceRow> attendance;
  final List<AssessmentRow> assessments;
  final List<AnswerRow> answers;

  /// Commitments written in the selected session.
  final List<CommitmentRow> commitments;

  /// Commitments of the follow-up value (the previous session), for the
  /// people the device may see.
  final List<CommitmentRow> previousCommitments;

  /// Ids of rows with a change still in PowerSync's upload queue.
  final Set<String> pendingRowIds;
  final List<UploadRejectionRow> rejections;
}
