import 'package:flutter/material.dart';

import '../../../../../../core/extensions/build_context_x.dart';
import '../../../../../../core/theme/app_spacing.dart';

/// Kicker line above a screen title ("SEGUIMIENTO · VALOR 3").
class MemberSectionTitle extends StatelessWidget {
  const MemberSectionTitle({super.key, required this.kicker, this.title});

  final String kicker;
  final String? title;

  @override
  Widget build(BuildContext context) {
    final title = this.title;
    return Padding(
      padding: const EdgeInsets.only(top: AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(kicker.toUpperCase(), style: context.textStyles.kicker),
          if (title != null) ...[
            const SizedBox(height: AppSpacing.xs),
            Semantics(
              header: true,
              child: Text(title, style: context.textTheme.headlineMedium),
            ),
          ],
        ],
      ),
    );
  }
}
