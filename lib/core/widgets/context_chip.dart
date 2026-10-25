import 'package:flutter/material.dart';

import '../extensions/build_context_x.dart';
import '../models/user_role.dart';
import '../theme/app_spacing.dart';
import '../theme/status_tone.dart';
import 'role_chip.dart';
import 'status_border.dart';

/// Header chip showing the active context ("Estás como · Coordinador ·
/// Fundación Luz"). Tapping opens the context switcher; with a single
/// context it is static (dashed border, no chevron).
class ContextChip extends StatelessWidget {
  const ContextChip({
    super.key,
    required this.role,
    required this.contextName,
    this.onTap,
  });

  final UserRole role;
  final String contextName;

  /// `null` renders the static variant.
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final isStatic = onTap == null;
    final roleLabel = RoleChip.labelFor(context, role);
    final radius = BorderRadius.circular(AppRadii.pill);

    return Semantics(
      button: !isStatic,
      label: '${context.l10n.contextChipLabel} $roleLabel, $contextName',
      onTap: onTap,
      excludeSemantics: true,
      child: CustomPaint(
        foregroundPainter: StatusBorderPainter(
          color: colors.border,
          style: isStatic ? StatusLineStyle.dashed : StatusLineStyle.solid,
          width: 2,
        ),
        child: Material(
          color: colors.surface,
          shape: RoundedRectangleBorder(borderRadius: radius),
          child: InkWell(
            borderRadius: radius,
            onTap: onTap,
            child: ConstrainedBox(
              constraints: const BoxConstraints(minHeight: AppSizes.control),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  AppSpacing.xs,
                  AppSpacing.xxs,
                  AppSpacing.md,
                  AppSpacing.xxs,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      radius: 18,
                      backgroundColor: colors.surfaceAlt,
                      child: Icon(
                        RoleChip.iconFor(role),
                        size: AppSizes.iconMd,
                        color: colors.accent,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Flexible(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            roleLabel.toUpperCase(),
                            style: context.textStyles.kicker,
                          ),
                          Text(
                            contextName,
                            style: context.textTheme.labelLarge,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    if (!isStatic) ...[
                      const SizedBox(width: AppSpacing.xs),
                      Icon(Icons.expand_more_rounded, color: colors.muted),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
