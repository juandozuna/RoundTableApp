import 'package:flutter/material.dart';

import '../extensions/build_context_x.dart';
import '../theme/app_spacing.dart';
import 'app_button.dart';

/// Friendly placeholder for an empty list or screen.
class EmptyState extends StatelessWidget {
  const EmptyState({
    super.key,
    this.icon = Icons.inbox_rounded,
    this.title,
    this.message,
    this.actionLabel,
    this.onAction,
  });

  final IconData icon;

  /// Defaults to "Todavía no hay nada aquí".
  final String? title;
  final String? message;
  final String? actionLabel;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    return _StateLayout(
      icon: icon,
      iconColor: context.colors.accent,
      title: title ?? context.l10n.emptyStateTitle,
      message: message,
      action: actionLabel == null
          ? null
          : AppButton(
              label: actionLabel!,
              onPressed: onAction,
              variant: AppButtonVariant.secondary,
              fullWidth: false,
            ),
    );
  }
}

/// Load failure with a Reintentar action.
class ErrorState extends StatelessWidget {
  const ErrorState({super.key, this.title, this.message, this.onRetry});

  /// Defaults to "No pudimos cargar esto".
  final String? title;
  final String? message;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return _StateLayout(
      icon: Icons.error_outline_rounded,
      iconColor: context.statusColors.error,
      title: title ?? context.l10n.errorStateTitle,
      message: message,
      action: onRetry == null
          ? null
          : AppButton(
              label: context.l10n.actionRetry,
              icon: Icons.refresh_rounded,
              onPressed: onRetry,
              variant: AppButtonVariant.secondary,
              fullWidth: false,
            ),
    );
  }
}

class _StateLayout extends StatelessWidget {
  const _StateLayout({
    required this.icon,
    required this.iconColor,
    required this.title,
    this.message,
    this.action,
  });

  final IconData icon;
  final Color iconColor;
  final String title;
  final String? message;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 420),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xl),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 48, color: iconColor),
              const SizedBox(height: AppSpacing.lg),
              Text(
                title,
                style: context.textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              if (message != null) ...[
                const SizedBox(height: AppSpacing.sm),
                Text(
                  message!,
                  style: context.textTheme.bodyLarge!.copyWith(
                    color: context.colors.muted,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
              if (action != null) ...[
                const SizedBox(height: AppSpacing.xl),
                action!,
              ],
            ],
          ),
        ),
      ),
    );
  }
}
