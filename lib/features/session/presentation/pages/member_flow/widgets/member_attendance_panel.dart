import 'package:flutter/material.dart';

import '../../../../../../core/extensions/build_context_x.dart';
import '../../../../../../core/models/attendance_status.dart';
import '../../../../../../core/theme/app_spacing.dart';
import '../../../../../../core/theme/status_tone.dart';
import '../../../../../../core/widgets/status_border.dart';
import '../../../../domain/models/session_participant.dart';
import 'member_peers_strip.dart';
import 'member_section_title.dart';

/// Attendance stage: the person's own mark in a big chip, with a hint.
class MemberAttendancePanel extends StatelessWidget {
  const MemberAttendancePanel({super.key, required this.me});

  final SessionParticipant me;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final attendance = me.attendance;
    final tone = MemberPeersStrip.toneOf(attendance);
    final color = context.statusColors.of(tone);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MemberSectionTitle(
          kicker: l10n.sessionMemberAttendanceKicker,
          title: me.isFacilitator
              ? l10n.sessionMemberAttendanceFacilitatorTitle
              : l10n.sessionMemberAttendanceTitle,
        ),
        const SizedBox(height: AppSpacing.lg),
        Center(
          child: Semantics(
            liveRegion: true,
            child: CustomPaint(
              foregroundPainter: StatusBorderPainter(
                color: color,
                style: tone.lineStyle,
                width: 3,
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.xl,
                  vertical: AppSpacing.md,
                ),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.14),
                  borderRadius: BorderRadius.circular(AppRadii.pill),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      MemberPeersStrip.iconOf(attendance),
                      color: color,
                      size: AppSizes.iconLg,
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Text(
                      _label(context, attendance),
                      style: context.textTheme.headlineSmall!.copyWith(
                        color: color,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        Text(
          _hint(context),
          style: context.textTheme.bodyLarge!.copyWith(
            color: context.colors.muted,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  String _label(BuildContext context, AttendanceStatus? attendance) {
    final l10n = context.l10n;
    return switch (attendance) {
      AttendanceStatus.present => l10n.attendancePresent,
      AttendanceStatus.late => l10n.attendanceLate,
      AttendanceStatus.excused => l10n.attendanceExcused,
      AttendanceStatus.absent => l10n.attendanceAbsent,
      null => l10n.sessionMemberAttendanceUnmarked,
    };
  }

  String _hint(BuildContext context) {
    final l10n = context.l10n;
    if (me.isFacilitator) return l10n.sessionMemberAttendanceFacilitatorHint;
    return switch (me.attendance) {
      null => l10n.sessionMemberAttendanceWait,
      AttendanceStatus.absent => l10n.sessionMemberAttendanceAbsentHint,
      _ => l10n.sessionMemberAttendanceOkHint,
    };
  }
}
