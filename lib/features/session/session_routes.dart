/// Paths and parameter keys of the live session feature.
abstract final class SessionRoutes {
  /// Where the back button goes when there is nothing to pop.
  static const String backFallback = '/';

  /// Today's session of the user's active table.
  static const String live = '/sesion';

  static const String tableIdParam = 'tableId';

  /// Today's session of a specific table.
  static const String liveForTable = '/mesas/:$tableIdParam/sesion';

  static String liveFor(String tableId) => '/mesas/$tableId/sesion';
}
