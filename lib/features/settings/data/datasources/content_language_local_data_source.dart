import 'package:injectable/injectable.dart';

import '../../../../core/sync/data/sync_database.dart';
import '../../../../core/sync/data/sync_schema.dart';

/// Reads the synced content languages and the device's choice from the local
/// database (ADR 0017). Never touches the network.
@lazySingleton
class ContentLanguageLocalDataSource {
  ContentLanguageLocalDataSource(this._database);

  final SyncDatabase _database;

  static const String _languagesSql =
      '''
SELECT l.code, l.name, l.is_default,
  (SELECT ${CoreSyncTables.valueColumn} FROM ${CoreSyncTables.localSyncState}
     WHERE id = '${CoreSyncTables.contentLocaleKey}') AS selected
FROM content_locales l WHERE l.status = 'active'
ORDER BY l.is_default DESC, l.code''';

  Stream<List<Map<String, Object?>>> watchLanguages() =>
      _database.powerSync.watch(_languagesSql);

  Future<void> saveSelected(String code) =>
      _database.powerSync.writeTransaction((tx) async {
        await tx.execute(
          'DELETE FROM ${CoreSyncTables.localSyncState} WHERE id = ?',
          [CoreSyncTables.contentLocaleKey],
        );
        await tx.execute(
          'INSERT INTO ${CoreSyncTables.localSyncState} '
          '(id, ${CoreSyncTables.keyColumn}, ${CoreSyncTables.valueColumn}) '
          'VALUES (?, ?, ?)',
          [
            CoreSyncTables.contentLocaleKey,
            CoreSyncTables.contentLocaleKey,
            code,
          ],
        );
      });
}
