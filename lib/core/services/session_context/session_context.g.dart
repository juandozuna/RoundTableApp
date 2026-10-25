// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_context.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SessionContext _$SessionContextFromJson(Map<String, dynamic> json) =>
    _SessionContext(
      role: $enumDecode(_$UserRoleEnumMap, json['role']),
      organizationId: json['organization_id'] as String?,
      organizationName: json['organization_name'] as String?,
      tableId: json['table_id'] as String?,
      tableName: json['table_name'] as String?,
    );

Map<String, dynamic> _$SessionContextToJson(_SessionContext instance) =>
    <String, dynamic>{
      'role': _$UserRoleEnumMap[instance.role]!,
      'organization_id': ?instance.organizationId,
      'organization_name': ?instance.organizationName,
      'table_id': ?instance.tableId,
      'table_name': ?instance.tableName,
    };

const _$UserRoleEnumMap = {
  UserRole.administrator: 'administrator',
  UserRole.coordinator: 'coordinator',
  UserRole.facilitator: 'facilitator',
  UserRole.member: 'member',
};
