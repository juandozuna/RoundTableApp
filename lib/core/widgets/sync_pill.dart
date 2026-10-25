import 'package:flutter/material.dart';

import '../extensions/build_context_x.dart';
import '../models/sync_state.dart';
import '../theme/app_spacing.dart';
import '../theme/status_tone.dart';
import 'status_pill.dart';

/// Sync state of captured answers: pendiente / sincronizando /
/// sincronizado / sincronizado tarde.
class SyncPill extends StatelessWidget {
  const SyncPill({super.key, required this.state, this.detail})
    : compact = false;

  /// Inline pill without the detail line.
  const SyncPill.compact({super.key, required this.state})
    : detail = null,
      compact = true;

  final SyncState state;

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

  @override
  Widget build(BuildContext context) {
    final tone = toneFor(state);
    final label = labelFor(context, state);
    if (compact) {
      return StatusPill(tone: tone, label: label, icon: iconFor(state));
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
            Icon(iconFor(state), color: color, size: AppSizes.iconMd),
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
