import 'package:drift/drift.dart';

/// Migration strategy for feature Drift databases over PowerSync.
///
/// PowerSync owns the schema (views over its internal tables), so Drift must
/// not create or alter tables. Keep `schemaVersion => 1` in every feature
/// Drift database; schema changes go into the PowerSync `Table` definitions.
abstract final class PowerSyncDriftMigration {
  static final MigrationStrategy strategy = MigrationStrategy(
    onCreate: (_) async {},
    onUpgrade: (_, _, _) async {},
  );
}
