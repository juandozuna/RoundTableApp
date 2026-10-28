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

  /// How long a device keeps working without confirming its sign-in with the
  /// server (ADR 0005). Beyond it the person must sign in online again.
  static const Duration offlineWindow = Duration(days: 7);

  /// Closed sessions older than this leave the device (sync rules,
  /// `app.archive_old_session_data`). Documented in
  /// `docs/implementation/offline-window.md`.
  static const Duration sessionSyncWindow = Duration(days: 56);
}
