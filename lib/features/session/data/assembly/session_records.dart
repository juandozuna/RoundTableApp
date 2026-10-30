import '../../../../core/data/records/records.dart';

/// Records read from the server for one session, before they are assembled
/// into the domain `LiveSession`. Data-layer only: records never leave
/// `data/`.
class SessionRecords {
  const SessionRecords({
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
    this.pendingRowIds = const {},
    this.rejectedMessages = const [],
  });

  final String myPersonId;
  final RoundTableRecord table;
  final String organizationName;
  final SessionRecord selectedSession;
  final bool isToday;

  /// Curriculum rows already carry the text in the content language in use.
  final CurriculumValueRecord value;
  final CurriculumValueRecord? followUpValue;
  final List<ValueQuestionRecord> questions;
  final List<TableMemberRecord> roster;
  final List<SessionAttendanceRecord> attendance;
  final List<MemberAssessmentRecord> assessments;
  final List<MemberAnswerRecord> answers;

  /// Commitments written in the selected session.
  final List<MemberCommitmentRecord> commitments;

  /// Commitments of the follow-up value (the previous session), for the
  /// people the signed-in user may see.
  final List<MemberCommitmentRecord> previousCommitments;

  /// Ids of rows whose change is still waiting to reach the server. Always
  /// empty while writes are sent immediately; a local outbox fills it.
  final Set<String> pendingRowIds;

  /// Spanish messages for captured rows the server refused permanently. Empty
  /// while a refused write fails right away; a local outbox fills it.
  final List<String> rejectedMessages;
}
