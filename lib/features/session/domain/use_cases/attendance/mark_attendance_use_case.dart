import 'package:injectable/injectable.dart';

import '../../../../../core/models/attendance_status.dart';
import '../../services/attendance_service.dart';

@injectable
class MarkAttendanceUseCase {
  const MarkAttendanceUseCase(this._attendance);

  final AttendanceService _attendance;

  Future<void> call({
    required String sessionId,
    required String personId,
    required AttendanceStatus status,
  }) => _attendance.mark(
    sessionId: sessionId,
    personId: personId,
    status: status,
  );
}
