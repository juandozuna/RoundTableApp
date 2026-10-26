/// Nudges synchronization when the person asks for it or the connection
/// returns. Replication itself is automatic (ADR 0004).
abstract interface class SessionSyncService {
  Future<void> requestSync();
}
