import 'package:drift/drift.dart';
import 'package:drift_sqlite_async/drift_sqlite_async.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:powersync/powersync.dart';

import '../../config/app_config.dart';
import '../../network/auth_token_provider.dart';
import '../../services/logging/app_log.dart';
import 'supabase_powersync_connector.dart';
import 'sync_database.dart';
import 'sync_schema.dart';
import 'sync_uploader.dart';

@LazySingleton(as: SyncDatabase)
class PowerSyncSyncDatabase implements SyncDatabase {
  PowerSyncSyncDatabase(
    this._config,
    this._schemaRegistry,
    this._tokens,
    this._uploader,
  );

  static const String fileName = 'gold_roundtables.db';

  final AppConfig _config;
  final SyncSchemaRegistry _schemaRegistry;
  final AuthTokenProvider _tokens;
  final SyncUploader _uploader;

  PowerSyncDatabase? _database;
  Future<void>? _opening;

  @override
  bool get isOpen => _database != null;

  @override
  PowerSyncDatabase get powerSync {
    final database = _database;
    if (database == null) {
      throw StateError('SyncDatabase.open() has not completed');
    }
    return database;
  }

  @override
  Future<void> open() => _opening ??= _open();

  Future<void> _open() async {
    final database = PowerSyncDatabase(
      schema: _schemaRegistry.buildSchema(),
      path: await _databasePath(),
    );
    await database.initialize();
    _database = database;
    AppLog.info('sync', 'Local database ready');
  }

  static Future<String> _databasePath() async {
    if (kIsWeb) return fileName;
    final directory = await getApplicationSupportDirectory();
    return p.join(directory.path, fileName);
  }

  @override
  DatabaseConnection createDriftConnection() =>
      SqliteAsyncDriftConnection(powerSync);

  @override
  Future<void> connect() async {
    if (!_config.hasPowerSync || !isOpen) return;
    await powerSync.connect(
      connector: SupabasePowerSyncConnector(
        endpoint: _config.powerSyncUrl,
        tokens: _tokens,
        uploader: _uploader,
      ),
    );
  }

  @override
  Future<void> disconnect({required bool clearLocalData}) async {
    if (!isOpen) return;
    if (clearLocalData) {
      await powerSync.disconnectAndClear();
    } else {
      await powerSync.disconnect();
    }
  }
}
