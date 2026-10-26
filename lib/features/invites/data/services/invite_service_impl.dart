import 'package:injectable/injectable.dart';

import '../../../../core/network/api_exception.dart';
import '../../domain/models/invite.dart';
import '../../domain/models/invite_preview.dart';
import '../../domain/models/invite_scope.dart';
import '../../domain/models/invite_status.dart';
import '../../domain/models/new_invite.dart';
import '../../domain/models/redeem_profile.dart';
import '../../domain/models/redeem_result.dart';
import '../../domain/services/invite_service.dart';
import '../datasources/invites_remote_data_source.dart';
import 'invite_failure_mapper.dart';

@LazySingleton(as: InviteService)
class InviteServiceImpl implements InviteService {
  InviteServiceImpl(this._remote);

  final InvitesRemoteDataSource _remote;

  @override
  Future<InvitePreview> preview(String code) =>
      _guard(() => _remote.preview(code));

  @override
  Future<RedeemResult> redeem(String code, RedeemProfile profile) =>
      _guard(() => _remote.redeem(code, profile));

  @override
  Future<Invite> create(NewInvite input) => _guard(() => _remote.create(input));

  @override
  Future<List<Invite>> list(InviteScope scope, {InviteStatus? status}) =>
      _guard(() => _remote.list(scope, status: status));

  @override
  Future<Invite> revoke(String inviteId) =>
      _guard(() => _remote.revoke(inviteId));

  @override
  Future<Invite> renew(String inviteId, {int? expiresInDays}) =>
      _guard(() => _remote.renew(inviteId, expiresInDays: expiresInDays));

  Future<T> _guard<T>(Future<T> Function() call) async {
    try {
      return await call();
    } on ApiException catch (error) {
      throw InviteFailureMapper.fromApi(error);
    }
  }
}
