import 'package:flutter/material.dart';

import '../../../../core/extensions/build_context_x.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/app_icon_button.dart';

/// A report chart with its title, a Gráfico | Tabla switch and a CSV button.
class ChartCard extends StatelessWidget {
  const ChartCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.chart,
    required this.table,
    required this.showTable,
    required this.onToggle,
    required this.onExport,
  });

  final String title;
  final String subtitle;
  final Widget chart;
  final Widget table;
  final bool showTable;
  final ValueChanged<bool> onToggle;
  final VoidCallback onExport;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
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
                constraints: const BoxConstraints(minWidth: 160, maxWidth: 360),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Semantics(
                      header: true,
                      child: Text(title, style: context.textTheme.titleMedium),
                    ),
                    Text(subtitle, style: context.textTheme.bodySmall),
                  ],
                ),
              ),
              SegmentedButton<bool>(
                showSelectedIcon: false,
                segments: [
                  ButtonSegment(value: false, label: Text(l10n.kpiChartView)),
                  ButtonSegment(value: true, label: Text(l10n.kpiTableView)),
                ],
                selected: {showTable},
                onSelectionChanged: (value) => onToggle(value.first),
              ),
              AppIconButton(
                icon: Icons.download_rounded,
                tooltip: l10n.kpiExportCsvOf(title),
                onPressed: onExport,
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          showTable ? table : chart,
        ],
      ),
    );
  }
}
