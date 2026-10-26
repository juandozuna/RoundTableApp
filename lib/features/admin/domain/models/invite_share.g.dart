// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invite_share.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InvitePerson _$InvitePersonFromJson(Map<String, dynamic> json) =>
    _InvitePerson(
      id: json['id'] as String?,
      firstName: json['first_name'] as String? ?? '',
      lastName: json['last_name'] as String? ?? '',
    );

Map<String, dynamic> _$InvitePersonToJson(_InvitePerson instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
    };

_InviteShare _$InviteShareFromJson(Map<String, dynamic> json) => _InviteShare(
  id: json['id'] as String,
  code: json['code'] as String,
  roleKind: json['role_kind'] as String,
  status: json['status'] as String?,
  organizationName: json['organization_name'] as String?,
  roundTableName: json['round_table_name'] as String?,
  person: json['person'] == null
      ? null
      : InvitePerson.fromJson(json['person'] as Map<String, dynamic>),
  expiresAt: json['expires_at'] == null
      ? null
      : DateTime.parse(json['expires_at'] as String),
  inviteUrl: json['invite_url'] as String?,
);

Map<String, dynamic> _$InviteShareToJson(_InviteShare instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'role_kind': instance.roleKind,
      'status': ?instance.status,
      'organization_name': ?instance.organizationName,
      'round_table_name': ?instance.roundTableName,
      'person': ?instance.person?.toJson(),
      'expires_at': ?instance.expiresAt?.toIso8601String(),
      'invite_url': ?instance.inviteUrl,
    };
