import 'package:flutter/material.dart';

import '../../../../../../core/extensions/build_context_x.dart';
import '../../../../../../core/theme/app_spacing.dart';

/// Centered waiting/notice panel: an icon or avatar, a title and a message.
/// Used by the lobby, "no session today" and "session cancelled" screens.
class MemberNoticePanel extends StatelessWidget {
  const MemberNoticePanel({
    super.key,
    required this.leading,
    required this.title,
    required this.message,
  });

  final Widget leading;
  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppSpacing.xl,
        horizontal: AppSpacing.sm,
      ),
      child: Column(
        children: [
          leading,
          const SizedBox(height: AppSpacing.lg),
          Semantics(
            header: true,
            liveRegion: true,
            child: Text(
              title,
              style: context.textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            message,
            style: context.textTheme.bodyLarge!.copyWith(
              color: context.colors.muted,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
