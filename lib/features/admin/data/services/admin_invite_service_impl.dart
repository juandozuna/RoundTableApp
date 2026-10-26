import 'package:injectable/injectable.dart';

import '../../domain/models/invite_request.dart';
import '../../domain/models/invite_share.dart';
import '../../domain/services/admin_invite_service.dart';
import '../datasources/admin_remote_data_source.dart';

@LazySingleton(as: AdminInviteService)
class AdminInviteServiceImpl implements AdminInviteService {
  AdminInviteServiceImpl(this._remote);

  final AdminRemoteDataSource _remote;

  @override
  Future<InviteShare> create(InviteRequest request) =>
      _remote.createInvite(request);
}
