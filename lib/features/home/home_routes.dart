/// Paths of the home feature and of the destinations it links to.
abstract final class HomeRoutes {
  static const String home = '/';

  /// Where the live session of a table opens. Owned by the session feature;
  /// keep in sync with its router.
  static const String sessionParamTableId = 'tableId';
  static const String sessionParamSessionId = 'sessionId';

  static String session({required String tableId, required String sessionId}) =>
      '/mesas/$tableId/sesion/$sessionId';

  /// KPI dashboard of the admin feature (coordinators and administrators).
  static const String adminDashboard = '/admin';

  /// Pending invites list of the invites feature.
  static const String invites = '/invitaciones';
}
