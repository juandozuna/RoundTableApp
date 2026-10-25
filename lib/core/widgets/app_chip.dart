import 'package:flutter/material.dart';

import '../extensions/build_context_x.dart';
import '../theme/app_spacing.dart';

/// Selectable chip for filters and saved views.
class AppChip extends StatelessWidget {
  const AppChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onSelected,
    this.icon,
    this.count,
  });

  final String label;
  final bool selected;
  final ValueChanged<bool>? onSelected;
  final IconData? icon;

  /// Optional count shown after the label, tabular.
  final int? count;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final foreground = selected ? colors.onAccent : colors.ink;
    final radius = BorderRadius.circular(AppRadii.pill);
    return Semantics(
      button: true,
      selected: selected,
      label: count == null ? label : '$label, $count',
      onTap: onSelected == null ? null : () => onSelected!(!selected),
      excludeSemantics: true,
      child: Material(
        color: selected ? colors.accentStrong : colors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: radius,
          side: BorderSide(
            color: selected ? colors.accentStrong : colors.border,
            width: 1.5,
          ),
        ),
        child: InkWell(
          borderRadius: radius,
          onTap: onSelected == null ? null : () => onSelected!(!selected),
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: AppSizes.minTarget),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (icon != null) ...[
                    Icon(icon, size: AppSizes.iconSm, color: foreground),
                    const SizedBox(width: AppSpacing.xs + 2),
                  ],
                  Text(
                    label,
                    style: context.textTheme.labelMedium!.copyWith(
                      color: foreground,
                    ),
                  ),
                  if (count != null) ...[
                    const SizedBox(width: AppSpacing.xs + 2),
                    Text(
                      '$count',
                      style: context.textStyles.pill.copyWith(
                        color: foreground,
                        fontFeatures: const [FontFeature.tabularFigures()],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
