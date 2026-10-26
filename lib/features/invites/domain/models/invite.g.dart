// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invite.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Invite _$InviteFromJson(Map<String, dynamic> json) => _Invite(
  id: json['id'] as String,
  code: json['code'] as String,
  roleKind: $enumDecode(_$InviteRoleKindEnumMap, json['role_kind']),
  status: $enumDecode(
    _$InviteStatusEnumMap,
    json['status'],
    unknownValue: InviteStatus.pending,
  ),
  organizationId: json['organization_id'] as String,
  organizationName: json['organization_name'] as String?,
  roundTableId: json['round_table_id'] as String?,
  roundTableName: json['round_table_name'] as String?,
  roundTableCode: json['round_table_code'] as String?,
  person: InvitePerson.fromJson(json['person'] as Map<String, dynamic>),
  invitedByPersonId: json['invited_by_person_id'] as String?,
  invitedByName: json['invited_by_name'] as String?,
  expiresAt: DateTime.parse(json['expires_at'] as String),
  acceptedAt: json['accepted_at'] == null
      ? null
      : DateTime.parse(json['accepted_at'] as String),
  revokedAt: json['revoked_at'] == null
      ? null
      : DateTime.parse(json['revoked_at'] as String),
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  inviteUrl: json['invite_url'] as String?,
);

Map<String, dynamic> _$InviteToJson(_Invite instance) => <String, dynamic>{
  'id': instance.id,
  'code': instance.code,
  'role_kind': _$InviteRoleKindEnumMap[instance.roleKind]!,
  'status': _$InviteStatusEnumMap[instance.status]!,
  'organization_id': instance.organizationId,
  'organization_name': ?instance.organizationName,
  'round_table_id': ?instance.roundTableId,
  'round_table_name': ?instance.roundTableName,
  'round_table_code': ?instance.roundTableCode,
  'person': instance.person.toJson(),
  'invited_by_person_id': ?instance.invitedByPersonId,
  'invited_by_name': ?instance.invitedByName,
  'expires_at': instance.expiresAt.toIso8601String(),
  'accepted_at': ?instance.acceptedAt?.toIso8601String(),
  'revoked_at': ?instance.revokedAt?.toIso8601String(),
  'created_at': ?instance.createdAt?.toIso8601String(),
  'invite_url': ?instance.inviteUrl,
};

const _$InviteRoleKindEnumMap = {
  InviteRoleKind.coordinator: 'coordinator',
  InviteRoleKind.facilitator: 'facilitator',
  InviteRoleKind.member: 'member',
};

const _$InviteStatusEnumMap = {
  InviteStatus.pending: 'pending',
  InviteStatus.accepted: 'accepted',
  InviteStatus.expired: 'expired',
  InviteStatus.revoked: 'revoked',
};
