/// Whether the device has a network connection. A connection does not
/// guarantee the server is reachable; remote calls still handle failures.
abstract interface class ConnectivityService {
  Future<bool> isOnline();

  /// Emits the current state first, then every change.
  Stream<bool> watchOnline();
}
