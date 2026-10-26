import 'package:injectable/injectable.dart';

import '../../services/admin_management_service.dart';

@injectable
class MoveMemberUseCase {
  const MoveMemberUseCase(this._admin);

  final AdminManagementService _admin;

  Future<void> call({
    required String tableMemberId,
    required String toTableId,
  }) => _admin.moveMember(tableMemberId: tableMemberId, toTableId: toTableId);
}
