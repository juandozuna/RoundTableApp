import 'package:injectable/injectable.dart';

import '../../models/table_input.dart';
import '../../services/admin_management_service.dart';

@injectable
class UpdateTableUseCase {
  const UpdateTableUseCase(this._admin);

  final AdminManagementService _admin;

  Future<void> call(String id, TableInput input) =>
      _admin.updateTable(id, input);
}
