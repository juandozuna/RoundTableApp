import '../models/member_history.dart';
import '../models/table_history.dart';

/// Progress and history of a table, read from the server while online
/// (ADR 0019). Only the last 8 weeks are shown; older sessions are archived
/// (ADR 0005).
abstract interface class HistoryService {
  /// One person's history at [tableId]; re-emits when the server data changes.
  Stream<MemberHistory> watchMemberHistory({
    required String tableId,
    required String personId,
  });

  /// Everyone's history at [tableId], for the table's facilitator.
  Stream<TableHistory> watchTableHistory(String tableId);
}
