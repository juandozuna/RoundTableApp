import 'package:flutter/material.dart';

import '../extensions/build_context_x.dart';
import '../theme/app_spacing.dart';
import 'app_back_button.dart';
import 'app_button.dart';

/// Shared dialog and bottom-sheet helpers. Each overlay has an explicit way
/// to leave (cancel / close), per AGENTS.md §15.
abstract final class AppDialogs {
  /// Asks for confirmation; resolves to `true` only when confirmed.
  static Future<bool> confirm(
    BuildContext context, {
    required String message,
    String? title,
    String? confirmLabel,
    String? cancelLabel,
    bool destructive = false,
  }) async {
    final l10n = context.l10n;
    final result = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(title ?? l10n.confirmDialogDefaultTitle),
        content: Text(message),
        actionsPadding: const EdgeInsets.fromLTRB(
          AppSpacing.lg,
          0,
          AppSpacing.lg,
          AppSpacing.lg,
        ),
        actions: [
          AppButton(
            label: cancelLabel ?? l10n.actionCancel,
            variant: AppButtonVariant.secondary,
            fullWidth: false,
            onPressed: () => Navigator.of(dialogContext).pop(false),
          ),
          AppButton(
            label: confirmLabel ?? l10n.actionConfirm,
            variant: destructive
                ? AppButtonVariant.danger
                : AppButtonVariant.primary,
            size: AppButtonSize.medium,
            fullWidth: false,
            onPressed: () => Navigator.of(dialogContext).pop(true),
          ),
        ],
      ),
    );
    return result ?? false;
  }

  /// Modal bottom sheet with a title row and a close button. On tablets and
  /// desktop it is width-constrained so it reads as a panel.
  static Future<T?> showSheet<T>(
    BuildContext context, {
    required String title,
    required WidgetBuilder builder,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      constraints: const BoxConstraints(maxWidth: 560),
      builder: (sheetContext) => Padding(
        padding: EdgeInsets.only(
          left: AppSpacing.lg,
          right: AppSpacing.sm,
          bottom: MediaQuery.viewInsetsOf(sheetContext).bottom + AppSpacing.xl,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(title, style: sheetContext.textTheme.titleLarge),
                ),
                AppCloseButton(
                  onPressed: () => Navigator.of(sheetContext).pop(),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.sm),
            Padding(
              padding: const EdgeInsets.only(right: AppSpacing.sm),
              child: builder(sheetContext),
            ),
          ],
        ),
      ),
    );
  }
}
