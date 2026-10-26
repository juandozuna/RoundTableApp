import 'package:injectable/injectable.dart';

import '../../services/attendance_service.dart';

@injectable
class MarkEveryonePresentUseCase {
  const MarkEveryonePresentUseCase(this._attendance);

  final AttendanceService _attendance;

  Future<void> call({
    required String sessionId,
    required List<String> personIds,
  }) {
    if (personIds.isEmpty) return Future.value();
    return _attendance.markPresent(sessionId: sessionId, personIds: personIds);
  }
}
