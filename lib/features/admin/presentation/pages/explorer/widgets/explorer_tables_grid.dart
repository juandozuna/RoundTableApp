import 'package:flutter/material.dart';

import '../../../../../../core/extensions/build_context_x.dart';
import '../../../../../../core/theme/app_spacing.dart';
import '../../../../../../core/theme/status_tone.dart';
import '../../../../../../core/widgets/app_avatar.dart';
import '../../../../../../core/widgets/app_data_table.dart';
import '../../../../../../core/widgets/seat_pips.dart';
import '../../../../../../core/widgets/status_pill.dart';
import '../../../../domain/models/explorer_table.dart';
import '../../../admin_format.dart';
import '../../../widgets/admin_status_pills.dart';
import '../../../widgets/attendance_meter.dart';
import '../cubit/explorer_state.dart';

/// Sortable grid of tables (cards on phones).
class ExplorerTablesGrid extends StatelessWidget {
  const ExplorerTablesGrid({
    super.key,
    required this.state,
    required this.wide,
    required this.onOpen,
    required this.onToggle,
    required this.onSelectAll,
    required this.onSort,
  });

  final ExplorerState state;

  /// Room for the extra columns (organization, facilitator…).
  final bool wide;
  final ValueChanged<ExplorerTable> onOpen;
  final void Function(String id, bool selected) onToggle;
  final ValueChanged<bool> onSelectAll;
  final ValueChanged<String> onSort;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final specs = <({String key, AppDataColumn<ExplorerTable> column})>[
      (
        key: 'code',
        column: AppDataColumn(
          label: l10n.adminColTable,
          flex: 4,
          sortable: true,
          cellBuilder: _buildName,
        ),
      ),
      if (wide)
        (
          key: 'organization',
          column: AppDataColumn(
            label: l10n.adminColOrganizationLocation,
            flex: 3,
            sortable: true,
            cellBuilder: (context, t) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  t.organizationName,
                  style: context.textTheme.labelLarge,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  t.locationName ?? AdminFormat.missing,
                  style: context.textTheme.bodySmall,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      if (wide)
        (
          key: 'facilitator',
          column: AppDataColumn(
            label: l10n.adminColFacilitator,
            flex: 2,
            sortable: true,
            cellBuilder: _buildFacilitator,
          ),
        ),
      (
        key: 'seats',
        column: AppDataColumn(
          label: l10n.adminColSeats,
          flex: 3,
          sortable: true,
          cellBuilder: (context, t) => Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SeatPips(
                taken: t.activePeople,
                capacity: t.maxPeople,
                showLabel: false,
              ),
              const SizedBox(width: AppSpacing.xs),
              Text(
                '${t.activePeople}/${t.maxPeople}',
                style: context.textTheme.labelMedium,
              ),
            ],
          ),
        ),
      ),
      (
        key: 'status',
        column: AppDataColumn(
          label: l10n.adminColStatus,
          flex: 3,
          sortable: true,
          cellBuilder: (context, t) => HealthPill(health: t.health),
        ),
      ),
      (
        key: 'attendance',
        column: AppDataColumn(
          label: l10n.adminColAttendance,
          flex: 3,
          sortable: true,
          cellBuilder: (context, t) =>
              AttendanceMeter(percent: t.attendancePct),
        ),
      ),
      (
        key: 'values',
        column: AppDataColumn(
          label: l10n.adminColValues,
          flex: 2,
          numeric: true,
          sortable: true,
          cellBuilder: (context, t) => Text('${t.valuesCompleted}'),
        ),
      ),
      (
        key: 'improvement',
        column: AppDataColumn(
          label: l10n.adminColImprovement,
          flex: 2,
          numeric: true,
          sortable: true,
          cellBuilder: (context, t) => Text(
            AdminFormat.improvement(t.improvementAvg),
            style: context.textTheme.labelLarge,
          ),
        ),
      ),
      (
        key: 'late',
        column: AppDataColumn(
          label: l10n.adminColLate,
          flex: 2,
          numeric: true,
          sortable: true,
          cellBuilder: (context, t) => t.syncedLateRows == 0
              ? const Text('0')
              : StatusPill(
                  tone: StatusTone.late,
                  label: '${t.syncedLateRows}',
                  icon: Icons.history_rounded,
                ),
        ),
      ),
    ];
    final sortIndex = specs.indexWhere((s) => s.key == state.query.sortKey);
    return AppDataTable<ExplorerTable>(
      columns: [for (final s in specs) s.column],
      rows: state.tables,
      rowExtent: state.compact ? 40 : AppDataTable.rowHeight,
      sortColumnIndex: sortIndex < 0 ? null : sortIndex,
      sortAscending: state.query.ascending,
      onSort: (index, _) => onSort(specs[index].key),
      onRowTap: onOpen,
      isSelected: (t) => state.selection.contains(t.id),
      onSelectChanged: (t, selected) => onToggle(t.id, selected),
      allSelected:
          state.tables.isNotEmpty &&
          state.tables.every((t) => state.selection.contains(t.id)),
      onSelectAll: onSelectAll,
      rowSemanticLabel: (t) => l10n.adminSelectRow(t.code),
      phoneCardBuilder: _buildCard,
    );
  }

  Widget _buildName(BuildContext context, ExplorerTable t) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '${t.code} · ${t.name}',
          style: context.textTheme.titleSmall,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          '${AdminFormat.schedule(context.l10n, t.weekday, t.startTime)} · ${t.timezone.split('/').last.replaceAll('_', ' ')}',
          style: context.textTheme.bodySmall,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _buildFacilitator(BuildContext context, ExplorerTable t) {
    final name = t.facilitatorName;
    if (name == null) {
      return StatusPill(
        tone: StatusTone.late,
        label: context.l10n.adminNoFacilitator,
        icon: Icons.warning_amber_rounded,
      );
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppAvatar(name: name, size: 26),
        const SizedBox(width: AppSpacing.sm),
        Flexible(child: Text(name, overflow: TextOverflow.ellipsis)),
      ],
    );
  }

  Widget _buildCard(BuildContext context, ExplorerTable t) {
    final l10n = context.l10n;
    final selected = state.selection.contains(t.id);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Checkbox(
              value: selected,
              semanticLabel: l10n.adminSelectRow(t.code),
              onChanged: (value) => onToggle(t.id, value ?? false),
            ),
            Expanded(child: _buildName(context, t)),
            HealthPill(health: t.health),
          ],
        ),
        Text(
          '${t.organizationName} · ${t.locationName ?? AdminFormat.missing}',
          style: context.textTheme.bodySmall,
        ),
        const SizedBox(height: AppSpacing.sm),
        Row(
          children: [
            _buildMini(
              context,
              l10n.adminColAttendance,
              AdminFormat.percent(t.attendancePct),
            ),
            const SizedBox(width: AppSpacing.sm),
            _buildMini(context, l10n.adminColValues, '${t.valuesCompleted}'),
            const SizedBox(width: AppSpacing.sm),
            _buildMini(
              context,
              l10n.adminColImprovement,
              AdminFormat.improvement(t.improvementAvg),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.sm),
        Wrap(
          spacing: AppSpacing.sm,
          runSpacing: AppSpacing.xs,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            SeatPips(taken: t.activePeople, capacity: t.maxPeople),
            if (t.syncedLateRows > 0)
              StatusPill(
                tone: StatusTone.late,
                label: l10n.adminLateCount(t.syncedLateRows),
                icon: Icons.history_rounded,
              ),
            if (t.facilitatorName == null)
              StatusPill(
                tone: StatusTone.late,
                label: l10n.adminNoFacilitator,
                icon: Icons.warning_amber_rounded,
              )
            else
              Text(t.facilitatorName!, style: context.textTheme.bodySmall),
          ],
        ),
      ],
    );
  }

  Widget _buildMini(BuildContext context, String label, String value) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.xs + 2,
        ),
        decoration: BoxDecoration(
          color: context.colors.backgroundAlt,
          borderRadius: BorderRadius.circular(AppRadii.sm),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label.toUpperCase(), style: context.textStyles.kicker),
            Text(value, style: context.textStyles.number),
          ],
        ),
      ),
    );
  }
}
