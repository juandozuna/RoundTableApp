import 'dart:convert';
import 'dart:io';

import 'package:gold_roundtables/core/config/app_config.dart';
import 'package:gold_roundtables/core/config/app_environment.dart';
import 'package:gold_roundtables/core/network/auth_token_provider.dart';
import 'package:gold_roundtables/core/services/clock/clock_service.dart';
import 'package:gold_roundtables/core/sync/data/powersync_sync_database.dart';
import 'package:gold_roundtables/core/sync/data/sync_schema.dart';
import 'package:gold_roundtables/core/sync/data/sync_upload_batch.dart';
import 'package:gold_roundtables/core/sync/data/sync_uploader.dart';
import 'package:gold_roundtables/features/session/data/local/session_drift_database.dart';
import 'package:gold_roundtables/features/session/data/local/session_sync_schema.dart';

class FakeTokens implements AuthTokenProvider {
  @override
  String? userId = 'user-a';

  @override
  String? get accessToken => userId == null ? null : 'jwt';

  @override
  Future<String?> refreshAccessToken() async => accessToken;
}

class RecordingUploader implements SyncUploader {
  final List<SyncUploadBatch> batches = [];

  @override
  Future<void> upload(SyncUploadBatch batch) async => batches.add(batch);
}

class FixedClock implements ClockService {
  FixedClock(this.now);

  DateTime now;

  @override
  DateTime nowUtc() => now;
}

const _config = AppConfig(
  supabaseUrl: '',
  supabaseAnonKey: '',
  powerSyncUrl: '',
  devAuthEnabled: false,
  environment: AppEnvironment.local,
);

/// A real local PowerSync database with the session schema, plus the Drift
/// view the feature uses. [seedSynced] writes rows the way a download from
/// the server would: without queuing an upload.
class SessionTestDatabase {
  SessionTestDatabase._(this.directory, this.sync, this.drift);

  final Directory directory;
  final PowerSyncSyncDatabase sync;
  final SessionDriftDatabase drift;

  static Future<SessionTestDatabase> open() async {
    final directory = await Directory.systemTemp.createTemp('grt_session');
    final sync = _TestSyncDatabase(directory.path);
    await sync.open();
    return SessionTestDatabase._(directory, sync, SessionDriftDatabase(sync));
  }

  /// Simulates a row arriving from the server (no upload is queued).
  Future<void> seedSynced(
    String table,
    String id,
    Map<String, Object?> columns,
  ) => sync.powerSync.execute(
    'INSERT OR REPLACE INTO ps_data__$table (id, data) VALUES (?, ?)',
    [id, jsonEncode(columns)],
  );

  Future<int> queuedChanges() async =>
      (await sync.powerSync.get('SELECT COUNT(*) AS n FROM ps_crud'))['n']
          as int;

  Future<List<Map<String, dynamic>>> queuedEntries() async {
    final rows = await sync.powerSync.getAll(
      'SELECT data FROM ps_crud ORDER BY id',
    );
    return [
      for (final row in rows)
        jsonDecode(row['data'] as String) as Map<String, dynamic>,
    ];
  }

  Future<int> rowCount(String table) async =>
      (await sync.powerSync.get('SELECT COUNT(*) AS n FROM $table'))['n']
          as int;

  Future<void> close() async {
    await drift.close();
    await sync.powerSync.close();
    await directory.delete(recursive: true);
  }
}

class _TestSyncDatabase extends PowerSyncSyncDatabase {
  _TestSyncDatabase(this.directoryPath)
    : super(
        _config,
        const SyncSchemaRegistry([SessionSyncSchema()]),
        FakeTokens(),
        RecordingUploader(),
      );

  final String directoryPath;

  @override
  Future<String> databasePath() async => '$directoryPath/test.db';
}
