import 'package:flutter/material.dart';

import '../extensions/build_context_x.dart';
import '../theme/app_spacing.dart';

enum AppToastKind { info, success, error }

/// Brief confirmation or error message (snackbar styled as the prototype
/// toast). Call from widgets, e.g. in a `BlocListener`.
abstract final class AppToast {
  static void show(
    BuildContext context,
    String message, {
    AppToastKind kind = AppToastKind.info,
    String? actionLabel,
    VoidCallback? onAction,
  }) {
    final colors = context.colors;
    final status = context.statusColors;
    final isError = kind == AppToastKind.error;
    final background = isError ? status.error : colors.ink;
    final foreground = isError ? status.onStatus : colors.background;
    final icon = switch (kind) {
      AppToastKind.info => Icons.info_rounded,
      AppToastKind.success => Icons.check_circle_rounded,
      AppToastKind.error => Icons.error_rounded,
    };

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          backgroundColor: background,
          content: Row(
            children: [
              Icon(icon, color: foreground, size: AppSizes.iconMd),
              const SizedBox(width: AppSpacing.sm + 2),
              Expanded(
                child: Text(
                  message,
                  style: context.textTheme.labelLarge!.copyWith(
                    color: foreground,
                  ),
                ),
              ),
            ],
          ),
          action: actionLabel == null
              ? null
              : SnackBarAction(
                  label: actionLabel,
                  textColor: foreground,
                  onPressed: onAction ?? () {},
                ),
        ),
      );
  }
}
