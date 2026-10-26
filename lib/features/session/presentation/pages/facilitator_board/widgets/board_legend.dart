import 'package:flutter/material.dart';

import '../../../../../../core/extensions/build_context_x.dart';
import '../../../../../../core/theme/app_spacing.dart';
import '../../../../../../core/theme/status_tone.dart';
import '../../../../../../core/widgets/status_border.dart';
import '../../../../domain/models/facilitator_stage.dart';

/// Key to the seat rings for the stage being viewed. Every entry pairs a
/// colour with a line style, so status never depends on colour alone.
class BoardLegend extends StatelessWidget {
  const BoardLegend({super.key, required this.stage});

  final FacilitatorStage stage;

  List<(StatusTone, String)> _entries(BuildContext context) {
    final l10n = context.l10n;
    return switch (stage) {
      FacilitatorStage.open => const [],
      FacilitatorStage.attendance => [
        (StatusTone.ok, l10n.attendancePresent),
        (StatusTone.info, l10n.attendanceLate),
        (StatusTone.neutral, l10n.attendanceExcused),
        (StatusTone.offline, l10n.attendanceAbsent),
        (StatusTone.pending, l10n.sessionBoardSeatUnmarked),
      ],
      _ => [
        (StatusTone.ok, l10n.sessionBoardSeatAnswered),
        (StatusTone.pending, l10n.sessionBoardSeatPending),
        (StatusTone.offline, l10n.sessionBoardLegendOffline),
        (StatusTone.syncing, l10n.sessionBoardSeatSyncing),
        (StatusTone.late, l10n.sessionBoardLegendSyncedLate),
        (StatusTone.neutral, l10n.sessionBoardSeatSkipped),
      ],
    };
  }

  @override
  Widget build(BuildContext context) {
    final entries = _entries(context);
    if (entries.isEmpty) return const SizedBox.shrink();
    final l10n = context.l10n;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          l10n.sessionBoardLegendTitle.toUpperCase(),
          style: context.textStyles.kicker,
        ),
        const SizedBox(height: AppSpacing.xs),
        Wrap(
          spacing: AppSpacing.lg,
          runSpacing: AppSpacing.xs,
          children: [
            for (final (tone, label) in entries)
              ConstrainedBox(
                constraints: const BoxConstraints(minHeight: 24),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomPaint(
                      foregroundPainter: StatusBorderPainter(
                        color: context.statusColors.of(tone),
                        style: tone.lineStyle,
                        width: 3,
                        circle: true,
                      ),
                      child: const SizedBox(width: 18, height: 18),
                    ),
                    const SizedBox(width: AppSpacing.xs + 2),
                    Text(label, style: context.textTheme.labelSmall),
                  ],
                ),
              ),
          ],
        ),
        const SizedBox(height: AppSpacing.xs),
        Row(
          children: [
            Icon(
              Icons.workspace_premium_rounded,
              size: 14,
              color: context.colors.muted,
            ),
            const SizedBox(width: AppSpacing.xs + 2),
            Expanded(
              child: Text(
                l10n.sessionBoardLegendNote,
                style: context.textTheme.bodySmall,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
