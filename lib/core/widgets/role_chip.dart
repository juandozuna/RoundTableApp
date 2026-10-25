import 'package:flutter/material.dart';

import '../extensions/build_context_x.dart';
import '../models/user_role.dart';
import '../theme/app_spacing.dart';

/// Shows a role with its icon and localized name.
class RoleChip extends StatelessWidget {
  const RoleChip({super.key, required this.role});

  final UserRole role;

  static IconData iconFor(UserRole role) => switch (role) {
    UserRole.administrator => Icons.admin_panel_settings_rounded,
    UserRole.coordinator => Icons.hub_rounded,
    UserRole.facilitator => Icons.workspace_premium_rounded,
    UserRole.member => Icons.person_rounded,
  };

  static String labelFor(BuildContext context, UserRole role) {
    final l10n = context.l10n;
    return switch (role) {
      UserRole.administrator => l10n.roleAdministrator,
      UserRole.coordinator => l10n.roleCoordinator,
      UserRole.facilitator => l10n.roleFacilitator,
      UserRole.member => l10n.roleMember,
    };
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.sm,
        AppSpacing.xs,
        AppSpacing.md - 2,
        AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: colors.surfaceAlt,
        borderRadius: BorderRadius.circular(AppRadii.pill),
        border: Border.all(color: colors.border, width: 1.5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(iconFor(role), size: AppSizes.iconSm, color: colors.accent),
          const SizedBox(width: AppSpacing.xs + 2),
          Text(labelFor(context, role), style: context.textStyles.pill),
        ],
      ),
    );
  }
}
