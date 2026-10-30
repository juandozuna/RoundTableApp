import 'package:gold_roundtables/core/data/records/records.dart';
import 'package:gold_roundtables/core/models/assessment_kind.dart';
import 'package:gold_roundtables/core/models/session_status.dart';
import 'package:gold_roundtables/features/session/data/datasources/session_reads_remote_data_source.dart';

/// In-memory [SessionReadsRemoteDataSource]: serves the seeded records the
/// way the server would for the signed-in person (filtered by session, table
/// or person) and counts the reads of the moving tables.
class FakeSessionReads implements SessionReadsRemoteDataSource {
  int cacheClears = 0;

  @override
  void clearReferenceCache() => cacheClears++;

  /// The signed-in person; null means no seat.
  String? mePersonId;

  RoundTableRecord? tableRecord;
  OrganizationRecord? organizationRecord;
  final List<TableMemberRecord> members = [];
  final List<SessionRecord> sessions = [];
  final Map<String, CurriculumValueRecord> curriculumValues = {};
  final List<ValueQuestionRecord> valueQuestions = [];
  final List<CurriculumTranslationRecord> translationRecords = [];
  final List<SessionAttendanceRecord> attendanceRows = [];
  final List<MemberAssessmentRecord> assessmentRows = [];
  final List<MemberAnswerRecord> answerRows = [];
  final List<MemberCommitmentRecord> commitmentRows = [];

  /// Thrown by every read while set, as a dropped connection would.
  Object? failure;

  int pendingSessionReads = 0;
  int lastClosedReads = 0;

  void _check() {
    final error = failure;
    if (error != null) throw error;
  }

  @override
  Future<TableMemberRecord?> myMembership({String? tableId}) async {
    _check();
    return members
        .where(
          (m) =>
              m.personId == mePersonId &&
              m.status == 'active' &&
              (tableId == null || m.roundTableId == tableId),
        )
        .firstOrNull;
  }

  @override
  Future<RoundTableRecord?> roundTable(String id) async {
    _check();
    return tableRecord?.id == id ? tableRecord : null;
  }

  @override
  Future<OrganizationRecord?> organization(String id) async {
    _check();
    return organizationRecord?.id == id ? organizationRecord : null;
  }

  @override
  Future<Map<String, CurriculumValueRecord>> values(
    Iterable<String> ids,
  ) async {
    _check();
    return {
      for (final id in ids)
        if (curriculumValues[id] != null) id: curriculumValues[id]!,
    };
  }

  @override
  Future<List<ValueQuestionRecord>> questions(String valueId) async {
    _check();
    return [
      for (final q in valueQuestions)
        if (q.valueId == valueId && q.status == 'active') q,
    ]..sort((a, b) => a.sortOrder.compareTo(b.sortOrder));
  }

  @override
  Future<List<CurriculumTranslationRecord>> translations({
    required String locale,
    required Iterable<String> entityIds,
  }) async {
    _check();
    final wanted = entityIds.toSet();
    return [
      for (final t in translationRecords)
        if (t.locale == locale && wanted.contains(t.entityId)) t,
    ];
  }

  @override
  Future<List<SessionRecord>> pendingSessions(String tableId) async {
    _check();
    pendingSessionReads++;
    return [
      for (final s in sessions)
        if (s.roundTableId == tableId &&
            s.archivedAt == null &&
            !s.status.isFinal)
          s,
    ];
  }

  @override
  Future<SessionRecord?> lastClosedSession(String tableId) async {
    _check();
    lastClosedReads++;
    final closed =
        [
          for (final s in sessions)
            if (s.roundTableId == tableId &&
                s.archivedAt == null &&
                s.status == SessionStatus.closed)
              s,
        ]..sort(
          (a, b) => (b.endedAt ?? b.scheduledAt).compareTo(
            a.endedAt ?? a.scheduledAt,
          ),
        );
    return closed.firstOrNull;
  }

  @override
  Future<SessionRecord?> session(String id) async {
    _check();
    return sessions.where((s) => s.id == id).firstOrNull;
  }

  @override
  Future<List<TableMemberRecord>> roster(String tableId) async {
    _check();
    return [
      for (final m in members)
        if (m.roundTableId == tableId && m.status == 'active') m,
    ];
  }

  @override
  Future<List<SessionAttendanceRecord>> attendance(String sessionId) async {
    _check();
    return [
      for (final r in attendanceRows)
        if (r.sessionId == sessionId) r,
    ];
  }

  @override
  Future<List<MemberAssessmentRecord>> assessments(String sessionId) async {
    _check();
    return [
      for (final r in assessmentRows)
        if (r.sessionId == sessionId) r,
    ];
  }

  @override
  Future<List<MemberAnswerRecord>> answers(String sessionId) async {
    _check();
    return [
      for (final r in answerRows)
        if (r.sessionId == sessionId) r,
    ];
  }

  @override
  Future<List<MemberCommitmentRecord>> commitments(String sessionId) async {
    _check();
    return [
      for (final r in commitmentRows)
        if (r.sessionId == sessionId) r,
    ];
  }

  @override
  Future<List<MemberCommitmentRecord>> commitmentsOfValue({
    required String tableId,
    required String valueId,
  }) async {
    _check();
    return [
      for (final r in commitmentRows)
        if (r.roundTableId == tableId && r.valueId == valueId) r,
    ];
  }

  @override
  Future<MemberAssessmentRecord?> myAssessment({
    required String sessionId,
    required String personId,
    required AssessmentKind kind,
  }) async {
    _check();
    return assessmentRows
        .where(
          (r) =>
              r.sessionId == sessionId &&
              r.personId == personId &&
              r.kind == kind,
        )
        .firstOrNull;
  }

  @override
  Future<List<MemberAnswerRecord>> myAnswers({
    required String sessionId,
    required String personId,
  }) async {
    _check();
    return [
      for (final r in answerRows)
        if (r.sessionId == sessionId && r.personId == personId) r,
    ];
  }

  @override
  Future<MemberCommitmentRecord?> myCommitment({
    required String sessionId,
    required String personId,
  }) async {
    _check();
    return commitmentRows
        .where((r) => r.sessionId == sessionId && r.personId == personId)
        .firstOrNull;
  }
}
