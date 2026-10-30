import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../constants/api_constants.dart';
import '../../data/records/records.dart';

part 'table_reads_client.g.dart';

/// One GET per server table the app reads, through PostgREST under the
/// caller's RLS (ADR 0008). Each call takes the query map built by
/// `PostgrestQuery.of` (filters such as `eq.`/`in.(...)`/`is.null`, `select`,
/// `order`, `limit`).
///
/// RLS is broader than the old PowerSync scopes (coordinators and
/// administrators can read whole organizations), so callers MUST filter by
/// the table, person or organization they mean. PostgREST caps a response at
/// the project's max-rows (1000 by default); page with `limit`/`offset` where a
/// result can grow.
///
/// Records carry the columns the old PowerSync schema replicated; extra server
/// columns in a `select=*` response are ignored. Narrowing `select` is fine
/// only while every required record field stays selected.
@lazySingleton
@RestApi()
abstract class TableReadsClient {
  @factoryMethod
  factory TableReadsClient(@Named(DioNames.postgrest) Dio dio) =
      _TableReadsClient;

  @GET('/curriculum_modules')
  Future<List<CurriculumModuleRecord>> curriculumModules(
    @Queries() Map<String, dynamic> query,
  );

  @GET('/curriculum_values')
  Future<List<CurriculumValueRecord>> curriculumValues(
    @Queries() Map<String, dynamic> query,
  );

  @GET('/value_questions')
  Future<List<ValueQuestionRecord>> valueQuestions(
    @Queries() Map<String, dynamic> query,
  );

  @GET('/content_locales')
  Future<List<ContentLocaleRecord>> contentLocales(
    @Queries() Map<String, dynamic> query,
  );

  @GET('/curriculum_translations')
  Future<List<CurriculumTranslationRecord>> curriculumTranslations(
    @Queries() Map<String, dynamic> query,
  );

  @GET('/organizations')
  Future<List<OrganizationRecord>> organizations(
    @Queries() Map<String, dynamic> query,
  );

  @GET('/locations')
  Future<List<LocationRecord>> locations(@Queries() Map<String, dynamic> query);

  @GET('/people')
  Future<List<PersonRecord>> people(@Queries() Map<String, dynamic> query);

  @GET('/role_assignments')
  Future<List<RoleAssignmentRecord>> roleAssignments(
    @Queries() Map<String, dynamic> query,
  );

  @GET('/round_tables')
  Future<List<RoundTableRecord>> roundTables(
    @Queries() Map<String, dynamic> query,
  );

  /// `first_name`/`last_name`/`auth_user_id` are real columns (denormalized by
  /// trigger), so the roster needs no embedded select.
  @GET('/table_members')
  Future<List<TableMemberRecord>> tableMembers(
    @Queries() Map<String, dynamic> query,
  );

  @GET('/sessions')
  Future<List<SessionRecord>> sessions(@Queries() Map<String, dynamic> query);

  @GET('/session_attendance')
  Future<List<SessionAttendanceRecord>> sessionAttendance(
    @Queries() Map<String, dynamic> query,
  );

  @GET('/member_assessments')
  Future<List<MemberAssessmentRecord>> memberAssessments(
    @Queries() Map<String, dynamic> query,
  );

  @GET('/member_answers')
  Future<List<MemberAnswerRecord>> memberAnswers(
    @Queries() Map<String, dynamic> query,
  );

  @GET('/member_commitments')
  Future<List<MemberCommitmentRecord>> memberCommitments(
    @Queries() Map<String, dynamic> query,
  );
}
