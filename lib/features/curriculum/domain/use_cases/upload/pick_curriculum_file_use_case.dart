import 'package:injectable/injectable.dart';

import '../../../../../core/services/file_pick/file_pick_service.dart';

/// Lets the person choose a curriculum file (JSON or CSV) from their device.
@injectable
class PickCurriculumFileUseCase {
  const PickCurriculumFileUseCase(this._files);

  final FilePickService _files;

  Future<PickedTextFile?> call() =>
      _files.pickTextFile(extensions: const ['json', 'csv']);
}
