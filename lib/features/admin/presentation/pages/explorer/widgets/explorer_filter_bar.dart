import 'package:flutter/material.dart';

import '../../../../../../core/extensions/build_context_x.dart';
import '../../../../../../core/theme/app_spacing.dart';
import '../../../../../../core/widgets/app_button.dart';
import '../../../../../../core/widgets/app_text_button.dart';
import '../../../../domain/models/explorer_query.dart';
import '../../../widgets/admin_search_field.dart';
import '../../../widgets/explorer_labels.dart';
import '../cubit/explorer_state.dart';

/// Search box, the "Filtros" button and the chips of the active filters.
class ExplorerFilterBar extends StatelessWidget {
  const ExplorerFilterBar({
    super.key,
    required this.state,
    required this.organizationLock,
    required this.onSearch,
    required this.onOpenFilters,
    required this.onRemoveFilter,
    required this.onClear,
  });

  final ExplorerState state;

  /// Organization name shown as a locked chip for coordinators.
  final String? organizationLock;
  final ValueChanged<String> onSearch;
  final VoidCallback onOpenFilters;
  final ValueChanged<String> onRemoveFilter;
  final VoidCallback onClear;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final query = state.query;
    final active = [
      for (final entry in query.filters.entries)
        if (entry.value.isNotEmpty) entry,
    ];
    return Wrap(
      spacing: AppSpacing.sm,
      runSpacing: AppSpacing.sm,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        AdminSearchField(
          hint: l10n.adminSearchHint(
            ExplorerLabels.entity(context, state.entity).toLowerCase(),
          ),
          initialText: query.search,
          onChanged: onSearch,
        ),
        AppButton(
          label: query.activeFilterCount == 0
              ? l10n.adminFilters
              : l10n.adminFiltersCount(query.activeFilterCount),
          icon: Icons.filter_list_rounded,
          variant: AppButtonVariant.secondary,
          size: AppButtonSize.small,
          fullWidth: false,
          onPressed: onOpenFilters,
        ),
        if (organizationLock != null &&
            state.entity != ExplorerEntity.organizations)
          Chip(
            avatar: const Icon(Icons.lock_rounded, size: 16),
            label: Text(l10n.adminOrganizationLock(organizationLock!)),
            side: BorderSide(
              color: context.colors.border,
              style: BorderStyle.solid,
            ),
          ),
        for (final entry in active)
          InputChip(
            label: Text(
              '${ExplorerLabels.filter(context, entry.key)}: ${_valueLabel(context, entry)}',
            ),
            onDeleted: () => onRemoveFilter(entry.key),
            deleteButtonTooltipMessage: l10n.adminRemoveFilterTooltip(
              ExplorerLabels.filter(context, entry.key),
            ),
          ),
        if (query.hasRefinements)
          AppTextButton(label: l10n.adminClearAll, onPressed: onClear),
      ],
    );
  }

  String _valueLabel(BuildContext context, MapEntry<String, String> entry) {
    final options = state.filterOptions[entry.key] ?? const [];
    for (final option in options) {
      if (option.value == entry.value) {
        return ExplorerLabels.optionLabel(
          context,
          state.entity,
          entry.key,
          option,
        );
      }
    }
    return entry.value;
  }
}
