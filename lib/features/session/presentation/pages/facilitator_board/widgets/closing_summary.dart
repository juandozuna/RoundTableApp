import 'package:flutter/material.dart';

import '../../../../../../core/extensions/build_context_x.dart';
import '../../../../../../core/models/sync_state.dart';
import '../../../../../../core/theme/app_spacing.dart';
import '../../../../../../core/theme/status_tone.dart';
import '../../../../../../core/widgets/app_message.dart';
import '../../../../domain/models/live_session.dart';
import '../../../../domain/models/member_step.dart';
import '../../../../domain/models/session_participant.dart';
import '../../../widgets/session_timer.dart';
import '../board_progress.dart';

/// Facilitator summary shown once the session is closed: attendance,
/// duration, answers received by step with averages, and the notes that
/// matter (automatic attendance, late sync, answers still on phones).
class ClosingSummary extends StatelessWidget {
  const ClosingSummary({super.key, required this.session});

  final LiveSession session;

  List<SessionParticipant> get _people => session.participants;

  Duration? get _duration {
    final info = session.session;
    final start = info.startedAt;
    final end = info.endedAt;
    return start == null || end == null ? null : end.difference(start);
  }

  /// Captured and already stored on the server.
  bool _isReceived(SessionParticipant p, MemberStep step) {
    final state = LiveSession.progressOf(p, step).syncState;
    return state == SyncState.synced || state == SyncState.syncedLate;
  }

  ({int expected, int received, String average}) _aggregate(MemberStep step) {
    final expected = _people.where((p) => session.appliesTo(p, step)).toList();
    final received = expected.where((p) => _isReceived(p, step)).toList();
    final scores = [
      for (final p in received) ?LiveSession.progressOf(p, step).score,
    ];
    final average = scores.isEmpty
        ? '–'
        : (scores.reduce((a, b) => a + b) / scores.length).toStringAsFixed(1);
    return (
      expected: expected.length,
      received: received.length,
      average: average,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final followUp = _aggregate(MemberStep.followUp);
    final reflection = _aggregate(MemberStep.reflection);
    final commitment = _aggregate(MemberStep.commitment);
    final attending = BoardProgress.attending(session);
    final absent = _people.where((p) => p.isAbsent).length;
    final autoCount = _people.where((p) => p.attendanceAuto).length;
    final late = _people
        .expand(
          (p) => MemberStep.values.where(
            (s) => LiveSession.progressOf(p, s).isSyncedLate,
          ),
        )
        .length;
    final unsynced = MemberStep.values.fold<int>(0, (sum, step) {
      final a = _aggregate(step);
      final captured = _people
          .where((p) => LiveSession.progressOf(p, step).isDone)
          .length;
      return sum + (captured - a.received);
    });
    final duration = _duration;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildTileGrid(context, [
          (
            value: '$attending/${_people.length}',
            caption: absent > 0
                ? l10n.sessionBoardSummaryPresentWithAbsent(absent)
                : l10n.sessionBoardSummaryPresent,
            wide: false,
          ),
          (
            value: duration == null ? '–' : SessionTimerFormat.format(duration),
            caption: l10n.sessionBoardSummaryDuration(
              session.table.durationMinutes,
            ),
            wide: false,
          ),
          (
            value: '${followUp.received}/${followUp.expected}',
            caption: l10n.sessionBoardSummaryFollowUp(followUp.average),
            wide: false,
          ),
          (
            value: '${reflection.received}/${reflection.expected}',
            caption: l10n.sessionBoardSummaryValue(reflection.average),
            wide: false,
          ),
          (
            value: '${commitment.received}/${commitment.expected}',
            caption: l10n.sessionBoardSummaryCommitments,
            wide: true,
          ),
        ]),
        if (autoCount > 0)
          _note(
            context,
            AppMessage(
              tone: StatusTone.ok,
              title: l10n.sessionBoardSummaryAutoTitle,
              detail: l10n.sessionBoardSummaryAutoBody(autoCount),
            ),
          ),
        if (late > 0)
          _note(
            context,
            AppMessage(
              tone: StatusTone.late,
              title: l10n.syncSyncedLate,
              detail: l10n.sessionBoardSummaryLateBody(late),
            ),
          ),
        if (unsynced > 0)
          _note(
            context,
            AppMessage(
              tone: StatusTone.pending,
              title: l10n.sessionBoardSummaryUnsyncedTitle(unsynced),
              detail: l10n.sessionBoardSummaryUnsyncedBody,
            ),
          ),
      ],
    );
  }

  Widget _note(BuildContext context, Widget child) => Padding(
    padding: const EdgeInsets.only(top: AppSpacing.sm),
    child: child,
  );

  Widget _buildTileGrid(BuildContext context, List<_TileData> tiles) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final half = (constraints.maxWidth - AppSpacing.sm) / 2;
        return Wrap(
          spacing: AppSpacing.sm,
          runSpacing: AppSpacing.sm,
          children: [
            for (final tile in tiles)
              SizedBox(
                width: tile.wide ? constraints.maxWidth : half,
                child: _buildTile(context, tile),
              ),
          ],
        );
      },
    );
  }

  Widget _buildTile(BuildContext context, _TileData tile) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm + 2,
      ),
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.circular(AppRadii.lg),
        border: Border.all(color: context.colors.line),
      ),
      child: Row(
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 84),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(tile.value, style: context.textStyles.numberLarge),
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Text(tile.caption, style: context.textTheme.bodySmall),
          ),
        ],
      ),
    );
  }
}

typedef _TileData = ({String value, String caption, bool wide});
