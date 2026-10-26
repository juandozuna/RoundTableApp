import 'package:flutter/material.dart';

import '../../../../core/extensions/build_context_x.dart';
import '../../../../core/theme/app_spacing.dart';

/// App mark with the "Gold Roundtables · Mesas de valores" wordmark.
class AuthBrandMark extends StatelessWidget {
  const AuthBrandMark({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [colors.accentStrong, colors.accentGradientEnd],
            ),
            boxShadow: [BoxShadow(color: colors.glow, blurRadius: 18)],
          ),
          child: Icon(Icons.groups_rounded, color: colors.onAccent),
        ),
        const SizedBox(width: AppSpacing.md),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(context.l10n.appTitle, style: context.textTheme.titleMedium),
            Text(
              context.l10n.authAppTagline.toUpperCase(),
              style: context.textStyles.kicker,
            ),
          ],
        ),
      ],
    );
  }
}
