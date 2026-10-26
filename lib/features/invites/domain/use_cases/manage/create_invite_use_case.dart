import 'package:injectable/injectable.dart';

import '../../models/invite.dart';
import '../../models/new_invite.dart';
import '../../services/invite_service.dart';

@injectable
class CreateInviteUseCase {
  const CreateInviteUseCase(this._invites);

  final InviteService _invites;

  Future<Invite> call(NewInvite input) => _invites.create(input);
}
