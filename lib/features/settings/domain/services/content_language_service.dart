import '../models/content_language.dart';

/// Which language the curriculum text (values, questions) is shown in.
/// Works offline: the choice is kept on the device and the languages come
/// from the synced curriculum (ADR 0017).
abstract interface class ContentLanguageService {
  /// Emits now and whenever the languages or the choice change.
  Stream<ContentLanguageChoice> watch();

  Future<void> select(String code);
}
