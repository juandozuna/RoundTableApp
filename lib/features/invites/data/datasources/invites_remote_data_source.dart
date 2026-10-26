import 'package:injectable/injectable.dart';

import '../../../../core/network/api_guard.dart';
import '../../domain/models/invite.dart';
import '../../domain/models/invite_preview.dart';
import '../../domain/models/invite_scope.dart';
import '../../domain/models/invite_status.dart';
import '../../domain/models/new_invite.dart';
import '../../domain/models/redeem_profile.dart';
import '../../domain/models/redeem_result.dart';
import '../client/invites_client.dart';

@lazySingleton
class InvitesRemoteDataSource {
  InvitesRemoteDataSource(this._client);

  final InvitesClient _client;

  Future<InvitePreview> preview(String code) async =>
      (await guardApiCall(() => _client.preview(code))).invite;

  Future<RedeemResult> redeem(String code, RedeemProfile profile) =>
      guardApiCall(
        () => _client.redeem({'code': code, 'profile': profile.toJson()}),
      );

  Future<Invite> create(NewInvite input) async =>
      (await guardApiCall(() => _client.create(input.toJson()))).invite;

  Future<List<Invite>> list(InviteScope scope, {InviteStatus? status}) async =>
      (await guardApiCall(
        () => _client.list(
          organizationId: scope.organizationId,
          roundTableId: scope.roundTableId,
          status: status?.wireValue,
        ),
      )).invites;

  Future<Invite> revoke(String inviteId) async =>
      (await guardApiCall(() => _client.revoke(inviteId))).invite;

  Future<Invite> renew(String inviteId, {int? expiresInDays}) async =>
      (await guardApiCall(
        () => _client.renew(inviteId, {'expires_in_days': ?expiresInDays}),
      )).invite;
}
