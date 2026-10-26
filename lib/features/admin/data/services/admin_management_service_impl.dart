import 'package:injectable/injectable.dart';

import '../../domain/models/admin_location.dart';
import '../../domain/models/admin_organization.dart';
import '../../domain/models/admin_person.dart';
import '../../domain/models/location_input.dart';
import '../../domain/models/organization_input.dart';
import '../../domain/models/organization_status.dart';
import '../../domain/models/person_input.dart';
import '../../domain/models/table_change.dart';
import '../../domain/models/table_input.dart';
import '../../domain/services/admin_management_service.dart';
import '../datasources/admin_remote_data_source.dart';

@LazySingleton(as: AdminManagementService)
class AdminManagementServiceImpl implements AdminManagementService {
  AdminManagementServiceImpl(this._remote);

  final AdminRemoteDataSource _remote;

  @override
  Future<AdminOrganization> createOrganization(OrganizationInput input) =>
      _remote.createOrganization(input);

  @override
  Future<AdminOrganization> updateOrganization(
    String id,
    OrganizationInput input,
  ) => _remote.updateOrganization(id, input);

  @override
  Future<AdminOrganization> setOrganizationStatus(
    String id,
    OrganizationStatus status,
  ) => _remote.setOrganizationStatus(id, status);

  @override
  Future<AdminLocation> createLocation(
    String organizationId,
    LocationInput input,
  ) => _remote.createLocation(organizationId, input);

  @override
  Future<AdminLocation> updateLocation(String id, LocationInput input) =>
      _remote.updateLocation(id, input);

  @override
  Future<TableChange> createTable({
    required String organizationId,
    required TableInput input,
    required PersonRef facilitator,
  }) => _remote.createTable(
    organizationId: organizationId,
    input: input,
    facilitator: facilitator,
  );

  @override
  Future<void> updateTable(String id, TableInput input) =>
      _remote.updateTable(id, input);

  @override
  Future<TableChange> changeFacilitator({
    required String tableId,
    required PersonRef facilitator,
    required bool keepPreviousAsMember,
  }) => _remote.changeFacilitator(
    tableId: tableId,
    facilitator: facilitator,
    keepPreviousAsMember: keepPreviousAsMember,
  );

  @override
  Future<void> addMember({required String tableId, required String personId}) =>
      _remote.addMember(tableId, personId);

  @override
  Future<void> moveMember({
    required String tableMemberId,
    required String toTableId,
  }) => _remote.moveMember(tableMemberId, toTableId);

  @override
  Future<void> deactivateMember(String tableMemberId) =>
      _remote.deactivateMember(tableMemberId);

  @override
  Future<AdminPerson> updatePerson(
    String id, {
    String? firstName,
    String? lastName,
    String? position,
    String? email,
    String? phone,
    PersonStatusChange? status,
  }) => _remote.updatePerson(
    id,
    firstName: firstName,
    lastName: lastName,
    position: position,
    email: email,
    phone: phone,
    status: status,
  );
}
