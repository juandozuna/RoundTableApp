import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/models/invite.dart';

part 'invite_list_envelope.freezed.dart';
part 'invite_list_envelope.g.dart';

@freezed
abstract class InviteListEnvelope with _$InviteListEnvelope {
  const factory InviteListEnvelope({@Default([]) List<Invite> invites}) =
      _InviteListEnvelope;

  factory InviteListEnvelope.fromJson(Map<String, dynamic> json) =>
      _$InviteListEnvelopeFromJson(json);
}
