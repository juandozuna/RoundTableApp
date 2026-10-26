import 'package:flutter/material.dart';

import '../../../../core/extensions/build_context_x.dart';
import '../../../../core/theme/app_spacing.dart';

/// A headline number with its label, as in the prototype's KPI rows.
class KpiTile extends StatelessWidget {
  const KpiTile({
    super.key,
    required this.label,
    required this.value,
    this.unit,
    this.detail,
    this.trailing,
  });

  final String label;
  final String value;

  /// Small suffix next to the value ("pts", "%").
  final String? unit;
  final String? detail;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Semantics(
      container: true,
      label: '$label: $value${unit == null ? '' : ' $unit'}',
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: BorderRadius.circular(AppRadii.lg),
          border: Border.all(color: colors.line),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(label.toUpperCase(), style: context.textStyles.kicker),
            const SizedBox(height: AppSpacing.xs),
            Text.rich(
              TextSpan(
                text: value,
                style: context.textStyles.numberLarge,
                children: [
                  if (unit != null)
                    TextSpan(
                      text: ' $unit',
                      style: context.textTheme.bodyMedium!.copyWith(
                        color: colors.muted,
                      ),
                    ),
                ],
              ),
            ),
            if (detail != null)
              Text(detail!, style: context.textTheme.bodySmall),
            ?trailing,
          ],
        ),
      ),
    );
  }
}
