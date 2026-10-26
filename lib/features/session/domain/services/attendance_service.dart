import '../../../../core/models/attendance_status.dart';

/// Attendance taking by the facilitator. Works offline: changes are saved on
/// the device and uploaded later.
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
