import '../auth/auth_routes.dart';

/// Paths of the invites feature. Redemption paths are public: a new person
/// opens them before having an account.
abstract final class InvitesRoutes {
  /// Code entry (also the deep-link base `/#/invitacion/<code>`).
  static const String redeem = AuthRoutes.inviteCode;
  static const String scan = AuthRoutes.inviteScan;
  static const String codeParam = 'code';
  static const String redeemWithCode = '$redeem/:$codeParam';

  /// Shared links of older builds (`/invite/<code>`) land here.
  static const String legacyRedeem = '/invite';
  static const String legacyRedeemWithCode = '$legacyRedeem/:$codeParam';

  static const String manager = '/invitaciones';
  static const String create = '$manager/nueva';
  static const String idParam = 'id';
  static const String share = '$manager/:$idParam/compartir';

  static String redeemFor(String code) => '$redeem/$code';

  static String shareFor(String inviteId) => '$manager/$inviteId/compartir';
}
