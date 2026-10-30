import 'package:injectable/injectable.dart';

import '../../../../core/models/session_stage.dart';
import '../../../../core/services/clock/clock_service.dart';
import '../../domain/services/session_control_service.dart';
import '../datasources/session_remote_data_source.dart';
import 'session_write_gateway.dart';

/// The `sessions` Edge Function (push, audit, program advance). Offline, or
/// when the call cannot reach the server, the control fails with
/// `SessionWriteFailure`; nothing is saved on the device.
@LazySingleton(as: SessionControlService)
class SessionControlServiceImpl implements SessionControlService {
  SessionControlServiceImpl(this._remote, this._gateway, this._clock);

  final SessionRemoteDataSource _remote;
  final SessionWriteGateway _gateway;
  final ClockService _clock;

  @override
  Future<ControlDelivery> open(String sessionId) =>
      _deliver(() => _remote.open(sessionId, stage: SessionStage.attendance));

  @override
  Future<ControlDelivery> setStage(String sessionId, SessionStage stage) =>
      _deliver(() => _remote.setStage(sessionId, stage));

  @override
  Future<ControlDelivery> closeAnswers(String sessionId) =>
      _deliver(() => _remote.closeAnswers(sessionId, _clock.nowUtc()));

  @override
  Future<ControlDelivery> close(String sessionId) =>
      _deliver(() => _remote.close(sessionId, _clock.nowUtc()));

  Future<ControlDelivery> _deliver(Future<void> Function() control) async {
    await _gateway.run(control);
    return ControlDelivery.online;
  }
}
