import 'package:flutter/material.dart';

import '../../../../../../core/extensions/build_context_x.dart';
import '../../../../../../core/models/attendance_status.dart';
import '../../../../../../core/theme/app_spacing.dart';
import '../../../../../../core/theme/status_tone.dart';
import '../../../../../../core/widgets/app_avatar.dart';
import '../../../../domain/models/session_participant.dart';
import '../board_texts.dart';
import '../seat_status.dart';

/// One person at the round table: avatar with a status ring (colour, line
/// style and badge icon), crown for the facilitator, attendance chip, name
/// and caption. Tapping opens the person's sheet.
class SeatView extends StatelessWidget {
  const SeatView({
    super.key,
    required this.participant,
    required this.status,
    required this.avatarSize,
    required this.width,
    required this.onTap,
    this.showAttendanceChip = false,
    this.highlighted = false,
    this.stateHint,
  });

  final SessionParticipant participant;
  final SeatStatus status;
  final double avatarSize;
  final double width;
  final VoidCallback onTap;

  /// Shows the A/T/E mark once attendance is behind us.
  final bool showAttendanceChip;

  /// Draws attention to a seat that blocks moving on (no attendance mark).
  final bool highlighted;

  /// Extra spoken state, e.g. hours without syncing.
  final String? stateHint;

  StatusTone get _ringTone => highlighted ? StatusTone.error : status.tone;

  String? _attendanceChipText(BuildContext context) {
    if (participant.attendanceAuto) {
      return context.l10n.sessionBoardSeatAutoChip;
    }
    if (!showAttendanceChip) return null;
    return switch (participant.attendance) {
      AttendanceStatus.absent => 'A',
      AttendanceStatus.late => 'T',
      AttendanceStatus.excused => 'E',
      _ => null,
    };
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final caption = status.caption(l10n);
    final name = participant.firstName;
    final spoken = [
      if (participant.isFacilitator) l10n.sessionBoardFacilitatorLabel,
      participant.fullName,
      if (caption.isNotEmpty) caption,
      ?stateHint,
    ].join(', ');
    return Semantics(
      button: true,
      label: spoken,
      excludeSemantics: true,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadii.lg),
        child: SizedBox(
          width: width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildAvatar(context),
              const SizedBox(height: AppSpacing.xs),
              Text(
                name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.textTheme.labelMedium,
              ),
              if (caption.isNotEmpty)
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    caption,
                    maxLines: 1,
                    style: context.textTheme.labelSmall!.copyWith(
                      color: context.statusColors.of(_ringTone),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAvatar(BuildContext context) {
    final color = context.statusColors.of(_ringTone);
    final chip = _attendanceChipText(context);
    return SizedBox(
      width: avatarSize + 14,
      height: avatarSize + 8,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          AppAvatar(
            name: participant.fullName,
            size: avatarSize,
            ringTone: _ringTone,
            semanticLabel: participant.fullName,
          ),
          if (status.icon != null)
            Positioned(
              right: 0,
              top: -2,
              child: _buildBadge(context, color, status.icon!),
            ),
          if (participant.isFacilitator)
            Positioned(left: 0, top: -2, child: _buildCrown(context)),
          if (chip != null)
            Positioned(left: -2, bottom: 8, child: _buildChip(context, chip)),
          if (status.pips.isNotEmpty)
            Positioned(bottom: -4, child: _buildPips(context)),
        ],
      ),
    );
  }

  Widget _buildBadge(BuildContext context, Color color, IconData icon) {
    return Container(
      width: 22,
      height: 22,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(color: context.colors.background, width: 2),
      ),
      child: Icon(icon, size: 13, color: context.statusColors.onStatus),
    );
  }

  Widget _buildCrown(BuildContext context) {
    return Container(
      width: 22,
      height: 22,
      decoration: BoxDecoration(
        color: context.colors.accentStrong,
        shape: BoxShape.circle,
        border: Border.all(color: context.colors.background, width: 2),
      ),
      child: Icon(
        Icons.workspace_premium_rounded,
        size: 13,
        color: context.colors.onAccent,
      ),
    );
  }

  Widget _buildChip(BuildContext context, String text) {
    final auto = participant.attendanceAuto;
    final colors = context.colors;
    return Container(
      constraints: const BoxConstraints(minWidth: 20, minHeight: 20),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: auto ? context.statusColors.ok : colors.surfaceAlt,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: colors.background, width: 1.5),
      ),
      child: Text(
        text,
        style: context.textTheme.labelSmall!.copyWith(
          color: auto ? context.statusColors.onStatus : colors.ink,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }

  Widget _buildPips(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
      decoration: BoxDecoration(
        color: context.colors.background,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (final tone in status.pips)
            Container(
              width: 10,
              height: 10,
              margin: const EdgeInsets.symmetric(horizontal: 1.5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: tone == StatusTone.ok || tone == StatusTone.late
                    ? context.statusColors.of(tone)
                    : null,
                border: Border.all(
                  color: context.statusColors.of(tone),
                  width: 2,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
