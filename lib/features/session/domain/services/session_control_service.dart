import '../../../../core/models/session_stage.dart';

/// How a facilitator control reached the server.
enum ControlDelivery {
  /// Sent now through the sessions function; members see it live.
  online,

  /// Saved on the device to upload later. Online-only writes never return
  /// it; it is the seam of a future outbox.
  savedOnDevice,
}

/// Facilitator controls over today's session, through the `sessions`
/// function (push, audit). Offline they fail with `SessionWriteFailure`.
abstract interface class SessionControlService {
  Future<ControlDelivery> open(String sessionId);

  Future<ControlDelivery> setStage(String sessionId, SessionStage stage);

  Future<ControlDelivery> closeAnswers(String sessionId);

  Future<ControlDelivery> close(String sessionId);
}
