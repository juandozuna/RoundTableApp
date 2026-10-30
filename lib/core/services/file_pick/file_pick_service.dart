/// A text file the person chose on their device.
class PickedTextFile {
  const PickedTextFile({required this.name, required this.content});

  final String name;
  final String content;
}

/// Opens the platform file chooser for small text files (JSON, CSV).
abstract interface class FilePickService {
  /// `null` when the person closes the chooser without choosing.
  Future<PickedTextFile?> pickTextFile({required List<String> extensions});
}
