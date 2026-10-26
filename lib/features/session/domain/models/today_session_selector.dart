import 'session_info.dart';

/// The session to show and whether it is within its meeting window.
class SelectedSession {
  const SelectedSession({required this.info, required this.isToday});

  final SessionInfo info;
  final bool isToday;
}

/// Picks which of a table's sessions the live screens show.
///
/// The server always keeps one pending session per table, and creates the
/// next one right after a close. So right after closing, the pending session
/// is next week's and the one that just closed is still worth showing as the
/// summary; once the next one is within its window it takes over.
abstract final class TodaySessionSelector {
  /// How long before the scheduled time a session counts as "today", and
  /// how long a closed session stays on screen as the summary.
  static const Duration window = Duration(hours: 12);

  static SelectedSession? select({
    required SessionInfo? pending,
    required SessionInfo? lastClosed,
    required DateTime now,
  }) {
    if (pending != null && pending.isOpen) {
      return SelectedSession(info: pending, isToday: true);
    }
    // Overdue sessions stay runnable; only far-future ones wait.
    final startsSoon =
        pending != null && pending.scheduledAt.difference(now) <= window;
    if (pending != null && startsSoon) {
      return SelectedSession(info: pending, isToday: true);
    }
    final closedAt = lastClosed?.endedAt;
    if (lastClosed != null &&
        closedAt != null &&
        now.difference(closedAt) < window) {
      return SelectedSession(info: lastClosed, isToday: true);
    }
    if (pending != null) {
      return SelectedSession(info: pending, isToday: false);
    }
    if (lastClosed != null) {
      return SelectedSession(info: lastClosed, isToday: false);
    }
    return null;
  }
}
