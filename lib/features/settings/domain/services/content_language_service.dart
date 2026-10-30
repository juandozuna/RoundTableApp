import '../models/content_language.dart';

/// Which language the curriculum text (values, questions) is shown in.
/// The choice is kept on the device; the available languages come from the
/// server curriculum (ADR 0017), so the stream errors while offline.
abstract interface class ContentLanguageService {
  /// Emits now and whenever the languages or the choice change.
  Stream<ContentLanguageChoice> watch();

  Future<void> select(String code);
}
