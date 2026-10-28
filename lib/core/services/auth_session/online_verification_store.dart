/// Device-local memory of when each identity last had its session confirmed
/// by the server, so the offline window survives app restarts.
abstract interface class OnlineVerificationStore {
  Future<DateTime?> readLastVerifiedAt(String userId);

  Future<void> saveLastVerifiedAt(String userId, DateTime at);
}
