/// Paths and query keys of the KPI dashboards.
abstract final class KpisRoutes {
  static const String reports = '/admin/informes';

  static const String countryQuery = 'pais';
  static const String organizationQuery = 'organizacion';
  static const String tableQuery = 'mesa';

  static const String tableIdParam = 'tableId';
  static const String personIdParam = 'personId';
  static const String memberDetail =
      '/admin/mesas/:$tableIdParam/miembros/:$personIdParam';

  static String memberDetailPath({
    required String tableId,
    required String personId,
  }) => '/admin/mesas/$tableId/miembros/$personId';

  /// Reports pre-filtered to one country, organization or table.
  static String reportsPath({
    String? country,
    String? organizationId,
    String? tableId,
  }) => Uri(
    path: reports,
    queryParameters: {
      countryQuery: ?country,
      organizationQuery: ?organizationId,
      tableQuery: ?tableId,
    },
  ).toString();
}
