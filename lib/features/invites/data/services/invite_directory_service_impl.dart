import 'package:injectable/injectable.dart';

import '../../../../core/network/api_exception.dart';
import '../../domain/models/invite_target_organization.dart';
import '../../domain/models/invite_target_table.dart';
import '../../domain/services/invite_directory_service.dart';
import '../datasources/invite_directory_remote_data_source.dart';
import 'invite_failure_mapper.dart';

@LazySingleton(as: InviteDirectoryService)
class InviteDirectoryServiceImpl implements InviteDirectoryService {
  InviteDirectoryServiceImpl(this._remote);

  final InviteDirectoryRemoteDataSource _remote;

  @override
  Future<List<InviteTargetOrganization>> organizations() async {
    try {
      return await _remote.organizations();
    } on ApiException catch (error) {
      throw InviteFailureMapper.fromApi(error);
    }
  }

  @override
  Future<List<InviteTargetTable>> tables({
    String? organizationId,
    String? tableId,
  }) async {
    try {
      return await _remote.tables(
        organizationId: organizationId,
        tableId: tableId,
      );
    } on ApiException catch (error) {
      throw InviteFailureMapper.fromApi(error);
    }
  }
}
