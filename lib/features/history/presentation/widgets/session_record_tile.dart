import 'package:flutter/material.dart';

import '../../../../core/extensions/build_context_x.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/status_tone.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/status_pill.dart';
import '../../domain/models/member_history.dart';
import 'history_format.dart';
import 'incomplete_session_pill.dart';
import 'late_synced_pill.dart';

/// A session in a person's history: date, value, attendance, late sync.
class SessionRecordTile extends StatelessWidget {
  const SessionRecordTile({super.key, required this.record});

  final SessionRecord record;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final valueName = record.valueName;
    final sequence = record.valueSequence;
    return AppCard(
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.historySessionTitle(record.scheduledAt.toLocal()),
                  style: context.textTheme.titleMedium,
                ),
                if (valueName != null && sequence != null)
                  Text(
                    l10n.historySessionValueLine(sequence, valueName),
                    style: context.textTheme.bodyMedium,
                  ),
              ],
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.xs,
            alignment: WrapAlignment.end,
            children: [
              if (record.isOpen)
                StatusPill(
                  tone: StatusTone.syncing,
                  label: l10n.historySessionOpenNow,
                ),
              StatusPill(
                tone: HistoryFormat.attendanceTone(record.attendance),
                label: HistoryFormat.attendanceLabel(
                  context,
                  record.attendance,
                ),
              ),
              if (record.incomplete) const IncompleteSessionPill(),
              if (record.syncedLate) const LateSyncedPill(),
            ],
          ),
        ],
      ),
    );
  }
}
