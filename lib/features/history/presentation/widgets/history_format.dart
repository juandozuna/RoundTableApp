import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/extensions/build_context_x.dart';
import '../../../../core/models/attendance_status.dart';
import '../../../../core/theme/status_tone.dart';
import '../../../session/domain/models/commitment_follow_up_status.dart';

/// Number, attendance and commitment-status wording shared by the history
/// widgets.
abstract final class HistoryFormat {
  /// "7,5" with the locale's decimal separator; "—" when there is no data.
  static String average(BuildContext context, double? value) => value == null
      ? '—'
      : NumberFormat('0.0', context.l10n.localeName).format(value);

  static String score(int? value) => value == null ? '—' : '$value';

  static String attendanceLabel(
    BuildContext context,
    AttendanceStatus? status,
  ) {
    final l10n = context.l10n;
    return switch (status) {
      AttendanceStatus.present => l10n.attendancePresent,
      AttendanceStatus.late => l10n.attendanceLate,
      AttendanceStatus.excused => l10n.attendanceExcused,
      AttendanceStatus.absent => l10n.attendanceAbsent,
      null => l10n.historyAttendanceNone,
    };
  }

  static StatusTone attendanceTone(AttendanceStatus? status) =>
      switch (status) {
        AttendanceStatus.present => StatusTone.ok,
        AttendanceStatus.late => StatusTone.pending,
        AttendanceStatus.excused => StatusTone.info,
        AttendanceStatus.absent => StatusTone.error,
        null => StatusTone.neutral,
      };

  static String followUpLabel(
    BuildContext context,
    CommitmentFollowUpStatus? status,
  ) {
    final l10n = context.l10n;
    return switch (status) {
      CommitmentFollowUpStatus.kept => l10n.sessionMemberStatusKept,
      CommitmentFollowUpStatus.partial => l10n.sessionMemberStatusPartial,
      CommitmentFollowUpStatus.notKept => l10n.sessionMemberStatusNotKept,
      null => l10n.historyCommitmentPending,
    };
  }

  static StatusTone followUpTone(CommitmentFollowUpStatus? status) =>
      switch (status) {
        CommitmentFollowUpStatus.kept => StatusTone.ok,
        CommitmentFollowUpStatus.partial => StatusTone.pending,
        CommitmentFollowUpStatus.notKept => StatusTone.error,
        null => StatusTone.neutral,
      };
}
