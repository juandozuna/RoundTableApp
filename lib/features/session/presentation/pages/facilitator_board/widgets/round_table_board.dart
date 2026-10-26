import 'package:flutter/material.dart';

import '../../../../../../core/extensions/build_context_x.dart';
import '../../../../../../core/theme/app_spacing.dart';
import '../../../../../../l10n/gen/app_localizations.dart';
import '../../../../domain/models/facilitator_stage.dart';
import '../../../../domain/models/live_session.dart';
import '../../../../domain/models/session_participant.dart';
import '../board_progress.dart';
import '../board_texts.dart';
import '../round_table_layout.dart';
import '../seat_status.dart';
import 'seat_view.dart';

/// The round table: seats around a tabletop that counts progress for the
/// stage being viewed (3 to 9 seats, facilitator included).
class RoundTableBoard extends StatelessWidget {
  const RoundTableBoard({
    super.key,
    required this.session,
    required this.viewing,
    required this.canSeeOthers,
    required this.width,
    required this.onSeatTap,
    this.highlightedIds = const {},
  });

  final LiveSession session;
  final FacilitatorStage viewing;

  /// False while the facilitator is offline: others' answers are unknown.
  final bool canSeeOthers;
  final double width;
  final ValueChanged<SessionParticipant> onSeatTap;
  final Set<String> highlightedIds;

  @override
  Widget build(BuildContext context) {
    final people = session.participants;
    final layout = RoundTableLayout.compute(seats: people.length, width: width);
    final l10n = context.l10n;
    return Semantics(
      container: true,
      label: l10n.sessionBoardTableSemantics(people.length, 9),
      child: SizedBox(
        width: layout.width,
        height: layout.height,
        child: Stack(
          children: [
            _buildTabletop(context, layout),
            for (var i = 0; i < people.length; i++)
              Positioned(
                left: layout.seats[i].dx,
                top: layout.seats[i].dy,
                child: SeatView(
                  participant: people[i],
                  width: layout.seatWidth,
                  avatarSize: layout.avatarSize,
                  status: SeatStatus.of(
                    session: session,
                    participant: people[i],
                    viewing: viewing,
                    canSeeOthers: canSeeOthers,
                  ),
                  showAttendanceChip: viewing.index >= 2,
                  highlighted: highlightedIds.contains(people[i].personId),
                  onTap: () => onSeatTap(people[i]),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabletop(BuildContext context, RoundTableLayout layout) {
    final l10n = context.l10n;
    final colors = context.colors;
    final progress = BoardProgress.of(session, viewing);
    final rect = layout.centerRect;
    return Positioned.fromRect(
      rect: rect,
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: colors.surface,
          border: Border.all(color: colors.line, width: 2),
          boxShadow: [BoxShadow(color: colors.glow, blurRadius: 40)],
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.sm),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '${progress.done}',
                        style: context.textStyles.numberLarge,
                      ),
                      TextSpan(
                        text: '/${progress.total}',
                        style: context.textStyles.number.copyWith(
                          color: colors.muted,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                _caption(l10n),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: context.textTheme.labelSmall!.copyWith(
                  color: colors.muted,
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                canSeeOthers
                    ? viewing.title(l10n)
                    : l10n.sessionBoardNoLiveData,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.textTheme.labelSmall!.copyWith(
                  color: colors.accent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _caption(AppLocalizations l10n) => switch (viewing) {
    FacilitatorStage.open => l10n.sessionBoardCaptionSeats,
    FacilitatorStage.attendance => l10n.sessionBoardCaptionWithList,
    FacilitatorStage.followUp => l10n.sessionBoardCaptionAnswered,
    FacilitatorStage.value => l10n.sessionBoardCaptionCompleted,
    FacilitatorStage.closing => l10n.sessionBoardCaptionResponses,
  };
}
