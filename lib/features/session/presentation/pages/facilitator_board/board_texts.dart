import '../../../../../core/models/attendance_status.dart';
import '../../../../../l10n/gen/app_localizations.dart';
import '../../../domain/models/facilitator_stage.dart';
import 'seat_status.dart';

/// Spanish text for the facilitator board's enums.
extension FacilitatorStageText on FacilitatorStage {
  /// Short caption under the number on the stage bar.
  String shortLabel(AppLocalizations l10n) => switch (this) {
    FacilitatorStage.open => l10n.stageOpen,
    FacilitatorStage.attendance => l10n.stageAttendance,
    FacilitatorStage.followUp => l10n.sessionBoardStageFollowUpShort,
    FacilitatorStage.value => l10n.stageCurrentValue,
    FacilitatorStage.closing => l10n.stageClosing,
  };

  /// Heading: "La mesa está en …".
  String title(AppLocalizations l10n) => switch (this) {
    FacilitatorStage.open => l10n.sessionBoardStageOpenTitle,
    FacilitatorStage.attendance => l10n.sessionBoardStageAttendanceTitle,
    FacilitatorStage.followUp => l10n.stageFollowUp,
    FacilitatorStage.value => l10n.sessionBoardStageValueTitle,
    FacilitatorStage.closing => l10n.stageClosing,
  };
}

extension AttendanceStatusText on AttendanceStatus {
  String label(AppLocalizations l10n) => switch (this) {
    AttendanceStatus.present => l10n.attendancePresent,
    AttendanceStatus.late => l10n.attendanceLate,
    AttendanceStatus.excused => l10n.attendanceExcused,
    AttendanceStatus.absent => l10n.attendanceAbsent,
  };
}

extension SeatStatusText on SeatStatus {
  String caption(AppLocalizations l10n) => switch (label) {
    SeatLabel.none => '',
    SeatLabel.unmarked => l10n.sessionBoardSeatUnmarked,
    SeatLabel.present => l10n.attendancePresent,
    SeatLabel.late => l10n.attendanceLate,
    SeatLabel.excused => l10n.attendanceExcused,
    SeatLabel.absent => l10n.attendanceAbsent,
    SeatLabel.answered => l10n.sessionBoardSeatAnswered,
    SeatLabel.pending => l10n.sessionBoardSeatPending,
    SeatLabel.offline => l10n.sessionBoardSeatOffline,
    SeatLabel.syncing => l10n.sessionBoardSeatSyncing,
    SeatLabel.savedOnPhone => l10n.sessionBoardSeatSaved,
    SeatLabel.syncedLate => l10n.sessionBoardSeatSyncedLate,
    SeatLabel.skipped => l10n.sessionBoardSeatSkipped,
    SeatLabel.missed => l10n.sessionBoardSeatMissed,
    SeatLabel.progress => l10n.sessionBoardSeatProgress(done, total),
  };
}
