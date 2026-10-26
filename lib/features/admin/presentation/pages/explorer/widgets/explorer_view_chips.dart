import 'package:flutter/material.dart';

import '../../../../../../core/extensions/build_context_x.dart';
import '../../../../../../core/theme/app_spacing.dart';
import '../../../../../../core/widgets/app_chip.dart';
import '../../../../../../core/widgets/app_icon_button.dart';
import '../../../../../../core/widgets/app_text_button.dart';
import '../../../../domain/models/explorer_query.dart';
import '../../../../domain/models/saved_explorer_view.dart';
import '../../../widgets/explorer_labels.dart';

/// "Vistas": the built-in views of the entity plus the user's saved ones.
class ExplorerViewChips extends StatelessWidget {
  const ExplorerViewChips({
    super.key,
    required this.entity,
    required this.activeViewId,
    required this.counts,
    required this.savedViews,
    required this.onSelect,
    required this.onSave,
    required this.onDelete,
    required this.canSave,
  });

  final ExplorerEntity entity;
  final String activeViewId;
  final Map<String, int> counts;
  final List<SavedExplorerView> savedViews;
  final ValueChanged<String> onSelect;
  final VoidCallback onSave;
  final ValueChanged<SavedExplorerView> onDelete;
  final bool canSave;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final showSaved = entity == ExplorerEntity.tables;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Text(l10n.adminViews.toUpperCase(), style: context.textStyles.kicker),
          const SizedBox(width: AppSpacing.sm),
          for (final view in ExplorerView.forEntity(entity))
            Padding(
              padding: const EdgeInsets.only(right: AppSpacing.sm),
              child: AppChip(
                label: ExplorerLabels.view(context, view),
                selected: activeViewId == view.id,
                count: counts[view.id],
                onSelected: (_) => onSelect(view.id),
              ),
            ),
          if (showSaved)
            for (final view in savedViews)
              Padding(
                padding: const EdgeInsets.only(right: AppSpacing.sm),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppChip(
                      label: view.name,
                      icon: Icons.star_rounded,
                      selected: activeViewId == view.id,
                      onSelected: (_) => onSelect(view.id),
                    ),
                    AppIconButton(
                      icon: Icons.close_rounded,
                      tooltip: l10n.adminDeleteViewTooltip(view.name),
                      onPressed: () => onDelete(view),
                    ),
                  ],
                ),
              ),
          if (showSaved)
            AppTextButton(
              label: l10n.adminSaveView,
              icon: Icons.star_outline_rounded,
              onPressed: canSave ? onSave : null,
            ),
        ],
      ),
    );
  }
}
