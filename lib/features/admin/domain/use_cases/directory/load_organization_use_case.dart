import 'package:injectable/injectable.dart';

import '../../models/admin_organization.dart';
import '../../services/admin_directory_service.dart';

@injectable
class LoadOrganizationUseCase {
  const LoadOrganizationUseCase(this._directory);

  final AdminDirectoryService _directory;

  Future<AdminOrganization> call(String id) => _directory.organization(id);
}
