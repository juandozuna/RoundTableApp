import 'package:flutter/material.dart';

import '../extensions/build_context_x.dart';
import '../theme/app_spacing.dart';
import 'app_card.dart';

/// Column of an [AppDataTable].
class AppDataColumn<T> {
  const AppDataColumn({
    required this.label,
    required this.cellBuilder,
    this.flex = 1,
    this.numeric = false,
    this.sortable = false,
  });

  final String label;
  final Widget Function(BuildContext context, T row) cellBuilder;
  final int flex;

  /// Right-aligned, tabular figures.
  final bool numeric;
  final bool sortable;
}

/// Dense, sortable grid for admin lists (K2 "Explorador"). On phones it
/// renders [phoneCardBuilder] cards instead of columns. Sorting state is
/// owned by the caller's Cubit.
class AppDataTable<T> extends StatelessWidget {
  const AppDataTable({
    super.key,
    required this.columns,
    required this.rows,
    required this.phoneCardBuilder,
    this.onRowTap,
    this.sortColumnIndex,
    this.sortAscending = true,
    this.onSort,
    this.isSelected,
    this.onSelectChanged,
  });

  final List<AppDataColumn<T>> columns;
  final List<T> rows;
  final Widget Function(BuildContext context, T row) phoneCardBuilder;
  final ValueChanged<T>? onRowTap;
  final int? sortColumnIndex;
  final bool sortAscending;
  final void Function(int columnIndex, bool ascending)? onSort;

  /// Enables row checkboxes (tablet and desktop) when both are set.
  final bool Function(T row)? isSelected;
  final void Function(T row, bool selected)? onSelectChanged;

  static const double rowHeight = 52;

  bool get _selectable => isSelected != null && onSelectChanged != null;

  @override
  Widget build(BuildContext context) {
    if (context.layout.isPhone) return _buildCards(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildHeader(context),
        Divider(color: context.colors.line),
        for (final row in rows) ...[
          _buildRow(context, row),
          Divider(color: context.colors.line),
        ],
      ],
    );
  }

  Widget _buildCards(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (final row in rows)
          Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.sm),
            child: AppCard(
              onTap: onRowTap == null ? null : () => onRowTap!(row),
              child: phoneCardBuilder(context, row),
            ),
          ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return SizedBox(
      height: AppSizes.control,
      child: Row(
        children: [
          if (_selectable) const SizedBox(width: AppSizes.control),
          for (var i = 0; i < columns.length; i++)
            Expanded(
              flex: columns[i].flex,
              child: _buildHeaderCell(context, i),
            ),
        ],
      ),
    );
  }

  Widget _buildHeaderCell(BuildContext context, int index) {
    final column = columns[index];
    final active = sortColumnIndex == index;
    final label = Text(
      column.label.toUpperCase(),
      style: context.textStyles.kicker.copyWith(
        color: active ? context.colors.ink : null,
      ),
      textAlign: column.numeric ? TextAlign.end : TextAlign.start,
    );
    if (!column.sortable || onSort == null) return label;
    return InkWell(
      onTap: () => onSort!(index, active ? !sortAscending : true),
      borderRadius: BorderRadius.circular(AppRadii.sm),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
        child: Row(
          mainAxisAlignment: column.numeric
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
          children: [
            Flexible(child: label),
            if (active)
              Icon(
                sortAscending
                    ? Icons.arrow_upward_rounded
                    : Icons.arrow_downward_rounded,
                size: AppSizes.iconSm,
                color: context.colors.accent,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(BuildContext context, T row) {
    final selected = isSelected?.call(row) ?? false;
    return Material(
      color: selected
          ? context.colors.accent.withValues(alpha: 0.12)
          : Colors.transparent,
      child: InkWell(
        onTap: onRowTap == null ? null : () => onRowTap!(row),
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: rowHeight),
          child: Row(
            children: [
              if (_selectable)
                SizedBox(
                  width: AppSizes.control,
                  child: Checkbox(
                    value: selected,
                    onChanged: (value) => onSelectChanged!(row, value ?? false),
                  ),
                ),
              for (final column in columns)
                Expanded(
                  flex: column.flex,
                  child: Align(
                    alignment: column.numeric
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: DefaultTextStyle.merge(
                      style: column.numeric
                          ? const TextStyle(
                              fontFeatures: [FontFeature.tabularFigures()],
                            )
                          : null,
                      child: column.cellBuilder(context, row),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
