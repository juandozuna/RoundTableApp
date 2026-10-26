import 'package:flutter/material.dart';

import '../extensions/build_context_x.dart';
import '../theme/app_spacing.dart';

/// Labelled on/off setting row with a switch, sized for touch (48 px).
class AppSwitchTile extends StatelessWidget {
  const AppSwitchTile({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
    this.subtitle,
  });

  final String title;
  final String? subtitle;
  final bool value;

  /// `null` disables the switch.
  final ValueChanged<bool>? onChanged;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: AppSpacing.xs),
      title: Text(title, style: context.textTheme.titleMedium),
      subtitle: subtitle == null
          ? null
          : Text(subtitle!, style: context.textTheme.bodySmall),
      value: value,
      onChanged: onChanged,
    );
  }
}
