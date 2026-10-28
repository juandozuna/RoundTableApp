import 'package:injectable/injectable.dart';

import '../../domain/models/admin_location.dart';
import '../../domain/models/admin_organization.dart';
import '../../domain/models/admin_person.dart';
import '../../domain/models/admin_table.dart';
import '../../domain/models/program_value.dart';
import '../../domain/models/table_membership.dart';
import '../../domain/services/admin_directory_service.dart';
import '../datasources/admin_remote_data_source.dart';

@LazySingleton(as: AdminDirectoryService)
class AdminDirectoryServiceImpl implements AdminDirectoryService {
  AdminDirectoryServiceImpl(this._remote);

  final AdminRemoteDataSource _remote;

  @override
  Future<List<AdminOrganization>> organizations() => _remote.organizations();

  @override
  Future<AdminOrganization> organization(String id) => _remote.organization(id);

  @override
  Future<List<AdminLocation>> locations({String? organizationId}) =>
      _remote.locations(organizationId: organizationId);

  @override
  Future<AdminLocation> location(String id) => _remote.location(id);

  @override
  Future<List<AdminTable>> tables({String? organizationId}) =>
      _remote.tables(organizationId: organizationId);

  @override
  Future<AdminTable> table(String id) => _remote.table(id);

  @override
  Future<List<AdminPerson>> people({String? organizationId}) =>
      _remote.people(organizationId: organizationId);

  @override
  Future<AdminPerson> person(String id) => _remote.person(id);

  @override
  Future<List<ProgramValue>> programValues() => _remote.programValues();

  @override
  Future<List<TableMembership>> memberships(String roundTableId) =>
      _remote.memberships(roundTableId);
}
