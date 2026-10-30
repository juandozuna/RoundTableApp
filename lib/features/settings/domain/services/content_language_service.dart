import '../models/content_language.dart';

/// Which language the curriculum text (values, questions) is shown in.
/// The choice is kept on the device; the available languages come from the
/// server curriculum (ADR 0017). While the list cannot be read the stream
/// still emits the stored choice, with the languages loaded earlier (none
/// before the first load).
abstract interface class ContentLanguageService {
  /// Emits now and whenever the languages or the choice change.
  Stream<ContentLanguageChoice> watch();

  Future<void> select(String code);
}
