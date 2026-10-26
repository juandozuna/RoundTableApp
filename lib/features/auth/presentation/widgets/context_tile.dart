import 'package:flutter/material.dart';

import '../../../../core/extensions/build_context_x.dart';
import '../../../../core/models/user_role.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/app_avatar.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/role_chip.dart';
import '../../domain/models/account_context.dart';

/// One selectable role/scope ("COORDINADOR · Fundación Luz"). Used by the
/// full-screen picker, the switcher sheet and the account page.
class ContextTile extends StatelessWidget {
  const ContextTile({
    super.key,
    required this.context_,
    required this.onTap,
    this.selected = false,
    this.showDescription = false,
  });

  final AccountContext context_;
  final VoidCallback? onTap;
  final bool selected;

  /// Adds the one-line explanation of the role (picker).
  final bool showDescription;

  static String scopeLabel(BuildContext context, AccountContext value) =>
      value.scopeName ?? context.l10n.authContextPlatform;

  static String descriptionFor(BuildContext context, UserRole role) {
    final l10n = context.l10n;
    return switch (role) {
      UserRole.administrator => l10n.authContextAdministratorDesc,
      UserRole.coordinator => l10n.authContextCoordinatorDesc,
      UserRole.facilitator => l10n.authContextFacilitatorDesc,
      UserRole.member => l10n.authContextMemberDesc,
    };
  }

  @override
  Widget build(BuildContext context) {
    final scope = scopeLabel(context, context_);
    final role = RoleChip.labelFor(context, context_.kind);
    return AppCard(
      highlighted: selected,
      onTap: onTap,
      semanticLabel: '$role, $scope',
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md + 2,
        vertical: AppSpacing.md,
      ),
      child: ExcludeSemantics(
        child: Row(
          children: [
            AppAvatar(name: scope, size: 48),
            const SizedBox(width: AppSpacing.md + 2),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(role.toUpperCase(), style: context.textStyles.kicker),
                  Text(scope, style: context.textTheme.titleMedium),
                  if (showDescription)
                    Text(
                      descriptionFor(context, context_.kind),
                      style: context.textTheme.bodySmall,
                    )
                  else if (context_.organizationName != null &&
                      context_.organizationName != scope)
                    Text(
                      context_.organizationName!,
                      style: context.textTheme.bodySmall,
                    ),
                ],
              ),
            ),
            Icon(
              selected
                  ? Icons.check_circle_rounded
                  : Icons.chevron_right_rounded,
              color: selected ? context.colors.accent : context.colors.muted,
            ),
          ],
        ),
      ),
    );
  }
}
