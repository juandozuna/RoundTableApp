/// Refreshes the live session now, when the person asks for it or the
/// connection returns, instead of waiting for the next poll.
abstract interface class SessionSyncService {
  Future<void> requestSync();
}
