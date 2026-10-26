import '../models/invite.dart';
import '../models/invite_preview.dart';
import '../models/invite_scope.dart';
import '../models/invite_status.dart';
import '../models/new_invite.dart';
import '../models/redeem_profile.dart';
import '../models/redeem_result.dart';

/// Invitations: preview and redeem (anyone), create/list/renew/revoke
/// (inviters). All online-only (ADR 0003). Methods throw `InviteFailure`.
abstract interface class InviteService {
  /// Anonymous: only the welcome-card data.
  Future<InvitePreview> preview(String code);

  /// Binds the signed-in identity to the pre-registered person.
  Future<RedeemResult> redeem(String code, RedeemProfile profile);

  Future<Invite> create(NewInvite input);

  Future<List<Invite>> list(InviteScope scope, {InviteStatus? status});

  Future<Invite> revoke(String inviteId);

  /// New code and a new expiry for [inviteId].
  Future<Invite> renew(String inviteId, {int? expiresInDays});
}
