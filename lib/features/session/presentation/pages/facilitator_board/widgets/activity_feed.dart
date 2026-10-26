import 'package:flutter/material.dart';

import '../../../../../../core/extensions/build_context_x.dart';
import '../../../../../../core/theme/app_spacing.dart';
import '../../../../domain/models/session_activity.dart';
import '../../../widgets/session_formatters.dart';

/// "En vivo · actividad": the latest things that arrived at the table.
class ActivityFeed extends StatelessWidget {
  const ActivityFeed({super.key, required this.activity, this.limit = 4});

  final List<SessionActivity> activity;
  final int limit;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final items = activity.take(limit).toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          l10n.sessionBoardActivityTitle.toUpperCase(),
          style: context.textStyles.kicker,
        ),
        const SizedBox(height: AppSpacing.sm),
        if (items.isEmpty)
          _buildRow(
            context,
            child: Text(
              l10n.sessionBoardActivityEmpty,
              style: context.textTheme.bodySmall,
            ),
          )
        else
          for (final item in items) ...[
            _buildItem(context, item),
            const SizedBox(height: AppSpacing.xs + 2),
          ],
      ],
    );
  }

  Widget _buildItem(BuildContext context, SessionActivity item) {
    final l10n = context.l10n;
    final text = switch (item.kind) {
      SessionActivityKind.attendance =>
        item.autoAttendance
            ? l10n.sessionBoardActivityAutoAttendance(item.personName)
            : l10n.sessionBoardActivityAttendance(item.personName),
      SessionActivityKind.followUp => l10n.sessionBoardActivityAnswered(
        item.personName,
        l10n.stageFollowUp,
      ),
      SessionActivityKind.reflection => l10n.sessionBoardActivityAnswered(
        item.personName,
        l10n.stageCurrentValue,
      ),
      SessionActivityKind.commitment => l10n.sessionBoardActivityAnswered(
        item.personName,
        l10n.stageCommitment,
      ),
    };
    final late = item.syncedLate;
    return _buildRow(
      context,
      borderColor: late
          ? context.statusColors.late
          : item.autoAttendance
          ? context.statusColors.ok
          : null,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            SessionFormatters.clock(context, item.at),
            style: context.textTheme.labelSmall!.copyWith(
              color: context.colors.muted,
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Text(
              late ? '$text · ${l10n.sessionBoardActivityLate}' : text,
              style: context.textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRow(
    BuildContext context, {
    required Widget child,
    Color? borderColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md - 2,
        vertical: AppSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.circular(AppRadii.md),
        border: Border.all(color: borderColor ?? context.colors.line),
      ),
      child: child,
    );
  }
}
