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
/// `eq.`, `neq.`, `in.(…)`, `is.null`, `not.is.null` and `gt/gte/lt/lte.`
/// column filters like PostgREST, `order` (nulls first on `desc`, last on
/// `asc`) and `limit` and `offset`, so paging can be exercised) and records
/// every query so tests can assert what was asked of PostgREST.
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
    final matching = (_rows[table] ?? const <Object>[])
        .where((row) => _matches(row, query))
        .toList();
    final rows = _ordered(matching, query[PostgrestParams.order]).cast<T>();
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

  /// Applies the column filters to a record's JSON. `eq.` and `in.(…)` skip
  /// columns the record does not model; the other operators read an absent
  /// JSON key as SQL null (records omit nulls). Unknown operators are not
  /// evaluated (the query is still recorded for asserts).
  static bool _matches(Object row, Map<String, dynamic> query) {
    final json = _json(row);
    for (final MapEntry(:key, :value) in query.entries) {
      if (value is! String) continue;
      final actual = json[key];
      final text = '$actual';
      if (value == 'is.null') {
        if (actual != null) return false;
      } else if (value == 'not.is.null') {
        if (actual == null) return false;
      } else if (value.startsWith('eq.')) {
        if (json.containsKey(key) && text != value.substring(3)) return false;
      } else if (value.startsWith('in.(') && value.endsWith(')')) {
        final allowed = value.substring(4, value.length - 1).split(',');
        if (json.containsKey(key) && !allowed.contains(text)) return false;
      } else if (value.startsWith('neq.')) {
        if (actual == null || text == value.substring(4)) return false;
      } else if (_isRange(value)) {
        if (actual == null || !_inRange(actual, value)) return false;
      }
    }
    return true;
  }

  static const _rangeOperators = ['gte.', 'gt.', 'lte.', 'lt.'];

  static bool _isRange(String value) => _rangeOperators.any(value.startsWith);

  static bool _inRange(Object actual, String filter) {
    final operator = _rangeOperators.firstWhere(filter.startsWith);
    final bound = filter.substring(operator.length);
    final order = _compare(actual, bound);
    return switch (operator) {
      'gte.' => order >= 0,
      'gt.' => order > 0,
      'lte.' => order <= 0,
      _ => order < 0,
    };
  }

  /// Numbers compare numerically, ISO timestamps chronologically (so
  /// `…:00Z` and `….000Z` are equal), anything else as text.
  static int _compare(Object a, Object b) {
    final left = '$a';
    final right = '$b';
    final leftNum = num.tryParse(left);
    final rightNum = num.tryParse(right);
    if (leftNum != null && rightNum != null) return leftNum.compareTo(rightNum);
    final leftTime = DateTime.tryParse(left);
    final rightTime = DateTime.tryParse(right);
    if (leftTime != null && rightTime != null) {
      return leftTime.compareTo(rightTime);
    }
    return left.compareTo(right);
  }

  /// Sorts by the `order` terms (`column.asc|desc`, comma separated); the
  /// sort is stable so rows equal on every term keep their seeded order.
  static List<Object> _ordered(List<Object> rows, Object? order) {
    if (order is! String || order.isEmpty) return rows;
    final terms = [
      for (final term in order.split(','))
        (
          column: term.substring(0, term.lastIndexOf('.')),
          descending: term.endsWith('.desc'),
        ),
    ];
    // List.sort is not stable: tie-break on the seeded position.
    final indexed = [
      for (var i = 0; i < rows.length; i++) (i, rows[i], _json(rows[i])),
    ];
    indexed.sort((a, b) {
      for (final term in terms) {
        final left = a.$3[term.column];
        final right = b.$3[term.column];
        // Postgres: nulls are the largest value (last on asc, first on desc).
        final result = left == null || right == null
            ? (left == null ? 1 : 0) - (right == null ? 1 : 0)
            : _compare(left, right);
        if (result != 0) return term.descending ? -result : result;
      }
      return a.$1.compareTo(b.$1);
    });
    return [for (final (_, row, _) in indexed) row];
  }

  static Map<String, dynamic> _json(Object row) =>
      (row as dynamic).toJson() as Map<String, dynamic>;
}
