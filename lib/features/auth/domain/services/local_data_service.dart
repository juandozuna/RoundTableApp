/// Removes the person's data stored on this device.
abstract interface class LocalDataService {
  /// Deletes device-local data (saved views, language choice) and any unsent
  /// changes a future outbox holds. Callers must warn first.
  Future<void> eraseLocalData();
}
