import 'package:injectable/injectable.dart';

import '../../models/person_input.dart';
import '../../models/table_change.dart';
import '../../services/admin_management_service.dart';

@injectable
class ChangeFacilitatorUseCase {
  const ChangeFacilitatorUseCase(this._admin);

  final AdminManagementService _admin;

  Future<TableChange> call({
    required String tableId,
    required PersonRef facilitator,
    required bool keepPreviousAsMember,
  }) => _admin.changeFacilitator(
    tableId: tableId,
    facilitator: facilitator,
    keepPreviousAsMember: keepPreviousAsMember,
  );
}
