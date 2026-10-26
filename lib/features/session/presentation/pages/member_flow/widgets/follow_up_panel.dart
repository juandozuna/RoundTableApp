import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/extensions/build_context_x.dart';
import '../../../../../../core/theme/app_spacing.dart';
import '../../../../../../core/theme/status_tone.dart';
import '../../../../../../core/widgets/app_card.dart';
import '../../../../../../core/widgets/app_message.dart';
import '../../../../../../core/widgets/score_grid.dart';
import '../../../../domain/models/commitment_follow_up_status.dart';
import '../../../../domain/models/member_flow.dart';
import '../../../../domain/models/member_step.dart';
import '../../../../domain/models/response_validation.dart';
import '../cubit/member_flow_cubit.dart';
import '../cubit/member_flow_state.dart';
import 'choice_option.dart';
import 'draft_text_field.dart';
import 'field_error_text.dart';
import 'follow_up_status_label.dart';
import 'locked_step_card.dart';
import 'member_notice_panel.dart';
import 'member_results.dart';
import 'member_section_title.dart';
import 'response_error_text.dart';

/// Follow-up of last week's commitment: how it went and the follow-up score.
/// Shows the gentle "no previous commitment" card when there is nothing to
/// review.
class FollowUpPanel extends StatelessWidget {
  const FollowUpPanel({super.key, required this.flow, required this.state});

  final MemberFlow flow;
  final MemberFlowState state;

  bool get _hasNothingToReview => !flow.applies(MemberStep.followUp);
  bool get _isDone => flow.isDone(MemberStep.followUp);
  bool get _isClosed => flow.accessOf(MemberStep.followUp) == StepAccess.closed;

  @override
  Widget build(BuildContext context) {
    final session = flow.session;
    final l10n = context.l10n;
    final value = session.followUpValue;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MemberSectionTitle(
          kicker: value == null
              ? l10n.stageFollowUp
              : l10n.sessionMemberFollowUpKicker(value.sequence),
          title: value?.name,
        ),
        if (_hasNothingToReview)
          _buildNothingToReview(context)
        else if (_isDone)
          _buildDone(context)
        else if (_isClosed)
          LockedStepCard(isFacilitator: session.iAmFacilitator)
        else
          _buildForm(context),
      ],
    );
  }

  Widget _buildNothingToReview(BuildContext context) {
    final l10n = context.l10n;
    final firstSession = !flow.session.session.hasFollowUp;
    return MemberNoticePanel(
      leading: Icon(
        Icons.groups_rounded,
        size: 40,
        color: context.colors.accent,
      ),
      title: firstSession
          ? l10n.sessionMemberFirstSessionTitle
          : l10n.sessionMemberNoPreviousTitle,
      message: firstSession
          ? l10n.sessionMemberFirstSessionMessage
          : l10n.sessionMemberNoPreviousMessage,
    );
  }

  Widget _buildDone(BuildContext context) {
    final l10n = context.l10n;
    return Padding(
      padding: const EdgeInsets.only(top: AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MemberResults(session: flow.session),
          const SizedBox(height: AppSpacing.md),
          AppMessage(
            tone: StatusTone.ok,
            title: flow.isLive && !flow.session.iAmFacilitator
                ? l10n.sessionMemberSentLive
                : l10n.sessionMemberSavedOffline,
          ),
        ],
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    final l10n = context.l10n;
    final cubit = context.read<MemberFlowCubit>();
    final previous = flow.session.previousCommitment;
    final errors = state.errors;
    final valueName = flow.session.followUpValue?.name ?? '';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: AppSpacing.md),
        Text(
          l10n.sessionMemberPreviousCommitmentKicker.toUpperCase(),
          style: context.textStyles.kicker,
        ),
        const SizedBox(height: AppSpacing.xs),
        if (previous != null) _buildQuote(context, previous.actionText),
        const SizedBox(height: AppSpacing.lg),
        Text(l10n.sessionMemberHowItWent, style: context.textTheme.titleMedium),
        const SizedBox(height: AppSpacing.sm),
        Semantics(
          container: true,
          label: l10n.sessionMemberHowItWent,
          child: Column(
            children: [
              for (final status in CommitmentFollowUpStatus.values) ...[
                ChoiceOption(
                  label: status.label(l10n),
                  selected: state.followUpStatus == status,
                  onSelected: () => cubit.setFollowUpStatus(status),
                ),
                const SizedBox(height: AppSpacing.sm),
              ],
            ],
          ),
        ),
        FieldErrorText(
          message: errors.messageFor(ResponseField.followUpStatus.name, l10n),
        ),
        const SizedBox(height: AppSpacing.lg),
        DraftTextField(
          label: l10n.sessionMemberFollowUpNoteLabel,
          text: state.followUpNote,
          maxLength: 80,
          maxLines: 1,
          onChanged: cubit.setFollowUpNote,
        ),
        const SizedBox(height: AppSpacing.lg),
        Text(
          l10n.sessionMemberFollowUpScoreLabel(valueName),
          style: context.textTheme.titleMedium,
        ),
        const SizedBox(height: AppSpacing.sm),
        ScoreGrid(
          value: state.followUpScore,
          onChanged: cubit.setFollowUpScore,
          errorText: errors.messageFor(ResponseField.followUpScore.name, l10n),
        ),
        const SizedBox(height: AppSpacing.lg),
        DraftTextField(
          key: const ValueKey('follow-up-justification'),
          label: l10n.sessionMemberJustificationLabel,
          hint: l10n.sessionMemberJustificationHint,
          text: state.followUpJustification,
          maxLength: 200,
          onChanged: cubit.setFollowUpJustification,
        ),
      ],
    );
  }

  Widget _buildQuote(BuildContext context, String text) {
    return AppCard(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 5,
            height: 44,
            decoration: BoxDecoration(
              color: context.colors.accent,
              borderRadius: BorderRadius.circular(AppRadii.pill),
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(child: Text(text, style: context.textTheme.titleMedium)),
        ],
      ),
    );
  }
}
