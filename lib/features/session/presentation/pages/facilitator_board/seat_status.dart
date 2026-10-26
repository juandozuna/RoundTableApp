import 'package:flutter/material.dart';

import '../../../../../core/models/attendance_status.dart';
import '../../../../../core/models/sync_state.dart';
import '../../../../../core/theme/status_tone.dart';
import '../../../domain/models/facilitator_stage.dart';
import '../../../domain/models/live_session.dart';
import '../../../domain/models/member_step.dart';
import '../../../domain/models/session_participant.dart';

/// What a seat's caption says; the widget turns it into Spanish.
enum SeatLabel {
  none,
  unmarked,
  present,
  late,
  excused,
  absent,
  answered,
  pending,
  offline,
  syncing,
  savedOnPhone,
  syncedLate,
  skipped,
  missed,
  progress,
}

/// Visual state of one seat on the round table: ring tone (colour + line
/// style), badge icon and caption. Pure so it is testable without widgets.
class SeatStatus {
  const SeatStatus({
    required this.tone,
    required this.label,
    this.icon,
    this.done = 0,
    this.total = 0,
    this.pips = const [],
  });

  final StatusTone tone;
  final SeatLabel label;
  final IconData? icon;

  /// For [SeatLabel.progress]: steps captured of steps expected.
  final int done;
  final int total;

  /// Two dots (reflection, commitment) inside the Valor stage.
  final List<StatusTone> pips;

  /// Seat status for [participant] while the board shows [viewing].
  ///
  /// [canSeeOthers] is false while the facilitator has no connection: other
  /// people's answers arrive only on sync, so their seats read "Sin red".
  static SeatStatus of({
    required LiveSession session,
    required SessionParticipant participant,
    required FacilitatorStage viewing,
    required bool canSeeOthers,
  }) {
    switch (viewing) {
      case FacilitatorStage.open:
        return const SeatStatus(
          tone: StatusTone.neutral,
          label: SeatLabel.none,
        );
      case FacilitatorStage.attendance:
        return _attendance(participant);
      case FacilitatorStage.followUp:
        return forStep(session, participant, MemberStep.followUp, canSeeOthers);
      case FacilitatorStage.value:
        return _aggregate(session, participant, const [
          MemberStep.reflection,
          MemberStep.commitment,
        ], canSeeOthers);
      case FacilitatorStage.closing:
        return _aggregate(
          session,
          participant,
          MemberStep.values,
          canSeeOthers,
        );
    }
  }

  static SeatStatus _attendance(SessionParticipant p) => switch (p.attendance) {
    null => const SeatStatus(
      tone: StatusTone.pending,
      label: SeatLabel.unmarked,
      icon: Icons.more_horiz_rounded,
    ),
    AttendanceStatus.present => const SeatStatus(
      tone: StatusTone.ok,
      label: SeatLabel.present,
      icon: Icons.check_rounded,
    ),
    AttendanceStatus.late => const SeatStatus(
      tone: StatusTone.info,
      label: SeatLabel.late,
      icon: Icons.schedule_rounded,
    ),
    AttendanceStatus.excused => const SeatStatus(
      tone: StatusTone.neutral,
      label: SeatLabel.excused,
      icon: Icons.remove_rounded,
    ),
    AttendanceStatus.absent => const SeatStatus(
      tone: StatusTone.offline,
      label: SeatLabel.absent,
      icon: Icons.close_rounded,
    ),
  };

  /// Status of one step of one person.
  static SeatStatus forStep(
    LiveSession session,
    SessionParticipant p,
    MemberStep step,
    bool canSeeOthers,
  ) {
    if (!session.appliesTo(p, step)) {
      return const SeatStatus(
        tone: StatusTone.neutral,
        label: SeatLabel.skipped,
        icon: Icons.remove_rounded,
      );
    }
    final progress = LiveSession.progressOf(p, step);
    if (progress.isDone) {
      return switch (progress.syncState) {
        SyncState.pending => const SeatStatus(
          tone: StatusTone.offline,
          label: SeatLabel.savedOnPhone,
          icon: Icons.cloud_off_rounded,
        ),
        SyncState.syncing => const SeatStatus(
          tone: StatusTone.syncing,
          label: SeatLabel.syncing,
          icon: Icons.sync_rounded,
        ),
        SyncState.syncedLate => const SeatStatus(
          tone: StatusTone.late,
          label: SeatLabel.syncedLate,
          icon: Icons.history_rounded,
        ),
        _ => const SeatStatus(
          tone: StatusTone.ok,
          label: SeatLabel.answered,
          icon: Icons.check_rounded,
        ),
      };
    }
    if (session.session.answersClosed || session.session.isFinal) {
      return const SeatStatus(
        tone: StatusTone.error,
        label: SeatLabel.missed,
        icon: Icons.close_rounded,
      );
    }
    if (!p.isMe && !canSeeOthers) {
      return const SeatStatus(
        tone: StatusTone.offline,
        label: SeatLabel.offline,
        icon: Icons.cloud_off_rounded,
      );
    }
    return const SeatStatus(
      tone: StatusTone.pending,
      label: SeatLabel.pending,
      icon: Icons.more_horiz_rounded,
    );
  }

  static SeatStatus _aggregate(
    LiveSession session,
    SessionParticipant p,
    List<MemberStep> steps,
    bool canSeeOthers,
  ) {
    final applicable = [
      for (final step in steps)
        if (session.appliesTo(p, step)) step,
    ];
    final parts = [
      for (final step in applicable) forStep(session, p, step, canSeeOthers),
    ];
    final done = parts
        .where(
          (s) =>
              s.label == SeatLabel.answered ||
              s.label == SeatLabel.syncedLate ||
              s.label == SeatLabel.savedOnPhone ||
              s.label == SeatLabel.syncing,
        )
        .length;
    // The loudest problem wins, in the prototype's priority order.
    const priority = [
      StatusTone.syncing,
      StatusTone.offline,
      StatusTone.pending,
      StatusTone.error,
      StatusTone.late,
    ];
    var tone = StatusTone.ok;
    for (final candidate in priority) {
      if (parts.any((s) => s.tone == candidate)) {
        tone = candidate;
        break;
      }
    }
    final allDone = done == applicable.length;
    return SeatStatus(
      tone: tone,
      label: allDone && tone == StatusTone.ok
          ? SeatLabel.answered
          : SeatLabel.progress,
      icon: parts.isEmpty
          ? Icons.remove_rounded
          : parts
                .firstWhere((s) => s.tone == tone, orElse: () => parts.first)
                .icon,
      done: done,
      total: applicable.length,
      pips: steps.length == 2 && applicable.length == 2
          ? [for (final s in parts) s.tone]
          : const [],
    );
  }
}
