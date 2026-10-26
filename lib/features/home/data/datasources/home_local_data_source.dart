import 'dart:convert';

import 'package:injectable/injectable.dart';

import '../../../../core/sync/data/sync_database.dart';
import '../../domain/models/home_commitment.dart';
import '../../domain/models/home_progress.dart';
import '../models/home_records.dart';

/// Reads the home data from the synced tables (ADR 0004). Queries are
/// reactive: any sync or local write re-emits.
///
/// Uses PowerSync's watch API with SQL instead of a Drift database because
/// the tables are declared by the session feature's schema contribution;
/// declaring a second typed view here would only duplicate it. When those
/// tables are not part of the schema the streams fail and the service falls
/// back to PostgREST.
@lazySingleton
class HomeLocalDataSource {
  HomeLocalDataSource(this._database);

  final SyncDatabase _database;

  static const String _tableSelect = '''
SELECT t.id AS table_id, t.name AS table_name, t.status AS table_status,
  (SELECT COUNT(*) FROM table_members m
     WHERE m.round_table_id = t.id AND m.status = 'active') AS seats,
  (SELECT MAX(COALESCE(c.ended_at, c.scheduled_at)) FROM sessions c
     WHERE c.round_table_id = t.id AND c.status = 'closed') AS last_closed_at,
  s.id AS session_id, s.status AS session_status, s.scheduled_at,
  v.name AS value_name, v.sequence AS value_sequence,
  fv.name AS follow_up_name''';

  static const String _tableFrom = '''
FROM round_tables t
LEFT JOIN sessions s ON s.id = (
  SELECT p.id FROM sessions p
  WHERE p.round_table_id = t.id AND p.status IN ('scheduled', 'open')
  ORDER BY p.scheduled_at LIMIT 1)
LEFT JOIN curriculum_values v ON v.id = s.value_id
LEFT JOIN curriculum_values fv ON fv.id = s.follow_up_value_id''';

  static const String _facilitatorSql =
      '$_tableSelect $_tableFrom WHERE t.id = ?';

  // `people` only holds the signed-in user's own rows (my_identity stream).
  static const String _memberSql =
      '''
SELECT b.*, 
  (SELECT cm.action_text FROM member_commitments cm
     WHERE cm.person_id IN (SELECT id FROM people)
     ORDER BY cm.device_created_at DESC LIMIT 1) AS commitment_action,
  (SELECT cm.measure_text FROM member_commitments cm
     WHERE cm.person_id IN (SELECT id FROM people)
     ORDER BY cm.device_created_at DESC LIMIT 1) AS commitment_measure,
  (SELECT cm.follow_up_status FROM member_commitments cm
     WHERE cm.person_id IN (SELECT id FROM people)
     ORDER BY cm.device_created_at DESC LIMIT 1) AS commitment_outcome,
  (SELECT cv.name FROM member_commitments cm
     JOIN curriculum_values cv ON cv.id = cm.value_id
     WHERE cm.person_id IN (SELECT id FROM people)
     ORDER BY cm.device_created_at DESC LIMIT 1) AS commitment_value,
  (SELECT json_group_array(json_object(
      'number', m.number, 'name', m.name, 'total', m.value_count,
      'completed', (SELECT COUNT(DISTINCT a.value_id)
        FROM member_assessments a
        JOIN curriculum_values cv ON cv.id = a.value_id
        WHERE a.kind = 'initial' AND cv.module_id = m.id
          AND a.person_id IN (SELECT id FROM people))))
   FROM (SELECT * FROM curriculum_modules ORDER BY number) m) AS modules
FROM (SELECT 1) base
LEFT JOIN (
  $_tableSelect $_tableFrom WHERE t.id = ?
) b ON 1 = 1''';

  /// Emits `null` while the table has not been synced to the device.
  Stream<HomeTableRecord?> watchFacilitatorTable(String tableId) => _database
      .powerSync
      .watch(_facilitatorSql, parameters: [tableId])
      .map((rows) => rows.isEmpty ? null : _tableRecord(rows.first));

  Stream<HomeMemberRecord> watchMember(String tableId) =>
      _database.powerSync.watch(_memberSql, parameters: [tableId]).map((rows) {
        final row = rows.first;
        final action = row['commitment_action'] as String?;
        return HomeMemberRecord(
          table: row['table_id'] == null ? null : _tableRecord(row),
          commitment: action == null
              ? null
              : HomeCommitment(
                  actionText: action,
                  measureText: row['commitment_measure'] as String?,
                  valueName: row['commitment_value'] as String?,
                  outcome: CommitmentOutcome.tryParse(
                    row['commitment_outcome'] as String?,
                  ),
                ),
          progress: _progress(row['modules'] as String?),
        );
      });

  HomeTableRecord _tableRecord(Map<String, Object?> row) => HomeTableRecord(
    tableId: row['table_id']! as String,
    tableName: row['table_name']! as String,
    tableIsActive: row['table_status'] == 'active',
    seats: (row['seats'] as num?)?.toInt() ?? 0,
    lastClosedAt: _date(row['last_closed_at']),
    sessionId: row['session_id'] as String?,
    sessionIsOpen: row['session_status'] == 'open',
    scheduledAt: _date(row['scheduled_at']),
    valueName: row['value_name'] as String?,
    valueSequence: (row['value_sequence'] as num?)?.toInt(),
    followUpValueName: row['follow_up_name'] as String?,
  );

  static DateTime? _date(Object? raw) =>
      raw is String ? DateTime.tryParse(raw)?.toUtc() : null;

  static HomeProgress _progress(String? json) {
    if (json == null) return const HomeProgress();
    final modules = (jsonDecode(json) as List<dynamic>)
        .cast<Map<String, dynamic>>();
    return HomeProgress(
      modules: [
        for (final m in modules)
          ModuleProgress(
            number: (m['number'] as num).toInt(),
            name: m['name'] as String,
            completed: (m['completed'] as num).toInt(),
            total: (m['total'] as num).toInt(),
          ),
      ],
    );
  }
}
