// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_context.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AccountContext _$AccountContextFromJson(Map<String, dynamic> json) =>
    _AccountContext(
      kind: $enumDecode(_$UserRoleEnumMap, json['kind']),
      personId: json['person_id'] as String,
      organizationId: json['organization_id'] as String?,
      organizationName: json['organization_name'] as String?,
      roundTableId: json['round_table_id'] as String?,
      roundTableName: json['round_table_name'] as String?,
      roundTableCode: json['round_table_code'] as String?,
      label: json['label'] as String? ?? '',
    );

Map<String, dynamic> _$AccountContextToJson(_AccountContext instance) =>
    <String, dynamic>{
      'kind': _$UserRoleEnumMap[instance.kind]!,
      'person_id': instance.personId,
      'organization_id': ?instance.organizationId,
      'organization_name': ?instance.organizationName,
      'round_table_id': ?instance.roundTableId,
      'round_table_name': ?instance.roundTableName,
      'round_table_code': ?instance.roundTableCode,
      'label': instance.label,
    };

const _$UserRoleEnumMap = {
  UserRole.administrator: 'platform_admin',
  UserRole.coordinator: 'coordinator',
  UserRole.facilitator: 'facilitator',
  UserRole.member: 'member',
};
