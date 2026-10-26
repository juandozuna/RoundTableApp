import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../../../core/extensions/build_context_x.dart';
import '../../../../../../core/theme/app_spacing.dart';
import '../../../../../../core/widgets/app_button.dart';
import '../../../../../../core/widgets/app_dialogs.dart';
import '../../../../../../core/widgets/form_fields/app_dropdown_form_field.dart';
import '../../../widgets/explorer_labels.dart';
import '../cubit/explorer_cubit.dart';
import '../cubit/explorer_state.dart';

/// The filter selects, shown in a popover (tablet/desktop) or a sheet (phone).
class ExplorerFiltersPanel extends StatelessWidget {
  const ExplorerFiltersPanel({super.key, required this.cubit});

  final ExplorerCubit cubit;

  /// Opens the panel in the container that fits the screen.
  static Future<void> show(BuildContext context, ExplorerCubit cubit) {
    final panel = ExplorerFiltersPanel(cubit: cubit);
    if (context.layout.isPhone) {
      return AppDialogs.showSheet<void>(
        context,
        title: context.l10n.adminFilters,
        builder: (_) => panel,
      );
    }
    return showDialog<void>(
      context: context,
      builder: (dialogContext) => Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.only(top: 120),
          child: Dialog(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 380),
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      context.l10n.adminFilters,
                      style: context.textTheme.titleLarge,
                    ),
                    const SizedBox(height: AppSpacing.md),
                    panel,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocBuilder<ExplorerCubit, ExplorerState>(
      bloc: cubit,
      builder: (context, state) {
        final filters = state.query.filters;
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FormBuilder(
              // Rebuilt when the filters change from outside (chip removed).
              key: ValueKey(filters.toString()),
              child: Column(
                children: [
                  for (final entry in state.filterOptions.entries)
                    if (entry.value.isNotEmpty ||
                        (filters[entry.key] ?? '').isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(bottom: AppSpacing.md),
                        child: AppDropdownFormField<String>(
                          name: entry.key,
                          label: ExplorerLabels.filter(context, entry.key),
                          initialValue: filters[entry.key] ?? '',
                          onChanged: (value) =>
                              cubit.setFilter(entry.key, value),
                          items: [
                            AppDropdownItem(
                              value: '',
                              label: l10n.adminFilterAll,
                            ),
                            for (final option in entry.value)
                              AppDropdownItem(
                                value: option.value,
                                label: ExplorerLabels.optionLabel(
                                  context,
                                  state.entity,
                                  entry.key,
                                  option,
                                ),
                              ),
                          ],
                        ),
                      ),
                ],
              ),
            ),
            AppButton(
              label: l10n.adminClearFilters,
              variant: AppButtonVariant.secondary,
              onPressed: cubit.clearFilters,
            ),
            const SizedBox(height: AppSpacing.sm),
            AppButton(
              label: l10n.adminShowResults(state.visibleCount),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }
}
