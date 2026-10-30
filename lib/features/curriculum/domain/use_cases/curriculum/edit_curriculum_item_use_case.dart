import 'package:injectable/injectable.dart';

import '../../models/curriculum_edit.dart';
import '../../services/curriculum_admin_service.dart';

@injectable
class EditCurriculumItemUseCase {
  const EditCurriculumItemUseCase(this._curriculum);

  final CurriculumAdminService _curriculum;

  Future<bool> call(CurriculumEdit edit) => _curriculum.edit(edit);
}
