import 'package:injectable/injectable.dart';

import '../../services/curriculum_admin_service.dart';

@injectable
class SetContentLanguageActiveUseCase {
  const SetContentLanguageActiveUseCase(this._curriculum);

  final CurriculumAdminService _curriculum;

  Future<void> call(String code, {required bool active}) =>
      _curriculum.setLanguageActive(code, active: active);
}
