import 'package:drift/drift.dart';

// Drift views onto the PowerSync tables declared in `SessionSyncSchema`.
// Table names must be string literals for the Drift generator and equal
// `SessionTables` / `CoreSyncTables`. Drift never creates them (PowerSyncDriftMigration). Every column is
// nullable because PowerSync views are untyped; keep the columns in step
// with the schema (a test compares both).
// Timestamps stay as ISO-8601 text and are parsed by the mappers, so a
// differently formatted server value cannot break a query.

mixin _PowerSyncId on Table {
  TextColumn get id => text()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

@DataClassName('ValueRow')
class CurriculumValues extends Table with _PowerSyncId {
  @override
  String get tableName => 'curriculum_values';

  TextColumn get moduleId => text().nullable()();
  IntColumn get numberInModule => integer().nullable()();
  IntColumn get sequence => integer().nullable()();
  TextColumn get name => text().nullable()();
  TextColumn get description => text().nullable()();
  TextColumn get bookletReference => text().nullable()();
  TextColumn get status => text().nullable()();
}

@DataClassName('QuestionRow')
class ValueQuestions extends Table with _PowerSyncId {
  @override
  String get tableName => 'value_questions';

  TextColumn get valueId => text().nullable()();
  TextColumn get questionCode => text().nullable()();
  TextColumn get questionText => text().nullable()();
  IntColumn get sortOrder => integer().nullable()();
  TextColumn get responseType => text().nullable()();
  TextColumn get status => text().nullable()();
}

@DataClassName('OrganizationRow')
class Organizations extends Table with _PowerSyncId {
  @override
  String get tableName => 'organizations';

  TextColumn get name => text().nullable()();
  TextColumn get kind => text().nullable()();
  TextColumn get countryCode => text().nullable()();
  TextColumn get countryName => text().nullable()();
  TextColumn get region => text().nullable()();
  TextColumn get status => text().nullable()();
}

@DataClassName('PersonRow')
class People extends Table with _PowerSyncId {
  @override
  String get tableName => 'people';

  TextColumn get organizationId => text().nullable()();
  TextColumn get firstName => text().nullable()();
  TextColumn get lastName => text().nullable()();
  TextColumn get position => text().nullable()();
  TextColumn get email => text().nullable()();
  TextColumn get phone => text().nullable()();
  TextColumn get status => text().nullable()();
}

@DataClassName('RoundTableRow')
class RoundTables extends Table with _PowerSyncId {
  @override
  String get tableName => 'round_tables';

  TextColumn get organizationId => text().nullable()();
  TextColumn get locationId => text().nullable()();
  TextColumn get name => text().nullable()();
  TextColumn get code => text().nullable()();
  IntColumn get weekday => integer().nullable()();
  TextColumn get startTime => text().nullable()();
  TextColumn get timezone => text().nullable()();
  IntColumn get durationMinutes => integer().nullable()();
  TextColumn get status => text().nullable()();
  TextColumn get currentValueId => text().nullable()();
}

@DataClassName('TableMemberRow')
class TableMembers extends Table with _PowerSyncId {
  @override
  String get tableName => 'table_members';

  TextColumn get organizationId => text().nullable()();
  TextColumn get roundTableId => text().nullable()();
  TextColumn get personId => text().nullable()();
  TextColumn get role => text().nullable()();
  TextColumn get joinedAt => text().nullable()();
  TextColumn get leftAt => text().nullable()();
  TextColumn get leftReason => text().nullable()();
  TextColumn get status => text().nullable()();
  TextColumn get firstName => text().nullable()();
  TextColumn get lastName => text().nullable()();
}

@DataClassName('SessionRow')
class Sessions extends Table with _PowerSyncId {
  @override
  String get tableName => 'sessions';

  TextColumn get organizationId => text().nullable()();
  TextColumn get roundTableId => text().nullable()();
  TextColumn get valueId => text().nullable()();
  TextColumn get followUpValueId => text().nullable()();
  TextColumn get status => text().nullable()();
  TextColumn get stage => text().nullable()();
  TextColumn get scheduledAt => text().nullable()();
  TextColumn get startedAt => text().nullable()();
  TextColumn get endedAt => text().nullable()();
  TextColumn get answersClosedAt => text().nullable()();
  TextColumn get cancelledReason => text().nullable()();

  /// `complete` or `incomplete`, set by the server when the session closes
  /// (RF-50); `incomplete_reason` says why.
  TextColumn get completion => text().nullable()();
  TextColumn get incompleteReason => text().nullable()();

  /// `regular` or `extraordinary` (RF-30).
  TextColumn get kind => text().nullable()();

  /// Regular slot a rescheduled session moved from.
  TextColumn get originalScheduledAt => text().nullable()();
  TextColumn get facilitatorPersonId => text().nullable()();
  TextColumn get deviceModifiedAt => text().nullable()();
  TextColumn get archivedAt => text().nullable()();
  TextColumn get createdAt => text().nullable()();
  TextColumn get updatedAt => text().nullable()();
}

mixin _CaptureColumns on Table {
  TextColumn get organizationId => text().nullable()();
  TextColumn get roundTableId => text().nullable()();
  TextColumn get sessionId => text().nullable()();
  TextColumn get personId => text().nullable()();
  TextColumn get deviceCreatedAt => text().nullable()();
  TextColumn get deviceModifiedAt => text().nullable()();
  TextColumn get receivedAt => text().nullable()();
  BoolColumn get syncedLate => boolean().nullable()();
  TextColumn get archivedAt => text().nullable()();
  TextColumn get createdAt => text().nullable()();
  TextColumn get updatedAt => text().nullable()();
}

@DataClassName('AttendanceRow')
class SessionAttendance extends Table with _PowerSyncId, _CaptureColumns {
  @override
  String get tableName => 'session_attendance';

  TextColumn get status => text().nullable()();
  TextColumn get source => text().nullable()();
  TextColumn get recordedByPersonId => text().nullable()();
}

@DataClassName('AssessmentRow')
class MemberAssessments extends Table with _PowerSyncId, _CaptureColumns {
  @override
  String get tableName => 'member_assessments';

  TextColumn get valueId => text().nullable()();
  TextColumn get kind => text().nullable()();
  IntColumn get score => integer().nullable()();
  TextColumn get justification => text().nullable()();
}

@DataClassName('AnswerRow')
class MemberAnswers extends Table with _PowerSyncId, _CaptureColumns {
  @override
  String get tableName => 'member_answers';

  TextColumn get valueId => text().nullable()();
  TextColumn get questionId => text().nullable()();
  TextColumn get answerText => text().nullable()();

  /// The person picked for a `person` question (RF-54); `answerText` keeps
  /// their name. Null for free text.
  TextColumn get answerPersonId => text().nullable()();
}

@DataClassName('CommitmentRow')
class MemberCommitments extends Table with _PowerSyncId, _CaptureColumns {
  @override
  String get tableName => 'member_commitments';

  TextColumn get valueId => text().nullable()();
  TextColumn get actionText => text().nullable()();
  TextColumn get measureText => text().nullable()();
  TextColumn get followUpSessionId => text().nullable()();
  TextColumn get followUpStatus => text().nullable()();
  TextColumn get followUpNote => text().nullable()();
  TextColumn get followUpDeviceAt => text().nullable()();
  TextColumn get followUpReceivedAt => text().nullable()();
  BoolColumn get followUpSyncedLate => boolean().nullable()();
}

@DataClassName('UploadRejectionRow')
class SyncUploadRejections extends Table with _PowerSyncId {
  @override
  String get tableName => 'sync_upload_rejections';

  TextColumn get tableNameValue => text().named('table_name').nullable()();
  TextColumn get rowId => text().nullable()();
  TextColumn get code => text().nullable()();
  TextColumn get message => text().nullable()();
  TextColumn get rejectedAt => text().nullable()();
}
