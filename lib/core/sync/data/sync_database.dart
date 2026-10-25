import 'package:drift/drift.dart';
import 'package:powersync/powersync.dart';

/// The single local SQLite database replicated by PowerSync (ADR 0004).
///
/// Data-layer only: local data sources build their Drift database on
/// [createDriftConnection]; domain code never sees this type.
abstract interface class SyncDatabase {
  bool get isOpen;

  /// Opens the local database. Safe to call more than once.
  Future<void> open();

  /// The PowerSync database. Throws if [open] has not completed.
  PowerSyncDatabase get powerSync;

  /// A Drift connection over the PowerSync database. Each feature Drift
  /// database gets its own connection; table updates propagate between them.
  DatabaseConnection createDriftConnection();

  /// Starts replication for the signed-in user. No-op when sync is not
  /// configured.
  Future<void> connect();

  /// Stops replication. With [clearLocalData] every synced row is deleted so
  /// no data remains for the next user.
  Future<void> disconnect({required bool clearLocalData});
}
