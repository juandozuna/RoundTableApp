/// Paths and query keys of the audit log.
abstract final class AuditRoutes {
  static const String audit = '/admin/auditoria';

  static const String organizationQuery = 'organizacion';

  static String auditPath({String? organizationId}) => Uri(
    path: audit,
    queryParameters: {organizationQuery: ?organizationId},
  ).toString();
}
