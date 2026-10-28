import '../../constants/app_constants.dart';

/// Decides whether a device has been offline longer than ADR 0005 allows
/// (`AppLimits.offlineWindow`).
abstract final class OfflineWindow {
  /// A device that never recorded a confirmation (installed before the
  /// window existed) is treated as within the window.
  static bool hasExpired({
    required DateTime? lastVerifiedAt,
    required DateTime now,
  }) =>
      lastVerifiedAt != null &&
      now.difference(lastVerifiedAt) > AppLimits.offlineWindow;
}
