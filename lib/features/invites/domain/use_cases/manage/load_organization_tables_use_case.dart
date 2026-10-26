import 'package:injectable/injectable.dart';

import '../../models/invite_target_table.dart';
import '../../services/invite_directory_service.dart';

@injectable
class LoadOrganizationTablesUseCase {
  const LoadOrganizationTablesUseCase(this._directory);

  final InviteDirectoryService _directory;

  Future<List<InviteTargetTable>> call(String organizationId) =>
      _directory.tables(organizationId: organizationId);
}
