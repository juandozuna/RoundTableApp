import 'package:injectable/injectable.dart';

import '../../services/content_language_service.dart';

@injectable
class SelectContentLanguageUseCase {
  const SelectContentLanguageUseCase(this._languages);

  final ContentLanguageService _languages;

  Future<void> call(String code) => _languages.select(code);
}
