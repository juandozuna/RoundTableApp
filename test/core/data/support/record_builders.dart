import 'package:gold_roundtables/core/data/records/records.dart';
import 'package:gold_roundtables/core/models/assessment_kind.dart';
import 'package:gold_roundtables/core/models/attendance_status.dart';
import 'package:gold_roundtables/core/models/commitment_follow_up_status.dart';
import 'package:gold_roundtables/core/models/session_stage.dart';
import 'package:gold_roundtables/core/models/session_status.dart';
import 'package:gold_roundtables/core/models/user_role.dart';

/// Compact builders for the server records the online readers consume.
abstract final class RecordBuilders {
  static const String org = 'org-1';

  static RoundTableRecord table({
    String id = 'table-1',
    String name = 'Mesa Esperanza 03',
    String locationId = 'loc-1',
    String status = 'active',
    String timezone = 'America/Santo_Domingo',
  }) => RoundTableRecord(
    id: id,
    organizationId: org,
    locationId: locationId,
    name: name,
    code: 'ESP-03',
    weekday: 4,
    startTime: '19:00:00',
    timezone: timezone,
    durationMinutes: 90,
    status: status,
  );

  static LocationRecord location({
    String id = 'loc-1',
    String name = 'Sede Central',
  }) =>
      LocationRecord(id: id, organizationId: org, name: name, status: 'active');

  static TableMemberRecord member(
    String personId, {
    String first = '',
    String last = '',
    UserRole role = UserRole.member,
    String status = 'active',
    String tableId = 'table-1',
  }) => TableMemberRecord(
    id: 'tm-$personId-$tableId',
    organizationId: org,
    roundTableId: tableId,
    personId: personId,
    role: role,
    joinedAt: DateTime.utc(2026, 1, 1),
    status: status,
    firstName: first,
    lastName: last,
  );

  static SessionRecord session(
    String id, {
    SessionStatus status = SessionStatus.closed,
    required DateTime at,
    String tableId = 'table-1',
    String valueId = 'v3',
    String? followUpValueId,
    DateTime? endedAt,
    String? completion,
    String? cancelledReason,
    String kind = 'regular',
    DateTime? originalAt,
  }) => SessionRecord(
    id: id,
    organizationId: org,
    roundTableId: tableId,
    valueId: valueId,
    followUpValueId: followUpValueId,
    status: status,
    stage: status == SessionStatus.closed
        ? SessionStage.closed
        : SessionStage.lobby,
    scheduledAt: at,
    endedAt: endedAt,
    completion: completion,
    cancelledReason: cancelledReason,
    kind: kind,
    originalScheduledAt: originalAt,
  );

  static SessionAttendanceRecord attendance(
    String sessionId,
    String personId, {
    AttendanceStatus status = AttendanceStatus.present,
    bool syncedLate = false,
  }) => SessionAttendanceRecord(
    id: 'att-$sessionId-$personId',
    organizationId: org,
    roundTableId: 'table-1',
    sessionId: sessionId,
    personId: personId,
    status: status,
    source: 'facilitator',
    syncedLate: syncedLate,
  );

  static MemberAssessmentRecord assessment(
    String sessionId,
    String personId,
    String valueId,
    int score, {
    AssessmentKind kind = AssessmentKind.initial,
    String? justification,
  }) => MemberAssessmentRecord(
    id: 'as-$sessionId-$personId-${kind.wireValue}',
    organizationId: org,
    roundTableId: 'table-1',
    sessionId: sessionId,
    personId: personId,
    valueId: valueId,
    kind: kind,
    score: score,
    justification: justification,
  );

  static MemberCommitmentRecord commitment(
    String sessionId,
    String personId,
    String valueId, {
    String action = 'Hablar con ella',
    String? measure,
    CommitmentFollowUpStatus? status,
    DateTime? createdAt,
  }) => MemberCommitmentRecord(
    id: 'cm-$sessionId-$personId',
    organizationId: org,
    roundTableId: 'table-1',
    sessionId: sessionId,
    personId: personId,
    valueId: valueId,
    actionText: action,
    measureText: measure,
    followUpStatus: status,
    deviceCreatedAt: createdAt,
  );

  static CurriculumModuleRecord module({
    String id = 'module-1',
    int number = 1,
    String name = 'Carácter',
    int valueCount = 2,
  }) => CurriculumModuleRecord(
    id: id,
    number: number,
    name: name,
    valueCount: valueCount,
    status: 'active',
  );

  static CurriculumValueRecord value(
    String id, {
    required int sequence,
    required String name,
    String moduleId = 'module-1',
  }) => CurriculumValueRecord(
    id: id,
    moduleId: moduleId,
    numberInModule: sequence,
    sequence: sequence,
    name: name,
    status: 'active',
  );

  static CurriculumTranslationRecord translation(
    String entityType,
    String entityId,
    String name, {
    String locale = 'en',
  }) => CurriculumTranslationRecord(
    id: 'tr-$entityType-$entityId-$locale',
    locale: locale,
    entityType: entityType,
    entityId: entityId,
    name: name,
  );
}
