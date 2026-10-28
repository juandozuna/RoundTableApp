import 'package:flutter/foundation.dart';

import '../../../../core/models/assessment_kind.dart';
import '../../../../core/models/attendance_status.dart';
import '../../../../core/models/commitment_follow_up_status.dart';
import '../../../../core/models/session_status.dart';

// Everything a device holds about one table, as plain records. The data
// layer fills them from the synced tables; `HistoryBuilder` turns them into
// the views. Kept separate from the views so the maths is testable without a
// database.

@immutable
class HistoryValue {
  const HistoryValue({
    required this.id,
    required this.sequence,
    required this.name,
    this.moduleNumber,
    this.moduleName,
  });

  final String id;
  final int sequence;
  final String name;
  final int? moduleNumber;
  final String? moduleName;
}

@immutable
class HistorySession {
  const HistorySession({
    required this.id,
    required this.status,
    this.valueId,
    this.followUpValueId,
    this.scheduledAt,
  });

  final String id;
  final SessionStatus status;
  final String? valueId;
  final String? followUpValueId;
  final DateTime? scheduledAt;
}

@immutable
class HistoryRosterEntry {
  const HistoryRosterEntry({
    required this.personId,
    required this.name,
    required this.isFacilitator,
    required this.isActive,
  });

  final String personId;
  final String name;
  final bool isFacilitator;
  final bool isActive;
}

@immutable
class HistoryAttendance {
  const HistoryAttendance({
    required this.sessionId,
    required this.personId,
    required this.status,
    required this.syncedLate,
  });

  final String sessionId;
  final String personId;
  final AttendanceStatus? status;
  final bool syncedLate;
}

@immutable
class HistoryAssessment {
  const HistoryAssessment({
    required this.sessionId,
    required this.personId,
    required this.valueId,
    required this.kind,
    required this.score,
    required this.syncedLate,
    this.justification,
  });

  final String sessionId;
  final String personId;
  final String valueId;
  final AssessmentKind kind;
  final int score;
  final String? justification;
  final bool syncedLate;
}

@immutable
class HistoryCommitment {
  const HistoryCommitment({
    required this.sessionId,
    required this.personId,
    required this.valueId,
    required this.actionText,
    required this.syncedLate,
    required this.followUpSyncedLate,
    this.measureText,
    this.followUpSessionId,
    this.followUpStatus,
    this.followUpNote,
  });

  final String sessionId;
  final String personId;
  final String valueId;
  final String actionText;
  final String? measureText;

  /// The session where the commitment was reviewed; null until then.
  final String? followUpSessionId;
  final CommitmentFollowUpStatus? followUpStatus;
  final String? followUpNote;
  final bool syncedLate;
  final bool followUpSyncedLate;
}

@immutable
class HistorySnapshot {
  const HistorySnapshot({
    required this.tableId,
    required this.tableName,
    this.values = const {},
    this.sessions = const [],
    this.roster = const [],
    this.attendance = const [],
    this.assessments = const [],
    this.commitments = const [],
  });

  final String tableId;
  final String tableName;
  final Map<String, HistoryValue> values;
  final List<HistorySession> sessions;
  final List<HistoryRosterEntry> roster;
  final List<HistoryAttendance> attendance;
  final List<HistoryAssessment> assessments;
  final List<HistoryCommitment> commitments;
}
