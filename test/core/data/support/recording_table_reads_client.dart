import 'package:dio/dio.dart';
import 'package:gold_roundtables/core/data/records/records.dart';
import 'package:gold_roundtables/core/network/postgrest/postgrest.dart';

/// One call of the fake client: the table and the query map it was sent.
class TableRead {
  const TableRead(this.table, this.query);

  final String table;
  final Map<String, dynamic> query;

  /// The filter sent for [column], e.g. `eq.table-1`.
  String? filter(String column) => query[column] as String?;
}

/// In-memory [TableReadsClient]: returns the rows seeded per table (honoring
/// `limit` and `offset`, so paging can be exercised) and records every query
/// so tests can assert what was asked of PostgREST.
class RecordingTableReadsClient implements TableReadsClient {
  final Map<String, List<Object>> _rows = {};
  final List<TableRead> reads = [];

  /// Thrown by every read while set, as Dio would on a failed request.
  DioException? failure;

  void seed(String table, List<Object> rows) => _rows[table] = rows;

  List<TableRead> readsOf(String table) => [
    for (final read in reads)
      if (read.table == table) read,
  ];

  void failOffline() => failure = DioException(
    requestOptions: RequestOptions(),
    type: DioExceptionType.connectionError,
  );

  Future<List<T>> _read<T>(String table, Map<String, dynamic> query) async {
    reads.add(TableRead(table, query));
    final error = failure;
    if (error != null) throw error;
    final rows = (_rows[table] ?? const <Object>[]).cast<T>();
    final offset = int.tryParse('${query[PostgrestParams.offset] ?? 0}') ?? 0;
    final limit = int.tryParse('${query[PostgrestParams.limit] ?? ''}');
    final page = rows.skip(offset);
    return (limit == null ? page : page.take(limit)).toList();
  }

  @override
  Future<List<CurriculumModuleRecord>> curriculumModules(
    Map<String, dynamic> query,
  ) => _read(PostgrestTables.curriculumModules, query);

  @override
  Future<List<CurriculumValueRecord>> curriculumValues(
    Map<String, dynamic> query,
  ) => _read(PostgrestTables.curriculumValues, query);

  @override
  Future<List<ValueQuestionRecord>> valueQuestions(
    Map<String, dynamic> query,
  ) => _read(PostgrestTables.valueQuestions, query);

  @override
  Future<List<ContentLocaleRecord>> contentLocales(
    Map<String, dynamic> query,
  ) => _read(PostgrestTables.contentLocales, query);

  @override
  Future<List<CurriculumTranslationRecord>> curriculumTranslations(
    Map<String, dynamic> query,
  ) => _read(PostgrestTables.curriculumTranslations, query);

  @override
  Future<List<OrganizationRecord>> organizations(Map<String, dynamic> query) =>
      _read(PostgrestTables.organizations, query);

  @override
  Future<List<LocationRecord>> locations(Map<String, dynamic> query) =>
      _read(PostgrestTables.locations, query);

  @override
  Future<List<PersonRecord>> people(Map<String, dynamic> query) =>
      _read(PostgrestTables.people, query);

  @override
  Future<List<RoleAssignmentRecord>> roleAssignments(
    Map<String, dynamic> query,
  ) => _read(PostgrestTables.roleAssignments, query);

  @override
  Future<List<RoundTableRecord>> roundTables(Map<String, dynamic> query) =>
      _read(PostgrestTables.roundTables, query);

  @override
  Future<List<TableMemberRecord>> tableMembers(Map<String, dynamic> query) =>
      _read(PostgrestTables.tableMembers, query);

  @override
  Future<List<SessionRecord>> sessions(Map<String, dynamic> query) =>
      _read(PostgrestTables.sessions, query);

  @override
  Future<List<SessionAttendanceRecord>> sessionAttendance(
    Map<String, dynamic> query,
  ) => _read(PostgrestTables.sessionAttendance, query);

  @override
  Future<List<MemberAssessmentRecord>> memberAssessments(
    Map<String, dynamic> query,
  ) => _read(PostgrestTables.memberAssessments, query);

  @override
  Future<List<MemberAnswerRecord>> memberAnswers(Map<String, dynamic> query) =>
      _read(PostgrestTables.memberAnswers, query);

  @override
  Future<List<MemberCommitmentRecord>> memberCommitments(
    Map<String, dynamic> query,
  ) => _read(PostgrestTables.memberCommitments, query);
}
