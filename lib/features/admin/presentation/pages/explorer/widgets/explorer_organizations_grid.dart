import 'package:flutter/material.dart';

import '../../../../../../core/extensions/build_context_x.dart';
import '../../../../../../core/theme/app_spacing.dart';
import '../../../../../../core/theme/status_tone.dart';
import '../../../../../../core/widgets/app_avatar.dart';
import '../../../../../../core/widgets/app_data_table.dart';
import '../../../../../../core/widgets/status_pill.dart';
import '../../../../domain/models/explorer_organization.dart';
import '../../../admin_format.dart';
import '../../../widgets/admin_status_pills.dart';
import '../../../widgets/attendance_meter.dart';
import '../../../widgets/explorer_labels.dart';
import '../cubit/explorer_state.dart';

class ExplorerOrganizationsGrid extends StatelessWidget {
  const ExplorerOrganizationsGrid({
    super.key,
    required this.state,
    required this.onOpen,
    required this.onToggle,
    required this.onSelectAll,
    required this.onSort,
  });

  final ExplorerState state;
  final ValueChanged<ExplorerOrganization> onOpen;
  final void Function(String id, bool selected) onToggle;
  final ValueChanged<bool> onSelectAll;
  final ValueChanged<String> onSort;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final wide = context.layout.isDesktop;
    final specs = <({String key, AppDataColumn<ExplorerOrganization> column})>[
      (
        key: 'name',
        column: AppDataColumn(
          label: l10n.adminColOrganization,
          flex: 4,
          sortable: true,
          cellBuilder: (context, o) => Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppAvatar(name: o.organization.name, size: 30),
              const SizedBox(width: AppSpacing.sm),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      o.organization.name,
                      style: context.textTheme.titleSmall,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      o.organization.region ?? AdminFormat.missing,
                      style: context.textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      if (wide)
        (
          key: 'kind',
          column: AppDataColumn(
            label: l10n.adminColKind,
            flex: 2,
            sortable: true,
            cellBuilder: (context, o) => Text(
              ExplorerLabels.organizationKind(context, o.organization.kind),
            ),
          ),
        ),
      (
        key: 'country',
        column: AppDataColumn(
          label: l10n.adminColCountry,
          flex: 3,
          sortable: true,
          cellBuilder: (context, o) => Text(o.organization.countryName),
        ),
      ),
      (
        key: 'status',
        column: AppDataColumn(
          label: l10n.adminColStatus,
          flex: 3,
          sortable: true,
          cellBuilder: _buildStatus,
        ),
      ),
      (
        key: 'tables',
        column: AppDataColumn(
          label: l10n.adminColTables,
          flex: 2,
          numeric: true,
          sortable: true,
          cellBuilder: (context, o) => o.tablesTotal == 0
              ? StatusPill(
                  tone: StatusTone.neutral,
                  label: l10n.adminWithoutTables,
                  showIcon: false,
                )
              : Text('${o.tablesTotal}'),
        ),
      ),
      if (wide)
        (
          key: 'people',
          column: AppDataColumn(
            label: l10n.adminColPeople,
            flex: 2,
            numeric: true,
            sortable: true,
            cellBuilder: (context, o) => Text('${o.people}'),
          ),
        ),
      (
        key: 'attendance',
        column: AppDataColumn(
          label: l10n.adminColAttendance,
          flex: 2,
          sortable: true,
          cellBuilder: (context, o) =>
              AttendanceMeter(percent: o.attendancePct),
        ),
      ),
      (
        key: 'improvement',
        column: AppDataColumn(
          label: l10n.adminColImprovement,
          flex: 2,
          numeric: true,
          sortable: true,
          cellBuilder: (context, o) => Text(
            o.tablesTotal == 0
                ? AdminFormat.missing
                : AdminFormat.improvement(o.improvementAvg),
            style: context.textTheme.labelLarge,
          ),
        ),
      ),
    ];
    final sortIndex = specs.indexWhere((s) => s.key == state.query.sortKey);
    return AppDataTable<ExplorerOrganization>(
      columns: [for (final s in specs) s.column],
      rows: state.organizations,
      rowExtent: state.compact ? 40 : AppDataTable.rowHeight,
      sortColumnIndex: sortIndex < 0 ? null : sortIndex,
      sortAscending: state.query.ascending,
      onSort: (index, _) => onSort(specs[index].key),
      onRowTap: onOpen,
      isSelected: (o) => state.selection.contains(o.id),
      onSelectChanged: (o, selected) => onToggle(o.id, selected),
      allSelected:
          state.organizations.isNotEmpty &&
          state.organizations.every((o) => state.selection.contains(o.id)),
      onSelectAll: onSelectAll,
      rowSemanticLabel: (o) => l10n.adminSelectRow(o.organization.name),
      phoneCardBuilder: _buildCard,
    );
  }

  Widget _buildStatus(BuildContext context, ExplorerOrganization o) {
    return Wrap(
      spacing: AppSpacing.xs,
      runSpacing: AppSpacing.xs,
      children: [
        OrganizationStatusPill(status: o.organization.status),
        if (!o.hasActiveCoordinator)
          StatusPill(
            tone: StatusTone.late,
            label: context.l10n.adminWithoutCoordinator,
            icon: Icons.warning_amber_rounded,
          ),
      ],
    );
  }

  Widget _buildCard(BuildContext context, ExplorerOrganization o) {
    final l10n = context.l10n;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Checkbox(
              value: state.selection.contains(o.id),
              semanticLabel: l10n.adminSelectRow(o.organization.name),
              onChanged: (value) => onToggle(o.id, value ?? false),
            ),
            AppAvatar(name: o.organization.name, size: 30),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    o.organization.name,
                    style: context.textTheme.titleSmall,
                  ),
                  Text(
                    o.organization.countryName,
                    style: context.textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            OrganizationStatusPill(status: o.organization.status),
          ],
        ),
        const SizedBox(height: AppSpacing.sm),
        Wrap(
          spacing: AppSpacing.md,
          runSpacing: AppSpacing.xs,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text(l10n.adminTablesCount(o.tablesTotal)),
            AttendanceMeter(percent: o.attendancePct),
            Text(AdminFormat.improvement(o.improvementAvg)),
            if (!o.hasActiveCoordinator)
              StatusPill(
                tone: StatusTone.late,
                label: l10n.adminWithoutCoordinator,
                icon: Icons.warning_amber_rounded,
              ),
          ],
        ),
      ],
    );
  }
}
