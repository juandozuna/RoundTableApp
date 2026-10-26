import 'package:flutter/material.dart';

import '../../../../../../core/extensions/build_context_x.dart';
import '../../../../../../core/models/attendance_status.dart';
import '../../../../../../core/theme/app_spacing.dart';
import '../../../../../../core/theme/status_tone.dart';
import '../../../../../../core/widgets/app_button.dart';
import '../../../../../../core/widgets/status_border.dart';
import '../../../../domain/models/session_participant.dart';
import '../board_texts.dart';

/// Four large options to mark one person's attendance.
class AttendanceSheet extends StatelessWidget {
  const AttendanceSheet({
    super.key,
    required this.participant,
    required this.onPick,
    required this.onCancel,
  });

  final SessionParticipant participant;
  final ValueChanged<AttendanceStatus> onPick;
  final VoidCallback onCancel;

  static StatusTone toneOf(AttendanceStatus status) => switch (status) {
    AttendanceStatus.present => StatusTone.ok,
    AttendanceStatus.late => StatusTone.info,
    AttendanceStatus.excused => StatusTone.neutral,
    AttendanceStatus.absent => StatusTone.offline,
  };

  static IconData iconOf(AttendanceStatus status) => switch (status) {
    AttendanceStatus.present => Icons.check_rounded,
    AttendanceStatus.late => Icons.schedule_rounded,
    AttendanceStatus.excused => Icons.remove_rounded,
    AttendanceStatus.absent => Icons.close_rounded,
  };

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          l10n.sessionBoardAttendanceHint,
          style: context.textTheme.bodyMedium!.copyWith(
            color: context.colors.muted,
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: AppSpacing.sm,
          crossAxisSpacing: AppSpacing.sm,
          childAspectRatio: 2.4,
          children: [
            for (final status in AttendanceStatus.values)
              _buildOption(context, status),
          ],
        ),
        const SizedBox(height: AppSpacing.md),
        AppButton(
          label: l10n.actionCancel,
          variant: AppButtonVariant.secondary,
          onPressed: onCancel,
        ),
      ],
    );
  }

  Widget _buildOption(BuildContext context, AttendanceStatus status) {
    final tone = toneOf(status);
    final color = context.statusColors.of(tone);
    final selected = participant.attendance == status;
    final radius = BorderRadius.circular(AppRadii.lg);
    return Semantics(
      button: true,
      selected: selected,
      label: status.label(context.l10n),
      excludeSemantics: true,
      child: CustomPaint(
        foregroundPainter: StatusBorderPainter(
          color: color,
          style: tone.lineStyle,
          width: 2,
          radius: AppRadii.lg,
        ),
        child: Material(
          color: selected ? color : color.withValues(alpha: 0.12),
          borderRadius: radius,
          child: InkWell(
            borderRadius: radius,
            onTap: () => onPick(status),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  iconOf(status),
                  color: selected
                      ? context.statusColors.onStatus
                      : context.colors.ink,
                ),
                const SizedBox(width: AppSpacing.sm),
                Text(
                  status.label(context.l10n),
                  style: context.textTheme.titleSmall!.copyWith(
                    color: selected
                        ? context.statusColors.onStatus
                        : context.colors.ink,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
