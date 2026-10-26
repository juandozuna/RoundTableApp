import 'package:flutter/material.dart';

import '../../../../../../core/extensions/build_context_x.dart';
import '../../../../../../core/theme/app_spacing.dart';
import '../../../../../../core/theme/status_tone.dart';
import '../../../../../../core/widgets/status_border.dart';

/// "Etapa cerrada": the facilitator closed answers before this step was sent.
class LockedStepCard extends StatelessWidget {
  const LockedStepCard({super.key, required this.isFacilitator});

  final bool isFacilitator;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final error = context.statusColors.error;
    return Padding(
      padding: const EdgeInsets.only(top: AppSpacing.lg),
      child: CustomPaint(
        foregroundPainter: StatusBorderPainter(
          color: error,
          style: StatusLineStyle.dashed,
          width: 2,
          radius: AppRadii.xl,
        ),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppSpacing.xl),
          decoration: BoxDecoration(
            color: error.withValues(alpha: 0.10),
            borderRadius: BorderRadius.circular(AppRadii.xl),
          ),
          child: Column(
            children: [
              Icon(Icons.lock_rounded, color: error, size: AppSizes.iconLg),
              const SizedBox(height: AppSpacing.sm),
              Text(
                l10n.sessionMemberLockedTitle,
                style: context.textTheme.titleLarge,
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                isFacilitator
                    ? l10n.sessionMemberLockedFacilitatorMessage
                    : l10n.sessionMemberLockedMemberMessage,
                style: context.textTheme.bodyMedium!.copyWith(
                  color: context.colors.muted,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
