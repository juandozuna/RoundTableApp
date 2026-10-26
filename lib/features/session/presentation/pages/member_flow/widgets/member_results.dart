import 'package:flutter/material.dart';

import '../../../../../../core/extensions/build_context_x.dart';
import '../../../../../../core/theme/app_spacing.dart';
import '../../../../../../core/widgets/app_card.dart';
import '../../../../domain/models/live_session.dart';
import 'follow_up_status_label.dart';

/// What the person has answered so far, as score rows and quotes.
class MemberResults extends StatelessWidget {
  const MemberResults({super.key, required this.session});

  final LiveSession session;

  bool get _isEmpty {
    final responses = session.myResponses;
    return responses.followUp == null &&
        responses.reflection == null &&
        responses.commitment == null;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final responses = session.myResponses;
    final followUp = responses.followUp;
    final reflection = responses.reflection;
    final commitment = responses.commitment;
    return AppCard(
      child: _isEmpty
          ? Text(
              l10n.sessionMemberResultsEmpty,
              style: context.textTheme.bodyMedium!.copyWith(
                color: context.colors.muted,
              ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (followUp != null) ...[
                  _scoreRow(
                    context,
                    l10n.sessionMemberResultFollowUp(
                      session.followUpValue?.name ?? '',
                    ),
                    followUp.score,
                    detail: followUp.status.label(l10n),
                  ),
                ],
                if (reflection != null) ...[
                  _scoreRow(
                    context,
                    l10n.sessionMemberResultInitialScore,
                    reflection.score,
                  ),
                  for (final question in session.questions)
                    if (reflection.answers[question.id] != null)
                      _textRow(
                        context,
                        question.text,
                        reflection.answers[question.id]!,
                      ),
                ],
                if (commitment != null)
                  _textRow(
                    context,
                    l10n.sessionMemberResultCommitment,
                    [commitment.actionText, ?commitment.measureText].join('\n'),
                  ),
              ],
            ),
    );
  }

  Widget _scoreRow(
    BuildContext context,
    String label,
    int score, {
    String? detail,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: context.textTheme.labelLarge),
                if (detail != null)
                  Text(detail, style: context.textTheme.bodySmall),
              ],
            ),
          ),
          Text(
            '$score',
            style: context.textStyles.number.copyWith(
              color: context.colors.accent,
            ),
          ),
        ],
      ),
    );
  }

  Widget _textRow(BuildContext context, String label, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: context.textTheme.labelLarge),
          const SizedBox(height: AppSpacing.xxs),
          Text(
            text,
            style: context.textTheme.bodyMedium!.copyWith(
              color: context.colors.muted,
            ),
          ),
        ],
      ),
    );
  }
}
