import 'package:flutter/material.dart';

import '../../../../../../core/extensions/build_context_x.dart';
import '../../../../../../core/models/attendance_status.dart';
import '../../../../../../core/theme/app_spacing.dart';
import '../../../../../../core/theme/status_tone.dart';
import '../../../../../../core/widgets/app_card.dart';
import '../../../../../../core/widgets/app_message.dart';
import '../../../../../../l10n/gen/app_localizations.dart';
import '../../../../domain/models/member_flow.dart';
import 'member_peers_strip.dart';
import 'member_results.dart';
import 'member_section_title.dart';

/// Closed session, from the person's point of view: thanks, their
/// attendance (automatic or not) and what they sent.
class MemberSummaryPanel extends StatelessWidget {
  const MemberSummaryPanel({super.key, required this.flow});

  final MemberFlow flow;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final me = flow.session.me;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MemberSectionTitle(
          kicker: l10n.sessionMemberSummaryKicker,
          title: l10n.sessionMemberSummaryThanks(me.firstName),
        ),
        const SizedBox(height: AppSpacing.md),
        AppCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.sessionMemberSummaryAttendance.toUpperCase(),
                style: context.textStyles.kicker,
              ),
              const SizedBox(height: AppSpacing.xs),
              Row(
                children: [
                  Icon(
                    MemberPeersStrip.iconOf(me.attendance),
                    color: context.statusColors.of(
                      MemberPeersStrip.toneOf(me.attendance),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Text(
                    _attendanceText(l10n, me.attendance, me.attendanceAuto),
                    style: context.textTheme.titleLarge,
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        MemberResults(session: flow.session),
        if (!flow.isFinished) ...[
          const SizedBox(height: AppSpacing.md),
          AppMessage(
            tone: StatusTone.info,
            title: l10n.sessionMemberSummaryUnanswered,
          ),
        ],
      ],
    );
  }

  static String _attendanceText(
    AppLocalizations l10n,
    AttendanceStatus? attendance,
    bool auto,
  ) {
    final label = switch (attendance) {
      AttendanceStatus.present => l10n.attendancePresent,
      AttendanceStatus.late => l10n.attendanceLate,
      AttendanceStatus.excused => l10n.attendanceExcused,
      AttendanceStatus.absent => l10n.attendanceAbsent,
      null => l10n.sessionMemberUnmarked,
    };
    return auto ? '$label · ${l10n.sessionMemberSummaryAutomatic}' : label;
  }
}
