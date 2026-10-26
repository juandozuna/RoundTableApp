import 'package:flutter/material.dart';

import '../../../../core/extensions/build_context_x.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/app_card.dart';

/// A number with its caption, e.g. "Asistencia · 5 de 6".
class HistoryStat {
  const HistoryStat({required this.label, required this.value});

  final String label;
  final String value;
}

/// Row of [HistoryStat] tiles: two per row on a phone, one row when wide.
class HistoryStats extends StatelessWidget {
  const HistoryStats({super.key, required this.stats});

  final List<HistoryStat> stats;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final columns = constraints.maxWidth >= 640 ? stats.length : 2;
        final width =
            (constraints.maxWidth - AppSpacing.md * (columns - 1)) / columns;
        return Wrap(
          spacing: AppSpacing.md,
          runSpacing: AppSpacing.md,
          children: [
            for (final stat in stats)
              SizedBox(
                width: width,
                child: AppCard(
                  semanticLabel: '${stat.label}: ${stat.value}',
                  child: ExcludeSemantics(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(stat.value, style: context.textStyles.number),
                        const SizedBox(height: AppSpacing.xs),
                        Text(stat.label, style: context.textTheme.bodySmall),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
