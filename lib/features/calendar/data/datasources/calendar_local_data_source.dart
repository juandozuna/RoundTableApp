import 'package:injectable/injectable.dart';

import '../../../../core/sync/data/sync_database.dart';
import '../models/upcoming_session_record.dart';

/// Reads a table's upcoming sessions from the synced tables (ADR 0004), so
/// the facilitator's calendar works offline. Raw SQL for the same reason as
/// the home and history data sources: the tables belong to the session
/// feature's schema contribution. Reactive: any sync or local write re-emits.
@lazySingleton
class CalendarLocalDataSource {
  CalendarLocalDataSource(this._database);

  final SyncDatabase _database;

  // Cancelled sessions are listed only while their slot is still ahead and
  // when an administrator cancelled that meeting (a closed table cancels its
  // pending session with a `table_` reason).
  static const String _sql = '''
SELECT s.id, s.round_table_id, s.status, s.scheduled_at, s.kind,
  s.original_scheduled_at, t.name AS table_name, t.timezone, t.location_id,
  l.name AS location_name, f.person_id AS facilitator_id,
  TRIM(COALESCE(f.first_name, '') || ' ' || COALESCE(f.last_name, ''))
    AS facilitator_name
FROM sessions s
JOIN round_tables t ON t.id = s.round_table_id
LEFT JOIN locations l ON l.id = t.location_id
LEFT JOIN table_members f ON f.round_table_id = t.id
  AND f.role = 'facilitator' AND f.status = 'active'
WHERE s.round_table_id = ? AND s.archived_at IS NULL AND t.status = 'active'
  AND (s.status IN ('scheduled', 'open')
    OR (s.status = 'cancelled' AND s.scheduled_at >= ?
      AND SUBSTR(COALESCE(s.cancelled_reason, ''), 1, 6) <> 'table_'))
ORDER BY s.scheduled_at''';

  /// Emits `[]` while the table has not been synced to the device.
  Stream<List<UpcomingSessionRecord>> watchTable(
    String tableId, {
    required DateTime now,
  }) => _database.powerSync
      .watch(_sql, parameters: [tableId, now.toUtc().toIso8601String()])
      .map((rows) => [for (final row in rows) _record(row)]);

  UpcomingSessionRecord _record(Map<String, Object?> row) {
    final facilitator = (row['facilitator_name'] as String?) ?? '';
    return UpcomingSessionRecord(
      id: row['id']! as String,
      roundTableId: row['round_table_id']! as String,
      tableName: row['table_name']! as String,
      status: row['status']! as String,
      scheduledAt: DateTime.parse(row['scheduled_at']! as String).toUtc(),
      timezone: (row['timezone'] as String?) ?? 'UTC',
      isExtraordinary: row['kind'] == 'extraordinary',
      originalScheduledAt: _date(row['original_scheduled_at']),
      locationId: row['location_id'] as String?,
      locationName: row['location_name'] as String?,
      facilitatorId: row['facilitator_id'] as String?,
      facilitatorName: facilitator.isEmpty ? null : facilitator,
    );
  }

  static DateTime? _date(Object? raw) =>
      raw is String ? DateTime.tryParse(raw)?.toUtc() : null;
}
