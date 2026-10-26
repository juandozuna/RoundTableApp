import 'package:flutter/material.dart';

import '../../../../../../core/extensions/build_context_x.dart';
import '../../../../../../core/theme/app_spacing.dart';
import '../../../../../../core/theme/status_tone.dart';
import '../../../../../../core/widgets/status_border.dart';

/// A tappable example sentence for "Qué haré". Dashed outline marks it as a
/// suggestion; the text wraps so long examples fit narrow phones.
class CommitmentExampleChip extends StatelessWidget {
  const CommitmentExampleChip({
    super.key,
    required this.text,
    required this.onTap,
  });

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final radius = BorderRadius.circular(AppRadii.lg);
    return Semantics(
      button: true,
      label: text,
      excludeSemantics: true,
      onTap: onTap,
      child: CustomPaint(
        foregroundPainter: StatusBorderPainter(
          color: colors.accent,
          style: StatusLineStyle.dashed,
          width: 1.5,
          radius: AppRadii.lg,
        ),
        child: Material(
          color: Colors.transparent,
          borderRadius: radius,
          child: InkWell(
            borderRadius: radius,
            onTap: onTap,
            child: ConstrainedBox(
              constraints: const BoxConstraints(minHeight: AppSizes.minTarget),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.md,
                  vertical: AppSpacing.sm,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(text, style: context.textTheme.labelMedium),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
