import 'package:gold_roundtables/features/settings/domain/models/content_language.dart';
import 'package:gold_roundtables/features/settings/domain/services/selected_content_language_service.dart';

/// Serves a fixed content-language code, as stored on the device.
class StubSelectedLanguage implements SelectedContentLanguageService {
  StubSelectedLanguage([this.selected = ContentLanguageChoice.baseCode]);

  String selected;

  @override
  Future<String> readCode() async => selected;
}
