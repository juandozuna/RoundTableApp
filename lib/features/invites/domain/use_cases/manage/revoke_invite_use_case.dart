import 'package:injectable/injectable.dart';

import '../../models/invite.dart';
import '../../services/invite_service.dart';

@injectable
class RevokeInviteUseCase {
  const RevokeInviteUseCase(this._invites);

  final InviteService _invites;

  Future<Invite> call(String inviteId) => _invites.revoke(inviteId);
}
