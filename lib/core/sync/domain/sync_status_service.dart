import 'sync_snapshot.dart';

/// Observes synchronization status, pending uploads and staleness.
abstract interface class SyncStatusService {
  /// Emits the current snapshot first, then every change.
  Stream<SyncSnapshot> watch();
}
