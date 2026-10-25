import 'package:flutter/material.dart';

import '../extensions/build_context_x.dart';
import '../theme/app_spacing.dart';
import '../theme/status_tone.dart';
import 'status_pill.dart';

/// Inline notice box (info, warning, error, success) with icon and tinted
/// border, e.g. "La mesa está en: Seguimiento".
class AppMessage extends StatelessWidget {
  const AppMessage({
    super.key,
    required this.tone,
    required this.title,
    this.detail,
    this.icon,
    this.action,
  });

  final StatusTone tone;
  final String title;
  final String? detail;
  final IconData? icon;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    final color = context.statusColors.of(tone);
    return Semantics(
      container: true,
      liveRegion: tone == StatusTone.error,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm + 2,
        ),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.14),
          borderRadius: BorderRadius.circular(AppRadii.lg),
          border: Border.all(color: color, width: 1.5),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon ?? StatusPill.defaultIcon(tone),
              color: color,
              size: AppSizes.iconMd,
            ),
            const SizedBox(width: AppSpacing.sm + 2),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: context.textTheme.labelLarge),
                  if (detail != null)
                    Padding(
                      padding: const EdgeInsets.only(top: AppSpacing.xxs),
                      child: Text(detail!, style: context.textTheme.bodySmall),
                    ),
                ],
              ),
            ),
            ?action,
          ],
        ),
      ),
    );
  }
}
