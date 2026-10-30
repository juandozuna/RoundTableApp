import 'package:injectable/injectable.dart';

import '../../../../core/models/assessment_kind.dart';
import '../../../../core/models/attendance_status.dart';
import '../../../../core/models/commitment_follow_up_status.dart';
import '../../../../core/models/session_status.dart';
import '../../../../core/sync/data/content_text_sql.dart';
import '../../../../core/sync/data/sync_database.dart';
import '../../../../core/sync/data/sync_schema.dart';
import '../../domain/models/history_snapshot.dart';

/// Reads a table's history from the synced tables (ADR 0004), so it works
/// offline. The tables belong to the session feature's schema contribution;
/// raw SQL here avoids declaring a second typed view of them (the home
/// feature does the same). Rows the user may not see never reach the device
/// (sync rules), so no extra filtering by role is needed.
@lazySingleton
class HistoryLocalDataSource {
  HistoryLocalDataSource(this._database);

  final SyncDatabase _database;

  static const List<String> _watched = [
    'curriculum_modules',
    'curriculum_values',
    'curriculum_translations',
    CoreSyncTables.localSyncState,
    'round_tables',
    'table_members',
    'sessions',
    'session_attendance',
    'member_assessments',
    'member_commitments',
  ];

  /// Emits now and after each sync or local write that touches the history.
  Stream<HistorySnapshot> watchSnapshot(String tableId) async* {
    yield await _load(tableId);
    yield* _database.powerSync
        .onChange(_watched, throttle: const Duration(milliseconds: 100))
        .asyncMap((_) => _load(tableId));
  }

  Future<HistorySnapshot> _load(String tableId) async {
    final db = _database.powerSync;
    final table = await db.getOptional(
      'SELECT name FROM round_tables WHERE id = ?',
      [tableId],
    );
    final values = await db.getAll(
      '''
SELECT v.id, v.sequence, ${ContentTextSql.name('value', 'v')} AS name,
  m.number AS module_number, ${ContentTextSql.name('module', 'm')} AS module_name
FROM curriculum_values v LEFT JOIN curriculum_modules m ON m.id = v.module_id''',
    );
    final sessions = await db.getAll(
      'SELECT id, status, value_id, follow_up_value_id, scheduled_at '
      'FROM sessions WHERE round_table_id = ?',
      [tableId],
    );
    final roster = await db.getAll(
      "SELECT person_id, role, status, TRIM(COALESCE(first_name, '') || ' ' "
      "|| COALESCE(last_name, '')) AS name FROM table_members "
      'WHERE round_table_id = ?',
      [tableId],
    );
    final attendance = await db.getAll(
      'SELECT session_id, person_id, status, synced_late '
      'FROM session_attendance WHERE round_table_id = ?',
      [tableId],
    );
    final assessments = await db.getAll(
      'SELECT session_id, person_id, value_id, kind, score, justification, '
      'synced_late FROM member_assessments WHERE round_table_id = ?',
      [tableId],
    );
    final commitments = await db.getAll(
      'SELECT session_id, person_id, value_id, action_text, measure_text, '
      'follow_up_session_id, follow_up_status, follow_up_note, synced_late, '
      'follow_up_synced_late FROM member_commitments WHERE round_table_id = ?',
      [tableId],
    );

    return HistorySnapshot(
      tableId: tableId,
      tableName: (table?['name'] as String?) ?? '',
      values: _valuesOf(values),
      sessions: [for (final row in sessions) ?_sessionOf(row)],
      roster: _rosterOf(roster),
      attendance: [
        for (final row in attendance)
          if (row['session_id'] != null && row['person_id'] != null)
            HistoryAttendance(
              sessionId: row['session_id']! as String,
              personId: row['person_id']! as String,
              status: AttendanceStatus.tryParse(row['status'] as String?),
              syncedLate: _flag(row['synced_late']),
            ),
      ],
      assessments: [for (final row in assessments) ?_assessmentOf(row)],
      commitments: [for (final row in commitments) ?_commitmentOf(row)],
    );
  }

  static Map<String, HistoryValue> _valuesOf(List<Map<String, Object?>> rows) {
    final values = <String, HistoryValue>{};
    for (final row in rows) {
      final value = _valueOf(row);
      if (value != null) values[value.id] = value;
    }
    return values;
  }

  static HistoryValue? _valueOf(Map<String, Object?> row) {
    final id = row['id'] as String?;
    final name = row['name'] as String?;
    if (id == null || name == null) return null;
    return HistoryValue(
      id: id,
      sequence: (row['sequence'] as num?)?.toInt() ?? 0,
      name: name,
      moduleNumber: (row['module_number'] as num?)?.toInt(),
      moduleName: row['module_name'] as String?,
    );
  }

  static HistorySession? _sessionOf(Map<String, Object?> row) {
    final status = SessionStatus.tryParse(row['status'] as String?);
    if (row['id'] == null || status == null) return null;
    return HistorySession(
      id: row['id']! as String,
      status: status,
      valueId: row['value_id'] as String?,
      followUpValueId: row['follow_up_value_id'] as String?,
      scheduledAt: _date(row['scheduled_at']),
    );
  }

  /// One entry per person: an active membership wins over earlier ones.
  static List<HistoryRosterEntry> _rosterOf(List<Map<String, Object?>> rows) {
    final byPerson = <String, HistoryRosterEntry>{};
    for (final row in rows) {
      final personId = row['person_id'] as String?;
      if (personId == null) continue;
      final entry = HistoryRosterEntry(
        personId: personId,
        name: (row['name'] as String?) ?? '',
        isFacilitator: row['role'] == 'facilitator',
        isActive: row['status'] == 'active',
      );
      final previous = byPerson[personId];
      if (previous == null || (entry.isActive && !previous.isActive)) {
        byPerson[personId] = entry;
      }
    }
    return byPerson.values.toList()..sort((a, b) => a.name.compareTo(b.name));
  }

  static HistoryAssessment? _assessmentOf(Map<String, Object?> row) {
    final kind = AssessmentKind.tryParse(row['kind'] as String?);
    final score = (row['score'] as num?)?.toInt();
    if (kind == null ||
        score == null ||
        row['session_id'] == null ||
        row['person_id'] == null ||
        row['value_id'] == null) {
      return null;
    }
    return HistoryAssessment(
      sessionId: row['session_id']! as String,
      personId: row['person_id']! as String,
      valueId: row['value_id']! as String,
      kind: kind,
      score: score,
      justification: row['justification'] as String?,
      syncedLate: _flag(row['synced_late']),
    );
  }

  static HistoryCommitment? _commitmentOf(Map<String, Object?> row) {
    if (row['session_id'] == null ||
        row['person_id'] == null ||
        row['value_id'] == null ||
        row['action_text'] == null) {
      return null;
    }
    return HistoryCommitment(
      sessionId: row['session_id']! as String,
      personId: row['person_id']! as String,
      valueId: row['value_id']! as String,
      actionText: row['action_text']! as String,
      measureText: row['measure_text'] as String?,
      followUpSessionId: row['follow_up_session_id'] as String?,
      followUpStatus: CommitmentFollowUpStatus.tryParse(
        row['follow_up_status'] as String?,
      ),
      followUpNote: row['follow_up_note'] as String?,
      syncedLate: _flag(row['synced_late']),
      followUpSyncedLate: _flag(row['follow_up_synced_late']),
    );
  }

  static bool _flag(Object? raw) => raw is num && raw != 0;

  static DateTime? _date(Object? raw) =>
      raw is String ? DateTime.tryParse(raw)?.toUtc() : null;
}
