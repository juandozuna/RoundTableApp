import 'package:flutter/material.dart';

import '../extensions/build_context_x.dart';
import '../sync/domain/sync_snapshot.dart';
import 'sync_pill.dart';

/// [SyncPill] for a [SyncSnapshot]: says "Sin conexión" while the app cannot
/// reach the server and nothing is waiting, otherwise the aggregate sync state
/// with how many changes are waiting to be sent.
class SyncStatusPill extends StatelessWidget {
  const SyncStatusPill({super.key, required this.snapshot});

  final SyncSnapshot snapshot;

  bool get _isOfflineWithNothingPending =>
      snapshot.connection == SyncConnection.offline &&
      snapshot.pendingCount == 0;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    if (_isOfflineWithNothingPending) {
      return SyncPill.offline(detail: l10n.syncOfflineDetail);
    }
    return SyncPill(
      state: snapshot.aggregateState,
      detail: snapshot.hasStalePending
          ? l10n.syncStaleWarning
          : l10n.syncPendingCount(snapshot.pendingCount),
    );
  }
}
