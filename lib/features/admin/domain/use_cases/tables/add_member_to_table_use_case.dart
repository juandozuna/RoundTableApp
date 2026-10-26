import 'package:injectable/injectable.dart';

import '../../services/admin_management_service.dart';

@injectable
class AddMemberToTableUseCase {
  const AddMemberToTableUseCase(this._admin);

  final AdminManagementService _admin;

  Future<void> call({required String tableId, required String personId}) =>
      _admin.addMember(tableId: tableId, personId: personId);
}
