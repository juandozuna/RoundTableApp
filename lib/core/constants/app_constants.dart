/// Business limits shared by features. Keep in sync with the database
/// constraints in `supabase/migrations`.
abstract final class AppLimits {
  /// People at one table including the facilitator (ADR 0014).
  static const int maxTableSeats = 9;

  /// Length of an invite code (letters and digits, uppercase).
  static const int inviteCodeLength = 6;

  /// Minimum length for free-text answers such as a commitment.
  static const int shortTextMinLength = 3;

  /// Unsynced session data older than this triggers a warning (ADR 0009).
  static const Duration unsyncedWarningAfter = Duration(hours: 24);
}
