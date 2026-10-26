import 'package:injectable/injectable.dart';

import '../../models/invite.dart';
import '../../services/invite_service.dart';

@injectable
class RenewInviteUseCase {
  const RenewInviteUseCase(this._invites);

  final InviteService _invites;

  Future<Invite> call(String inviteId, {int? expiresInDays}) =>
      _invites.renew(inviteId, expiresInDays: expiresInDays);
}
