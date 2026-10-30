import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/config/injection.dart';
import '../../../../core/extensions/build_context_x.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/app_chip.dart';
import '../cubit/content_language_cubit.dart';
import '../cubit/content_language_state.dart';

/// Settings card to pick the language the values and questions are shown in.
/// Hidden until the church has added a second language (ADR 0017).
class ContentLanguageCard extends StatelessWidget {
  const ContentLanguageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ContentLanguageCubit>(),
      child: BlocBuilder<ContentLanguageCubit, ContentLanguageState>(
        builder: (context, state) {
          final choice = state.choice;
          if (!choice.canChoose) return const SizedBox.shrink();
          final l10n = context.l10n;
          return Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.lg),
            child: AppCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.settingsContentLanguageKicker.toUpperCase(),
                    style: context.textStyles.kicker,
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    l10n.settingsContentLanguageHint,
                    style: context.textTheme.bodySmall,
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Wrap(
                    spacing: AppSpacing.sm,
                    runSpacing: AppSpacing.sm,
                    children: [
                      for (final language in choice.available)
                        AppChip(
                          label: language.name,
                          selected: language.code == choice.selected,
                          onSelected: (_) => context
                              .read<ContentLanguageCubit>()
                              .select(language.code),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
