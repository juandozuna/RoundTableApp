/// The language the device is set to, as a lowercase ISO 639-1 code (`en`,
/// `es`). Used as the first-run content language (ADR 0017).
abstract interface class DeviceLanguage {
  String get code;
}
