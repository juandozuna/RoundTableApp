import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/models/attendance_status.dart';
import '../../../../core/models/commitment_follow_up_status.dart';

part 'member_history.freezed.dart';

/// A commitment and how it went when it was reviewed.
@freezed
abstract class CommitmentProgress with _$CommitmentProgress {
  const factory CommitmentProgress({
    required String actionText,
    String? measureText,

    /// Null until the next session reviewed it.
    CommitmentFollowUpStatus? status,
    String? note,
    @Default(false) bool syncedLate,
  }) = _CommitmentProgress;
}

/// One curriculum value in a person's history: initial score, the score
/// given when it was reviewed the following session, and the commitment made.
@freezed
abstract class ValueProgress with _$ValueProgress {
  const factory ValueProgress({
    required String valueId,
    required int sequence,
    required String name,
    int? moduleNumber,
    String? moduleName,
    int? initialScore,
    String? initialJustification,
    @Default(false) bool initialSyncedLate,
    int? followUpScore,
    String? followUpJustification,
    @Default(false) bool followUpSyncedLate,
    CommitmentProgress? commitment,
  }) = _ValueProgress;

  const ValueProgress._();

  /// Follow-up minus initial; positive means the person improved.
  int? get improvement => initialScore == null || followUpScore == null
      ? null
      : followUpScore! - initialScore!;

  bool get hasLateData =>
      initialSyncedLate ||
      followUpSyncedLate ||
      (commitment?.syncedLate ?? false);
}

/// One session in a person's history.
@freezed
abstract class SessionRecord with _$SessionRecord {
  const factory SessionRecord({
    required String sessionId,
    required DateTime scheduledAt,
    required bool isOpen,
    int? valueSequence,
    String? valueName,

    /// Null when no attendance was recorded.
    AttendanceStatus? attendance,

    /// Something this person sent for the session reached the server late.
    @Default(false) bool syncedLate,
  }) = _SessionRecord;

  const SessionRecord._();

  bool get attended =>
      attendance == AttendanceStatus.present ||
      attendance == AttendanceStatus.late;
}

/// A person's progress at one table, from the data synced to the device.
@freezed
abstract class MemberHistory with _$MemberHistory {
  const factory MemberHistory({
    required String personId,
    required String name,
    @Default([]) List<ValueProgress> values,

    /// Newest first.
    @Default([]) List<SessionRecord> sessions,
  }) = _MemberHistory;

  const MemberHistory._();

  bool get isEmpty => values.isEmpty && sessions.isEmpty;

  /// The person has answers or an attendance record, beyond the sessions the
  /// table held.
  bool get hasActivity =>
      values.isNotEmpty || sessions.any((s) => s.attendance != null);

  /// Closed sessions the attendance rate is measured against.
  int get closedSessions => sessions.where((s) => !s.isOpen).length;

  int get attendedSessions =>
      sessions.where((s) => !s.isOpen && s.attended).length;

  int get lateSyncedSessions => sessions.where((s) => s.syncedLate).length;

  double? get averageInitial =>
      _average(values.map((v) => v.initialScore).whereType<int>());

  double? get averageFollowUp =>
      _average(values.map((v) => v.followUpScore).whereType<int>());

  double? get averageImprovement =>
      _average(values.map((v) => v.improvement).whereType<int>());

  static double? _average(Iterable<int> numbers) {
    if (numbers.isEmpty) return null;
    return numbers.fold<int>(0, (a, b) => a + b) / numbers.length;
  }
}
