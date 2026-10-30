import 'postgrest_names.dart';

/// Builds PostgREST filter values (the right-hand side of `?column=op.value`)
/// so callers never hand-build strings. A filter set is a
/// `Map<String, dynamic>` keyed by column name; combine it with
/// [PostgrestQuery.of] for `select`, `order` and `limit`.
///
/// ```dart
/// PostgrestQuery.of(
///   filters: {
///     PostgrestColumns.roundTableId: PostgrestFilter.eq(tableId),
///     PostgrestColumns.archivedAt: PostgrestFilter.isNull(),
///   },
///   order: [PostgrestOrder.desc(PostgrestColumns.scheduledAt)],
/// );
/// ```
///
/// One map key holds one filter, so two filters on the same column (a range)
/// need [and] or a manual `and=(...)` entry.
abstract final class PostgrestFilter {
  static String eq(Object value) => 'eq.${_scalar(value)}';
  static String neq(Object value) => 'neq.${_scalar(value)}';
  static String gt(Object value) => 'gt.${_scalar(value)}';
  static String gte(Object value) => 'gte.${_scalar(value)}';
  static String lt(Object value) => 'lt.${_scalar(value)}';
  static String lte(Object value) => 'lte.${_scalar(value)}';

  /// `in.(a,b,c)`. An empty list matches nothing.
  static String inList(Iterable<Object> values) =>
      'in.(${values.map(_listItem).join(',')})';

  static String isNull() => 'is.null';
  static String isNotNull() => 'not.is.null';

  /// Instant in UTC ISO-8601, the form PostgREST compares `timestamptz` with.
  static String instant(DateTime value) => value.toUtc().toIso8601String();

  /// Value of the `and` parameter combining `(column, filter)` pairs, which
  /// allows several filters on one column, e.g. a range:
  /// `{PostgrestParams.and: PostgrestFilter.and([(col, gte(a)), (col, lt(b))])}`.
  static String and(Iterable<(String column, String filter)> conditions) =>
      '(${conditions.map((c) => '${c.$1}.${c.$2}').join(',')})';

  static String _scalar(Object value) => value is DateTime
      ? instant(value)
      : value is bool
      ? '$value'
      : _quoteIfNeeded('$value', const ['(', ')', ',', ' ']);

  static String _listItem(Object value) => _quoteIfNeeded(
    value is DateTime ? instant(value) : '$value',
    const ['(', ')', ',', '"', ' '],
  );

  static String _quoteIfNeeded(String text, List<String> special) {
    if (!special.any(text.contains)) return text;
    final escaped = text.replaceAll(r'\', r'\\').replaceAll('"', r'\"');
    return '"$escaped"';
  }
}

/// One `order` term: `column.asc` / `column.desc`.
class PostgrestOrder {
  const PostgrestOrder._(this._term);

  factory PostgrestOrder.asc(String column) => PostgrestOrder._('$column.asc');
  factory PostgrestOrder.desc(String column) =>
      PostgrestOrder._('$column.desc');

  final String _term;

  @override
  String toString() => _term;
}

/// Assembles the `@Queries()` map of a `TableReadsClient` call.
abstract final class PostgrestQuery {
  /// [filters] maps column to a [PostgrestFilter] value; [select] defaults to
  /// every column (`*`) and may embed (`*,round_tables(name)`).
  static Map<String, dynamic> of({
    Map<String, String> filters = const {},
    String? select,
    List<PostgrestOrder> order = const [],
    int? limit,
    int? offset,
  }) => {
    ...filters,
    if (select != null) PostgrestParams.select: select,
    if (order.isNotEmpty) PostgrestParams.order: order.join(','),
    if (limit != null) PostgrestParams.limit: '$limit',
    if (offset != null) PostgrestParams.offset: '$offset',
  };
}
