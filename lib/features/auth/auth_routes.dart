/// Paths and query keys of the auth feature. The invitation paths live here
/// because the sign-in gate links to them and the access guard exempts them.
abstract final class AuthRoutes {
  /// The app root; the guards decide where it leads for each person.
  static const String appRoot = '/';

  static const String signIn = '/ingresar';

  /// Loading and blocked states of a signed-in identity (no role, deactivated…).
  static const String access = '/acceso';
  static const String contextPicker = '/contexto';
  static const String account = '/cuenta';

  /// Invitation redemption (owned by the invites feature). Public: a new
  /// person opens it before having an account.
  static const String inviteCode = '/invitacion';
  static const String inviteScan = '/invitacion/escanear';

  /// Locations the access guard never redirects away from.
  static const List<String> exemptFromAccessGate = [inviteCode, '/dev'];
}
