import 'package:flutter/material.dart';

import '../extensions/build_context_x.dart';
import '../models/sync_state.dart';
import '../theme/app_spacing.dart';
import '../theme/status_tone.dart';
import 'status_pill.dart';

/// Sync state of captured answers: pendiente / sincronizando /
/// sincronizado / sincronizado tarde, or sin conexión when the app cannot
/// reach the server.
class SyncPill extends StatelessWidget {
  const SyncPill({super.key, required this.state, this.detail})
    : compact = false,
      offline = false;

  /// Inline pill without the detail line.
  const SyncPill.compact({super.key, required this.state})
    : detail = null,
      compact = true,
      offline = false;

  /// "Sin conexión": nothing can be sent until the connection returns.
  const SyncPill.offline({super.key, this.detail})
    : state = SyncState.pending,
      compact = false,
      offline = true;

  final SyncState state;
  final bool offline;

  /// Second line, e.g. "3 cambios pendientes".
  final String? detail;
  final bool compact;

  static StatusTone toneFor(SyncState state) => switch (state) {
    SyncState.pending => StatusTone.pending,
    SyncState.syncing => StatusTone.syncing,
    SyncState.synced => StatusTone.ok,
    SyncState.syncedLate => StatusTone.late,
  };

  static IconData iconFor(SyncState state) => switch (state) {
    SyncState.pending => Icons.cloud_upload_outlined,
    SyncState.syncing => Icons.sync_rounded,
    SyncState.synced => Icons.cloud_done_rounded,
    SyncState.syncedLate => Icons.history_rounded,
  };

  static String labelFor(BuildContext context, SyncState state) {
    final l10n = context.l10n;
    return switch (state) {
      SyncState.pending => l10n.syncPending,
      SyncState.syncing => l10n.syncSyncing,
      SyncState.synced => l10n.syncSynced,
      SyncState.syncedLate => l10n.syncSyncedLate,
    };
  }

  StatusTone get _tone => offline ? StatusTone.offline : toneFor(state);
  IconData get _icon => offline ? Icons.cloud_off_rounded : iconFor(state);

  @override
  Widget build(BuildContext context) {
    final tone = _tone;
    final label = offline
        ? context.l10n.connectivityOffline
        : labelFor(context, state);
    if (compact) {
      return StatusPill(tone: tone, label: label, icon: _icon);
    }
    final color = context.statusColors.of(tone);
    final detail = this.detail;
    return Semantics(
      liveRegion: true,
      label: detail == null ? label : '$label. $detail',
      excludeSemantics: true,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm + 2,
        ),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.13),
          borderRadius: BorderRadius.circular(AppRadii.lg),
          border: Border.all(color: color, width: 1.5),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(_icon, color: color, size: AppSizes.iconMd),
            const SizedBox(width: AppSpacing.sm + 2),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label, style: context.textTheme.labelMedium),
                  if (detail != null)
                    Padding(
                      padding: const EdgeInsets.only(top: AppSpacing.xxs),
                      child: Text(detail, style: context.textTheme.bodySmall),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
