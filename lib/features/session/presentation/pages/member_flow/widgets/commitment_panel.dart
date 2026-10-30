import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/extensions/build_context_x.dart';
import '../../../../../../core/theme/app_spacing.dart';
import '../../../../../../core/theme/status_tone.dart';
import '../../../../../../core/widgets/app_card.dart';
import '../../../../../../core/widgets/app_chip.dart';
import '../../../../../../core/widgets/app_message.dart';
import '../../../../domain/models/member_flow.dart';
import '../../../../domain/models/member_step.dart';
import '../../../../domain/models/response_validation.dart';
import '../cubit/member_flow_cubit.dart';
import '../cubit/member_flow_state.dart';
import 'commitment_example_chip.dart';
import 'draft_text_field.dart';
import 'field_error_text.dart';
import 'locked_step_card.dart';
import 'member_section_title.dart';
import 'response_error_text.dart';

/// Current value, part 2: one concrete, measurable action built from three
/// guided parts: qué haré, cuándo, cómo lo mediré.
class CommitmentPanel extends StatelessWidget {
  const CommitmentPanel({super.key, required this.flow, required this.state});

  final MemberFlow flow;
  final MemberFlowState state;

  static const int whatMaxLength = 80;

  bool get _isDone => flow.isDone(MemberStep.commitment);
  bool get _isClosed =>
      flow.accessOf(MemberStep.commitment) == StepAccess.closed;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MemberSectionTitle(
          kicker: l10n.sessionMemberCommitmentKicker,
          title: l10n.sessionMemberCommitmentTitle,
        ),
        if (_isDone)
          _buildDone(context)
        else if (_isClosed)
          LockedStepCard(isFacilitator: flow.session.iAmFacilitator)
        else
          _buildForm(context),
      ],
    );
  }

  Widget _buildDone(BuildContext context) {
    final l10n = context.l10n;
    final commitment = flow.session.myResponses.commitment;
    return Padding(
      padding: const EdgeInsets.only(top: AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (commitment != null)
            AppCard(
              highlighted: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    commitment.actionText,
                    style: context.textTheme.titleMedium,
                  ),
                  if (commitment.measureText != null) ...[
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      commitment.measureText!,
                      style: context.textTheme.bodyMedium!.copyWith(
                        color: context.colors.muted,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          const SizedBox(height: AppSpacing.md),
          AppMessage(
            tone: StatusTone.ok,
            title: flow.isLive && !flow.session.iAmFacilitator
                ? l10n.sessionMemberSentWaitingFacilitator
                : l10n.sessionMemberSent,
          ),
        ],
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    final l10n = context.l10n;
    final cubit = context.read<MemberFlowCubit>();
    final errors = state.errors;
    final whenOptions = [
      l10n.sessionMemberWhenEveryDay,
      l10n.sessionMemberWhenMondayThursday,
      l10n.sessionMemberWhenThisWeek,
      l10n.sessionMemberWhenBeforeFriday,
    ];
    final howOptions = [
      l10n.sessionMemberHowCount,
      l10n.sessionMemberHowYesNo,
      l10n.sessionMemberHowSunday,
      l10n.sessionMemberHowTell,
    ];
    final examples = [
      l10n.sessionMemberWhatExample1,
      l10n.sessionMemberWhatExample2,
      l10n.sessionMemberWhatExample3,
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: AppSpacing.sm),
        Text(
          l10n.sessionMemberCommitmentHelper,
          style: context.textTheme.bodyMedium!.copyWith(
            color: context.colors.muted,
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        DraftTextField(
          key: const ValueKey('commitment-what'),
          label: l10n.sessionMemberWhatLabel,
          hint: l10n.sessionMemberWhatHint,
          text: state.commitmentWhat,
          maxLength: whatMaxLength,
          errorText: errors.messageFor(ResponseField.commitmentWhat.name, l10n),
          onChanged: cubit.setCommitmentWhat,
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          l10n.sessionMemberWhatExamplesKicker.toUpperCase(),
          style: context.textStyles.kicker,
        ),
        const SizedBox(height: AppSpacing.sm),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (final example in examples) ...[
              CommitmentExampleChip(
                text: example,
                onTap: () => cubit.setCommitmentWhat(example),
              ),
              const SizedBox(height: AppSpacing.sm),
            ],
          ],
        ),
        const SizedBox(height: AppSpacing.lg),
        _buildChoices(
          context,
          label: l10n.sessionMemberWhenLabel,
          options: whenOptions,
          selected: state.commitmentWhen,
          onSelected: cubit.setCommitmentWhen,
          error: errors.messageFor(ResponseField.commitmentWhen.name, l10n),
        ),
        const SizedBox(height: AppSpacing.lg),
        _buildChoices(
          context,
          label: l10n.sessionMemberHowLabel,
          options: howOptions,
          selected: state.commitmentHow,
          onSelected: cubit.setCommitmentHow,
          error: errors.messageFor(ResponseField.commitmentHow.name, l10n),
        ),
      ],
    );
  }

  Widget _buildChoices(
    BuildContext context, {
    required String label,
    required List<String> options,
    required String? selected,
    required ValueChanged<String> onSelected,
    required String? error,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: context.textTheme.titleMedium),
        const SizedBox(height: AppSpacing.sm),
        Wrap(
          spacing: AppSpacing.sm,
          runSpacing: AppSpacing.sm,
          children: [
            for (final option in options)
              AppChip(
                label: option,
                selected: selected == option,
                onSelected: (_) => onSelected(option),
              ),
          ],
        ),
        FieldErrorText(message: error),
      ],
    );
  }
}
