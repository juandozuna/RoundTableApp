/// Ends the session on this device.
abstract interface class SignOutService {
  Future<void> signOut();
}
