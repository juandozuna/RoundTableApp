/// Paths and parameter keys of the administration feature.
abstract final class AdminRoutes {
  /// The app's home, for people whose role cannot use the admin screens.
  static const String appHome = '/';

  static const String explorer = '/admin';
  static const String organizationNew = '/admin/organizaciones/nueva';
  static const String organizationIdParam = 'organizationId';
  static const String organization =
      '/admin/organizaciones/:$organizationIdParam';
  static const String organizationEdit = '$organization/editar';
  static const String locationNew = '$organization/ubicaciones/nueva';
  static const String locationIdParam = 'locationId';
  static const String locationEdit =
      '$organization/ubicaciones/:$locationIdParam';
  static const String tableNew = '/admin/mesas/nueva';
  static const String tableIdParam = 'tableId';
  static const String table = '/admin/mesas/:$tableIdParam';
  static const String tableEdit = '$table/editar';
  static const String personIdParam = 'personId';
  static const String person = '/admin/personas/:$personIdParam';
  static const String invite = '/admin/invitar';

  /// Query keys.
  static const String viewQuery = 'vista';
  static const String organizationQuery = 'organizacion';
  static const String tableQuery = 'mesa';
  static const String roleQuery = 'rol';

  static String organizationPath(String id) => '/admin/organizaciones/$id';
  static String organizationEditPath(String id) =>
      '/admin/organizaciones/$id/editar';
  static String locationNewPath(String organizationId) =>
      '/admin/organizaciones/$organizationId/ubicaciones/nueva';
  static String locationEditPath(String organizationId, String locationId) =>
      '/admin/organizaciones/$organizationId/ubicaciones/$locationId';
  static String tablePath(String id) => '/admin/mesas/$id';
  static String tableEditPath(String id) => '/admin/mesas/$id/editar';
  static String personPath(String id) => '/admin/personas/$id';

  static String tableNewPath({String? organizationId}) => Uri(
    path: tableNew,
    queryParameters: {organizationQuery: ?organizationId},
  ).toString();

  static String invitePath({
    required String role,
    String? organizationId,
    String? tableId,
  }) => Uri(
    path: invite,
    queryParameters: {
      roleQuery: role,
      organizationQuery: ?organizationId,
      tableQuery: ?tableId,
    },
  ).toString();

  static String explorerPath({String? viewId}) =>
      Uri(path: explorer, queryParameters: {viewQuery: ?viewId}).toString();
}
