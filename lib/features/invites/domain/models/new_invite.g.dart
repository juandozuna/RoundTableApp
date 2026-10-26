// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_invite.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NewInvite _$NewInviteFromJson(Map<String, dynamic> json) => _NewInvite(
  roleKind: $enumDecode(_$InviteRoleKindEnumMap, json['role_kind']),
  organizationId: json['organization_id'] as String?,
  roundTableId: json['round_table_id'] as String?,
  person: PersonDraft.fromJson(json['person'] as Map<String, dynamic>),
  expiresInDays: (json['expires_in_days'] as num?)?.toInt(),
);

Map<String, dynamic> _$NewInviteToJson(_NewInvite instance) =>
    <String, dynamic>{
      'role_kind': _$InviteRoleKindEnumMap[instance.roleKind]!,
      'organization_id': ?instance.organizationId,
      'round_table_id': ?instance.roundTableId,
      'person': instance.person.toJson(),
      'expires_in_days': ?instance.expiresInDays,
    };

const _$InviteRoleKindEnumMap = {
  InviteRoleKind.coordinator: 'coordinator',
  InviteRoleKind.facilitator: 'facilitator',
  InviteRoleKind.member: 'member',
};
