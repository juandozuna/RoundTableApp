import 'package:flutter/material.dart';

import '../../../../../../core/extensions/build_context_x.dart';
import '../../../../../../core/widgets/app_button.dart';

/// Asks the admin to confirm moving a table back past completed sessions.
class RewindConfirmDialog extends StatelessWidget {
  const RewindConfirmDialog({super.key});

  /// True when the admin confirms the rewind.
  static Future<bool> show(BuildContext context) async =>
      await showDialog<bool>(
        context: context,
        builder: (_) => const RewindConfirmDialog(),
      ) ??
      false;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AlertDialog(
      title: Text(l10n.adminRewindTitle),
      content: Text(l10n.adminRewindMessage),
      actions: [
        AppButton(
          label: l10n.actionCancel,
          variant: AppButtonVariant.secondary,
          fullWidth: false,
          onPressed: () => Navigator.of(context).pop(false),
        ),
        AppButton(
          label: l10n.adminRewindConfirm,
          size: AppButtonSize.medium,
          fullWidth: false,
          onPressed: () => Navigator.of(context).pop(true),
        ),
      ],
    );
  }
}
