import 'package:flutter/material.dart';

import '../../../../../../core/extensions/build_context_x.dart';
import '../../../../../../core/theme/app_spacing.dart';
import '../../../../../../core/widgets/app_button.dart';

/// Last confirmation before the session closes.
class ConfirmCloseSheet extends StatelessWidget {
  const ConfirmCloseSheet({
    super.key,
    required this.incomplete,
    required this.onBack,
    required this.onConfirm,
  });

  final int incomplete;
  final VoidCallback onBack;
  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          l10n.sessionBoardConfirmCloseBody,
          style: context.textTheme.bodyLarge,
        ),
        if (incomplete > 0) ...[
          const SizedBox(height: AppSpacing.sm),
          Text(
            l10n.sessionBoardConfirmCloseIncomplete(incomplete),
            style: context.textTheme.bodyMedium!.copyWith(
              color: context.statusColors.pending,
            ),
          ),
        ],
        const SizedBox(height: AppSpacing.lg),
        Row(
          children: [
            Expanded(
              child: AppButton(
                label: l10n.actionBack,
                variant: AppButtonVariant.secondary,
                onPressed: onBack,
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: AppButton(
                label: l10n.sessionBoardDockCloseSession,
                onPressed: onConfirm,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
