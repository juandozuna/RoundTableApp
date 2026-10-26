/// Client-side brake on typed codes: 5 wrong codes lock typing for a minute.
/// (The server has no rate limit; this only slows down guessing.)
abstract interface class InviteAttemptsService {
  static const int maxAttempts = 5;
  static const Duration lockDuration = Duration(seconds: 60);

  /// Until when typing is locked, or `null`.
  DateTime? get lockedUntil;

  int get remainingAttempts;

  void recordFailure();

  void reset();
}
