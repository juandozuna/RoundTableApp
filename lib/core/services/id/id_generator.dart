/// Generates identifiers for entities created on the device.
abstract interface class IdGenerator {
  /// A random UUID v4 string, as PowerSync and the server expect.
  String newId();
}
