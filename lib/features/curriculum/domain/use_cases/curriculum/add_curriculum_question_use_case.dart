import 'package:injectable/injectable.dart';

import '../../models/curriculum_edit.dart';
import '../../services/curriculum_admin_service.dart';

@injectable
class AddCurriculumQuestionUseCase {
  const AddCurriculumQuestionUseCase(this._curriculum);

  final CurriculumAdminService _curriculum;

  Future<void> call(NewQuestion question) => _curriculum.addQuestion(question);
}
