import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extensions/build_context_x.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/status_tone.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/status_border.dart';

/// Permission-denied state: the user's role cannot see or do this.
class AdminDeniedView extends StatelessWidget {
  const AdminDeniedView({
    super.key,
    required this.message,
    required this.homeLocation,
    this.title,
    this.actionLabel,
  });

  final String message;
  final String homeLocation;
  final String? title;
  final String? actionLabel;

  @override
  Widget build(BuildContext context) {
    final error = context.statusColors.error;
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 460),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xl),
          child: CustomPaint(
            foregroundPainter: StatusBorderPainter(
              color: error,
              style: StatusLineStyle.double,
              width: 3.5,
              radius: 20,
            ),
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.xl),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.lock_rounded, size: 48, color: error),
                  const SizedBox(height: AppSpacing.lg),
                  Text(
                    title ?? context.l10n.adminDeniedTitle,
                    style: context.textTheme.headlineSmall,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    message,
                    style: context.textTheme.bodyLarge!.copyWith(
                      color: context.colors.muted,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  AppButton(
                    label: actionLabel ?? context.l10n.adminDeniedAction,
                    icon: Icons.home_rounded,
                    variant: AppButtonVariant.secondary,
                    fullWidth: false,
                    onPressed: () => context.go(homeLocation),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
