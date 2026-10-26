import 'package:flutter/material.dart';

import '../../../../../../core/extensions/build_context_x.dart';
import '../../../../../../core/theme/app_spacing.dart';
import '../../../../../../core/theme/status_tone.dart';
import '../../../../../../core/widgets/status_border.dart';
import '../../../../domain/models/member_flow.dart';
import '../../../../domain/models/member_step.dart';

/// The person's three steps with their state (Listo / Ahora / Falta /
/// Cerrado / Aún no). Tapping a step the flow allows opens it.
class MemberStepChips extends StatelessWidget {
  const MemberStepChips({
    super.key,
    required this.flow,
    required this.currentStep,
    required this.onSelected,
  });

  final MemberFlow flow;

  /// Step whose screen is showing, if any.
  final MemberStep? currentStep;
  final ValueChanged<MemberStep> onSelected;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Semantics(
          container: true,
          label: l10n.sessionMemberStepsLabel,
          child: Row(
            children: [
              for (final step in MemberStep.values) ...[
                if (step != MemberStep.values.first)
                  const SizedBox(width: AppSpacing.xs + 2),
                Expanded(child: _buildChip(context, step)),
              ],
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          l10n.sessionMemberValueIncludesCommitment,
          style: context.textTheme.bodySmall,
        ),
      ],
    );
  }

  Widget _buildChip(BuildContext context, MemberStep step) {
    final l10n = context.l10n;
    final access = flow.accessOf(step);
    final isCurrent = step == currentStep;
    final tapable = flow.canView(step);
    final (tone, icon, state) = switch (access) {
      StepAccess.done => (
        StatusTone.ok,
        Icons.check_rounded,
        l10n.sessionMemberChipDone,
      ),
      StepAccess.open => (
        StatusTone.pending,
        Icons.more_horiz_rounded,
        isCurrent ? l10n.sessionMemberChipNow : l10n.sessionMemberChipMissing,
      ),
      StepAccess.closed => (
        StatusTone.error,
        Icons.close_rounded,
        l10n.sessionMemberChipClosed,
      ),
      StepAccess.notYet => (
        StatusTone.neutral,
        Icons.lock_outline_rounded,
        l10n.sessionMemberChipNotYet,
      ),
      StepAccess.skipped => (
        StatusTone.neutral,
        Icons.remove_rounded,
        l10n.sessionMemberChipSkipped,
      ),
    };
    final name = _labelOf(context, step);
    final colors = context.colors;
    final color = context.statusColors.of(tone);
    final radius = BorderRadius.circular(AppRadii.md);
    final onAccent = isCurrent;
    final foreground = onAccent ? colors.onAccent : colors.ink;
    return Semantics(
      button: tapable,
      enabled: tapable,
      selected: isCurrent,
      label: l10n.sessionMemberChipSemantics(name, state),
      excludeSemantics: true,
      child: CustomPaint(
        foregroundPainter: StatusBorderPainter(
          color: isCurrent ? colors.accentStrong : color,
          style: tone.lineStyle,
          width: 2,
          radius: AppRadii.md,
        ),
        child: Material(
          color: isCurrent
              ? colors.accentStrong
              : color.withValues(alpha: 0.10),
          borderRadius: radius,
          child: InkWell(
            borderRadius: radius,
            onTap: tapable ? () => onSelected(step) : null,
            child: ConstrainedBox(
              constraints: const BoxConstraints(minHeight: AppSizes.control),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name,
                    style: context.textTheme.labelMedium!.copyWith(
                      color: foreground,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        icon,
                        size: AppSizes.iconSm - 4,
                        color: isCurrent ? colors.onAccent : color,
                      ),
                      const SizedBox(width: AppSpacing.xxs),
                      Text(
                        state,
                        style: context.textTheme.bodySmall!.copyWith(
                          color: isCurrent ? colors.onAccent : colors.muted,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  static String _labelOf(BuildContext context, MemberStep step) {
    final l10n = context.l10n;
    return switch (step) {
      MemberStep.followUp => l10n.sessionMemberStepFollowUp,
      MemberStep.reflection => l10n.sessionMemberStepValue,
      MemberStep.commitment => l10n.sessionMemberStepCommitment,
    };
  }
}
