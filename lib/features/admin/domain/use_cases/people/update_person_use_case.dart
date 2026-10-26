import 'package:injectable/injectable.dart';

import '../../models/admin_person.dart';
import '../../services/admin_management_service.dart';

@injectable
class UpdatePersonUseCase {
  const UpdatePersonUseCase(this._admin);

  final AdminManagementService _admin;

  /// Deactivating a person ends their seats, roles and pending invites.
  Future<AdminPerson> call(String id, {PersonStatusChange? status}) =>
      _admin.updatePerson(id, status: status);
}
