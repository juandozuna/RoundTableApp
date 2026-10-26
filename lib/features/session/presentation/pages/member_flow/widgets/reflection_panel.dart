import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/extensions/build_context_x.dart';
import '../../../../../../core/theme/app_spacing.dart';
import '../../../../../../core/theme/status_tone.dart';
import '../../../../../../core/widgets/app_message.dart';
import '../../../../../../core/widgets/score_grid.dart';
import '../../../../domain/models/member_flow.dart';
import '../../../../domain/models/member_step.dart';
import '../../../../domain/models/response_validation.dart';
import '../cubit/member_flow_cubit.dart';
import '../cubit/member_flow_state.dart';
import 'draft_text_field.dart';
import 'locked_step_card.dart';
import 'member_results.dart';
import 'member_section_title.dart';
import 'response_error_text.dart';

/// Current value, part 1: the reflection questions and the initial score.
class ReflectionPanel extends StatelessWidget {
  const ReflectionPanel({super.key, required this.flow, required this.state});

  final MemberFlow flow;
  final MemberFlowState state;

  bool get _isDone => flow.isDone(MemberStep.reflection);
  bool get _isClosed =>
      flow.accessOf(MemberStep.reflection) == StepAccess.closed;

  @override
  Widget build(BuildContext context) {
    final session = flow.session;
    final value = session.value;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MemberSectionTitle(
          kicker: context.l10n.sessionMemberReflectionKicker(value.sequence),
          title: value.name,
        ),
        if (_isDone)
          _buildDone(context)
        else if (_isClosed)
          LockedStepCard(isFacilitator: session.iAmFacilitator)
        else
          _buildForm(context),
      ],
    );
  }

  Widget _buildDone(BuildContext context) => Padding(
    padding: const EdgeInsets.only(top: AppSpacing.md),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MemberResults(session: flow.session),
        const SizedBox(height: AppSpacing.md),
        AppMessage(
          tone: StatusTone.ok,
          title: flow.isLive && !flow.session.iAmFacilitator
              ? context.l10n.sessionMemberSentLive
              : context.l10n.sessionMemberSavedOffline,
        ),
      ],
    ),
  );

  Widget _buildForm(BuildContext context) {
    final l10n = context.l10n;
    final cubit = context.read<MemberFlowCubit>();
    final session = flow.session;
    final errors = state.errors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: AppSpacing.sm),
        Text(
          l10n.sessionMemberReflectionHelper,
          style: context.textTheme.bodyMedium!.copyWith(
            color: context.colors.muted,
          ),
        ),
        for (final question in session.questions) ...[
          const SizedBox(height: AppSpacing.lg),
          DraftTextField(
            key: ValueKey('answer-${question.id}'),
            label: question.text,
            text: state.answers[question.id] ?? '',
            maxLength: 140,
            errorText: errors.messageFor(
              ResponseValidator.answerField(question.id),
              l10n,
            ),
            onChanged: (text) => cubit.setAnswer(question.id, text),
          ),
        ],
        const SizedBox(height: AppSpacing.lg),
        Text(
          l10n.sessionMemberReflectionScoreLabel(session.value.name),
          style: context.textTheme.titleMedium,
        ),
        const SizedBox(height: AppSpacing.sm),
        ScoreGrid(
          value: state.reflectionScore,
          onChanged: cubit.setReflectionScore,
          errorText: errors.messageFor(
            ResponseField.reflectionScore.name,
            l10n,
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        DraftTextField(
          key: const ValueKey('reflection-justification'),
          label: l10n.sessionMemberJustificationLabel,
          hint: l10n.sessionMemberJustificationHint,
          text: state.reflectionJustification,
          maxLength: 200,
          onChanged: cubit.setReflectionJustification,
        ),
      ],
    );
  }
}
