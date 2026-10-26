import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/models/attendance_status.dart';

part 'table_history.freezed.dart';

/// One member in one session of the table.
@freezed
abstract class TableSessionEntry with _$TableSessionEntry {
  const factory TableSessionEntry({
    required String personId,
    required String name,
    AttendanceStatus? attendance,
    int? initialScore,
    int? followUpScore,
    String? commitmentText,
    @Default(false) bool syncedLate,
  }) = _TableSessionEntry;
}

@freezed
abstract class TableSessionSummary with _$TableSessionSummary {
  const factory TableSessionSummary({
    required String sessionId,
    required DateTime scheduledAt,
    required bool isOpen,
    int? valueSequence,
    String? valueName,
    @Default([]) List<TableSessionEntry> entries,
  }) = _TableSessionSummary;

  const TableSessionSummary._();

  int get attendedCount => entries
      .where(
        (e) =>
            e.attendance == AttendanceStatus.present ||
            e.attendance == AttendanceStatus.late,
      )
      .length;

  int get rosterCount => entries.length;
}

/// Average scores of the table for one value.
@freezed
abstract class TableValueSummary with _$TableValueSummary {
  const factory TableValueSummary({
    required String valueId,
    required int sequence,
    required String name,
    double? averageInitial,
    double? averageFollowUp,

    /// Mean of follow-up minus initial over the people who gave both.
    double? averageImprovement,
    @Default(0) int initialCount,
    @Default(0) int followUpCount,
  }) = _TableValueSummary;
}

@freezed
abstract class TableMemberSummary with _$TableMemberSummary {
  const factory TableMemberSummary({
    required String personId,
    required String name,
    required bool isFacilitator,
    required int attendedSessions,
    required int closedSessions,
    double? averageInitial,
    double? averageFollowUp,
    double? averageImprovement,
  }) = _TableMemberSummary;
}

/// What the facilitator sees about their table (PC-10).
@freezed
abstract class TableHistory with _$TableHistory {
  const factory TableHistory({
    required String tableId,
    required String tableName,
    @Default([]) List<TableMemberSummary> members,

    /// Newest first.
    @Default([]) List<TableSessionSummary> sessions,
    @Default([]) List<TableValueSummary> values,
  }) = _TableHistory;

  const TableHistory._();

  bool get isEmpty => sessions.isEmpty && values.isEmpty;

  int get closedSessions => sessions.where((s) => !s.isOpen).length;

  /// Share of recorded seats that attended, over closed sessions (0..1).
  double? get attendanceRate {
    final closed = sessions.where((s) => !s.isOpen);
    final seats = closed.fold<int>(0, (n, s) => n + s.rosterCount);
    if (seats == 0) return null;
    return closed.fold<int>(0, (n, s) => n + s.attendedCount) / seats;
  }

  double? get averageImprovement {
    final improvements = values
        .map((v) => v.averageImprovement)
        .whereType<double>();
    if (improvements.isEmpty) return null;
    return improvements.fold<double>(0, (a, b) => a + b) / improvements.length;
  }
}
