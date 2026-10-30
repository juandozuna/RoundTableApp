import 'package:injectable/injectable.dart';

import '../../models/curriculum_view.dart';
import '../../services/curriculum_admin_service.dart';

@injectable
class LoadCurriculumUseCase {
  const LoadCurriculumUseCase(this._curriculum);

  final CurriculumAdminService _curriculum;

  Future<CurriculumView> call({String? locale}) =>
      _curriculum.load(locale: locale);
}
