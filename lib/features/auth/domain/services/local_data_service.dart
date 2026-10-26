/// Removes the session data stored on this device.
abstract interface class LocalDataService {
  /// Deletes local rows and unsent changes. Callers must warn first.
  Future<void> eraseLocalData();
}
