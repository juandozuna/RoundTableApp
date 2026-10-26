import '../../../../core/models/health_status.dart';

/// Health of a table from its session history, mirroring the KPI definition
/// (ADR 0010): inactive after 28 days without a closed session; delayed when
/// the pending session is overdue by more than a day or the last session was
/// more than 9 days ago.
abstract final class TableHealthRule {
  static const Duration inactiveAfter = Duration(days: 28);
  static const Duration delayedAfterLastSession = Duration(days: 9);
  static const Duration pendingOverdueAfter = Duration(days: 1);

  /// Returns `null` when the table has no history yet.
  static HealthStatus? evaluate({
    required DateTime now,
    required bool tableIsActive,
    DateTime? lastClosedAt,
    DateTime? pendingScheduledAt,
  }) {
    if (!tableIsActive) return HealthStatus.inactive;
    if (lastClosedAt == null && pendingScheduledAt == null) return null;
    if (lastClosedAt != null && now.difference(lastClosedAt) > inactiveAfter) {
      return HealthStatus.inactive;
    }
    final overdue =
        pendingScheduledAt != null &&
        now.difference(pendingScheduledAt) > pendingOverdueAfter;
    final stale =
        lastClosedAt != null &&
        now.difference(lastClosedAt) > delayedAfterLastSession;
    return overdue || stale ? HealthStatus.delayed : HealthStatus.active;
  }
}
