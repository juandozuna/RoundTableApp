import 'package:injectable/injectable.dart';

import '../../models/person_input.dart';
import '../../models/table_change.dart';
import '../../models/table_input.dart';
import '../../services/admin_management_service.dart';

@injectable
class CreateTableUseCase {
  const CreateTableUseCase(this._admin);

  final AdminManagementService _admin;

  Future<TableChange> call({
    required String organizationId,
    required TableInput input,
    required PersonRef facilitator,
  }) => _admin.createTable(
    organizationId: organizationId,
    input: input,
    facilitator: facilitator,
  );
}
