import '../models/admin_location.dart';
import '../models/admin_organization.dart';
import '../models/admin_person.dart';
import '../models/admin_table.dart';
import '../models/table_membership.dart';

/// Online reads of the administration directory, filtered by the server to
/// what the signed-in user may see. Single-item reads throw a not-found
/// failure when nothing matches.
abstract interface class AdminDirectoryService {
  Future<List<AdminOrganization>> organizations();

  Future<AdminOrganization> organization(String id);

  Future<List<AdminLocation>> locations({String? organizationId});

  Future<AdminLocation> location(String id);

  Future<List<AdminTable>> tables({String? organizationId});

  Future<AdminTable> table(String id);

  Future<List<AdminPerson>> people({String? organizationId});

  Future<AdminPerson> person(String id);

  /// Current and past seats of a table, newest first.
  Future<List<TableMembership>> memberships(String roundTableId);
}
