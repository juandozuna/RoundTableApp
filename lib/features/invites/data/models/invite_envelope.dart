import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/models/invite.dart';

part 'invite_envelope.freezed.dart';
part 'invite_envelope.g.dart';

/// `{ "invite": { … } }` of create, revoke and renew.
@freezed
abstract class InviteEnvelope with _$InviteEnvelope {
  const factory InviteEnvelope({required Invite invite}) = _InviteEnvelope;

  factory InviteEnvelope.fromJson(Map<String, dynamic> json) =>
      _$InviteEnvelopeFromJson(json);
}
