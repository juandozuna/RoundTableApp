import '../../../../core/models/session_stage.dart';
import '../../../../core/models/session_status.dart';
import '../../domain/models/session_info.dart';
import 'session_drift_database.dart';

/// Timestamps are stored as ISO-8601 text; parse them leniently.
DateTime? parseTimestamp(String? raw) {
  if (raw == null || raw.isEmpty) return null;
  return DateTime.tryParse(raw)?.toUtc();
}

extension SessionRowMapper on SessionRow {
  /// Null when the row lacks the columns a session cannot work without.
  SessionInfo? toInfo() {
    final scheduled = parseTimestamp(scheduledAt);
    final tableId = roundTableId;
    final value = valueId;
    final parsedStatus = SessionStatus.tryParse(status);
    if (scheduled == null ||
        tableId == null ||
        value == null ||
        parsedStatus == null) {
      return null;
    }
    return SessionInfo(
      id: id,
      tableId: tableId,
      status: parsedStatus,
      stage: SessionStage.tryParse(stage) ?? SessionStage.lobby,
      scheduledAt: scheduled,
      valueId: value,
      followUpValueId: followUpValueId,
      startedAt: parseTimestamp(startedAt),
      endedAt: parseTimestamp(endedAt),
      answersClosedAt: parseTimestamp(answersClosedAt),
    );
  }
}
