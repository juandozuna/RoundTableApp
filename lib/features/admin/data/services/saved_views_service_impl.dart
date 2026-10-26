import 'dart:convert';

import 'package:injectable/injectable.dart';

import '../../../../core/services/logging/app_log.dart';
import '../../../../core/sync/data/sync_database.dart';
import '../../../../core/sync/data/sync_schema.dart';
import '../../domain/models/saved_explorer_view.dart';
import '../../domain/services/saved_views_service.dart';

/// Keeps saved views in the local-only `local_sync_state` table, so they are
/// never uploaded and are cleared when another user signs in on the device.
/// Before the local database is open they live in memory only.
@LazySingleton(as: SavedViewsService)
class SavedViewsServiceImpl implements SavedViewsService {
  SavedViewsServiceImpl(this._database);

  static const String _key = 'admin_saved_views';

  final SyncDatabase _database;
  List<SavedExplorerView> _memory = const [];

  @override
  Future<List<SavedExplorerView>> load() async {
    if (!_database.isOpen) return _memory;
    try {
      final row = await _database.powerSync.getOptional(
        'SELECT ${CoreSyncTables.valueColumn} AS value FROM '
        '${CoreSyncTables.localSyncState} WHERE id = ?',
        [_key],
      );
      final raw = row?['value'] as String?;
      if (raw == null) return _memory;
      final decoded = jsonDecode(raw) as List<dynamic>;
      _memory = [
        for (final item in decoded)
          SavedExplorerView.fromJson(item as Map<String, dynamic>),
      ];
    } on Object catch (error) {
      AppLog.warning('saved_views', 'Could not read saved views', error);
    }
    return _memory;
  }

  @override
  Future<void> save(List<SavedExplorerView> views) async {
    _memory = List.unmodifiable(views);
    if (!_database.isOpen) return;
    final encoded = jsonEncode([for (final v in views) v.toJson()]);
    try {
      await _database.powerSync.writeTransaction((tx) async {
        await tx.execute(
          'DELETE FROM ${CoreSyncTables.localSyncState} WHERE id = ?',
          [_key],
        );
        await tx.execute(
          'INSERT INTO ${CoreSyncTables.localSyncState} '
          '(id, ${CoreSyncTables.keyColumn}, ${CoreSyncTables.valueColumn}) '
          'VALUES (?, ?, ?)',
          [_key, _key, encoded],
        );
      });
    } on Object catch (error) {
      AppLog.warning('saved_views', 'Could not persist saved views', error);
    }
  }
}
