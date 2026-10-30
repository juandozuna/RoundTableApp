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
      path: await databasePath(),
    );
    await database.initialize();
    _database = database;
    AppLog.info('sync', 'Local database ready');
  }

  /// File name on web (OPFS/IndexedDB); app support directory on mobile.
  @visibleForTesting
  Future<String> databasePath() async {
    if (kIsWeb) return fileName;
    final directory = await getApplicationSupportDirectory();
    return p.join(directory.path, fileName);
  }

  @override
  DatabaseConnection createDriftConnection() =>
      SqliteAsyncDriftConnection(powerSync);

  @override
  Future<void> connect() async {
    if (!isOpen) return;
    final userId = _tokens.userId;
    if (userId == null) return;
    await _claimForUser(userId);
    await _ensureContentLocale();
    if (!_config.hasPowerSync) return;
    await powerSync.connect(
      connector: SupabasePowerSyncConnector(
        endpoint: _config.powerSyncUrl,
        tokens: _tokens,
        uploader: _uploader,
      ),
    );
  }

  /// Clears the device when another user's data is on it, then records
  /// [userId] as the owner.
  Future<void> _claimForUser(String userId) async {
    final owner = await powerSync.getOptional(
      'SELECT ${CoreSyncTables.valueColumn} AS owner FROM '
      '${CoreSyncTables.localSyncState} WHERE id = ?',
      [CoreSyncTables.ownerUserIdKey],
    );
    final ownerId = owner?['owner'] as String?;
    if (ownerId == userId) return;
    if (ownerId != null) {
      AppLog.info('sync', 'Another user signed in; clearing local data');
      await powerSync.disconnectAndClear();
    }
    await powerSync.execute(
      'INSERT INTO ${CoreSyncTables.localSyncState} '
      '(id, ${CoreSyncTables.keyColumn}, ${CoreSyncTables.valueColumn}) '
      'VALUES (?, ?, ?)',
      [CoreSyncTables.ownerUserIdKey, CoreSyncTables.ownerUserIdKey, userId],
    );
  }

  /// First run on this device: show the curriculum in the device language
  /// (text without a translation stays in Spanish). The person can change it
  /// in Settings; the choice lives in the local-only state table.
  Future<void> _ensureContentLocale() async {
    final stored = await powerSync.getOptional(
      'SELECT id FROM ${CoreSyncTables.localSyncState} WHERE id = ?',
      [CoreSyncTables.contentLocaleKey],
    );
    if (stored != null) return;
    await powerSync.execute(
      'INSERT INTO ${CoreSyncTables.localSyncState} '
      '(id, ${CoreSyncTables.keyColumn}, ${CoreSyncTables.valueColumn}) '
      'VALUES (?, ?, ?)',
      [
        CoreSyncTables.contentLocaleKey,
        CoreSyncTables.contentLocaleKey,
        PlatformDispatcher.instance.locale.languageCode.toLowerCase(),
      ],
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
