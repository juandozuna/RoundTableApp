/// PostgREST table names read by `TableReadsClient` (AGENTS §16).
abstract final class PostgrestTables {
  static const String curriculumModules = 'curriculum_modules';
  static const String curriculumValues = 'curriculum_values';
  static const String valueQuestions = 'value_questions';
  static const String contentLocales = 'content_locales';
  static const String curriculumTranslations = 'curriculum_translations';
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
}

/// Column names used as filter, order and select keys.
abstract final class PostgrestColumns {
  static const String id = 'id';
  static const String organizationId = 'organization_id';
  static const String locationId = 'location_id';
  static const String roundTableId = 'round_table_id';
  static const String sessionId = 'session_id';
  static const String personId = 'person_id';
  static const String authUserId = 'auth_user_id';
  static const String valueId = 'value_id';
  static const String moduleId = 'module_id';
  static const String questionId = 'question_id';
  static const String followUpSessionId = 'follow_up_session_id';
  static const String status = 'status';
  static const String stage = 'stage';
  static const String role = 'role';
  static const String kind = 'kind';
  static const String code = 'code';
  static const String locale = 'locale';
  static const String entityType = 'entity_type';
  static const String entityId = 'entity_id';
  static const String isDefault = 'is_default';
  static const String number = 'number';
  static const String sequence = 'sequence';
  static const String sortOrder = 'sort_order';
  static const String scheduledAt = 'scheduled_at';
  static const String endedAt = 'ended_at';
  static const String joinedAt = 'joined_at';
  static const String archivedAt = 'archived_at';
  static const String createdAt = 'created_at';
  static const String deviceCreatedAt = 'device_created_at';
  static const String updatedAt = 'updated_at';
  static const String lastName = 'last_name';
  static const String firstName = 'first_name';
}

/// Query-string keys PostgREST reserves next to column filters.
abstract final class PostgrestParams {
  static const String select = 'select';
  static const String order = 'order';
  static const String and = 'and';
  static const String limit = 'limit';
  static const String offset = 'offset';
}
