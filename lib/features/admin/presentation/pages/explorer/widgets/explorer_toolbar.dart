import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/extensions/build_context_x.dart';
import '../../../../../../core/theme/app_spacing.dart';
import '../../../../../../core/widgets/app_button.dart';
import '../../../../admin_routes.dart';
import '../../../../domain/models/explorer_query.dart';
import '../../../widgets/explorer_labels.dart';

/// Title row of the Explorador: entity switch, density and "Crear" menu.
class ExplorerToolbar extends StatelessWidget {
  const ExplorerToolbar({
    super.key,
    required this.entity,
    required this.isAdministrator,
    required this.online,
    required this.counts,
    required this.compact,
    required this.onEntity,
    required this.onToggleDensity,
    this.organizationId,
  });

  final ExplorerEntity entity;
  final bool isAdministrator;
  final bool online;
  final Map<ExplorerEntity, int> counts;
  final bool compact;
  final ValueChanged<ExplorerEntity> onEntity;
  final VoidCallback onToggleDensity;

  /// Organization a coordinator works in, for their shortcut.
  final String? organizationId;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final entities = [
      ExplorerEntity.tables,
      if (isAdministrator) ExplorerEntity.organizations,
      ExplorerEntity.people,
    ];
    return Wrap(
      spacing: AppSpacing.sm,
      runSpacing: AppSpacing.sm,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(
          isAdministrator ? l10n.adminExplorerTitle : l10n.adminMyOrganization,
          style: context.textTheme.headlineSmall,
        ),
        SizedBox(
          width: context.layout.isPhone ? double.infinity : null,
          child: SegmentedButton<ExplorerEntity>(
            showSelectedIcon: false,
            segments: [
              for (final e in entities)
                ButtonSegment(
                  value: e,
                  label: Text(
                    '${ExplorerLabels.entity(context, e)} ${counts[e] ?? 0}',
                    maxLines: 1,
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
            ],
            selected: {entity},
            onSelectionChanged: (value) => onEntity(value.first),
          ),
        ),
        if (!isAdministrator && organizationId != null)
          AppButton(
            label: l10n.adminMyOrganization,
            icon: Icons.apartment_rounded,
            variant: AppButtonVariant.ghost,
            fullWidth: false,
            onPressed: () =>
                context.push(AdminRoutes.organizationPath(organizationId!)),
          ),
        if (!context.layout.isPhone)
          AppButton(
            label: compact
                ? l10n.adminDensityCompact
                : l10n.adminDensityComfortable,
            icon: Icons.density_medium_rounded,
            variant: AppButtonVariant.secondary,
            fullWidth: false,
            onPressed: onToggleDensity,
          ),
        _buildCreateMenu(context),
      ],
    );
  }

  Widget _buildCreateMenu(BuildContext context) {
    final l10n = context.l10n;
    return MenuAnchor(
      menuChildren: [
        MenuItemButton(
          leadingIcon: const Icon(Icons.table_restaurant_rounded),
          onPressed: online
              ? () => context.push(
                  AdminRoutes.tableNewPath(
                    organizationId: isAdministrator ? null : organizationId,
                  ),
                )
              : null,
          child: Text(l10n.adminCreateTable),
        ),
        MenuItemButton(
          leadingIcon: const Icon(Icons.apartment_rounded),
          onPressed: online && isAdministrator
              ? () => context.push(AdminRoutes.organizationNew)
              : null,
          child: Text(
            isAdministrator
                ? l10n.adminCreateOrganization
                : '${l10n.adminCreateOrganization} · ${l10n.adminAdministratorOnly}',
          ),
        ),
        MenuItemButton(
          leadingIcon: const Icon(Icons.person_add_alt_1_rounded),
          onPressed: online
              ? () => context.push(
                  AdminRoutes.invitePath(
                    role: isAdministrator ? 'coordinator' : 'facilitator',
                    organizationId: isAdministrator ? null : organizationId,
                  ),
                )
              : null,
          child: Text(l10n.adminInvitePerson),
        ),
      ],
      builder: (context, controller, _) => AppButton(
        label: l10n.adminCreate,
        icon: Icons.add_rounded,
        trailingIcon: Icons.expand_more_rounded,
        size: AppButtonSize.small,
        fullWidth: false,
        onPressed: () =>
            controller.isOpen ? controller.close() : controller.open(),
      ),
    );
  }
}
