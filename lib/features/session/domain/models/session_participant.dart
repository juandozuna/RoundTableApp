import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/models/attendance_status.dart';
import 'step_progress.dart';

part 'session_participant.freezed.dart';

/// A person sitting at the table today, the facilitator included (ADR 0014).
@freezed
abstract class SessionParticipant with _$SessionParticipant {
  const factory SessionParticipant({
    required String personId,
    required String firstName,
    required String lastName,
    required bool isFacilitator,
    required bool isMe,

    /// Whether the person has a commitment from the previous session to
    /// review. False for a first session or an absence last week.
    required bool hasPreviousCommitment,
    AttendanceStatus? attendance,

    /// The server flipped the attendance because the person submitted
    /// answers (ADR 0005).
    @Default(false) bool attendanceAuto,
    @Default(false) bool attendanceSyncedLate,
    @Default(StepProgress.none) StepProgress followUp,
    @Default(StepProgress.none) StepProgress reflection,
    @Default(StepProgress.none) StepProgress commitment,
  }) = _SessionParticipant;

  const SessionParticipant._();

  String get fullName => '$firstName $lastName'.trim();

  bool get hasAttendance => attendance != null;

  bool get isAbsent => attendance == AttendanceStatus.absent;

  /// Counts as in the room (present or late).
  bool get isAttending =>
      attendance == AttendanceStatus.present ||
      attendance == AttendanceStatus.late;

  /// Follow-up applies only to people with something to review.
  bool get followUpApplies => hasPreviousCommitment;

  bool get hasSubmittedAnything =>
      followUp.isDone || reflection.isDone || commitment.isDone;

  /// Submitted answers while marked absent: attendance becomes present on
  /// sync (ADR 0005). Excused is never flipped.
  bool get autoAttendancePending =>
      isMe && isAbsent && hasSubmittedAnything && !attendanceAuto;
}
