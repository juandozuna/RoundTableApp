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

  /// Starts replication for the signed-in user. When a different user than
  /// the device's previous owner signs in, all local data is cleared first so
  /// one user's data is never shown to another. Replication itself is skipped
  /// when sync is not configured.
  Future<void> connect();

  /// Stops replication. Without [clearLocalData], local rows and unsent
  /// changes stay and upload when the same user signs in again. With it,
  /// everything is deleted, including unsent changes.
  Future<void> disconnect({required bool clearLocalData});
}
