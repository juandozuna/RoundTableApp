import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/config/app_config.dart';
import 'package:gold_roundtables/core/config/app_environment.dart';
import 'package:gold_roundtables/core/network/auth_token_provider.dart';
import 'package:gold_roundtables/core/services/clock/clock_service.dart';
import 'package:gold_roundtables/core/sync/data/powersync_sync_database.dart';
import 'package:gold_roundtables/core/sync/data/powersync_sync_status_service.dart';
import 'package:gold_roundtables/core/sync/data/sync_schema.dart';
import 'package:gold_roundtables/core/sync/data/sync_upload_batch.dart';
import 'package:gold_roundtables/core/sync/data/sync_uploader.dart';
import 'package:gold_roundtables/core/sync/domain/sync_snapshot.dart';
import 'package:powersync/powersync.dart';

class FakeTokens implements AuthTokenProvider {
  @override
  String? userId;

  @override
  String? get accessToken => userId == null ? null : 'jwt';

  @override
  Future<String?> refreshAccessToken() async => accessToken;
}

class NoUploader implements SyncUploader {
  @override
  Future<void> upload(SyncUploadBatch batch) async {}
}

class FixedClock implements ClockService {
  FixedClock(this.now);

  DateTime now;

  @override
  DateTime nowUtc() => now;
}

class NotesSchema implements SyncSchemaContribution {
  const NotesSchema();

  @override
  List<Table> get tables => const [
    Table('notes', [Column.text('body')]),
  ];
}

const config = AppConfig(
  supabaseUrl: '',
  supabaseAnonKey: '',
  powerSyncUrl: '',
  devAuthEnabled: false,
  environment: AppEnvironment.local,
);

void main() {
  late Directory dir;
  late FakeTokens tokens;
  late PowerSyncSyncDatabase database;

  setUp(() async {
    dir = await Directory.systemTemp.createTemp('grt_sync_test');
    tokens = FakeTokens();
    database = _TestDatabase(dir.path, tokens);
    await database.open();
  });

  tearDown(() async {
    await database.powerSync.close();
    await dir.delete(recursive: true);
  });

  Future<int> noteCount() async =>
      (await database.powerSync.get('SELECT COUNT(*) AS n FROM notes'))['n']
          as int;

  test('same user keeps local data across sign-out and sign-in', () async {
    tokens.userId = 'user-a';
    await database.connect();
    await database.powerSync.execute(
      "INSERT INTO notes (id, body) VALUES (uuid(), 'offline answer')",
    );

    await database.disconnect(clearLocalData: false);
    await database.connect();

    expect(await noteCount(), 1);
  });

  test('a different user clears the device before connecting', () async {
    tokens.userId = 'user-a';
    await database.connect();
    await database.powerSync.execute(
      "INSERT INTO notes (id, body) VALUES (uuid(), 'private')",
    );

    tokens.userId = 'user-b';
    await database.connect();

    expect(await noteCount(), 0);
  });

  test('status service reports pending changes and staleness', () async {
    tokens.userId = 'user-a';
    await database.connect();
    final clock = FixedClock(DateTime.utc(2026, 10, 1, 8));
    final status = PowerSyncSyncStatusService(database, config, clock);
    final snapshots = <SyncSnapshot>[];
    final subscription = status.watch().listen(snapshots.add);

    await database.powerSync.execute(
      "INSERT INTO notes (id, body) VALUES (uuid(), 'queued')",
    );
    await database.powerSync.execute(
      'INSERT INTO ${CoreSyncTables.localSyncState} (id, '
      '${CoreSyncTables.keyColumn}, ${CoreSyncTables.valueColumn}) '
      'VALUES (?, ?, ?)',
      [
        CoreSyncTables.pendingSinceKey,
        CoreSyncTables.pendingSinceKey,
        DateTime.utc(2026, 9, 30, 7).toIso8601String(),
      ],
    );
    await Future<void>.delayed(const Duration(milliseconds: 300));
    await subscription.cancel();

    final last = snapshots.last;
    expect(last.pendingCount, 1);
    expect(last.connection, SyncConnection.unavailable);
    expect(last.pendingSince, DateTime.utc(2026, 9, 30, 7));
    expect(last.hasStalePending, isTrue);
  });
}

/// Uses a temp directory instead of path_provider.
class _TestDatabase extends PowerSyncSyncDatabase {
  _TestDatabase(this.directory, AuthTokenProvider tokens)
    : super(
        config,
        const SyncSchemaRegistry([NotesSchema()]),
        tokens,
        NoUploader(),
      );

  final String directory;

  @override
  Future<String> databasePath() async => '$directory/test.db';
}
