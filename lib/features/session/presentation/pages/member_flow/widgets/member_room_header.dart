import 'package:flutter/material.dart';

import '../../../../../../core/extensions/build_context_x.dart';
import '../../../../../../core/services/clock/clock_service.dart';
import '../../../../../../core/services/clock/system_clock_service.dart';
import '../../../../../../core/theme/app_spacing.dart';
import '../../../../domain/models/facilitator_stage.dart';
import '../../../widgets/session_connection_pill.dart';
import '../../../widgets/session_timer.dart';
import '../../session/cubit/session_state.dart';
import 'member_peers_strip.dart';

/// Presence strip of the member phone: connection, "La mesa está en: …" (or
/// "A tu ritmo" when self-paced), elapsed time and who is at the table.
class MemberRoomHeader extends StatelessWidget {
  const MemberRoomHeader({
    super.key,
    required this.view,
    this.clock = const SystemClockService(),
  });

  final SessionView view;
  final ClockService clock;

  @override
  Widget build(BuildContext context) {
    final session = view.session;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(child: SessionConnectionPill(view: view)),
            const Spacer(),
            Flexible(
              child: SessionTimer(
                startedAt: session.session.startedAt,
                endedAt: session.session.endedAt,
                limitMinutes: session.table.durationMinutes,
                clock: clock,
              ),
            ),
          ],
        ),
        _buildPlace(context),
        const SizedBox(height: AppSpacing.sm),
        MemberPeersStrip(session: session),
      ],
    );
  }

  Widget _buildPlace(BuildContext context) {
    final l10n = context.l10n;
    final style = context.textTheme.labelLarge;
    if (!view.isLive) {
      return Text(l10n.sessionMemberPaceOwn, style: style);
    }
    return Text.rich(
      TextSpan(
        style: style,
        children: [
          TextSpan(text: '${l10n.sessionMemberTableIs} '),
          TextSpan(
            text: _stageName(context, view.stage),
            style: style!.copyWith(color: context.colors.accent),
          ),
        ],
      ),
    );
  }

  static String _stageName(BuildContext context, FacilitatorStage stage) {
    final l10n = context.l10n;
    return switch (stage) {
      FacilitatorStage.open => l10n.stageOpen,
      FacilitatorStage.attendance => l10n.stageAttendance,
      FacilitatorStage.followUp => l10n.stageFollowUp,
      FacilitatorStage.value => l10n.stageCurrentValue,
      FacilitatorStage.closing => l10n.stageClosing,
    };
  }
}
