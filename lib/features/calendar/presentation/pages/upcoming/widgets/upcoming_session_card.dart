import 'package:flutter/material.dart';

import '../../../../../../core/extensions/build_context_x.dart';
import '../../../../../../core/theme/app_spacing.dart';
import '../../../../../../core/theme/status_tone.dart';
import '../../../../../../core/widgets/app_card.dart';
import '../../../../../../core/widgets/status_pill.dart';
import '../../../../domain/models/upcoming_session.dart';
import '../../../calendar_format.dart';

/// One upcoming session: the time on the table's wall clock, where it is and
/// who leads it, and its markers (open, cancelled, extraordinary, moved).
class UpcomingSessionCard extends StatelessWidget {
  const UpcomingSessionCard({super.key, required this.session, this.onTap});

  final UpcomingSession session;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AppCard(
      onTap: onTap,
      highlighted: session.isOpen,
      semanticLabel: onTap == null
          ? null
          : l10n.calendarOpenTable(session.tableName),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTime(context),
          const SizedBox(height: AppSpacing.sm),
          _buildWhere(context),
          if (_hasMarkers) ...[
            const SizedBox(height: AppSpacing.sm),
            _buildMarkers(context),
          ],
        ],
      ),
    );
  }

  bool get _hasMarkers =>
      session.isOpen ||
      session.isCancelled ||
      session.isExtraordinary ||
      session.isRescheduled;

  Widget _buildTime(BuildContext context) {
    final style = context.textTheme.headlineSmall!.copyWith(
      decoration: session.isCancelled ? TextDecoration.lineThrough : null,
      fontFeatures: const [FontFeature.tabularFigures()],
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(CalendarFormat.time(session.localStart), style: style),
        Text(
          context.l10n.calendarTableTime(session.timezone),
          style: context.textTheme.bodySmall,
        ),
      ],
    );
  }

  Widget _buildWhere(BuildContext context) {
    final l10n = context.l10n;
    final textTheme = context.textTheme;
    final place = [
      ?session.locationName,
      session.facilitatorName ?? l10n.calendarNoFacilitator,
    ].join(' · ');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(session.tableName, style: textTheme.titleMedium),
        Text(place, style: textTheme.bodyMedium),
      ],
    );
  }

  Widget _buildMarkers(BuildContext context) {
    final l10n = context.l10n;
    final original = session.rescheduledFromLocal;
    return Wrap(
      spacing: AppSpacing.sm,
      runSpacing: AppSpacing.xs,
      children: [
        if (session.isOpen)
          StatusPill(tone: StatusTone.ok, label: l10n.calendarOpenBadge),
        if (session.isCancelled)
          StatusPill(
            tone: StatusTone.error,
            label: l10n.calendarCancelledBadge,
          ),
        if (session.isExtraordinary)
          StatusPill(
            tone: StatusTone.info,
            label: l10n.adminSessionExtraBadge,
            icon: Icons.bolt_rounded,
          ),
        if (original != null)
          StatusPill(
            tone: StatusTone.late,
            label: l10n.calendarMovedBadge(
              CalendarFormat.shortDateTime(original),
            ),
          ),
      ],
    );
  }
}
