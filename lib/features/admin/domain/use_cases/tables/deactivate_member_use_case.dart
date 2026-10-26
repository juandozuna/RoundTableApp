import 'package:injectable/injectable.dart';

import '../../services/admin_management_service.dart';

@injectable
class DeactivateMemberUseCase {
  const DeactivateMemberUseCase(this._admin);

  final AdminManagementService _admin;

  Future<void> call(String tableMemberId) =>
      _admin.deactivateMember(tableMemberId);
}
