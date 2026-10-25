import 'package:flutter/material.dart';

import '../extensions/build_context_x.dart';
import '../theme/app_spacing.dart';

enum AppIconButtonVariant {
  /// Transparent (app bars, inline).
  plain,

  /// Bordered square (action dock, counters).
  filled,
}

/// Icon-only action. [tooltip] is required: it is the accessible label.
class AppIconButton extends StatelessWidget {
  const AppIconButton({
    super.key,
    required this.icon,
    required this.tooltip,
    required this.onPressed,
    this.variant = AppIconButtonVariant.plain,
    this.size = AppSizes.minTarget,
    this.color,
  });

  final IconData icon;
  final String tooltip;
  final VoidCallback? onPressed;
  final AppIconButtonVariant variant;

  /// Square side; never below the 44 px minimum target.
  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final side = size < AppSizes.minTarget ? AppSizes.minTarget : size;
    final filled = variant == AppIconButtonVariant.filled;
    return IconButton(
      tooltip: tooltip,
      onPressed: onPressed,
      icon: Icon(icon),
      color: color ?? colors.ink,
      disabledColor: colors.muted,
      constraints: BoxConstraints.tightFor(width: side, height: side),
      style: filled
          ? IconButton.styleFrom(
              backgroundColor: colors.surfaceAlt,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
                side: BorderSide(color: colors.border, width: 2),
              ),
            )
          : null,
    );
  }
}
