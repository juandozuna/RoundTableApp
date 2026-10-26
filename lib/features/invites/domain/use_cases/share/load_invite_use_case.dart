import 'package:injectable/injectable.dart';

import '../../../../../core/services/session_context/session_context.dart';
import '../../models/invite.dart';
import '../manage/list_invites_use_case.dart';

/// Finds one invite by id (the share page after a browser refresh, when the
/// invite handed over in memory is gone).
@injectable
class LoadInviteUseCase {
  const LoadInviteUseCase(this._list);

  final ListInvitesUseCase _list;

  Future<Invite?> call(SessionContext context, String inviteId) async {
    final invites = await _list(context);
    for (final invite in invites) {
      if (invite.id == inviteId) return invite;
    }
    return null;
  }
}
