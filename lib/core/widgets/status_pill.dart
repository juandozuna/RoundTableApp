import 'package:flutter/material.dart';

import '../extensions/build_context_x.dart';
import '../theme/app_spacing.dart';
import '../theme/status_tone.dart';
import 'status_border.dart';

/// Compact status label: tinted fill, border in the tone's colour and line
/// style, and an icon — status is never conveyed by colour alone.
class StatusPill extends StatelessWidget {
  const StatusPill({
    super.key,
    required this.tone,
    required this.label,
    this.icon,
    this.showIcon = true,
  });

  final StatusTone tone;
  final String label;

  /// Defaults to [defaultIcon] for the tone.
  final IconData? icon;
  final bool showIcon;

  static IconData defaultIcon(StatusTone tone) => switch (tone) {
    StatusTone.ok => Icons.check_circle_rounded,
    StatusTone.pending => Icons.schedule_rounded,
    StatusTone.syncing => Icons.sync_rounded,
    StatusTone.late => Icons.history_rounded,
    StatusTone.offline => Icons.cloud_off_rounded,
    StatusTone.error => Icons.error_rounded,
    StatusTone.info => Icons.info_rounded,
    StatusTone.neutral => Icons.circle_outlined,
  };

  @override
  Widget build(BuildContext context) {
    final color = context.statusColors.of(tone);
    return Semantics(
      label: label,
      excludeSemantics: true,
      child: CustomPaint(
        foregroundPainter: StatusBorderPainter(
          color: color,
          style: tone.lineStyle,
          width: tone.lineStyle == StatusLineStyle.double ? 3.5 : 1.5,
        ),
        child: Container(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.sm,
            AppSpacing.xs,
            AppSpacing.md - 2,
            AppSpacing.xs,
          ),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.14),
            borderRadius: BorderRadius.circular(AppRadii.pill),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (showIcon) ...[
                Icon(
                  icon ?? defaultIcon(tone),
                  size: AppSizes.iconSm,
                  color: color,
                ),
                const SizedBox(width: AppSpacing.xs + 2),
              ],
              Flexible(
                child: Text(
                  label,
                  style: context.textStyles.pill.copyWith(
                    color: context.colors.ink,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
