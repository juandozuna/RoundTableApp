/// Generates identifiers for entities created on the device.
abstract interface class IdGenerator {
  /// A random UUID v4 string, as the server expects (uploads are idempotent by id).
  String newId();
}
