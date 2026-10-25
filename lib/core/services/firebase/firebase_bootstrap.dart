/// Optional Firebase initialization (push only, ADR 0009). The app must start
/// without Firebase configuration; features check [isAvailable] first.
abstract interface class FirebaseBootstrap {
  bool get isAvailable;

  /// Initializes Firebase once. Returns `false` (never throws) when Firebase
  /// is not configured for this platform.
  Future<bool> initialize();
}
