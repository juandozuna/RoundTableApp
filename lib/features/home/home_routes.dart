/// Paths of the home feature and of the destinations it links to.
abstract final class HomeRoutes {
  static const String home = '/';

  /// Where the live session of a table opens. Owned by the session feature
  /// (`SessionRoutes.liveFor`); keep in sync with its router. The session
  /// screen picks the table's current session itself, so no session id.
  static const String sessionParamTableId = 'tableId';

  static String session({required String tableId}) => '/mesas/$tableId/sesion';

  /// KPI dashboard of the admin feature (coordinators and administrators).
  static const String adminDashboard = '/admin';

  /// Table detail of the admin feature (`AdminRoutes.tablePath`); keep in sync.
  static String table(String id) => '/admin/mesas/$id';

  /// Progress and history of the history feature (`HistoryRoutes.progress`);
  /// keep in sync with its router.
  static const String progress = '/progreso';

  /// Pending invites list of the invites feature.
  static const String invites = '/invitaciones';
}
