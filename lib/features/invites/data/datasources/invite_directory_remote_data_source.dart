import 'package:injectable/injectable.dart';

import '../../../../core/network/api_guard.dart';
import '../../domain/models/invite_target_organization.dart';
import '../../domain/models/invite_target_table.dart';
import '../client/invite_directory_client.dart';

@lazySingleton
class InviteDirectoryRemoteDataSource {
  InviteDirectoryRemoteDataSource(this._client);

  final InviteDirectoryClient _client;

  static const String _tableColumns =
      'id,organization_id,organization_name,name,code,status,active_people,'
      'max_people,facilitator_person_id,facilitator_name';

  Future<List<InviteTargetOrganization>> organizations() => guardApiCall(
    () => _client.organizations(
      select: 'id,name',
      status: 'eq.active',
      order: 'name.asc',
    ),
  );

  Future<List<InviteTargetTable>> tables({
    String? organizationId,
    String? tableId,
  }) => guardApiCall(
    () => _client.tables(
      select: _tableColumns,
      status: 'in.(active,paused)',
      order: 'name.asc',
      organizationId: organizationId == null ? null : 'eq.$organizationId',
      id: tableId == null ? null : 'eq.$tableId',
    ),
  );
}
