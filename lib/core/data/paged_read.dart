import '../network/api_guard.dart';
import '../network/postgrest/postgrest.dart';

/// PostgREST answers at most this many rows per request. Keep it equal to
/// `max_rows` in `supabase/config.toml` (the hosted project's API setting
/// too); a longer list needs several pages.
const int postgrestPageSize = 1000;

/// Reads every row of a list that can outgrow one response: [read] receives
/// the query to send (the [filters] and [order] plus `limit`/`offset`) and
/// pages are requested until one comes back short. [order] must be a total
/// order, or rows can repeat or go missing between pages.
Future<List<T>> readAllPages<T>(
  Future<List<T>> Function(Map<String, dynamic> query) read, {
  Map<String, String> filters = const {},
  List<PostgrestOrder> order = const [],
  int pageSize = postgrestPageSize,
}) async {
  final rows = <T>[];
  for (var offset = 0; ; offset += pageSize) {
    final page = await guardApiCall(
      () => read(
        PostgrestQuery.of(
          filters: filters,
          order: order,
          limit: pageSize,
          offset: offset,
        ),
      ),
    );
    rows.addAll(page);
    if (page.length < pageSize) return rows;
  }
}
