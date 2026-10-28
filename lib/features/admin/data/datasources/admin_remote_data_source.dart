import 'package:injectable/injectable.dart';

import '../../../../core/network/api_exception.dart';
import '../../../../core/network/api_guard.dart';
import '../../domain/models/admin_location.dart';
import '../../domain/models/admin_organization.dart';
import '../../domain/models/admin_person.dart';
import '../../domain/models/admin_table.dart';
import '../../domain/models/invite_request.dart';
import '../../domain/models/invite_share.dart';
import '../../domain/models/location_input.dart';
import '../../domain/models/organization_input.dart';
import '../../domain/models/organization_status.dart';
import '../../domain/models/person_input.dart';
import '../../domain/models/program_value.dart';
import '../../domain/models/table_change.dart';
import '../../domain/models/table_input.dart';
import '../../domain/models/table_membership.dart';
import '../../domain/services/admin_management_service.dart';
import '../client/admin_invites_client.dart';
import '../client/admin_read_client.dart';
import '../client/admin_write_client.dart';

/// Wire format of the administration API: PostgREST filters for reads and
/// Edge Function bodies for writes. Knows nothing about Drift or PowerSync.
@lazySingleton
class AdminRemoteDataSource {
  AdminRemoteDataSource(this._read, this._write, this._invites);

  final AdminReadClient _read;
  final AdminWriteClient _write;
  final AdminInvitesClient _invites;

  // ── Reads ───────────────────────────────────────────────────────────────

  Future<List<AdminOrganization>> organizations() => guardApiCall(
    () => _read.organizations({'select': '*', 'order': 'name.asc'}),
  );

  Future<AdminOrganization> organization(String id) async {
    final rows = await guardApiCall(
      () => _read.organizations({'select': '*', 'id': _eq(id)}),
    );
    return _first(rows);
  }

  Future<List<AdminLocation>> locations({String? organizationId}) =>
      guardApiCall(
        () => _read.locations({
          'select': '*',
          'order': 'name.asc',
          if (organizationId != null) 'organization_id': _eq(organizationId),
        }),
      );

  Future<AdminLocation> location(String id) async {
    final rows = await guardApiCall(
      () => _read.locations({'select': '*', 'id': _eq(id)}),
    );
    return _first(rows);
  }

  Future<List<AdminTable>> tables({String? organizationId}) => guardApiCall(
    () => _read.tables({
      'select': '*',
      'order': 'code.asc',
      if (organizationId != null) 'organization_id': _eq(organizationId),
    }),
  );

  Future<AdminTable> table(String id) async {
    final rows = await guardApiCall(
      () => _read.tables({'select': '*', 'id': _eq(id)}),
    );
    return _first(rows);
  }

  Future<List<AdminPerson>> people({String? organizationId}) => guardApiCall(
    () => _read.people({
      'select': '*',
      'order': 'last_name.asc,first_name.asc',
      if (organizationId != null) 'organization_id': _eq(organizationId),
    }),
  );

  Future<AdminPerson> person(String id) async {
    final rows = await guardApiCall(
      () => _read.people({'select': '*', 'id': _eq(id)}),
    );
    return _first(rows);
  }

  Future<List<ProgramValue>> programValues() => guardApiCall(
    () => _read.programValues({
      'select':
          'id,sequence,number_in_module,name,module:curriculum_modules(number,name)',
      'status': 'eq.active',
      'order': 'sequence.asc',
    }),
  );

  Future<List<TableMembership>> memberships(String roundTableId) =>
      guardApiCall(
        () => _read.memberships({
          'select':
              'id,person_id,role,joined_at,left_at,left_reason,'
              'moved_to_round_table_id,status,first_name,last_name',
          'round_table_id': _eq(roundTableId),
          'order': 'joined_at.desc',
        }),
      );

  Future<Map<String, dynamic>> me() async =>
      (await guardApiCall(_write.me)) as Map<String, dynamic>;

  // ── Writes ──────────────────────────────────────────────────────────────

  Future<AdminOrganization> createOrganization(OrganizationInput input) async {
    final json = await guardApiCall(
      () => _write.createOrganization(input.toJson()),
    );
    return AdminOrganization.fromJson(_row(json, 'organization'));
  }

  Future<AdminOrganization> updateOrganization(
    String id,
    OrganizationInput input,
  ) async {
    final json = await guardApiCall(
      () => _write.updateOrganization(id, input.toJson()),
    );
    return AdminOrganization.fromJson(_row(json, 'organization'));
  }

  Future<AdminOrganization> setOrganizationStatus(
    String id,
    OrganizationStatus status,
  ) async {
    final json = await guardApiCall(
      () => _write.setOrganizationStatus(id, {'status': status.wireValue}),
    );
    return AdminOrganization.fromJson(_row(json, 'organization'));
  }

  Future<AdminLocation> createLocation(
    String organizationId,
    LocationInput input,
  ) async {
    final json = await guardApiCall(
      () => _write.createLocation({
        'organization_id': organizationId,
        ...input.toJson(),
      }),
    );
    return AdminLocation.fromJson(_row(json, 'location'));
  }

  Future<AdminLocation> updateLocation(String id, LocationInput input) async {
    final json = await guardApiCall(
      () => _write.updateLocation(id, input.toJson()),
    );
    return AdminLocation.fromJson(_row(json, 'location'));
  }

  Future<TableChange> createTable({
    required String organizationId,
    required TableInput input,
    required PersonRef facilitator,
  }) async {
    final json = await guardApiCall(
      () => _write.createTable({
        'organization_id': organizationId,
        ...input.toJson(),
        'facilitator': facilitator.toRequest(),
      }),
    );
    return _tableChange(json);
  }

  Future<void> updateTable(String id, TableInput input) async {
    await guardApiCall(() => _write.updateTable(id, input.toJson()));
  }

  Future<TableChange> changeFacilitator({
    required String tableId,
    required PersonRef facilitator,
    required bool keepPreviousAsMember,
  }) async {
    final json = await guardApiCall(
      () => _write.setFacilitator(tableId, {
        ...facilitator.toRequest(),
        'keep_previous_as_member': keepPreviousAsMember,
      }),
    );
    return _tableChange(json);
  }

  Future<void> addMember(String tableId, String personId) async {
    await guardApiCall(
      () => _write.addMember(tableId, {'person_id': personId}),
    );
  }

  Future<void> moveMember(String tableMemberId, String toTableId) async {
    await guardApiCall(
      () => _write.moveMember(tableMemberId, {'to_round_table_id': toTableId}),
    );
  }

  Future<void> deactivateMember(String tableMemberId) async {
    await guardApiCall(() => _write.deactivateMember(tableMemberId, const {}));
  }

  Future<AdminPerson> updatePerson(
    String id, {
    String? firstName,
    String? lastName,
    String? position,
    String? email,
    String? phone,
    PersonStatusChange? status,
  }) async {
    final json = await guardApiCall(
      () => _write.updatePerson(id, {
        'first_name': ?firstName,
        'last_name': ?lastName,
        'position': ?position,
        'email': ?email,
        'phone': ?phone,
        if (status != null) 'status': status.name,
      }),
    );
    return AdminPerson.fromJson(_row(json, 'person'));
  }

  Future<InviteShare> createInvite(InviteRequest request) async {
    final json = await guardApiCall(
      () => _invites.create({
        'role_kind': request.roleKind.wireValue,
        if (request.organizationId != null)
          'organization_id': request.organizationId,
        if (request.roundTableId != null)
          'round_table_id': request.roundTableId,
        ...request.person.toRequest(),
        if (request.expiresInDays != null)
          'expires_in_days': request.expiresInDays,
      }),
    );
    return InviteShare.fromJson(_row(json, 'invite'));
  }

  // ── Helpers ─────────────────────────────────────────────────────────────

  static String _eq(String value) => 'eq.$value';

  static T _first<T>(List<T> rows) {
    if (rows.isEmpty) {
      throw const ApiException(
        kind: ApiErrorKind.notFound,
        code: 'not_found',
        statusCode: 404,
      );
    }
    return rows.first;
  }

  static Map<String, dynamic> _row(dynamic json, String key) {
    final row = json is Map<String, dynamic> ? json[key] : null;
    if (row is Map<String, dynamic>) return row;
    throw ApiException(
      kind: ApiErrorKind.unknown,
      message: 'Respuesta inesperada: falta "$key"',
    );
  }

  static TableChange _tableChange(dynamic json) {
    final table = _row(json, 'table');
    final invite = table['facilitator_invite'];
    return TableChange(
      tableId: table['id'] as String,
      facilitatorInvite: invite is Map<String, dynamic>
          ? InviteShare.fromJson(invite)
          : null,
    );
  }
}
