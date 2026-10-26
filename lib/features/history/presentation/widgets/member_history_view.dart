import 'package:flutter/material.dart';

import '../../../../core/extensions/build_context_x.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/empty_state.dart';
import '../../domain/models/member_history.dart';
import 'history_format.dart';
import 'history_section_title.dart';
import 'history_stat_tile.dart';
import 'history_window_note.dart';
import 'score_comparison_chart.dart';
import 'session_record_tile.dart';
import 'value_progress_card.dart';

/// A person's history: summary, initial vs follow-up chart, values grouped
/// by module and the sessions attended. Used for the member's own screen and
/// for the facilitator's member timeline.
class MemberHistoryView extends StatelessWidget {
  const MemberHistoryView({super.key, required this.history});

  final MemberHistory history;

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
        if (_chartBars(context).isNotEmpty) ...[
          const SizedBox(height: AppSpacing.lg),
          _buildChart(context),
        ],
        if (history.values.isNotEmpty) ...[
          HistorySectionTitle(l10n.historyValuesTitle),
          ..._buildModules(context),
        ],
        if (history.sessions.isNotEmpty) ...[
          HistorySectionTitle(l10n.historySessionsTitle),
          for (final record in history.sessions) ...[
            SessionRecordTile(record: record),
            const SizedBox(height: AppSpacing.sm),
          ],
        ],
      ],
    );
  }

  Widget _buildStats(BuildContext context) {
    final l10n = context.l10n;
    return HistoryStats(
      stats: [
        HistoryStat(
          label: l10n.historyStatAttendance,
          value: l10n.historyAttendedOf(
            history.attendedSessions,
            history.closedSessions,
          ),
        ),
        HistoryStat(
          label: l10n.historyStatInitial,
          value: HistoryFormat.average(context, history.averageInitial),
        ),
        HistoryStat(
          label: l10n.historyStatFollowUp,
          value: HistoryFormat.average(context, history.averageFollowUp),
        ),
        HistoryStat(
          label: l10n.historyStatImprovement,
          value: _signed(context, history.averageImprovement),
        ),
      ],
    );
  }

  String _signed(BuildContext context, double? value) {
    if (value == null) return '—';
    final text = HistoryFormat.average(context, value);
    return value > 0 ? '+$text' : text;
  }

  List<ScoreBar> _chartBars(BuildContext context) {
    final l10n = context.l10n;
    return [
      for (final value in history.values)
        if (value.initialScore != null || value.followUpScore != null)
          ScoreBar(
            label: '${value.sequence}',
            initial: value.initialScore?.toDouble(),
            followUp: value.followUpScore?.toDouble(),
            semanticLabel: l10n.historyChartItemSemantics(
              value.sequence,
              value.name,
              value.initialScore?.toString() ?? l10n.historyScoreMissing,
              value.followUpScore?.toString() ?? l10n.historyScoreMissing,
            ),
          ),
    ];
  }

  Widget _buildChart(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.historyChartTitle,
            style: context.textTheme.titleMedium,
          ),
          const SizedBox(height: AppSpacing.md),
          ScoreComparisonChart(bars: _chartBars(context)),
        ],
      ),
    );
  }

  /// Value cards under their module heading, two columns when wide.
  List<Widget> _buildModules(BuildContext context) {
    final l10n = context.l10n;
    final groups = <int?, List<ValueProgress>>{};
    for (final value in history.values) {
      groups.putIfAbsent(value.moduleNumber, () => []).add(value);
    }
    return [
      for (final entry in groups.entries) ...[
        if (entry.key != null)
          Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.sm),
            child: Text(
              l10n.historyModuleHeading(
                entry.key!,
                entry.value.first.moduleName ?? '',
              ),
              style: context.textStyles.kicker,
            ),
          ),
        LayoutBuilder(
          builder: (context, constraints) {
            final columns = constraints.maxWidth >= 720 ? 2 : 1;
            final width =
                (constraints.maxWidth - AppSpacing.md * (columns - 1)) /
                columns;
            return Wrap(
              spacing: AppSpacing.md,
              runSpacing: AppSpacing.md,
              children: [
                for (final value in entry.value)
                  SizedBox(
                    width: width,
                    child: ValueProgressCard(value: value),
                  ),
              ],
            );
          },
        ),
        const SizedBox(height: AppSpacing.lg),
      ],
    ];
  }
}
