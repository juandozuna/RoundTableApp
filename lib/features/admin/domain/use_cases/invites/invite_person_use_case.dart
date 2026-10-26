import 'package:injectable/injectable.dart';

import '../../models/invite_request.dart';
import '../../models/invite_share.dart';
import '../../services/admin_invite_service.dart';

@injectable
class InvitePersonUseCase {
  const InvitePersonUseCase(this._invites);

  final AdminInviteService _invites;

  Future<InviteShare> call(InviteRequest request) => _invites.create(request);
}
