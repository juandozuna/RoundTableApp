import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extensions/build_context_x.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/status_tone.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/empty_state.dart';
import '../../../../core/widgets/status_pill.dart';
import '../../domain/models/table_history.dart';
import '../../history_routes.dart';
import 'history_format.dart';
import 'history_section_title.dart';
import 'history_stat_tile.dart';
import 'history_window_note.dart';
import 'late_synced_pill.dart';
import 'score_comparison_chart.dart';

/// What the facilitator sees about the table: per-value averages, members
/// (each opens their timeline) and each session with its scores.
class TableHistoryView extends StatelessWidget {
  const TableHistoryView({super.key, required this.history});

  final TableHistory history;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    if (history.isEmpty) {
      return Column(
        children: [
          const HistoryWindowNote(),
          EmptyState(
            icon: Icons.timeline_rounded,
            title: l10n.historyEmptyTitle,
            message: l10n.historyEmptyMessage,
          ),
        ],
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const HistoryWindowNote(),
        const SizedBox(height: AppSpacing.lg),
        _buildStats(context),
        if (history.values.isNotEmpty) ...[
          const SizedBox(height: AppSpacing.lg),
          _buildChart(context),
        ],
        if (history.members.isNotEmpty) ...[
          HistorySectionTitle(l10n.historyMembersTitle),
          for (final member in history.members) ...[
            _buildMember(context, member),
            const SizedBox(height: AppSpacing.sm),
          ],
        ],
        if (history.values.isNotEmpty) ...[
          HistorySectionTitle(l10n.historyTableValuesTitle),
          for (final value in history.values) ...[
            _buildValue(context, value),
            const SizedBox(height: AppSpacing.sm),
          ],
        ],
        if (history.sessions.isNotEmpty) ...[
          HistorySectionTitle(l10n.historySessionsTitle),
          for (final session in history.sessions) ...[
            _buildSession(context, session),
            const SizedBox(height: AppSpacing.sm),
          ],
        ],
      ],
    );
  }

  Widget _buildStats(BuildContext context) {
    final l10n = context.l10n;
    final rate = history.attendanceRate;
    final improvement = history.averageImprovement;
    return HistoryStats(
      stats: [
        HistoryStat(
          label: l10n.historyStatSessions,
          value: '${history.closedSessions}',
        ),
        HistoryStat(
          label: l10n.historyStatAttendanceRate,
          value: rate == null ? '—' : l10n.historyPercent(rate),
        ),
        HistoryStat(
          label: l10n.historyStatImprovement,
          value: improvement == null
              ? '—'
              : '${improvement > 0 ? '+' : ''}${HistoryFormat.average(context, improvement)}',
        ),
      ],
    );
  }

  Widget _buildChart(BuildContext context) {
    final l10n = context.l10n;
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l10n.historyChartTitle, style: context.textTheme.titleMedium),
          const SizedBox(height: AppSpacing.md),
          ScoreComparisonChart(
            bars: [
              for (final value in history.values)
                ScoreBar(
                  label: '${value.sequence}',
                  initial: value.averageInitial,
                  followUp: value.averageFollowUp,
                  semanticLabel: l10n.historyChartItemSemantics(
                    value.sequence,
                    value.name,
                    HistoryFormat.average(context, value.averageInitial),
                    HistoryFormat.average(context, value.averageFollowUp),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMember(BuildContext context, TableMemberSummary member) {
    final l10n = context.l10n;
    return AppCard(
      semanticLabel: l10n.historyOpenTimeline(member.name),
      onTap: () => context.push(
        HistoryRoutes.memberTimelineOf(
          tableId: history.tableId,
          personId: member.personId,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(member.name, style: context.textTheme.titleMedium),
                Text(
                  l10n.historyMemberAverages(
                    HistoryFormat.average(context, member.averageInitial),
                    HistoryFormat.average(context, member.averageFollowUp),
                  ),
                  style: context.textTheme.bodySmall,
                ),
                Text(
                  '${l10n.historyStatAttendance}: ${l10n.historyAttendedOf(member.attendedSessions, member.closedSessions)}',
                  style: context.textTheme.bodySmall,
                ),
              ],
            ),
          ),
          if (member.isFacilitator)
            Padding(
              padding: const EdgeInsets.only(right: AppSpacing.sm),
              child: StatusPill(
                tone: StatusTone.info,
                label: l10n.historyFacilitatorTag,
              ),
            ),
          const Icon(Icons.chevron_right_rounded),
        ],
      ),
    );
  }

  Widget _buildValue(BuildContext context, TableValueSummary value) {
    final l10n = context.l10n;
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.historyValueHeading(value.sequence, value.name),
            style: context.textTheme.titleMedium,
          ),
          Text(
            l10n.historyTableValueLine(
              HistoryFormat.average(context, value.averageInitial),
              HistoryFormat.average(context, value.averageFollowUp),
              value.initialCount,
            ),
            style: context.textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }

  Widget _buildSession(BuildContext context, TableSessionSummary session) {
    final l10n = context.l10n;
    final sequence = session.valueSequence;
    final name = session.valueName;
    return AppCard(
      padding: EdgeInsets.zero,
      child: Theme(
        data: context.theme.copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.xs,
          ),
          childrenPadding: const EdgeInsets.fromLTRB(
            AppSpacing.lg,
            0,
            AppSpacing.lg,
            AppSpacing.md,
          ),
          title: Text(
            l10n.historySessionTitle(session.scheduledAt.toLocal()),
            style: context.textTheme.titleMedium,
          ),
          subtitle: Text(
            [
              if (sequence != null && name != null)
                l10n.historySessionValueLine(sequence, name),
              l10n.historySessionAttendance(
                session.attendedCount,
                session.rosterCount,
              ),
            ].join(' · '),
            style: context.textTheme.bodySmall,
          ),
          expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (final entry in session.entries) _buildEntry(context, entry),
          ],
        ),
      ),
    );
  }

  Widget _buildEntry(BuildContext context, TableSessionEntry entry) {
    final l10n = context.l10n;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.xs,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(entry.name, style: context.textTheme.titleSmall),
              StatusPill(
                tone: HistoryFormat.attendanceTone(entry.attendance),
                label: HistoryFormat.attendanceLabel(context, entry.attendance),
              ),
              if (entry.syncedLate) const LateSyncedPill(),
            ],
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            l10n.historySessionScores(
              HistoryFormat.score(entry.initialScore),
              HistoryFormat.score(entry.followUpScore),
            ),
            style: context.textTheme.bodyMedium,
          ),
          Text(
            entry.commitmentText ?? l10n.historyNoCommitment,
            style: context.textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
