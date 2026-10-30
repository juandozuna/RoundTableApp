import 'package:freezed_annotation/freezed_annotation.dart';
import '../../models/attendance_status.dart';

part 'session_attendance_record.freezed.dart';
part 'session_attendance_record.g.dart';

/// Row of `session_attendance`; `source` is `facilitator` or `auto_submission`.
@freezed
abstract class SessionAttendanceRecord with _$SessionAttendanceRecord {
  const factory SessionAttendanceRecord({
    required String id,
    required String organizationId,
    required String roundTableId,
    DateTime? deviceCreatedAt,
    DateTime? deviceModifiedAt,
    DateTime? receivedAt,
    @Default(false) bool syncedLate,
    DateTime? archivedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    required String sessionId,
    required String personId,
    required AttendanceStatus status,
    required String source,
    String? recordedByPersonId,
  }) = _SessionAttendanceRecord;

  factory SessionAttendanceRecord.fromJson(Map<String, dynamic> json) =>
      _$SessionAttendanceRecordFromJson(json);
}
