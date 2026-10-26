/// Paths of the progress and history feature.
abstract final class HistoryRoutes {
  /// "Progreso" shell destination: a member's own history or the facilitator's
  /// table history.
  static const String progress = '/progreso';

  static const String personIdParam = 'personId';
  static const String tableIdParam = 'tableId';

  /// One member's timeline, opened by the facilitator of the table.
  static const String memberTimeline =
      '$progress/mesas/:$tableIdParam/miembros/:$personIdParam';

  static String memberTimelineOf({
    required String tableId,
    required String personId,
  }) => '$progress/mesas/$tableId/miembros/$personId';
}
