import 'package:flutter/material.dart';

import '../../../../core/extensions/build_context_x.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/status_tone.dart';

/// Full-width outcome: big tinted icon, title, explanation and the actions
/// that get the person unstuck (expired invite, no role, deactivated…).
class AuthResultView extends StatelessWidget {
  const AuthResultView({
    super.key,
    required this.tone,
    required this.icon,
    required this.title,
    this.body,
    this.actions = const [],
  });

  final StatusTone tone;
  final IconData icon;
  final String title;
  final String? body;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    final color = context.statusColors.of(tone);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: AppSpacing.lg),
        Center(
          child: Container(
            width: 76,
            height: 76,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color.withValues(alpha: 0.14),
              border: Border.all(color: color, width: 3),
            ),
            child: Icon(icon, size: 38, color: color),
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        Semantics(
          header: true,
          liveRegion: true,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: context.textTheme.headlineMedium,
          ),
        ),
        if (body != null) ...[
          const SizedBox(height: AppSpacing.sm),
          Text(
            body!,
            textAlign: TextAlign.center,
            style: context.textTheme.bodyMedium!.copyWith(
              color: context.colors.muted,
            ),
          ),
        ],
        const SizedBox(height: AppSpacing.xl),
        for (final action in actions)
          Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.sm),
            child: action,
          ),
      ],
    );
  }
}
