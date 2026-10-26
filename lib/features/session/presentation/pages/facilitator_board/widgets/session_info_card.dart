import 'package:flutter/material.dart';

import '../../../../../../core/constants/app_constants.dart';
import '../../../../../../core/extensions/build_context_x.dart';
import '../../../../../../core/theme/app_spacing.dart';
import '../../../../domain/models/live_session.dart';
import '../../../widgets/session_formatters.dart';

/// "Sesión de hoy" facts shown before the session opens.
class SessionInfoCard extends StatelessWidget {
  const SessionInfoCard({super.key, required this.session});

  final LiveSession session;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final followUp = session.followUpValue;
    final rows = <(String, String)>[
      (l10n.sessionBoardInfoTable, session.table.name),
      (l10n.sessionBoardInfoOrganization, session.table.organizationName),
      (
        l10n.sessionBoardInfoScheduled,
        '${SessionFormatters.shortWhen(context, session.session.scheduledAt)}'
            ' · ${l10n.sessionBoardInfoMaxMinutes(session.table.durationMinutes)}',
      ),
      (
        l10n.sessionBoardInfoCurrentValue,
        '${session.value.sequence} · ${session.value.name}',
      ),
      if (followUp != null)
        (
          l10n.sessionBoardInfoPreviousValue,
          '${followUp.sequence} · ${followUp.name}',
        ),
      (
        l10n.sessionBoardInfoSeats,
        l10n.sessionBoardInfoSeatsValue(
          session.seatCount,
          AppLimits.maxTableSeats,
        ),
      ),
    ];
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.circular(AppRadii.xl),
        border: Border.all(color: context.colors.line),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            l10n.sessionBoardInfoTitle.toUpperCase(),
            style: context.textStyles.kicker,
          ),
          for (var i = 0; i < rows.length; i++)
            Container(
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
              decoration: BoxDecoration(
                border: i == rows.length - 1
                    ? null
                    : Border(bottom: BorderSide(color: context.colors.line)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(rows[i].$1, style: context.textTheme.bodyMedium),
                  const SizedBox(width: AppSpacing.md),
                  Flexible(
                    child: Text(
                      rows[i].$2,
                      textAlign: TextAlign.end,
                      style: context.textTheme.titleSmall,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
