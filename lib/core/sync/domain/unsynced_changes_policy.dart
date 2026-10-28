import '../../constants/app_constants.dart';

/// When waiting local changes deserve a warning (ADR 0009).
abstract final class UnsyncedChangesPolicy {
  static bool isStale({
    required DateTime? pendingSince,
    required DateTime now,
  }) =>
      pendingSince != null &&
      now.difference(pendingSince) >= AppLimits.unsyncedWarningAfter;
}
