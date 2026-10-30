import 'package:injectable/injectable.dart';

import '../../models/content_language.dart';
import '../../services/content_language_service.dart';

@injectable
class WatchContentLanguageUseCase {
  const WatchContentLanguageUseCase(this._languages);

  final ContentLanguageService _languages;

  Stream<ContentLanguageChoice> call() => _languages.watch();
}
