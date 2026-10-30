import '../models/content_language.dart';

/// The content language chosen on this device, read without the network.
/// Screens that translate curriculum text use it, so a failed language list
/// never changes the language they show.
abstract interface class SelectedContentLanguageService {
  /// The stored code, or [ContentLanguageChoice.baseCode] when nothing was
  /// chosen or the choice cannot be read.
  Future<String> readCode();
}
