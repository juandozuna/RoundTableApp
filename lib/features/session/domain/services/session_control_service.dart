import '../../../../core/models/session_stage.dart';

/// How a facilitator control reached the server.
enum ControlDelivery {
  /// Sent now through the sessions function; members see it live.
  online,

  /// Saved on the device (no connection); uploads when back online.
  savedOnDevice,
}

/// Facilitator controls over today's session. Online they go through the
/// `sessions` function (push, audit); offline the same change is saved
/// locally and uploaded with the rest (verbal-guide mode).
abstract interface class SessionControlService {
  Future<ControlDelivery> open(String sessionId);

  Future<ControlDelivery> setStage(String sessionId, SessionStage stage);

  Future<ControlDelivery> closeAnswers(String sessionId);

  Future<ControlDelivery> close(String sessionId);
}
