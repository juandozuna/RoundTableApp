// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invite_list_envelope.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InviteListEnvelope _$InviteListEnvelopeFromJson(Map<String, dynamic> json) =>
    _InviteListEnvelope(
      invites:
          (json['invites'] as List<dynamic>?)
              ?.map((e) => Invite.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$InviteListEnvelopeToJson(_InviteListEnvelope instance) =>
    <String, dynamic>{
      'invites': instance.invites.map((e) => e.toJson()).toList(),
    };
