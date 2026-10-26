import 'package:flutter/material.dart';

import '../../../../../../core/extensions/build_context_x.dart';
import '../../../../../../core/models/attendance_status.dart';
import '../../../../../../core/theme/app_spacing.dart';
import '../../../../../../core/theme/status_tone.dart';
import '../../../../../../core/widgets/app_avatar.dart';
import '../../../../../../l10n/gen/app_localizations.dart';
import '../../../../domain/models/live_session.dart';
import '../../../../domain/models/session_participant.dart';

/// Who is at the table, from synced attendance. Members only know the
/// attendance of others, never their answers (PC-10). Each seat pairs the
/// ring colour with a line style and an icon.
class MemberPeersStrip extends StatelessWidget {
  const MemberPeersStrip({super.key, required this.session});

  final LiveSession session;

  @override
  Widget build(BuildContext context) {
    final count = session.participants.length;
    final size = count <= 6 ? 40.0 : (count <= 8 ? 34.0 : 30.0);
    return Semantics(
      container: true,
      label: context.l10n.sessionMemberPeersLabel,
      child: Wrap(
        spacing: AppSpacing.sm,
        runSpacing: AppSpacing.md,
        children: [
          for (final participant in session.participants)
            _buildSeat(context, participant, size),
        ],
      ),
    );
  }

  Widget _buildSeat(
    BuildContext context,
    SessionParticipant participant,
    double size,
  ) {
    final l10n = context.l10n;
    final tone = toneOf(participant.attendance);
    final badge = iconOf(participant.attendance);
    final color = context.statusColors.of(tone);
    final label = _semanticLabel(l10n, participant);
    return Semantics(
      label: label,
      image: true,
      excludeSemantics: true,
      child: SizedBox(
        width: size + 8,
        child: Column(
          children: [
            SizedBox.square(
              dimension: size + 6,
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  AppAvatar(
                    name: participant.fullName,
                    size: size,
                    ringTone: tone,
                  ),
                  Positioned(
                    right: -4,
                    top: -4,
                    child: _Badge(icon: badge, color: color),
                  ),
                  if (participant.isFacilitator)
                    Positioned(
                      left: -4,
                      top: -4,
                      child: _Badge(
                        icon: Icons.workspace_premium_rounded,
                        color: context.colors.accentStrong,
                      ),
                    ),
                ],
              ),
            ),
            if (participant.isMe)
              Text(
                l10n.sessionMemberYouMark,
                style: context.textTheme.labelSmall!.copyWith(
                  color: context.colors.accent,
                  letterSpacing: 0.4,
                ),
              ),
          ],
        ),
      ),
    );
  }

  static String _semanticLabel(
    AppLocalizations l10n,
    SessionParticipant participant,
  ) {
    final name = participant.isFacilitator
        ? '${participant.fullName} (${l10n.sessionMemberFacilitatorSuffix})'
        : participant.fullName;
    return switch (participant.attendance) {
      AttendanceStatus.present => l10n.sessionMemberPeerPresent(name),
      AttendanceStatus.late => l10n.sessionMemberPeerLate(name),
      AttendanceStatus.excused => l10n.sessionMemberPeerExcused(name),
      AttendanceStatus.absent => l10n.sessionMemberPeerAbsent(name),
      null => l10n.sessionMemberPeerUnmarked(name),
    };
  }

  /// Ring tone for an attendance mark; unmarked reads as pending (dotted).
  static StatusTone toneOf(AttendanceStatus? attendance) =>
      switch (attendance) {
        AttendanceStatus.present => StatusTone.ok,
        AttendanceStatus.late => StatusTone.late,
        AttendanceStatus.excused => StatusTone.info,
        AttendanceStatus.absent => StatusTone.offline,
        null => StatusTone.pending,
      };

  static IconData iconOf(AttendanceStatus? attendance) => switch (attendance) {
    AttendanceStatus.present => Icons.check_rounded,
    AttendanceStatus.late => Icons.schedule_rounded,
    AttendanceStatus.excused => Icons.remove_rounded,
    AttendanceStatus.absent => Icons.close_rounded,
    null => Icons.more_horiz_rounded,
  };
}

class _Badge extends StatelessWidget {
  const _Badge({required this.icon, required this.color});

  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 16,
      height: 16,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(color: context.colors.background, width: 1.5),
      ),
      child: Icon(icon, size: 10, color: context.statusColors.onStatus),
    );
  }
}
