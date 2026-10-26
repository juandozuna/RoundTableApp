import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/extensions/build_context_x.dart';
import '../../../../../core/network/api_error_messages.dart';
import '../../../../../core/theme/app_spacing.dart';
import '../../../../../core/widgets/app_toast.dart';
import '../../../../../core/widgets/empty_state.dart';
import '../../../../../core/widgets/skeleton.dart';
import '../../../../../l10n/gen/app_localizations.dart';
import '../../../../admin/admin_routes.dart';
import '../../../../admin/presentation/admin_format.dart';
import '../../../../admin/presentation/widgets/admin_page_frame.dart';
import '../../../../admin/presentation/widgets/kpi_tile.dart';
import '../../../domain/export/report_csv.dart';
import '../../../domain/models/csv_document.dart';
import '../../../domain/models/drill_level.dart';
import '../../../domain/models/kpi_breakdown_row.dart';
import '../../../domain/models/kpi_table_row.dart';
import '../../../domain/models/kpi_weekly_point.dart';
import '../../../domain/models/report_data.dart';
import '../../../kpis_routes.dart';
import '../../widgets/chart_card.dart';
import '../../widgets/charts/bar_chart.dart';
import '../../widgets/charts/dumbbell_chart.dart';
import '../../widgets/charts/horizontal_bars_chart.dart';
import '../../widgets/charts/interactive_chart.dart';
import '../../widgets/charts/line_chart.dart';
import '../../widgets/charts/stacked_bars_chart.dart';
import '../../widgets/drill_down_card.dart';
import '../../widgets/report_data_table.dart';
import '../../widgets/report_filter_bar.dart';
import 'cubit/reports_cubit.dart';
import 'cubit/reports_state.dart';

/// "Informes": KPI dashboards with filters, graph/table switch, CSV export
/// and a drill-down to members (ADR 0010, ADR 0015).
class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ReportsCubit>();
    return AdminPageFrame(
      title: context.l10n.kpiReportsTitle,
      showPalette: true,
      onReconnect: cubit.refresh,
      onRetry: cubit.refresh,
      maxContentWidth: 1280,
      builder: (context, access) => BlocBuilder<ReportsCubit, ReportsState>(
        builder: (context, state) {
          final data = state.data;
          if (state.status == ReportsStatus.loading) {
            return ListView(
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
              children: const [SkeletonList(count: 5, itemHeight: 120)],
            );
          }
          if (data == null) {
            return _buildUnavailable(context, state, access.online);
          }
          return _buildReport(context, state, data, access.online);
        },
      ),
    );
  }

  Widget _buildUnavailable(
    BuildContext context,
    ReportsState state,
    bool online,
  ) {
    final l10n = context.l10n;
    final cubit = context.read<ReportsCubit>();
    if (!online) {
      return EmptyState(
        icon: Icons.cloud_off_rounded,
        title: l10n.kpiOfflineTitle,
        message: l10n.kpiOfflineMessage,
        actionLabel: l10n.adminGoToExplorer,
        onAction: () => context.go(AdminRoutes.explorer),
      );
    }
    return ErrorState(
      message: state.error?.userMessage(l10n),
      onRetry: cubit.load,
    );
  }

  Widget _buildReport(
    BuildContext context,
    ReportsState state,
    ReportData data,
    bool online,
  ) {
    final l10n = context.l10n;
    final cubit = context.read<ReportsCubit>();
    final scopeLabel = state.lockedOrganizationId == null
        ? l10n.kpiAllOrganizationsScope
        : state.drillPath.firstOrNull?.label ?? '';
    final charts = _buildCharts(context, state, data);
    return RefreshIndicator(
      onRefresh: cubit.refresh,
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
        children: [
          Text(
            '$scopeLabel · ${l10n.kpiPeriodOf(state.filters.periodWeeks)}'
                .toUpperCase(),
            style: context.textStyles.kicker,
          ),
          Text(l10n.kpiReportsTitle, style: context.textTheme.headlineMedium),
          const SizedBox(height: AppSpacing.md),
          _buildFilters(context, state, data),
          if (state.refreshing)
            const Padding(
              padding: EdgeInsets.only(top: AppSpacing.sm),
              child: LinearProgressIndicator(),
            ),
          const SizedBox(height: AppSpacing.md),
          if (data.summary.tables.total == 0 && data.tables.isEmpty)
            EmptyState(
              icon: Icons.bar_chart_rounded,
              title: l10n.kpiEmptyTitle,
              message: l10n.kpiEmptyMessage,
              actionLabel: l10n.kpiRemoveFilters,
              onAction: cubit.clearFilters,
            )
          else ...[
            _buildKpiRow(context, data),
            const SizedBox(height: AppSpacing.md),
            LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth < 900) {
                  return Column(
                    children: [
                      for (final chart in charts)
                        Padding(
                          padding: const EdgeInsets.only(bottom: AppSpacing.md),
                          child: chart,
                        ),
                    ],
                  );
                }
                return Wrap(
                  spacing: AppSpacing.md,
                  runSpacing: AppSpacing.md,
                  children: [
                    for (final chart in charts)
                      SizedBox(
                        width: (constraints.maxWidth - AppSpacing.md) / 2,
                        child: chart,
                      ),
                  ],
                );
              },
            ),
            const SizedBox(height: AppSpacing.md),
            _buildDrill(context, state),
          ],
        ],
      ),
    );
  }

  Widget _buildFilters(
    BuildContext context,
    ReportsState state,
    ReportData data,
  ) {
    final l10n = context.l10n;
    final cubit = context.read<ReportsCubit>();
    final body = ReportFilterBar(
      filters: state.filters,
      options: state.options,
      lockedOrganizationName: state.lockedOrganizationId == null
          ? null
          : state.drillPath.firstOrNull?.label ?? '',
      onPeriod: cubit.setPeriod,
      onCountry: cubit.setCountry,
      onOrganization: cubit.setOrganization,
      onLocation: cubit.setLocation,
      onTable: cubit.setTable,
      onFacilitator: cubit.setFacilitator,
      onModule: cubit.setModule,
      onClear: cubit.clearFilters,
      onExportAll: () => _exportAll(context, data),
    );
    if (!context.layout.isPhone) return body;
    return ExpansionTile(
      title: Text(l10n.kpiReportFilters),
      leading: const Icon(Icons.filter_list_rounded),
      tilePadding: EdgeInsets.zero,
      childrenPadding: const EdgeInsets.only(bottom: AppSpacing.md),
      children: [body],
    );
  }

  Widget _buildKpiRow(BuildContext context, ReportData data) {
    final l10n = context.l10n;
    final summary = data.summary;
    final low = data.tables
        .where((t) => t.attendancePct != null && t.attendancePct! < 70)
        .length;
    final tiles = [
      KpiTile(
        label: l10n.kpiValuesCompleted,
        value: '${summary.valuesCompleted}',
        detail: l10n.kpiValuesDetail,
      ),
      KpiTile(
        label: l10n.kpiEstimatedImprovement,
        value: AdminFormat.improvement(summary.improvementAvg),
        unit: l10n.kpiPointsUnit,
        detail: l10n.kpiImprovementDetail,
      ),
      KpiTile(
        label: l10n.kpiAttendance,
        value: summary.attendancePct == null
            ? AdminFormat.missing
            : '${summary.attendancePct!.round()}',
        unit: summary.attendancePct == null ? null : '%',
        detail: l10n.kpiLowTablesDetail(low),
      ),
      KpiTile(
        label: l10n.kpiTables,
        value: '${summary.tables.active}',
        unit: '· ${summary.tables.delayed} · ${summary.tables.inactive}',
        detail: l10n.kpiTablesLegend,
        trailing: TextButton(
          onPressed: () =>
              context.go(AdminRoutes.explorerPath(viewId: 'delayed')),
          child: Text(l10n.kpiSeeDelayed),
        ),
      ),
      KpiTile(
        label: l10n.kpiSyncedLate,
        value: '${summary.syncedLateRows}',
        detail: l10n.kpiSyncedLateDetail,
        trailing: TextButton(
          onPressed: () =>
              context.go(AdminRoutes.explorerPath(viewId: 'syncedLate')),
          child: Text(l10n.kpiSeeTables),
        ),
      ),
    ];
    return LayoutBuilder(
      builder: (context, constraints) {
        // Two per row on phones, otherwise as many as fit.
        final width = constraints.maxWidth < 600
            ? (constraints.maxWidth - AppSpacing.sm) / 2
            : 220.0;
        return Wrap(
          spacing: AppSpacing.sm,
          runSpacing: AppSpacing.sm,
          children: [
            for (final tile in tiles) SizedBox(width: width, child: tile),
          ],
        );
      },
    );
  }

  List<Widget> _buildCharts(
    BuildContext context,
    ReportsState state,
    ReportData data,
  ) {
    final l10n = context.l10n;
    final cubit = context.read<ReportsCubit>();
    final phone = context.layout.isPhone;
    final leftPad = phone ? 96.0 : 128.0;

    ChartCard card(
      ReportChart chart,
      String title,
      String subtitle,
      Widget graph,
      List<String> columns,
      List<List<String>> rows,
      CsvDocument csv,
    ) => ChartCard(
      title: title,
      subtitle: subtitle,
      chart: graph,
      table: ReportDataTable(columns: columns, rows: rows),
      showTable: state.tableViews.contains(chart),
      onToggle: (_) => cubit.toggleChartView(chart),
      onExport: () => _export(context, csv),
    );

    String weekLabel(KpiWeeklyPoint p) {
      final d = p.weekStart.toUtc();
      return '${d.day.toString().padLeft(2, '0')}/${d.month.toString().padLeft(2, '0')}';
    }

    final weekly = data.weekly;
    final totalValues = weekly.fold<int>(0, (s, p) => s + p.valuesCompleted);
    final weeklyHeaders = [
      l10n.kpiColWeek,
      l10n.kpiColSessions,
      l10n.adminColValues,
      l10n.adminColAttendance,
      l10n.kpiColInitialAvg,
      l10n.adminColImprovement,
      l10n.adminColLate,
    ];
    final weeklyCsv = ReportCsv.weekly(
      filename: 'informe-semanal.csv',
      headers: weeklyHeaders,
      points: weekly,
    );

    const threshold = 70.0;
    final late = [
      for (final t
          in (List<KpiTableRow>.of(data.tables)
                ..sort((a, b) => b.syncedLateRows.compareTo(a.syncedLateRows)))
              .where((t) => t.syncedLateRows > 0)
              .take(6))
        t,
    ];
    final modules = data.modules;
    final orgs = data.organizations
        .where((o) => (o.tablesTotal ?? 0) > 0)
        .toList();

    return [
      card(
        ReportChart.valuesPerWeek,
        l10n.kpiChartValuesPerWeek,
        l10n.kpiInPeriod(totalValues),
        InteractiveChart(
          height: 190,
          semanticLabel: l10n.kpiChartValuesPerWeek,
          builder: (palette, hi) => BarChartPainter(
            palette: palette,
            highlighted: hi,
            data: [
              for (final p in weekly)
                BarDatum(
                  label: weekLabel(p),
                  value: p.valuesCompleted.toDouble(),
                  tooltip: l10n.kpiTipWeekValues(
                    weekLabel(p),
                    p.valuesCompleted,
                  ),
                ),
            ],
          ),
        ),
        [l10n.kpiColWeek, l10n.adminColValues],
        [
          for (final p in weekly) [weekLabel(p), '${p.valuesCompleted}'],
        ],
        weeklyCsv,
      ),
      card(
        ReportChart.attendance,
        l10n.kpiAttendance,
        l10n.kpiAttendanceSubtitle(
          AdminFormat.percent(data.summary.attendancePct),
          threshold.round(),
        ),
        InteractiveChart(
          height: 190,
          semanticLabel: l10n.kpiAttendance,
          builder: (palette, hi) => LineChartPainter(
            palette: palette,
            highlighted: hi,
            threshold: threshold,
            thresholdLabel: l10n.kpiThreshold(threshold.round()),
            data: [
              for (final p in weekly)
                LineDatum(
                  label: weekLabel(p),
                  value: p.attendancePct,
                  tooltip: l10n.kpiTipWeekAttendance(
                    weekLabel(p),
                    AdminFormat.percent(p.attendancePct),
                    (p.attendancePct ?? 100) < threshold ? 1 : 0,
                  ),
                ),
            ],
          ),
        ),
        [l10n.kpiColWeek, l10n.adminColAttendance],
        [
          for (final p in weekly)
            [weekLabel(p), AdminFormat.percent(p.attendancePct)],
        ],
        weeklyCsv,
      ),
      card(
        ReportChart.improvementByModule,
        l10n.kpiChartImprovementByModule,
        l10n.kpiChartImprovementSubtitle,
        modules.isEmpty
            ? Text(l10n.kpiNoDataInScope)
            : InteractiveChart(
                height: DumbbellChartPainter.heightFor(modules.length),
                semanticLabel: l10n.kpiChartImprovementByModule,
                builder: (palette, hi) => DumbbellChartPainter(
                  palette: palette,
                  highlighted: hi,
                  leftPadding: leftPad,
                  data: [for (final m in modules) _dumbbell(l10n, m)],
                ),
              ),
        [
          l10n.kpiColModule,
          l10n.kpiColInitialAvg,
          l10n.kpiColFollowUpAvg,
          l10n.adminColImprovement,
        ],
        [
          for (final m in modules)
            [
              m.label,
              AdminFormat.decimal(m.initialAvg),
              AdminFormat.decimal(m.followUpAvg),
              AdminFormat.improvement(m.improvementAvg),
            ],
        ],
        ReportCsv.breakdown(
          filename: 'informe-modulos.csv',
          headers: _breakdownHeaders(l10n),
          rows: modules,
        ),
      ),
      card(
        ReportChart.tablesByStatus,
        l10n.kpiTablesByStatus,
        l10n.kpiTablesByStatusSubtitle,
        orgs.isEmpty
            ? Text(l10n.kpiNoDataInScope)
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InteractiveChart(
                    height: StackedBarsPainter.heightFor(orgs.length),
                    semanticLabel: l10n.kpiTablesByStatus,
                    builder: (palette, hi) => StackedBarsPainter(
                      palette: palette,
                      highlighted: hi,
                      leftPadding: leftPad,
                      data: [
                        for (final o in orgs)
                          StackedDatum(
                            label: o.label,
                            active: o.tablesActive ?? 0,
                            delayed: o.tablesDelayed ?? 0,
                            inactive: o.tablesInactive ?? 0,
                            activeTooltip: l10n.kpiTipStatus(
                              o.label,
                              l10n.adminHealthActive,
                              o.tablesActive ?? 0,
                            ),
                            delayedTooltip: l10n.kpiTipStatus(
                              o.label,
                              l10n.adminHealthDelayed,
                              o.tablesDelayed ?? 0,
                            ),
                            inactiveTooltip: l10n.kpiTipStatus(
                              o.label,
                              l10n.adminHealthInactive,
                              o.tablesInactive ?? 0,
                            ),
                          ),
                      ],
                    ),
                  ),
                  Wrap(
                    spacing: AppSpacing.md,
                    children: [
                      _legend(
                        context,
                        l10n.adminHealthActive,
                        Icons.square_rounded,
                      ),
                      _legend(
                        context,
                        l10n.adminHealthDelayed,
                        Icons.texture_rounded,
                      ),
                      _legend(
                        context,
                        l10n.adminHealthInactive,
                        Icons.grain_rounded,
                      ),
                    ],
                  ),
                ],
              ),
        [
          l10n.adminColOrganization,
          l10n.adminHealthActive,
          l10n.adminHealthDelayed,
          l10n.adminHealthInactive,
        ],
        [
          for (final o in orgs)
            [
              o.label,
              '${o.tablesActive ?? 0}',
              '${o.tablesDelayed ?? 0}',
              '${o.tablesInactive ?? 0}',
            ],
        ],
        ReportCsv.breakdown(
          filename: 'informe-mesas-por-estado.csv',
          headers: _breakdownHeaders(l10n),
          rows: orgs,
        ),
      ),
      card(
        ReportChart.syncedLate,
        l10n.kpiSyncedLate,
        l10n.kpiSyncedLateChartSubtitle(data.summary.syncedLateRows),
        late.isEmpty
            ? Text(l10n.kpiNoSyncedLate)
            : InteractiveChart(
                height: HorizontalBarsPainter.heightFor(late.length),
                semanticLabel: l10n.kpiSyncedLate,
                builder: (palette, hi) => HorizontalBarsPainter(
                  palette: palette,
                  highlighted: hi,
                  leftPadding: leftPad - 28,
                  data: [
                    for (final t in late)
                      HorizontalBarDatum(
                        label: t.code,
                        value: t.syncedLateRows.toDouble(),
                        tooltip: l10n.kpiTipLate(t.code, t.syncedLateRows),
                      ),
                  ],
                ),
              ),
        [l10n.adminColTable, l10n.adminColLate],
        [
          for (final t in late) [t.code, '${t.syncedLateRows}'],
        ],
        ReportCsv.tables(
          filename: 'informe-sincronizado-tarde.csv',
          headers: _tableHeaders(l10n),
          rows: late,
        ),
      ),
    ];
  }

  Widget _legend(BuildContext context, String label, IconData icon) => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(icon, size: 14, color: context.colors.muted),
      const SizedBox(width: AppSpacing.xs),
      Text(label, style: context.textTheme.bodySmall),
    ],
  );

  DumbbellDatum _dumbbell(AppLocalizations l10n, KpiBreakdownRow m) {
    final delta = m.improvementAvg;
    return DumbbellDatum(
      label: m.label,
      initial: m.initialAvg,
      followUp: m.followUpAvg,
      initialTooltip: l10n.kpiTipInitial(
        m.label,
        AdminFormat.decimal(m.initialAvg),
      ),
      followUpTooltip: l10n.kpiTipFollowUp(
        m.label,
        AdminFormat.decimal(m.followUpAvg),
        AdminFormat.improvement(delta),
      ),
      deltaLabel: AdminFormat.improvement(delta),
    );
  }

  List<String> _breakdownHeaders(AppLocalizations l10n) => [
    l10n.kpiColName,
    l10n.kpiColSessions,
    l10n.adminColValues,
    l10n.adminColAttendance,
    l10n.kpiColInitialAvg,
    l10n.kpiColFollowUpAvg,
    l10n.adminColImprovement,
    l10n.adminColLate,
    l10n.adminColTables,
    l10n.adminHealthActive,
    l10n.adminHealthDelayed,
    l10n.adminHealthInactive,
  ];

  List<String> _tableHeaders(AppLocalizations l10n) => [
    l10n.adminColCode,
    l10n.adminColName,
    l10n.adminColOrganization,
    l10n.adminColLocation,
    l10n.adminColFacilitator,
    l10n.adminColStatus,
    l10n.adminColSeats,
    l10n.adminColValues,
    l10n.adminColAttendance,
    l10n.adminColImprovement,
    l10n.adminColLate,
    l10n.adminLastSession,
  ];

  Widget _buildDrill(BuildContext context, ReportsState state) {
    final l10n = context.l10n;
    final cubit = context.read<ReportsCubit>();
    return DrillDownCard(
      level: state.drillLevel,
      loading: state.drillLoading,
      error: state.drillError,
      path: state.drillPath,
      group: state.drillGroup,
      canChangeGroup: state.lockedOrganizationId == null,
      lockedRootLabel: state.lockedOrganizationId == null
          ? null
          : state.drillPath.firstOrNull?.label,
      onGroup: cubit.setDrillGroup,
      onCrumb: cubit.drillTo,
      onRow: (row) {
        final level = state.drillLevel;
        if (level?.kind == DrillKind.member) {
          final tableId = state.drillPath
              .lastWhere((s) => s.kind == DrillKind.table)
              .id;
          context.push(
            KpisRoutes.memberDetailPath(tableId: tableId, personId: row.id),
          );
        } else {
          cubit.drillInto(row);
        }
      },
      onExport: () {
        final csv = cubit.drillCsv([
          l10n.kpiColName,
          l10n.adminColTables,
          l10n.adminColAttendance,
          l10n.adminColValues,
          l10n.adminColImprovement,
          l10n.adminColLate,
        ], 'desglose.csv');
        if (csv != null) _export(context, csv);
      },
    );
  }

  Future<void> _exportAll(BuildContext context, ReportData data) {
    final l10n = context.l10n;
    return _export(
      context,
      ReportCsv.tables(
        filename: 'informe-mesas.csv',
        headers: _tableHeaders(l10n),
        rows: data.tables,
      ),
    );
  }

  Future<void> _export(BuildContext context, CsvDocument document) async {
    final l10n = context.l10n;
    final cubit = context.read<ReportsCubit>();
    try {
      await cubit.exportCsv(document);
      if (context.mounted) {
        AppToast.show(context, l10n.kpiExported, kind: AppToastKind.success);
      }
    } on Object {
      if (context.mounted) {
        AppToast.show(
          context,
          l10n.adminExportFailed,
          kind: AppToastKind.error,
        );
      }
    }
  }
}
