import 'package:flutter/material.dart';

import '../../../../core/extensions/build_context_x.dart';
import '../../../../core/theme/app_spacing.dart';
import '../admin_format.dart';

/// Attendance as a small bar plus number. Below [lowThreshold] the bar turns
/// amber and a ▼ icon follows the number, so the alert is not colour-only.
class AttendanceMeter extends StatelessWidget {
  const AttendanceMeter({
    super.key,
    required this.percent,
    this.lowThreshold = 70,
    this.showBar = true,
  });

  final double? percent;
  final double lowThreshold;

  /// Hides the bar (tight tables): number and flag only.
  final bool showBar;

  @override
  Widget build(BuildContext context) {
    final value = percent;
    if (value == null) {
      return Text(AdminFormat.missing, style: context.textTheme.bodyMedium);
    }
    final low = value < lowThreshold;
    final status = context.statusColors;
    final label = AdminFormat.percent(value);
    return Semantics(
      label: low ? '$label, ${context.l10n.adminAttendanceLow}' : label,
      excludeSemantics: true,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showBar) ...[
            _buildBar(context, value, low ? status.pending : status.ok),
            const SizedBox(width: AppSpacing.sm),
          ],
          Text(
            label,
            style: context.textTheme.labelLarge!.copyWith(
              color: low ? status.pending : null,
              fontFeatures: const [FontFeature.tabularFigures()],
            ),
          ),
          if (low)
            Icon(
              Icons.arrow_drop_down_rounded,
              color: status.pending,
              size: 22,
            ),
        ],
      ),
    );
  }

  Widget _buildBar(BuildContext context, double value, Color fill) {
    final colors = context.colors;
    return Container(
      width: 48,
      height: 8,
      decoration: BoxDecoration(
        color: colors.backgroundAlt,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: colors.line),
      ),
      alignment: Alignment.centerLeft,
      child: FractionallySizedBox(
        widthFactor: (value / 100).clamp(0, 1),
        heightFactor: 1,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: fill,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }
}
