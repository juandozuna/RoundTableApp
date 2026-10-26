import 'package:flutter/material.dart';

import '../../../../core/extensions/build_context_x.dart';
import '../../../../core/theme/app_spacing.dart';

class HistorySectionTitle extends StatelessWidget {
  const HistorySectionTitle(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(top: AppSpacing.xl, bottom: AppSpacing.md),
    child: Semantics(
      header: true,
      child: Text(title, style: context.textTheme.titleLarge),
    ),
  );
}
