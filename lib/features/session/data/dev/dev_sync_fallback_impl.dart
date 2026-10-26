import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/config/app_config.dart';
import '../../../../core/constants/api_constants.dart';
import '../../../../core/network/auth_token_provider.dart';
import '../../../../core/services/logging/app_log.dart';
import '../../../../core/sync/data/supabase_powersync_connector.dart';
import '../../../../core/sync/data/sync_database.dart';
import '../../../../core/sync/data/sync_uploader.dart';
import '../local/session_sync_schema.dart';
import 'dev_sync_fallback.dart';

/// Poll-based replacement for PowerSync used while the service is not
/// running (see [DevSyncFallback]).
///
/// - Down: reads each replicated table through PostgREST under the user's
///   RLS and writes it into the local tables the way a download would,
///   skipping rows with a change still waiting to upload.
/// - Up: drains PowerSync's upload queue through the same connector and
///   uploader as production.
@LazySingleton(as: DevSyncFallback)
class DevSyncFallbackImpl implements DevSyncFallback {
  DevSyncFallbackImpl(
    this._config,
    this._database,
    this._tokens,
    this._uploader,
    @Named(DioNames.postgrest) this._postgrest,
  );

  static const Duration interval = Duration(seconds: 2);

  /// Tables downloaded, in dependency order.
  static const List<String> _downloaded = [
    SessionTables.curriculumValues,
    SessionTables.valueQuestions,
    SessionTables.organizations,
    SessionTables.people,
    SessionTables.roundTables,
    SessionTables.tableMembers,
    SessionTables.sessions,
    SessionTables.sessionAttendance,
    SessionTables.memberAssessments,
    SessionTables.memberAnswers,
    SessionTables.memberCommitments,
  ];

  final AppConfig _config;
  final SyncDatabase _database;
  final AuthTokenProvider _tokens;
  final SyncUploader _uploader;
  final Dio _postgrest;

  Timer? _timer;
  bool _running = false;

  bool get _enabled => AppConfig.devAuthCompiledIn && !_config.hasPowerSync;

  @override
  void ensureRunning() {
    if (!_enabled || _timer != null) return;
    AppLog.info('sync', 'Dev sync fallback active (no PowerSync service)');
    _timer = Timer.periodic(interval, (_) => unawaited(_cycle()));
    unawaited(_cycle());
  }

  Future<void> _cycle() async {
    if (_running || !_database.isOpen || _tokens.userId == null) return;
    _running = true;
    try {
      await _upload();
      await _download();
    } on Object catch (error) {
      AppLog.warning('sync', 'Dev sync cycle failed', error);
    } finally {
      _running = false;
    }
  }

  Future<void> _upload() async {
    final db = _database.powerSync;
    final connector = SupabasePowerSyncConnector(
      endpoint: '',
      tokens: _tokens,
      uploader: _uploader,
    );
    while ((await db.get('SELECT COUNT(*) AS n FROM ps_crud'))['n'] as int >
        0) {
      await connector.uploadData(db);
    }
  }

  Future<void> _download() async {
    final db = _database.powerSync;
    final pending = <String>{};
    for (final row in await db.getAll('SELECT data FROM ps_crud')) {
      final entry = jsonDecode(row['data'] as String) as Map<String, dynamic>;
      pending.add(entry['id'] as String);
    }
    for (final table in _downloaded) {
      final response = await _postgrest.get<List<dynamic>>(
        '/$table',
        queryParameters: {
          'select': '*',
          if (table == SessionTables.people)
            'auth_user_id': 'eq.${_tokens.userId}',
        },
      );
      final rows = (response.data ?? const []).cast<Map<String, dynamic>>();
      await db.writeTransaction((tx) async {
        for (final row in rows) {
          final id = row['id'] as String;
          if (pending.contains(id)) continue;
          final data = {
            for (final entry in row.entries)
              if (entry.key != 'id')
                entry.key: entry.value is bool
                    ? ((entry.value as bool) ? 1 : 0)
                    : entry.value,
          };
          await tx.execute(
            'INSERT OR REPLACE INTO ps_data__$table (id, data) VALUES (?, ?)',
            [id, jsonEncode(data)],
          );
        }
      });
    }
  }
}
