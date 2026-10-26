import 'package:injectable/injectable.dart';

import '../../models/admin_location.dart';
import '../../services/admin_directory_service.dart';

@injectable
class LoadLocationUseCase {
  const LoadLocationUseCase(this._directory);

  final AdminDirectoryService _directory;

  Future<AdminLocation> call(String id) => _directory.location(id);
}
