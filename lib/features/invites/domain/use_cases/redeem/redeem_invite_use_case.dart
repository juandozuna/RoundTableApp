import 'package:injectable/injectable.dart';

import '../../../../auth/domain/services/access_session_service.dart';
import '../../models/invite_code.dart';
import '../../models/redeem_profile.dart';
import '../../models/redeem_result.dart';
import '../../services/invite_service.dart';

@injectable
class RedeemInviteUseCase {
  const RedeemInviteUseCase(this._invites, this._access);

  final InviteService _invites;
  final AccessSessionService _access;

  /// Redeems [code] with the signed-in account, then reloads the account so
  /// the new context becomes the active one. Throws `InviteFailure`.
  Future<RedeemResult> call(String code, RedeemProfile profile) async {
    final result = await _invites.redeem(InviteCode.normalize(code), profile);
    await _access.refresh(preferPersonId: result.person.id);
    return result;
  }
}
