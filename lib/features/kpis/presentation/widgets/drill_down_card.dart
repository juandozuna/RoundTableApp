import 'package:flutter/material.dart';

import '../../../../core/extensions/build_context_x.dart';
import '../../../../core/network/api_error_messages.dart';
import '../../../../core/network/api_exception.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/status_tone.dart';
import '../../../../core/widgets/app_icon_button.dart';
import '../../../../core/widgets/app_message.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../../../core/widgets/empty_state.dart';
import '../../../admin/presentation/admin_format.dart';
import '../../../admin/presentation/widgets/attendance_meter.dart';
import '../../domain/models/drill_level.dart';

/// Drill-down table: country / organization / facilitator → table → member.
class DrillDownCard extends StatelessWidget {
  const DrillDownCard({
    super.key,
    required this.level,
    required this.loading,
    required this.error,
    required this.path,
    required this.group,
    required this.canChangeGroup,
    required this.lockedRootLabel,
    required this.onGroup,
    required this.onRow,
    required this.onCrumb,
    required this.onExport,
  });

  final DrillLevel? level;
  final bool loading;
  final ApiException? error;
  final List<DrillStep> path;
  final DrillKind group;

  /// Only platform admins choose the root grouping, at the root.
  final bool canChangeGroup;

  /// Set for coordinators: label of the fixed first step.
  final String? lockedRootLabel;
  final ValueChanged<DrillKind> onGroup;
  final ValueChanged<DrillRow> onRow;
  final ValueChanged<int> onCrumb;
  final VoidCallback onExport;

  static String kindLabel(BuildContext context, DrillKind kind) {
    final l10n = context.l10n;
    return switch (kind) {
      DrillKind.country => l10n.kpiDrillCountry,
      DrillKind.organization => l10n.kpiDrillOrganization,
      DrillKind.facilitator => l10n.kpiDrillFacilitator,
      DrillKind.table => l10n.kpiDrillTable,
      DrillKind.member => l10n.kpiDrillMember,
    };
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
    final current = level;
    final isMember = current?.kind == DrillKind.member;
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(AppRadii.xl),
        border: Border.all(color: colors.line),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 420),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Semantics(
                      header: true,
                      child: Text(
                        l10n.kpiDrillTitle(
                          current == null
                              ? ''
                              : kindLabel(context, current.kind),
                        ),
                        style: context.textTheme.titleMedium,
                      ),
                    ),
                    Text(
                      l10n.kpiDrillSubtitle,
                      style: context.textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              if (canChangeGroup && path.isEmpty)
                SegmentedButton<DrillKind>(
                  showSelectedIcon: false,
                  segments: [
                    ButtonSegment(
                      value: DrillKind.country,
                      label: Text(l10n.kpiDrillCountry),
                    ),
                    ButtonSegment(
                      value: DrillKind.organization,
                      label: Text(l10n.kpiDrillOrganization),
                    ),
                    ButtonSegment(
                      value: DrillKind.facilitator,
                      label: Text(l10n.kpiDrillFacilitator),
                    ),
                  ],
                  selected: {group},
                  onSelectionChanged: (value) => onGroup(value.first),
                ),
              AppIconButton(
                icon: Icons.download_rounded,
                tooltip: l10n.kpiExportCsvOf(l10n.kpiDrillTitle('')),
                onPressed: current == null ? null : onExport,
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          _buildCrumbs(context),
          const SizedBox(height: AppSpacing.sm),
          _buildBody(context),
          if (isMember)
            Padding(
              padding: const EdgeInsets.only(top: AppSpacing.md),
              child: AppMessage(
                tone: StatusTone.late,
                title: l10n.kpiSensitiveTitle,
                detail: l10n.kpiSensitiveDetail,
                icon: Icons.lock_rounded,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildCrumbs(BuildContext context) {
    final l10n = context.l10n;
    final rootLabel = switch (group) {
      DrillKind.country => l10n.kpiAllCountries,
      DrillKind.facilitator => l10n.kpiAllFacilitators,
      _ => l10n.kpiAllOrganizations,
    };
    final locked = lockedRootLabel != null;
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        if (locked)
          Text(lockedRootLabel!, style: context.textTheme.labelLarge)
        else if (path.isEmpty)
          Text(rootLabel, style: context.textTheme.labelLarge)
        else
          AppTextButton(label: rootLabel, onPressed: () => onCrumb(0)),
        for (var i = locked ? 1 : 0; i < path.length; i++) ...[
          const Icon(Icons.chevron_right_rounded, size: 18),
          if (i == path.length - 1)
            Text(path[i].label, style: context.textTheme.labelLarge)
          else
            AppTextButton(
              label: path[i].label,
              onPressed: () => onCrumb(i + 1),
            ),
        ],
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    final l10n = context.l10n;
    if (loading && level == null) {
      return const Padding(
        padding: EdgeInsets.all(AppSpacing.xl),
        child: Center(child: CircularProgressIndicator()),
      );
    }
    final failure = error;
    if (failure != null) {
      return ErrorState(message: failure.userMessage(l10n));
    }
    final current = level;
    if (current == null || current.rows.isEmpty) {
      return EmptyState(icon: Icons.inbox_rounded, title: l10n.kpiDrillEmpty);
    }
    final isMember = current.kind == DrillKind.member;
    final phone = context.layout.isPhone;
    return Opacity(
      opacity: loading ? 0.5 : 1,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          showCheckboxColumn: false,
          columnSpacing: 20,
          columns: [
            DataColumn(
              label: Text(
                kindLabel(context, current.kind).toUpperCase(),
                style: context.textStyles.kicker,
              ),
            ),
            if (!phone && !isMember)
              DataColumn(
                numeric: true,
                label: Text(
                  l10n.adminColTables.toUpperCase(),
                  style: context.textStyles.kicker,
                ),
              ),
            DataColumn(
              numeric: true,
              label: Text(
                l10n.adminColAttendance.toUpperCase(),
                style: context.textStyles.kicker,
              ),
            ),
            if (!phone)
              DataColumn(
                numeric: true,
                label: Text(
                  l10n.adminColValues.toUpperCase(),
                  style: context.textStyles.kicker,
                ),
              ),
            DataColumn(
              numeric: true,
              label: Text(
                l10n.adminColImprovement.toUpperCase(),
                style: context.textStyles.kicker,
              ),
            ),
            if (!phone)
              DataColumn(
                numeric: true,
                label: Text(
                  l10n.adminColLate.toUpperCase(),
                  style: context.textStyles.kicker,
                ),
              ),
          ],
          rows: [
            for (final row in current.rows)
              DataRow(
                onSelectChanged: (_) => onRow(row),
                cells: [
                  DataCell(
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              row.label,
                              style: context.textTheme.titleSmall,
                            ),
                            if (row.sublabel != null)
                              Text(
                                row.sublabel!,
                                style: context.textTheme.bodySmall,
                              ),
                          ],
                        ),
                        const SizedBox(width: AppSpacing.xs),
                        Icon(
                          isMember
                              ? Icons.lock_rounded
                              : Icons.chevron_right_rounded,
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                  if (!phone && !isMember)
                    DataCell(Text('${row.tablesCount ?? AdminFormat.missing}')),
                  DataCell(
                    AttendanceMeter(percent: row.attendancePct, showBar: false),
                  ),
                  if (!phone) DataCell(Text('${row.valuesCompleted}')),
                  DataCell(Text(AdminFormat.improvement(row.improvementAvg))),
                  if (!phone) DataCell(Text('${row.syncedLate}')),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
