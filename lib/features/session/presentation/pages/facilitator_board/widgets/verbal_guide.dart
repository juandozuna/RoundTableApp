import 'package:flutter/material.dart';

import '../../../../../../core/extensions/build_context_x.dart';
import '../../../../../../core/theme/app_spacing.dart';
import '../../../../../../core/theme/status_tone.dart';
import '../../../../../../core/widgets/status_border.dart';
import '../../../../domain/models/facilitator_stage.dart';

/// "Guía verbal": what to say to the room for [stage] when there is no
/// internet and the phones go self-paced.
class VerbalGuide extends StatelessWidget {
  const VerbalGuide({
    super.key,
    required this.stage,
    required this.previousValue,
    required this.currentValue,
  });

  final FacilitatorStage stage;
  final String? previousValue;
  final String currentValue;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
    final script = switch (stage) {
      FacilitatorStage.open => l10n.sessionBoardVerbalOpen,
      FacilitatorStage.attendance => l10n.sessionBoardVerbalAttendance,
      FacilitatorStage.followUp => l10n.sessionBoardVerbalFollowUp(
        previousValue ?? '',
      ),
      FacilitatorStage.value => l10n.sessionBoardVerbalValue(currentValue),
      FacilitatorStage.closing => l10n.sessionBoardVerbalClosing,
    };
    return CustomPaint(
      foregroundPainter: StatusBorderPainter(
        color: context.statusColors.offline,
        style: StatusLineStyle.dashed,
        width: 1.5,
        radius: AppRadii.lg,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
        decoration: BoxDecoration(
          color: context.statusColors.offline.withValues(alpha: 0.18),
          borderRadius: BorderRadius.circular(AppRadii.lg),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.mic_rounded, color: colors.ink),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.sessionBoardVerbalTitle.toUpperCase(),
                    style: context.textStyles.kicker,
                  ),
                  Text('“$script”', style: context.textTheme.titleSmall),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
