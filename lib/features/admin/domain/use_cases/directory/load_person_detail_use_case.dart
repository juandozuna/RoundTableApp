import 'package:injectable/injectable.dart';

import '../../models/admin_person.dart';
import '../../services/admin_directory_service.dart';

@injectable
class LoadPersonDetailUseCase {
  const LoadPersonDetailUseCase(this._directory);

  final AdminDirectoryService _directory;

  Future<AdminPerson> call(String id) => _directory.person(id);
}
