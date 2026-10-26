// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invite_preview.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InvitePreview _$InvitePreviewFromJson(Map<String, dynamic> json) =>
    _InvitePreview(
      code: json['code'] as String,
      status:
          $enumDecodeNullable(
            _$InviteStatusEnumMap,
            json['status'],
            unknownValue: InviteStatus.pending,
          ) ??
          InviteStatus.pending,
      roleKind: $enumDecode(_$InviteRoleKindEnumMap, json['role_kind']),
      organizationName: json['organization_name'] as String,
      roundTableName: json['round_table_name'] as String?,
      personFirstName: json['person_first_name'] as String?,
      invitedByName: json['invited_by_name'] as String?,
      expiresAt: json['expires_at'] == null
          ? null
          : DateTime.parse(json['expires_at'] as String),
    );

Map<String, dynamic> _$InvitePreviewToJson(_InvitePreview instance) =>
    <String, dynamic>{
      'code': instance.code,
      'status': _$InviteStatusEnumMap[instance.status]!,
      'role_kind': _$InviteRoleKindEnumMap[instance.roleKind]!,
      'organization_name': instance.organizationName,
      'round_table_name': ?instance.roundTableName,
      'person_first_name': ?instance.personFirstName,
      'invited_by_name': ?instance.invitedByName,
      'expires_at': ?instance.expiresAt?.toIso8601String(),
    };

const _$InviteStatusEnumMap = {
  InviteStatus.pending: 'pending',
  InviteStatus.accepted: 'accepted',
  InviteStatus.expired: 'expired',
  InviteStatus.revoked: 'revoked',
};

const _$InviteRoleKindEnumMap = {
  InviteRoleKind.coordinator: 'coordinator',
  InviteRoleKind.facilitator: 'facilitator',
  InviteRoleKind.member: 'member',
};
