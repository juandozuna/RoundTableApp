import 'package:flutter/material.dart';

import '../../../../../../core/extensions/build_context_x.dart';
import '../../../../../../core/theme/app_spacing.dart';
import '../../../../../../core/theme/status_tone.dart';
import '../../../../../../core/widgets/app_button.dart';
import '../../../../../../core/widgets/app_message.dart';
import '../../../../domain/models/member_step.dart';

/// "¿Cerrar respuestas ya?" / "¿Abrir valor actual ya?": shown when people
/// have not answered yet.
class ConfirmAdvanceSheet extends StatelessWidget {
  const ConfirmAdvanceSheet({
    super.key,
    required this.closingAnswers,
    required this.pendingNames,
    required this.myMissingSteps,
    required this.onWait,
    required this.onConfirm,
    required this.onAnswerMyself,
  });

  final bool closingAnswers;
  final List<String> pendingNames;
  final List<MemberStep> myMissingSteps;
  final VoidCallback onWait;
  final VoidCallback onConfirm;
  final VoidCallback onAnswerMyself;

  String _stepName(BuildContext context, MemberStep step) {
    final l10n = context.l10n;
    return switch (step) {
      MemberStep.followUp => l10n.stageFollowUp,
      MemberStep.reflection => l10n.stageCurrentValue,
      MemberStep.commitment => l10n.stageCommitment,
    };
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final hasMine = myMissingSteps.isNotEmpty;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (hasMine) ...[
          AppMessage(
            tone: StatusTone.pending,
            title: l10n.sessionBoardConfirmMineTitle,
            detail: l10n.sessionBoardConfirmMineBody(
              myMissingSteps.map((s) => _stepName(context, s)).join(', '),
            ),
          ),
          const SizedBox(height: AppSpacing.md),
        ],
        Text(
          pendingNames.isEmpty
              ? l10n.sessionBoardConfirmEveryoneAnswered
              : l10n.sessionBoardConfirmPending(
                  pendingNames.join(', '),
                  closingAnswers ? 'close' : 'open',
                ),
          style: context.textTheme.bodyLarge,
        ),
        const SizedBox(height: AppSpacing.lg),
        if (hasMine) ...[
          AppButton(
            label: l10n.sessionBoardAnswerNow,
            icon: Icons.person_rounded,
            onPressed: onAnswerMyself,
          ),
          const SizedBox(height: AppSpacing.sm),
        ],
        Row(
          children: [
            Expanded(
              child: AppButton(
                label: l10n.sessionBoardWait,
                variant: AppButtonVariant.secondary,
                onPressed: onWait,
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: AppButton(
                label: closingAnswers
                    ? l10n.sessionBoardCloseAnyway
                    : l10n.sessionBoardOpenNow,
                variant: hasMine
                    ? AppButtonVariant.secondary
                    : AppButtonVariant.primary,
                onPressed: onConfirm,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
