import 'package:powersync/powersync.dart';

import '../../../../core/sync/data/sync_schema.dart';

/// Names of the replicated tables, shared by the schema, Drift tables and the
/// upload queue reader.
abstract final class SessionTables {
  static const String curriculumModules = 'curriculum_modules';
  static const String curriculumValues = 'curriculum_values';
  static const String valueQuestions = 'value_questions';
  static const String organizations = 'organizations';
  static const String locations = 'locations';
  static const String people = 'people';
  static const String roleAssignments = 'role_assignments';
  static const String roundTables = 'round_tables';
  static const String tableMembers = 'table_members';
  static const String sessions = 'sessions';
  static const String sessionAttendance = 'session_attendance';
  static const String memberAssessments = 'member_assessments';
  static const String memberAnswers = 'member_answers';
  static const String memberCommitments = 'member_commitments';

  /// Tables a person writes during the session (uploaded through
  /// `sync-upload`).
  static const List<String> written = [
    sessions,
    sessionAttendance,
    memberAssessments,
    memberAnswers,
    memberCommitments,
  ];
}

/// Columns shared by every session-domain row (device and server metadata).
const List<Column> _captureColumns = [
  Column.text('organization_id'),
  Column.text('round_table_id'),
  Column.text('device_created_at'),
  Column.text('device_modified_at'),
  Column.text('received_at'),
  Column.integer('synced_late'),
  Column.text('archived_at'),
  Column.text('created_at'),
  Column.text('updated_at'),
];

/// PowerSync tables for everything the sync rules replicate to a device
/// (`powersync/sync-rules.yaml`). The session feature owns the schema; other
/// features read these tables through their own Drift views and must not
/// redeclare them.
class SessionSyncSchema implements SyncSchemaContribution {
  const SessionSyncSchema();

  @override
  List<Table> get tables => const [
    Table(SessionTables.curriculumModules, [
      Column.integer('number'),
      Column.text('name'),
      Column.text('description'),
      Column.integer('value_count'),
      Column.text('status'),
    ]),
    Table(SessionTables.curriculumValues, [
      Column.text('module_id'),
      Column.integer('number_in_module'),
      Column.integer('sequence'),
      Column.text('name'),
      Column.text('description'),
      Column.text('booklet_reference'),
      Column.text('status'),
    ]),
    Table(SessionTables.valueQuestions, [
      Column.text('value_id'),
      Column.text('question_code'),
      Column.text('question_text'),
      Column.integer('sort_order'),
      Column.text('response_type'),
      Column.text('status'),
    ]),
    Table(SessionTables.organizations, [
      Column.text('name'),
      Column.text('kind'),
      Column.text('country_code'),
      Column.text('country_name'),
      Column.text('region'),
      Column.text('status'),
    ]),
    Table(SessionTables.locations, [
      Column.text('organization_id'),
      Column.text('name'),
      Column.text('city'),
      Column.text('region'),
      Column.text('status'),
    ]),
    Table(SessionTables.people, [
      Column.text('organization_id'),
      Column.text('first_name'),
      Column.text('last_name'),
      Column.text('position'),
      Column.text('email'),
      Column.text('phone'),
      Column.text('status'),
    ]),
    Table(SessionTables.roleAssignments, [
      Column.text('person_id'),
      Column.text('role'),
      Column.text('organization_id'),
      Column.text('location_id'),
      Column.text('status'),
    ]),
    Table(SessionTables.roundTables, [
      Column.text('organization_id'),
      Column.text('location_id'),
      Column.text('name'),
      Column.text('code'),
      Column.integer('weekday'),
      Column.text('start_time'),
      Column.text('timezone'),
      Column.integer('duration_minutes'),
      Column.text('status'),
      Column.text('current_value_id'),
    ]),
    Table(SessionTables.tableMembers, [
      Column.text('organization_id'),
      Column.text('round_table_id'),
      Column.text('person_id'),
      Column.text('role'),
      Column.text('joined_at'),
      Column.text('left_at'),
      Column.text('left_reason'),
      Column.text('status'),
      Column.text('first_name'),
      Column.text('last_name'),
    ]),
    Table(SessionTables.sessions, [
      Column.text('organization_id'),
      Column.text('round_table_id'),
      Column.text('value_id'),
      Column.text('follow_up_value_id'),
      Column.text('status'),
      Column.text('stage'),
      Column.text('scheduled_at'),
      Column.text('started_at'),
      Column.text('ended_at'),
      Column.text('answers_closed_at'),
      Column.text('cancelled_reason'),
      Column.text('kind'),
      Column.text('original_scheduled_at'),
      Column.text('facilitator_person_id'),
      Column.text('device_modified_at'),
      Column.text('archived_at'),
      Column.text('created_at'),
      Column.text('updated_at'),
    ]),
    Table(SessionTables.sessionAttendance, [
      ..._captureColumns,
      Column.text('session_id'),
      Column.text('person_id'),
      Column.text('status'),
      Column.text('source'),
      Column.text('recorded_by_person_id'),
    ]),
    Table(SessionTables.memberAssessments, [
      ..._captureColumns,
      Column.text('session_id'),
      Column.text('person_id'),
      Column.text('value_id'),
      Column.text('kind'),
      Column.integer('score'),
      Column.text('justification'),
    ]),
    Table(SessionTables.memberAnswers, [
      ..._captureColumns,
      Column.text('session_id'),
      Column.text('person_id'),
      Column.text('value_id'),
      Column.text('question_id'),
      Column.text('answer_text'),
    ]),
    Table(SessionTables.memberCommitments, [
      ..._captureColumns,
      Column.text('session_id'),
      Column.text('person_id'),
      Column.text('value_id'),
      Column.text('action_text'),
      Column.text('measure_text'),
      Column.text('follow_up_session_id'),
      Column.text('follow_up_status'),
      Column.text('follow_up_note'),
      Column.text('follow_up_device_at'),
      Column.text('follow_up_received_at'),
      Column.integer('follow_up_synced_late'),
    ]),
  ];
}
