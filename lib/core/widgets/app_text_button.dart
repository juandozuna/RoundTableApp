import 'package:flutter/material.dart';

import '../theme/app_spacing.dart';

/// Low-emphasis text action (links, "Reintentar", "Ver todo").
class AppTextButton extends StatelessWidget {
  const AppTextButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.fullWidth = false,
    this.color,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool fullWidth;

  /// Overrides the accent foreground (e.g. on a coloured banner).
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final style = TextButton.styleFrom(
      foregroundColor: color,
      minimumSize: Size(fullWidth ? double.infinity : 0, AppSizes.minTarget),
    );
    final icon = this.icon;
    return icon == null
        ? TextButton(onPressed: onPressed, style: style, child: Text(label))
        : TextButton.icon(
            onPressed: onPressed,
            style: style,
            icon: Icon(icon, size: AppSizes.iconMd),
            label: Text(label),
          );
  }
}
