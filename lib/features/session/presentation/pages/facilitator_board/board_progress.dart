import '../../../../../core/models/attendance_status.dart';
import '../../../domain/models/facilitator_stage.dart';
import '../../../domain/models/live_session.dart';
import '../../../domain/models/member_step.dart';

/// The big "a/b" in the middle of the round table for one stage.
class BoardProgress {
  const BoardProgress({
    required this.done,
    required this.total,
    required this.noPrevious,
    required this.withPendingCommitment,
  });

  final int done;
  final int total;

  /// People with nothing to review (follow-up stage).
  final int noPrevious;

  /// Finished the reflection but not the commitment (value stage).
  final int withPendingCommitment;

  static BoardProgress of(LiveSession session, FacilitatorStage stage) {
    final people = session.participants;
    bool done(MemberStep step, p) => LiveSession.progressOf(p, step).isDone;
    switch (stage) {
      case FacilitatorStage.open:
        return BoardProgress(
          done: people.length,
          total: people.length,
          noPrevious: 0,
          withPendingCommitment: 0,
        );
      case FacilitatorStage.attendance:
        return BoardProgress(
          done: people.where((p) => p.hasAttendance).length,
          total: people.length,
          noPrevious: 0,
          withPendingCommitment: 0,
        );
      case FacilitatorStage.followUp:
        final applicable = people
            .where((p) => session.appliesTo(p, MemberStep.followUp))
            .toList();
        return BoardProgress(
          done: applicable.where((p) => done(MemberStep.followUp, p)).length,
          total: applicable.length,
          noPrevious: people.length - applicable.length,
          withPendingCommitment: 0,
        );
      case FacilitatorStage.value:
        final both = people
            .where(
              (p) =>
                  done(MemberStep.reflection, p) &&
                  done(MemberStep.commitment, p),
            )
            .length;
        return BoardProgress(
          done: both,
          total: people.length,
          noPrevious: 0,
          withPendingCommitment: people
              .where(
                (p) =>
                    done(MemberStep.reflection, p) &&
                    !done(MemberStep.commitment, p),
              )
              .length,
        );
      case FacilitatorStage.closing:
        var total = 0;
        var captured = 0;
        for (final p in people) {
          for (final step in MemberStep.values) {
            if (!session.appliesTo(p, step)) continue;
            total++;
            if (done(step, p)) captured++;
          }
        }
        return BoardProgress(
          done: captured,
          total: total,
          noPrevious: 0,
          withPendingCommitment: 0,
        );
    }
  }

  /// People counted present or late today.
  static int attending(LiveSession session) => session.participants
      .where(
        (p) =>
            p.attendance == AttendanceStatus.present ||
            p.attendance == AttendanceStatus.late,
      )
      .length;
}
