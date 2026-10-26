import 'package:powersync/powersync.dart';

/// Local-only tables owned by `lib/core/sync`.
abstract final class CoreSyncTables {
  /// Key/value state kept on the device, never uploaded.
  static const String localSyncState = 'local_sync_state';
  static const String keyColumn = 'state_key';
  static const String valueColumn = 'state_value';

  /// Row key holding the instant pending changes were first observed.
  static const String pendingSinceKey = 'pending_since';

  /// Row key holding the id of the user whose data is on this device.
  static const String ownerUserIdKey = 'owner_user_id';

  /// Changes the server refused permanently, kept so the person can be told
  /// why (for example "La sesión ya se cerró").
  static const String uploadRejections = 'sync_upload_rejections';

  static const List<Table> tables = [
    Table.localOnly(localSyncState, [
      Column.text(keyColumn),
      Column.text(valueColumn),
    ]),
    Table.localOnly(uploadRejections, [
      Column.text('table_name'),
      Column.text('row_id'),
      Column.text('code'),
      Column.text('message'),
      Column.text('rejected_at'),
    ]),
  ];
}

/// PowerSync tables a feature contributes to the single local database.
/// Each feature exposes one const instance and adds it to
/// `lib/app/feature_registry.dart`.
abstract interface class SyncSchemaContribution {
  List<Table> get tables;
}

/// Combines core and feature tables into the PowerSync [Schema].
class SyncSchemaRegistry {
  const SyncSchemaRegistry(this.contributions);

  final List<SyncSchemaContribution> contributions;

  Schema buildSchema() {
    final tables = <Table>[
      ...CoreSyncTables.tables,
      for (final contribution in contributions) ...contribution.tables,
    ];
    final names = <String>{};
    for (final table in tables) {
      if (!names.add(table.name)) {
        throw StateError('Duplicate PowerSync table "${table.name}"');
      }
    }
    return Schema(tables);
  }
}
