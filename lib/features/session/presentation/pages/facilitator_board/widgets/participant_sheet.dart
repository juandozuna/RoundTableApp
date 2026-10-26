import 'package:flutter/material.dart';

import '../../../../../../core/extensions/build_context_x.dart';
import '../../../../../../core/theme/app_spacing.dart';
import '../../../../../../core/theme/status_tone.dart';
import '../../../../../../core/widgets/app_button.dart';
import '../../../../../../core/widgets/app_message.dart';
import '../../../../../../core/widgets/status_pill.dart';
import '../../../../domain/models/live_session.dart';
import '../../../../domain/models/member_step.dart';
import '../../../../domain/models/session_participant.dart';
import '../board_texts.dart';
import '../seat_status.dart';

/// A person's attendance and progress by step, opened from their seat.
class ParticipantSheet extends StatelessWidget {
  const ParticipantSheet({
    super.key,
    required this.session,
    required this.participant,
    required this.canSeeOthers,
    required this.showStaleWarning,
    required this.onClose,
    this.onOpenMyAnswers,
  });

  final LiveSession session;
  final SessionParticipant participant;
  final bool canSeeOthers;
  final bool showStaleWarning;
  final VoidCallback onClose;

  /// Only for the facilitator's own seat.
  final VoidCallback? onOpenMyAnswers;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final attendance =
        participant.attendance?.label(l10n) ??
        l10n.sessionBoardAttendanceUnmarked;
    final notes = [
      attendance,
      if (participant.attendanceAuto) l10n.sessionBoardAttendanceAutoNote,
      if (participant.isFacilitator) l10n.sessionBoardFacilitatorLabel,
      if (!participant.hasPreviousCommitment && session.session.hasFollowUp)
        l10n.sessionBoardNoPreviousNote,
    ];
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          notes.join(' · '),
          style: context.textTheme.bodyMedium!.copyWith(
            color: context.colors.muted,
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        for (final step in MemberStep.values) _buildRow(context, step),
        if (showStaleWarning && participant.isMe)
          Padding(
            padding: const EdgeInsets.only(top: AppSpacing.md),
            child: AppMessage(
              tone: StatusTone.pending,
              title: l10n.syncStaleWarning,
            ),
          ),
        if (onOpenMyAnswers != null)
          Padding(
            padding: const EdgeInsets.only(top: AppSpacing.md),
            child: AppButton(
              label: l10n.sessionBoardGoToMyAnswers,
              size: AppButtonSize.small,
              onPressed: onOpenMyAnswers,
            ),
          ),
        const SizedBox(height: AppSpacing.md),
        AppButton(
          label: l10n.actionClose,
          variant: AppButtonVariant.secondary,
          onPressed: onClose,
        ),
      ],
    );
  }

  Widget _buildRow(BuildContext context, MemberStep step) {
    final l10n = context.l10n;
    final status = SeatStatus.forStep(session, participant, step, canSeeOthers);
    final name = switch (step) {
      MemberStep.followUp => l10n.stageFollowUp,
      MemberStep.reflection => l10n.stageCurrentValue,
      MemberStep.commitment => l10n.stageCommitment,
    };
    return Container(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm + 1),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: context.colors.line)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name, style: context.textTheme.titleSmall),
          StatusPill(tone: status.tone, label: status.caption(l10n)),
        ],
      ),
    );
  }
}
