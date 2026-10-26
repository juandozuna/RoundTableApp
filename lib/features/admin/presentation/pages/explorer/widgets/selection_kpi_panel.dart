import 'package:flutter/material.dart';

import '../../../../../../core/extensions/build_context_x.dart';
import '../../../../../../core/theme/app_spacing.dart';
import '../../../../../../core/theme/status_tone.dart';
import '../../../../../../core/widgets/app_button.dart';
import '../../../../../../core/widgets/app_message.dart';
import '../../../../../../core/widgets/status_pill.dart';
import '../../../../domain/explorer/explorer_engine.dart';
import '../../../../domain/models/explorer_query.dart';
import '../../../../domain/models/table_aggregate.dart';
import '../../../admin_format.dart';
import '../../../widgets/kpi_tile.dart';
import '../cubit/explorer_state.dart';

/// KPIs of the selected rows (or of the whole current view when nothing is
/// selected) — the Explorador's side panel / bottom sheet.
class SelectionKpiPanel extends StatelessWidget {
  const SelectionKpiPanel({
    super.key,
    required this.state,
    required this.online,
    required this.onOpenReports,
    required this.onExport,
    required this.onClear,
    required this.onRemove,
  });

  final ExplorerState state;
  final bool online;
  final VoidCallback onOpenReports;
  final VoidCallback onExport;
  final VoidCallback onClear;
  final ValueChanged<String> onRemove;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final has = state.hasSelection;
    final title = has ? l10n.adminSelection : l10n.adminCurrentView;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          '${title.toUpperCase()} · ${_summary(context)}',
          style: context.textStyles.kicker,
        ),
        const SizedBox(height: AppSpacing.sm),
        if (state.entity == ExplorerEntity.people)
          _buildPeople(context)
        else
          _buildKpis(context, state.aggregate),
        const SizedBox(height: AppSpacing.md),
        if (has) ..._buildSelected(context),
        if (!has)
          Text(l10n.adminSelectionHint, style: context.textTheme.bodySmall),
        const SizedBox(height: AppSpacing.lg),
        if (state.entity != ExplorerEntity.people)
          AppButton(
            label: l10n.adminOpenInReports,
            icon: Icons.bar_chart_rounded,
            size: AppButtonSize.small,
            onPressed: state.aggregate.tables == 0 ? null : onOpenReports,
          ),
        const SizedBox(height: AppSpacing.sm),
        AppButton(
          label: l10n.adminExportCsv,
          icon: Icons.download_rounded,
          variant: AppButtonVariant.secondary,
          onPressed: onExport,
        ),
        if (has) ...[
          const SizedBox(height: AppSpacing.sm),
          AppButton(
            label: l10n.adminClearSelection,
            variant: AppButtonVariant.ghost,
            onPressed: onClear,
          ),
        ],
      ],
    );
  }

  String _summary(BuildContext context) {
    final l10n = context.l10n;
    if (state.entity == ExplorerEntity.people) {
      final n = state.hasSelection
          ? state.selection.length
          : state.people.length;
      return l10n.adminPeopleCount(n);
    }
    if (state.entity == ExplorerEntity.organizations && state.hasSelection) {
      return l10n.adminOrganizationsCount(state.selection.length);
    }
    return l10n.adminTablesCount(state.aggregate.tables);
  }

  Widget _buildKpis(BuildContext context, TableAggregate a) {
    final l10n = context.l10n;
    if (a.tables == 0) {
      return AppMessage(
        tone: StatusTone.info,
        title: l10n.adminNoTablesToAggregate,
      );
    }
    final total = a.tables;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: AppSpacing.sm,
          crossAxisSpacing: AppSpacing.sm,
          childAspectRatio: 1.45,
          children: [
            KpiTile(
              label: l10n.kpiValuesCompleted,
              value: '${a.valuesCompleted}',
            ),
            KpiTile(
              label: l10n.kpiEstimatedImprovement,
              value: AdminFormat.improvement(a.improvementAvg),
              unit: l10n.kpiPointsUnit,
            ),
            KpiTile(
              label: l10n.kpiAttendance,
              value: a.attendancePct == null
                  ? AdminFormat.missing
                  : '${a.attendancePct!.round()}',
              unit: a.attendancePct == null ? null : '%',
            ),
            KpiTile(label: l10n.kpiSyncedLate, value: '${a.syncedLateRows}'),
          ],
        ),
        const SizedBox(height: AppSpacing.md),
        Text(
          l10n.kpiTablesByStatus.toUpperCase(),
          style: context.textStyles.kicker,
        ),
        const SizedBox(height: AppSpacing.xs),
        _buildStatusBar(context, a, total),
        const SizedBox(height: AppSpacing.xs),
        Wrap(
          spacing: AppSpacing.xs,
          runSpacing: AppSpacing.xs,
          children: [
            StatusPill(
              tone: StatusTone.ok,
              label: l10n.kpiTablesActive(a.active),
            ),
            StatusPill(
              tone: StatusTone.late,
              label: l10n.kpiTablesDelayed(a.delayed),
              icon: Icons.schedule_rounded,
            ),
            StatusPill(
              tone: StatusTone.offline,
              label: l10n.kpiTablesInactive(a.inactive),
              icon: Icons.pause_circle_rounded,
            ),
          ],
        ),
        if (a.lowAttendance > 0) ...[
          const SizedBox(height: AppSpacing.md),
          AppMessage(
            tone: StatusTone.pending,
            title: l10n.adminLowAttendanceTables(a.lowAttendance),
            detail: l10n.adminLowAttendanceThreshold,
          ),
        ],
      ],
    );
  }

  Widget _buildStatusBar(BuildContext context, TableAggregate a, int total) {
    final status = context.statusColors;
    Widget segment(int count, Color color) => count == 0
        ? const SizedBox.shrink()
        : Expanded(
            flex: count,
            child: ColoredBox(color: color),
          );
    return Semantics(
      label: context.l10n.kpiTablesByStatus,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(7),
        child: SizedBox(
          height: 12,
          child: Row(
            children: [
              segment(a.active, status.ok),
              segment(a.delayed, status.pending),
              segment(a.inactive, status.offline),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPeople(BuildContext context) {
    final l10n = context.l10n;
    final base = state.hasSelection
        ? state.people.where((p) => state.selection.contains(p.id)).toList()
        : state.people;
    int count(PersonKind kind) =>
        base.where((p) => ExplorerEngine.personKind(p) == kind).length;
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: AppSpacing.sm,
      crossAxisSpacing: AppSpacing.sm,
      childAspectRatio: 1.7,
      children: [
        KpiTile(
          label: l10n.roleCoordinator,
          value: '${count(PersonKind.coordinator)}',
        ),
        KpiTile(
          label: l10n.roleFacilitator,
          value: '${count(PersonKind.facilitator)}',
        ),
        KpiTile(label: l10n.roleMember, value: '${count(PersonKind.member)}'),
        KpiTile(
          label: l10n.adminViewPendingInvites,
          value: '${base.where((p) => p.status.name == 'invited').length}',
        ),
      ],
    );
  }

  List<Widget> _buildSelected(BuildContext context) {
    final l10n = context.l10n;
    final labels = <String, String>{
      for (final t in state.tables) t.id: t.code,
      for (final o in state.organizations) o.id: o.organization.name,
      for (final p in state.people) p.id: p.fullName,
    };
    final ids = state.selection.toList();
    return [
      Text(l10n.adminSelected.toUpperCase(), style: context.textStyles.kicker),
      const SizedBox(height: AppSpacing.xs),
      Wrap(
        spacing: AppSpacing.xs,
        runSpacing: AppSpacing.xs,
        children: [
          for (final id in ids.take(12))
            InputChip(
              label: Text(labels[id] ?? id),
              onDeleted: () => onRemove(id),
              deleteButtonTooltipMessage: l10n.adminRemoveFromSelection(
                labels[id] ?? id,
              ),
            ),
          if (ids.length > 12) Text('+${ids.length - 12}'),
        ],
      ),
    ];
  }
}
