import 'package:flutter/material.dart';

import '../../../../core/extensions/build_context_x.dart';
import '../../../../core/theme/app_spacing.dart';

/// "1/3 · Código" progress bar of the invitation flow.
class AuthSteps extends StatelessWidget {
  const AuthSteps({super.key, required this.current, required this.labels});

  /// 1-based.
  final int current;
  final List<String> labels;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final label = '$current/${labels.length} · ${labels[current - 1]}';
    return Semantics(
      label: context.l10n.authStepSemantics(
        current,
        labels.length,
        labels[current - 1],
      ),
      excludeSemantics: true,
      child: Row(
        children: [
          for (var i = 1; i <= labels.length; i++)
            Expanded(
              child: Container(
                height: 6,
                margin: const EdgeInsets.only(right: AppSpacing.xs + 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: i < current
                      ? colors.accent
                      : i == current
                      ? colors.accentStrong
                      : colors.line,
                ),
              ),
            ),
          const SizedBox(width: AppSpacing.xs),
          Text(label.toUpperCase(), style: context.textStyles.kicker),
        ],
      ),
    );
  }
}
