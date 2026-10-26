import 'package:flutter/material.dart';

import '../../../../core/extensions/build_context_x.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/status_pill.dart';
import '../../domain/models/member_history.dart';
import 'history_format.dart';
import 'improvement_badge.dart';
import 'late_synced_pill.dart';

/// One value of a person's history: both scores, why, and the commitment.
class ValueProgressCard extends StatelessWidget {
  const ValueProgressCard({super.key, required this.value});

  final ValueProgress value;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final commitment = value.commitment;
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.historyValueHeading(value.sequence, value.name),
            style: context.textTheme.titleMedium,
          ),
          const SizedBox(height: AppSpacing.sm),
          Wrap(
            spacing: AppSpacing.lg,
            runSpacing: AppSpacing.xs,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(
                l10n.historyScoreInitialLine(
                  HistoryFormat.score(value.initialScore),
                ),
                style: context.textTheme.bodyLarge,
              ),
              Text(
                l10n.historyScoreFollowUpLine(
                  HistoryFormat.score(value.followUpScore),
                ),
                style: context.textTheme.bodyLarge,
              ),
              ImprovementBadge(points: value.improvement),
              if (value.hasLateData) const LateSyncedPill(),
            ],
          ),
          if (value.initialJustification != null ||
              value.followUpJustification != null) ...[
            const SizedBox(height: AppSpacing.md),
            Text(
              l10n.historyWhyKicker.toUpperCase(),
              style: context.textStyles.kicker,
            ),
            if (value.initialJustification != null)
              _buildQuote(
                context,
                '${l10n.historyLegendInitial}: ${value.initialJustification}',
              ),
            if (value.followUpJustification != null)
              _buildQuote(
                context,
                '${l10n.historyLegendFollowUp}: ${value.followUpJustification}',
              ),
          ],
          if (commitment != null) ...[
            const SizedBox(height: AppSpacing.md),
            _buildCommitment(context, commitment),
          ],
        ],
      ),
    );
  }

  Widget _buildQuote(BuildContext context, String text) => Padding(
    padding: const EdgeInsets.only(top: AppSpacing.xs),
    child: Text(text, style: context.textTheme.bodyMedium),
  );

  Widget _buildCommitment(BuildContext context, CommitmentProgress commitment) {
    final l10n = context.l10n;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.historyCommitmentKicker.toUpperCase(),
          style: context.textStyles.kicker,
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(commitment.actionText, style: context.textTheme.bodyLarge),
        if (commitment.measureText != null)
          Text(
            l10n.historyCommitmentMeasure(commitment.measureText!),
            style: context.textTheme.bodySmall,
          ),
        const SizedBox(height: AppSpacing.sm),
        StatusPill(
          tone: HistoryFormat.followUpTone(commitment.status),
          label: HistoryFormat.followUpLabel(context, commitment.status),
        ),
        if (commitment.note != null)
          Padding(
            padding: const EdgeInsets.only(top: AppSpacing.xs),
            child: Text(
              l10n.historyCommitmentNote(commitment.note!),
              style: context.textTheme.bodySmall,
            ),
          ),
      ],
    );
  }
}
