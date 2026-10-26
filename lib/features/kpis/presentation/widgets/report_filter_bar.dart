import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../core/extensions/build_context_x.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/form_fields/app_dropdown_form_field.dart';
import '../../domain/models/report_filters.dart';
import '../../domain/models/report_options.dart';

/// Filters of the Informes tab: period, country, organization, location,
/// table, facilitator and module/value.
class ReportFilterBar extends StatelessWidget {
  const ReportFilterBar({
    super.key,
    required this.filters,
    required this.options,
    required this.lockedOrganizationName,
    required this.onPeriod,
    required this.onCountry,
    required this.onOrganization,
    required this.onLocation,
    required this.onTable,
    required this.onFacilitator,
    required this.onModule,
    required this.onClear,
    required this.onExportAll,
  });

  final ReportFilters filters;
  final ReportOptions options;

  /// Set for coordinators: their organization, shown instead of the picker.
  final String? lockedOrganizationName;
  final ValueChanged<int> onPeriod;
  final ValueChanged<String?> onCountry;
  final ValueChanged<String?> onOrganization;
  final ValueChanged<String?> onLocation;
  final ValueChanged<String?> onTable;
  final ValueChanged<String?> onFacilitator;
  final ValueChanged<String?> onModule;
  final VoidCallback onClear;
  final VoidCallback onExportAll;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final organizations = [
      for (final o in options.organizations)
        if (filters.country == null || o.parentId == filters.country) o,
    ];
    final locations = [
      for (final o in options.locations)
        if (filters.organizationId == null ||
            o.parentId == filters.organizationId)
          o,
    ];
    final tables = [
      for (final o in options.tables)
        if (filters.organizationId == null ||
            o.parentId == filters.organizationId)
          o,
    ];
    final facilitators = [
      for (final o in options.facilitators)
        if (filters.organizationId == null ||
            o.parentId == filters.organizationId)
          o,
    ];
    return FormBuilder(
      // Rebuilt when filters change so cleared pickers show "Todos".
      key: ValueKey(filters),
      child: Wrap(
        spacing: AppSpacing.sm,
        runSpacing: AppSpacing.sm,
        crossAxisAlignment: WrapCrossAlignment.end,
        children: [
          _field<int>(
            name: 'period',
            label: l10n.kpiPeriod,
            value: filters.periodWeeks,
            options: [
              for (final weeks in ReportFilters.periodOptions)
                AppDropdownItem(value: weeks, label: l10n.kpiWeeks(weeks)),
            ],
            onChanged: (v) {
              if (v != null) onPeriod(v);
            },
          ),
          if (lockedOrganizationName == null) ...[
            _optional(
              context,
              'country',
              l10n.adminFilterCountry,
              filters.country,
              options.countries,
              onCountry,
            ),
            _optional(
              context,
              'organization',
              l10n.adminFilterOrganization,
              filters.organizationId,
              organizations,
              onOrganization,
            ),
          ] else
            Chip(
              avatar: const Icon(Icons.lock_rounded, size: 16),
              label: Text(l10n.adminOrganizationLock(lockedOrganizationName!)),
            ),
          _optional(
            context,
            'location',
            l10n.adminFilterLocation,
            filters.locationId,
            locations,
            onLocation,
          ),
          _optional(
            context,
            'table',
            l10n.adminColTable,
            filters.roundTableId,
            tables,
            onTable,
          ),
          _optional(
            context,
            'facilitator',
            l10n.adminFilterFacilitator,
            filters.facilitatorPersonId,
            facilitators,
            onFacilitator,
          ),
          _optional(
            context,
            'module',
            l10n.kpiModuleValue,
            filters.moduleId,
            options.modules,
            onModule,
          ),
          AppButton(
            label: l10n.adminClearFilters,
            variant: AppButtonVariant.secondary,
            size: AppButtonSize.small,
            fullWidth: false,
            onPressed: onClear,
          ),
          AppButton(
            label: l10n.adminExportCsv,
            icon: Icons.download_rounded,
            size: AppButtonSize.small,
            fullWidth: false,
            onPressed: onExportAll,
          ),
        ],
      ),
    );
  }

  Widget _optional(
    BuildContext context,
    String name,
    String label,
    String? value,
    List<ReportOption> choices,
    ValueChanged<String?> onChanged,
  ) {
    final all = context.l10n.adminFilterAll;
    final known = choices.any((c) => c.id == value);
    return _field<String>(
      name: name,
      label: label,
      value: known ? value : '',
      options: [
        AppDropdownItem(value: '', label: all),
        for (final c in choices) AppDropdownItem(value: c.id, label: c.label),
      ],
      onChanged: (v) => onChanged(v == null || v.isEmpty ? null : v),
    );
  }

  Widget _field<T>({
    required String name,
    required String label,
    required T? value,
    required List<AppDropdownItem<T>> options,
    required ValueChanged<T?> onChanged,
  }) {
    return SizedBox(
      width: 180,
      child: AppDropdownFormField<T>(
        name: name,
        label: label,
        initialValue: value,
        onChanged: onChanged,
        items: options,
      ),
    );
  }
}
