import 'package:flutter/material.dart';

import '../../../../../../core/extensions/build_context_x.dart';
import '../../../../../../core/theme/app_spacing.dart';

/// Validation message under a control, announced to screen readers.
class FieldErrorText extends StatelessWidget {
  const FieldErrorText({super.key, required this.message});

  final String? message;

  @override
  Widget build(BuildContext context) {
    final message = this.message;
    if (message == null) return const SizedBox.shrink();
    final color = context.statusColors.error;
    return Padding(
      padding: const EdgeInsets.only(top: AppSpacing.sm),
      child: Semantics(
        liveRegion: true,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.warning_amber_rounded,
              size: AppSizes.iconSm,
              color: color,
            ),
            const SizedBox(width: AppSpacing.xs + 2),
            Expanded(
              child: Text(
                message,
                style: context.textTheme.labelMedium!.copyWith(color: color),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
