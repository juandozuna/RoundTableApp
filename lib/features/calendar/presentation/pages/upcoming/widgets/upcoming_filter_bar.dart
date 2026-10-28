import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../../../core/extensions/build_context_x.dart';
import '../../../../../../core/theme/app_spacing.dart';
import '../../../../../../core/widgets/app_button.dart';
import '../../../../../../core/widgets/form_fields/app_dropdown_form_field.dart';
import '../../../../domain/models/upcoming_filter.dart';
import '../../../../domain/models/upcoming_sessions.dart';

/// Location, facilitator and table pickers of the managers' calendar.
class UpcomingFilterBar extends StatelessWidget {
  const UpcomingFilterBar({
    super.key,
    required this.sessions,
    required this.filter,
    required this.onLocation,
    required this.onFacilitator,
    required this.onTable,
    required this.onClear,
  });

  final UpcomingSessions sessions;
  final UpcomingFilter filter;
  final ValueChanged<String?> onLocation;
  final ValueChanged<String?> onFacilitator;
  final ValueChanged<String?> onTable;
  final VoidCallback onClear;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return FormBuilder(
      // Rebuilt when the filter changes so a cleared picker shows "Todos".
      key: ValueKey(filter),
      child: Wrap(
        spacing: AppSpacing.sm,
        runSpacing: AppSpacing.sm,
        crossAxisAlignment: WrapCrossAlignment.end,
        children: [
          _buildPicker(
            context,
            name: 'location',
            label: l10n.adminFilterLocation,
            value: filter.locationId,
            options: sessions.locations,
            onChanged: onLocation,
          ),
          _buildPicker(
            context,
            name: 'facilitator',
            label: l10n.adminFilterFacilitator,
            value: filter.facilitatorId,
            options: sessions.facilitators,
            onChanged: onFacilitator,
          ),
          _buildPicker(
            context,
            name: 'table',
            label: l10n.adminColTable,
            value: filter.roundTableId,
            options: sessions.tables,
            onChanged: onTable,
          ),
          if (filter.isActive)
            AppButton(
              label: l10n.adminClearFilters,
              variant: AppButtonVariant.secondary,
              size: AppButtonSize.small,
              fullWidth: false,
              onPressed: onClear,
            ),
        ],
      ),
    );
  }

  Widget _buildPicker(
    BuildContext context, {
    required String name,
    required String label,
    required String? value,
    required List<UpcomingOption> options,
    required ValueChanged<String?> onChanged,
  }) {
    final known = options.any((option) => option.id == value);
    return SizedBox(
      width: 200,
      child: AppDropdownFormField<String>(
        name: name,
        label: label,
        initialValue: known ? value : '',
        onChanged: (v) => onChanged(v == null || v.isEmpty ? null : v),
        items: [
          AppDropdownItem(value: '', label: context.l10n.adminFilterAll),
          for (final option in options)
            AppDropdownItem(value: option.id, label: option.label),
        ],
      ),
    );
  }
}
