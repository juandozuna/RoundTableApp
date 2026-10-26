import 'package:injectable/injectable.dart';

import '../../../../core/models/session_stage.dart';
import '../../../../core/network/api_exception.dart';
import '../../../../core/services/clock/clock_service.dart';
import '../../../../core/services/connectivity/connectivity_service.dart';
import '../../domain/models/session_status.dart';
import '../../domain/services/session_control_service.dart';
import '../datasources/session_local_data_source.dart';
import '../datasources/session_remote_data_source.dart';

/// Online: the `sessions` Edge Function (push, audit, program advance).
/// Offline, or when the call cannot reach the server: the same change is
/// saved on the device and uploads later through `sync-upload`.
@LazySingleton(as: SessionControlService)
class SessionControlServiceImpl implements SessionControlService {
  SessionControlServiceImpl(
    this._local,
    this._remote,
    this._connectivity,
    this._clock,
  );

  final SessionLocalDataSource _local;
  final SessionRemoteDataSource _remote;
  final ConnectivityService _connectivity;
  final ClockService _clock;

  @override
  Future<ControlDelivery> open(String sessionId) => _deliver(
    online: () => _remote.open(sessionId, stage: SessionStage.attendance),
    offline: (nowIso) => _local.patchSession(
      sessionId,
      nowIso: nowIso,
      status: SessionStatus.open.wireValue,
      stage: SessionStage.attendance.wireValue,
      startedAt: nowIso,
    ),
  );

  @override
  Future<ControlDelivery> setStage(String sessionId, SessionStage stage) =>
      _deliver(
        online: () => _remote.setStage(sessionId, stage),
        offline: (nowIso) => _local.patchSession(
          sessionId,
          nowIso: nowIso,
          stage: stage.wireValue,
        ),
      );

  @override
  Future<ControlDelivery> closeAnswers(String sessionId) => _deliver(
    online: () => _remote.closeAnswers(sessionId, _clock.nowUtc()),
    offline: (nowIso) => _local.patchSession(
      sessionId,
      nowIso: nowIso,
      answersClosedAt: nowIso,
    ),
  );

  @override
  Future<ControlDelivery> close(String sessionId) => _deliver(
    online: () => _remote.close(sessionId, _clock.nowUtc()),
    offline: (nowIso) => _local.patchSession(
      sessionId,
      nowIso: nowIso,
      status: SessionStatus.closed.wireValue,
      stage: SessionStage.closed.wireValue,
      endedAt: nowIso,
    ),
  );

  Future<ControlDelivery> _deliver({
    required Future<void> Function() online,
    required Future<void> Function(String nowIso) offline,
  }) async {
    if (await _connectivity.isOnline()) {
      try {
        await online();
        return ControlDelivery.online;
      } on ApiException catch (error) {
        if (!_isUnreachable(error)) rethrow;
      }
    }
    await offline(_clock.nowUtc().toIso8601String());
    return ControlDelivery.savedOnDevice;
  }

  static bool _isUnreachable(ApiException error) =>
      error.kind == ApiErrorKind.network || error.kind == ApiErrorKind.timeout;
}
