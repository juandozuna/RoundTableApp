import 'package:injectable/injectable.dart';

import '../../models/admin_table.dart';
import '../../services/admin_directory_service.dart';

/// Tables of an organization, or all tables in scope when none is given.
@injectable
class LoadTablesUseCase {
  const LoadTablesUseCase(this._directory);

  final AdminDirectoryService _directory;

  Future<List<AdminTable>> call({String? organizationId}) =>
      _directory.tables(organizationId: organizationId);
}
