import 'package:flutter/material.dart';

import '../../../../../../core/extensions/build_context_x.dart';
import '../../../../../../core/theme/app_spacing.dart';
import '../../../../../../core/widgets/app_avatar.dart';
import '../../../../../../core/widgets/app_data_table.dart';
import '../../../../domain/explorer/explorer_engine.dart';
import '../../../../domain/models/admin_person.dart';
import '../../../admin_format.dart';
import '../../../widgets/admin_status_pills.dart';
import '../../../widgets/explorer_labels.dart';
import '../cubit/explorer_state.dart';

class ExplorerPeopleGrid extends StatelessWidget {
  const ExplorerPeopleGrid({
    super.key,
    required this.state,
    required this.wide,
    required this.organizationNames,
    required this.onOpen,
    required this.onToggle,
    required this.onSelectAll,
    required this.onSort,
  });

  final ExplorerState state;

  /// Room for the extra columns (organization, facilitator…).
  final bool wide;
  final Map<String?, String> organizationNames;
  final ValueChanged<AdminPerson> onOpen;
  final void Function(String id, bool selected) onToggle;
  final ValueChanged<bool> onSelectAll;
  final ValueChanged<String> onSort;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final specs = <({String key, AppDataColumn<AdminPerson> column})>[
      (
        key: 'name',
        column: AppDataColumn(
          label: l10n.adminColPerson,
          flex: 4,
          sortable: true,
          cellBuilder: _buildName,
        ),
      ),
      (
        key: 'role',
        column: AppDataColumn(
          label: l10n.adminColRole,
          flex: 2,
          sortable: true,
          cellBuilder: (context, p) => Text(
            ExplorerLabels.personKind(context, ExplorerEngine.personKind(p)),
          ),
        ),
      ),
      if (wide)
        (
          key: 'organization',
          column: AppDataColumn(
            label: l10n.adminColOrganization,
            flex: 3,
            sortable: true,
            cellBuilder: (context, p) => Text(
              organizationNames[p.organizationId] ?? l10n.adminPlatformStaff,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      (
        key: 'table',
        column: AppDataColumn(
          label: l10n.adminColTable,
          flex: 3,
          sortable: true,
          cellBuilder: (context, p) => Text(
            p.currentTable?.roundTableName ?? l10n.adminWithoutTable,
            overflow: TextOverflow.ellipsis,
            style: p.currentTable == null
                ? TextStyle(color: context.colors.muted)
                : null,
          ),
        ),
      ),
      (
        key: 'status',
        column: AppDataColumn(
          label: l10n.adminColStatus,
          flex: 3,
          sortable: true,
          cellBuilder: (context, p) => PersonStatusPill(status: p.status),
        ),
      ),
    ];
    final sortIndex = specs.indexWhere((s) => s.key == state.query.sortKey);
    return AppDataTable<AdminPerson>(
      columns: [for (final s in specs) s.column],
      rows: state.people,
      rowExtent: state.compact ? 40 : AppDataTable.rowHeight,
      sortColumnIndex: sortIndex < 0 ? null : sortIndex,
      sortAscending: state.query.ascending,
      onSort: (index, _) => onSort(specs[index].key),
      onRowTap: onOpen,
      isSelected: (p) => state.selection.contains(p.id),
      onSelectChanged: (p, selected) => onToggle(p.id, selected),
      allSelected:
          state.people.isNotEmpty &&
          state.people.every((p) => state.selection.contains(p.id)),
      onSelectAll: onSelectAll,
      rowSemanticLabel: (p) => l10n.adminSelectRow(p.fullName),
      phoneCardBuilder: (context, p) => Row(
        children: [
          Checkbox(
            value: state.selection.contains(p.id),
            semanticLabel: l10n.adminSelectRow(p.fullName),
            onChanged: (value) => onToggle(p.id, value ?? false),
          ),
          Expanded(child: _buildName(context, p)),
          PersonStatusPill(status: p.status),
        ],
      ),
    );
  }

  Widget _buildName(BuildContext context, AdminPerson p) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppAvatar(name: p.fullName, size: 30),
        const SizedBox(width: AppSpacing.sm),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                p.fullName,
                style: context.textTheme.titleSmall,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                p.email ?? AdminFormat.missing,
                style: context.textTheme.bodySmall,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
