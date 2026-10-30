import 'package:injectable/injectable.dart';

import '../../services/curriculum_admin_service.dart';

@injectable
class AddContentLanguageUseCase {
  const AddContentLanguageUseCase(this._curriculum);

  final CurriculumAdminService _curriculum;

  Future<void> call({required String code, required String name}) =>
      _curriculum.addLanguage(code: code, name: name);
}
