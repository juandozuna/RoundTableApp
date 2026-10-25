/// Source of the current time, replaceable in tests.
abstract interface class ClockService {
  /// Current instant in UTC (ADR 0011: timestamps are stored in UTC).
  DateTime nowUtc();
}
