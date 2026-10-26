import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/extensions/build_context_x.dart';
import '../../../../../core/network/api_error_messages.dart';
import '../../../../../core/theme/app_spacing.dart';
import '../../../../../core/theme/status_tone.dart';
import '../../../../../core/widgets/app_avatar.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_message.dart';
import '../../../../../core/widgets/app_toast.dart';
import '../../../../../core/widgets/empty_state.dart';
import '../../../../../core/widgets/skeleton.dart';
import '../../../../../core/widgets/status_pill.dart';
import '../../../../admin/admin_routes.dart';
import '../../../../admin/presentation/admin_format.dart';
import '../../../../admin/presentation/widgets/admin_denied_view.dart';
import '../../../../admin/presentation/widgets/admin_page_frame.dart';
import '../../../../admin/presentation/widgets/kpi_tile.dart';
import '../../../../admin/presentation/widgets/section_card.dart';
import '../../../domain/models/kpi_member_detail.dart';
import '../../../domain/models/revealed_answers.dart';
import '../../widgets/report_data_table.dart';
import 'cubit/member_detail_cubit.dart';
import 'cubit/member_detail_state.dart';

/// One member of a table: scores, and individual answers behind a logged
/// "Mostrar respuestas" gate.
class MemberDetailPage extends StatelessWidget {
  const MemberDetailPage({
    super.key,
    required this.tableId,
    required this.personId,
  });

  final String tableId;
  final String personId;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MemberDetailCubit>();
    return AdminPageFrame(
      title: context.l10n.kpiMemberTitle,
      backFallbackLocation: AdminRoutes.tablePath(tableId),
      maxContentWidth: 960,
      onReconnect: cubit.refresh,
      onRetry: cubit.refresh,
      builder: (context, access) =>
          BlocConsumer<MemberDetailCubit, MemberDetailState>(
            listenWhen: (a, b) =>
                b.revealError != null && a.revealError != b.revealError,
            listener: (context, state) => AppToast.show(
              context,
              state.revealError!.userMessage(context.l10n),
              kind: AppToastKind.error,
            ),
            builder: (context, state) {
              final l10n = context.l10n;
              switch (state.status) {
                case MemberDetailStatus.loading:
                  return ListView(
                    padding: const EdgeInsets.symmetric(
                      vertical: AppSpacing.lg,
                    ),
                    children: const [SkeletonList(count: 4, itemHeight: 96)],
                  );
                case MemberDetailStatus.failure:
                  final kind = state.error?.kind.name;
                  if (kind == 'forbidden' || kind == 'notFound') {
                    return AdminDeniedView(
                      title: l10n.kpiMemberDeniedTitle,
                      message: l10n.kpiMemberDeniedMessage,
                      homeLocation: AdminRoutes.tablePath(tableId),
                      actionLabel: l10n.kpiBackToTable,
                    );
                  }
                  return ErrorState(
                    message: state.error?.userMessage(l10n),
                    onRetry: () =>
                        cubit.load(tableId: tableId, personId: personId),
                  );
                case MemberDetailStatus.ready:
                  return _buildMember(context, state, access.online);
              }
            },
          ),
    );
  }

  Widget _buildMember(
    BuildContext context,
    MemberDetailState state,
    bool online,
  ) {
    final l10n = context.l10n;
    final member = state.member!;
    final revealed = state.revealed;
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
      children: [
        Wrap(
          spacing: AppSpacing.md,
          runSpacing: AppSpacing.sm,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            AppAvatar(name: member.fullName, size: 52),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  (member.role == 'facilitator'
                          ? l10n.roleFacilitator
                          : l10n.roleMember)
                      .toUpperCase(),
                  style: context.textStyles.kicker,
                ),
                Text(member.fullName, style: context.textTheme.headlineMedium),
              ],
            ),
            AppButton(
              label: l10n.kpiBackToTable,
              icon: Icons.table_restaurant_rounded,
              variant: AppButtonVariant.secondary,
              size: AppButtonSize.small,
              fullWidth: false,
              onPressed: () => context.go(AdminRoutes.tablePath(tableId)),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.md),
        Wrap(
          spacing: AppSpacing.sm,
          runSpacing: AppSpacing.sm,
          children: [
            for (final tile in [
              KpiTile(
                label: l10n.kpiAttendance,
                value: AdminFormat.percent(member.attendancePct),
                detail: l10n.kpiSessionsOf(
                  member.sessionsPresent,
                  member.sessionsExpected,
                ),
              ),
              KpiTile(
                label: l10n.adminColValues,
                value: '${member.valuesCompleted}',
              ),
              KpiTile(
                label: l10n.adminColImprovement,
                value: AdminFormat.improvement(member.improvementAvg),
              ),
              KpiTile(
                label: l10n.adminColLate,
                value: '${member.syncedLateSessions}',
              ),
            ])
              SizedBox(width: 200, child: tile),
          ],
        ),
        const SizedBox(height: AppSpacing.md),
        SectionCard(
          title: l10n.kpiIndividualAnswers,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppMessage(
                tone: StatusTone.late,
                title: l10n.kpiSensitiveTitle,
                detail: revealed == null
                    ? l10n.kpiSensitiveRevealWarning
                    : l10n.kpiSensitiveRevealed,
                icon: Icons.lock_rounded,
              ),
              const SizedBox(height: AppSpacing.md),
              if (revealed == null)
                AppButton(
                  label: l10n.kpiRevealAnswers,
                  icon: Icons.visibility_rounded,
                  loading: state.revealing,
                  onPressed: online && !state.revealing
                      ? context.read<MemberDetailCubit>().reveal
                      : null,
                ),
              if (revealed == null) ...[
                const SizedBox(height: AppSpacing.md),
                _buildScores(context, member, null),
              ] else
                ..._buildRevealed(context, member, revealed),
            ],
          ),
        ),
      ],
    );
  }

  /// Scores of every value; masked until [revealed] is available.
  Widget _buildScores(
    BuildContext context,
    KpiMemberDetail member,
    RevealedPerson? revealed,
  ) {
    final l10n = context.l10n;
    if (member.scores.isEmpty) {
      return EmptyState(icon: Icons.inbox_rounded, title: l10n.kpiNoAnswersYet);
    }
    final masked = revealed == null;
    String score(int? value) =>
        masked ? '••' : (value?.toString() ?? AdminFormat.missing);
    return ReportDataTable(
      columns: [
        l10n.kpiColValue,
        l10n.kpiColInitial,
        l10n.kpiColFollowUp,
        l10n.adminColImprovement,
        l10n.kpiColSyncedLate,
      ],
      rows: [
        for (final s in member.scores)
          [
            s.valueLabel,
            score(s.initialScore),
            score(s.followUpScore),
            masked
                ? '••'
                : (s.delta == null
                      ? AdminFormat.missing
                      : AdminFormat.improvement(s.delta!.toDouble())),
            s.syncedLate ? l10n.syncSyncedLate : '',
          ],
      ],
      maxHeight: 360,
    );
  }

  List<Widget> _buildRevealed(
    BuildContext context,
    KpiMemberDetail member,
    RevealedPerson revealed,
  ) {
    final l10n = context.l10n;
    return [
      _buildScores(context, member, revealed),
      const SizedBox(height: AppSpacing.lg),
      Text(l10n.kpiReflections.toUpperCase(), style: context.textStyles.kicker),
      const SizedBox(height: AppSpacing.sm),
      if (revealed.answers.isEmpty)
        Text(l10n.kpiNoAnswersYet)
      else
        for (final answer in revealed.answers)
          Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  answer.questionText ?? '',
                  style: context.textTheme.titleSmall,
                ),
                const SizedBox(height: AppSpacing.xxs),
                Text(answer.answerText ?? ''),
                if (answer.syncedLate)
                  Padding(
                    padding: const EdgeInsets.only(top: AppSpacing.xs),
                    child: StatusPill(
                      tone: StatusTone.late,
                      label: l10n.syncSyncedLate,
                    ),
                  ),
              ],
            ),
          ),
      const SizedBox(height: AppSpacing.md),
      Text(
        l10n.kpiJustifications.toUpperCase(),
        style: context.textStyles.kicker,
      ),
      const SizedBox(height: AppSpacing.sm),
      if (revealed.assessments
          .where((a) => (a.justification ?? '').isNotEmpty)
          .isEmpty)
        Text(l10n.kpiNoAnswersYet)
      else
        for (final a in revealed.assessments.where(
          (a) => (a.justification ?? '').isNotEmpty,
        ))
          Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.sm),
            child: Text(
              '${a.valueName ?? ''} · ${a.kind == 'initial' ? l10n.assessmentCurrentValue : l10n.assessmentFollowUp} (${a.score ?? AdminFormat.missing}): ${a.justification}',
            ),
          ),
      const SizedBox(height: AppSpacing.md),
      Text(l10n.kpiCommitments.toUpperCase(), style: context.textStyles.kicker),
      const SizedBox(height: AppSpacing.sm),
      if (revealed.commitments.isEmpty)
        Text(l10n.kpiNoAnswersYet)
      else
        for (final c in revealed.commitments)
          Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.sm),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(c.actionText ?? '', style: context.textTheme.titleSmall),
                if ((c.measureText ?? '').isNotEmpty)
                  Text(c.measureText!, style: context.textTheme.bodySmall),
                if (c.followUpStatus != null)
                  Text(
                    '${l10n.kpiCommitmentFollowUp}: ${c.followUpStatus}${(c.followUpNote ?? '').isEmpty ? '' : ' · ${c.followUpNote}'}',
                    style: context.textTheme.bodySmall,
                  ),
              ],
            ),
          ),
    ];
  }
}
