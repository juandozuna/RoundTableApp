import 'package:flutter/material.dart';

import '../extensions/build_context_x.dart';
import '../theme/app_spacing.dart';
import 'app_text_button.dart';

/// "Sin conexión · …" strip with an optional Reintentar action. Shown above
/// the body of online-only screens and while the session runs offline.
class OfflineBanner extends StatelessWidget {
  const OfflineBanner({super.key, required this.detail, this.onRetry});

  /// Completes "Sin conexión · {detail}", e.g.
  /// `l10n.offlineDetailOnlineOnly`.
  final String detail;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final offline = context.statusColors.offline;
    return Semantics(
      liveRegion: true,
      container: true,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md + 2,
          vertical: AppSpacing.xs,
        ),
        constraints: const BoxConstraints(minHeight: AppSizes.control),
        decoration: BoxDecoration(
          color: Color.alphaBlend(
            offline.withValues(alpha: 0.16),
            colors.background,
          ),
          border: Border(bottom: BorderSide(color: offline, width: 1.5)),
        ),
        child: Row(
          children: [
            Icon(
              Icons.cloud_off_rounded,
              color: offline,
              size: AppSizes.iconMd,
            ),
            const SizedBox(width: AppSpacing.sm + 2),
            Expanded(
              child: Text(
                context.l10n.offlineBanner(detail),
                style: context.textTheme.labelMedium,
              ),
            ),
            if (onRetry != null)
              AppTextButton(
                label: context.l10n.actionRetry,
                onPressed: onRetry,
              ),
          ],
        ),
      ),
    );
  }
}
