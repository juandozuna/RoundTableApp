import 'package:injectable/injectable.dart';

import '../../models/curriculum_plan.dart';
import '../../models/curriculum_upload.dart';
import '../../services/curriculum_admin_service.dart';

@injectable
class ApplyCurriculumUploadUseCase {
  const ApplyCurriculumUploadUseCase(this._curriculum);

  final CurriculumAdminService _curriculum;

  Future<CurriculumPlan> call(CurriculumUpload upload) =>
      _curriculum.applyUpload(upload);
}
