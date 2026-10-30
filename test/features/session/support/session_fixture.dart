import 'package:gold_roundtables/core/data/records/records.dart';
import 'package:gold_roundtables/core/models/assessment_kind.dart';
import 'package:gold_roundtables/core/models/attendance_status.dart';
import 'package:gold_roundtables/core/models/session_stage.dart';
import 'package:gold_roundtables/core/models/session_status.dart';
import 'package:gold_roundtables/core/models/user_role.dart';

import 'fake_session_reads.dart';

/// A deterministic table: facilitator Sofía (the signed-in person when
/// [asFacilitator]) and members Ana (signed in otherwise), Luis and Marta.
/// Session "today" is Responsabilidad (value 4) reviewing Honestidad (3).
abstract final class Ids {
  static const org = 'org-luz';
  static const table = 'table-esperanza';
  static const session = 'session-4';
  static const closedSession = 'session-3';
  static const value3 = 'value-3';
  static const value4 = 'value-4';
  static const q1 = 'question-1';
  static const q2 = 'question-2';
  static const sofia = 'person-sofia';
  static const ana = 'person-ana';
  static const luis = 'person-luis';
  static const marta = 'person-marta';
  static const anaPrevious = 'commit-ana-3';
  static const luisPrevious = 'commit-luis-3';
}

final DateTime scheduledAt = DateTime.utc(2026, 10, 29, 23);

abstract final class SessionFixture {
  /// Seeds the records the signed-in person can read before the meeting.
  static FakeSessionReads seed(
    FakeSessionReads reads, {
    bool asFacilitator = false,
    SessionStatus status = SessionStatus.scheduled,
    SessionStage stage = SessionStage.lobby,
    DateTime? endedAt,
  }) {
    reads
      ..mePersonId = asFacilitator ? Ids.sofia : Ids.ana
      ..organizationRecord = const OrganizationRecord(
        id: Ids.org,
        name: 'Fundación Luz',
        kind: 'foundation',
        countryCode: 'DO',
        countryName: 'República Dominicana',
        status: 'active',
      )
      ..tableRecord = const RoundTableRecord(
        id: Ids.table,
        organizationId: Ids.org,
        locationId: 'loc-1',
        name: 'Mesa Esperanza 03',
        code: 'LUZ-03',
        weekday: 4,
        startTime: '19:00:00',
        timezone: 'America/Santo_Domingo',
        durationMinutes: 30,
        status: 'active',
      );
    reads.members.addAll([
      member('tm-sofia', Ids.sofia, UserRole.facilitator, 'Sofía', 'Herrera'),
      member('tm-ana', Ids.ana, UserRole.member, 'Ana Lucía', 'Méndez'),
      member('tm-luis', Ids.luis, UserRole.member, 'Luis', 'Ferrer'),
      member('tm-marta', Ids.marta, UserRole.member, 'Marta', 'Quiroz'),
    ]);
    reads.curriculumValues.addAll({
      Ids.value3: value(Ids.value3, 3, 'Honestidad'),
      Ids.value4: value(Ids.value4, 4, 'Responsabilidad'),
    });
    reads.valueQuestions.addAll([
      question(
        Ids.q1,
        '¿Quién es para ti un ejemplo de este valor?',
        1,
        'person',
      ),
      question(Ids.q2, '¿Por qué te diste ese puntaje?', 2, 'text'),
    ]);
    reads.sessions.add(session(status: status, stage: stage, endedAt: endedAt));
    // Last week's commitments: Ana and Luis attended, Marta did not. A member
    // only reads their own; the facilitator reads everyone's.
    for (final (id, person, text) in [
      (Ids.anaPrevious, Ids.ana, 'Llamar a mi mamá 3 veces · esta semana'),
      (Ids.luisPrevious, Ids.luis, 'Llegar puntual · todos los días'),
    ]) {
      if (asFacilitator || person == Ids.ana) {
        reads.commitmentRows.add(
          commitment(id, Ids.closedSession, person, Ids.value3, text),
        );
      }
    }
    return reads;
  }

  static SessionRecord session({
    String id = Ids.session,
    SessionStatus status = SessionStatus.scheduled,
    SessionStage stage = SessionStage.lobby,
    DateTime? at,
    DateTime? endedAt,
  }) => SessionRecord(
    id: id,
    organizationId: Ids.org,
    roundTableId: Ids.table,
    valueId: Ids.value4,
    followUpValueId: Ids.value3,
    status: status,
    stage: stage,
    scheduledAt: at ?? scheduledAt,
    endedAt: endedAt,
  );

  static TableMemberRecord member(
    String id,
    String personId,
    UserRole role,
    String first,
    String last,
  ) => TableMemberRecord(
    id: id,
    organizationId: Ids.org,
    roundTableId: Ids.table,
    personId: personId,
    role: role,
    joinedAt: DateTime.utc(2026, 1, 1),
    status: 'active',
    firstName: first,
    lastName: last,
  );

  static CurriculumValueRecord value(String id, int sequence, String name) =>
      CurriculumValueRecord(
        id: id,
        moduleId: 'module-1',
        numberInModule: sequence,
        sequence: sequence,
        name: name,
        status: 'active',
      );

  static ValueQuestionRecord question(
    String id,
    String text,
    int order,
    String responseType,
  ) => ValueQuestionRecord(
    id: id,
    valueId: Ids.value4,
    questionCode: 'q$order',
    questionText: text,
    sortOrder: order,
    responseType: responseType,
    status: 'active',
  );

  static MemberCommitmentRecord commitment(
    String id,
    String sessionId,
    String personId,
    String valueId,
    String text, {
    DateTime? createdAt,
    bool syncedLate = false,
  }) => MemberCommitmentRecord(
    id: id,
    organizationId: Ids.org,
    roundTableId: Ids.table,
    sessionId: sessionId,
    personId: personId,
    valueId: valueId,
    actionText: text,
    measureText: 'Cuántas veces',
    deviceCreatedAt: createdAt ?? DateTime.utc(2026, 10, 22, 23, 30),
    syncedLate: syncedLate,
  );

  static SessionAttendanceRecord attendance(
    String personId,
    AttendanceStatus status, {
    String source = 'facilitator',
    DateTime? at,
    String? id,
  }) => SessionAttendanceRecord(
    id: id ?? 'att-$personId',
    organizationId: Ids.org,
    roundTableId: Ids.table,
    sessionId: Ids.session,
    personId: personId,
    status: status,
    source: source,
    deviceCreatedAt: at,
  );

  static MemberAssessmentRecord assessment(
    String personId,
    AssessmentKind kind,
    int score, {
    bool syncedLate = false,
    DateTime? at,
    String? id,
  }) => MemberAssessmentRecord(
    id: id ?? 'as-$personId-${kind.wireValue}',
    organizationId: Ids.org,
    roundTableId: Ids.table,
    sessionId: Ids.session,
    personId: personId,
    valueId: kind == AssessmentKind.initial ? Ids.value4 : Ids.value3,
    kind: kind,
    score: score,
    syncedLate: syncedLate,
    deviceCreatedAt: at ?? DateTime.utc(2026, 10, 29, 23, 10),
  );

  static MemberAnswerRecord answer(
    String personId,
    String questionId,
    String text, {
    String? id,
  }) => MemberAnswerRecord(
    id: id ?? 'ans-$personId-$questionId',
    organizationId: Ids.org,
    roundTableId: Ids.table,
    sessionId: Ids.session,
    personId: personId,
    valueId: Ids.value4,
    questionId: questionId,
    answerText: text,
  );
}
