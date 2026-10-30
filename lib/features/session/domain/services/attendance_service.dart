import '../../../../core/models/attendance_status.dart';

/// Attendance taking by the facilitator. Needs a connection: when the change
/// cannot reach the server it fails with `SessionWriteFailure`.
abstract interface class AttendanceService {
  Future<void> mark({
    required String sessionId,
    required String personId,
    required AttendanceStatus status,
  });

  /// Marks every person in [personIds] present in one step.
  Future<void> markPresent({
    required String sessionId,
    required List<String> personIds,
  });
}
