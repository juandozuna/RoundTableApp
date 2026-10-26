import 'package:injectable/injectable.dart';

import '../../models/admin_organization.dart';
import '../../services/admin_directory_service.dart';

@injectable
class LoadOrganizationsUseCase {
  const LoadOrganizationsUseCase(this._directory);

  final AdminDirectoryService _directory;

  Future<List<AdminOrganization>> call() => _directory.organizations();
}
