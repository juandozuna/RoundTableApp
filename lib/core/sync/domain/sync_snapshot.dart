import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/sync_state.dart';

part 'sync_snapshot.freezed.dart';

/// Connection of the app to the server (online-only now; a future local
/// outbox reports its own connection here too, ADR 0019).
enum SyncConnection {
  /// The server is not configured.
  unavailable,

  /// Not connected (signed out, no network or service unreachable).
  offline,
  connecting,
  connected,
}

/// What the user needs to know about synchronization, free of transport
/// types (ADR 0019).
@freezed
abstract class SyncSnapshot with _$SyncSnapshot {
  const factory SyncSnapshot({
    required SyncConnection connection,
    @Default(false) bool uploading,
    @Default(false) bool downloading,

    /// Local changes waiting to upload.
    @Default(0) int pendingCount,
    DateTime? lastSyncedAt,

    /// When the oldest still-pending change was first observed.
    DateTime? pendingSince,

    /// Pending changes are older than `AppLimits.unsyncedWarningAfter`.
    @Default(false) bool hasStalePending,
    @Default(false) bool hasError,
  }) = _SyncSnapshot;

  const SyncSnapshot._();

  static const SyncSnapshot unavailable = SyncSnapshot(
    connection: SyncConnection.unavailable,
  );

  /// Aggregate state for a [SyncState] pill.
  SyncState get aggregateState {
    if (uploading) return SyncState.syncing;
    if (pendingCount > 0) return SyncState.pending;
    return SyncState.synced;
  }
}
