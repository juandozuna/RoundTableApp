import 'package:injectable/injectable.dart';

import '../../../../core/models/attendance_status.dart';
import '../../../../core/services/clock/clock_service.dart';
import '../../../../core/services/id/id_generator.dart';
import '../../domain/services/attendance_service.dart';
import '../datasources/session_reads_remote_data_source.dart';
import '../models/session_write_operations.dart';
import 'session_write_gateway.dart';

@LazySingleton(as: AttendanceService)
class AttendanceServiceImpl implements AttendanceService {
  AttendanceServiceImpl(this._reads, this._gateway, this._clock, this._ids);

  final SessionReadsRemoteDataSource _reads;
  final SessionWriteGateway _gateway;
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

  /// One row per (session, person): an existing row is edited (and left alone
  /// when it already says [status]), never duplicated (api-contract.md §4).
  Future<void> _save(
    String sessionId,
    List<String> personIds,
    AttendanceStatus status,
  ) async {
    final existing = {
      for (final row in await _reads.attendance(sessionId)) row.personId: row,
    };
    final nowIso = _clock.nowUtc().toIso8601String();
    await _gateway.upload([
      for (final personId in personIds)
        if (existing[personId]?.status != status)
          SessionWriteOperations.attendance(
            existingId: existing[personId]?.id,
            newId: _ids.newId,
            sessionId: sessionId,
            personId: personId,
            status: status,
            nowIso: nowIso,
          ),
    ]);
  }
}
