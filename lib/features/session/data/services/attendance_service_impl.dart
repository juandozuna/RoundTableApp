import 'package:injectable/injectable.dart';

import '../../../../core/models/attendance_status.dart';
import '../../../../core/services/clock/clock_service.dart';
import '../../../../core/services/id/id_generator.dart';
import '../../domain/services/attendance_service.dart';
import '../datasources/session_local_data_source.dart';

@LazySingleton(as: AttendanceService)
class AttendanceServiceImpl implements AttendanceService {
  AttendanceServiceImpl(this._local, this._clock, this._ids);

  final SessionLocalDataSource _local;
  final ClockService _clock;
  final IdGenerator _ids;

  @override
  Future<void> mark({
    required String sessionId,
    required String personId,
    required AttendanceStatus status,
  }) => _save(sessionId, [personId], status);

  @override
  Future<void> markPresent({
    required String sessionId,
    required List<String> personIds,
  }) => _save(sessionId, personIds, AttendanceStatus.present);

  Future<void> _save(
    String sessionId,
    List<String> personIds,
    AttendanceStatus status,
  ) async {
    final session = await _local.sessionById(sessionId);
    if (session == null) {
      throw StateError('Session $sessionId is not on this device');
    }
    await _local.upsertAttendance(
      session: session,
      personIds: personIds,
      status: status.wireValue,
      nowIso: _clock.nowUtc().toIso8601String(),
      newId: _ids.newId,
    );
  }
}
