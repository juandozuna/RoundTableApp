// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role_assignment_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RoleAssignmentRecord _$RoleAssignmentRecordFromJson(
  Map<String, dynamic> json,
) => _RoleAssignmentRecord(
  id: json['id'] as String,
  personId: json['person_id'] as String,
  role: $enumDecode(_$UserRoleEnumMap, json['role']),
  organizationId: json['organization_id'] as String?,
  locationId: json['location_id'] as String?,
  status: json['status'] as String,
);

Map<String, dynamic> _$RoleAssignmentRecordToJson(
  _RoleAssignmentRecord instance,
) => <String, dynamic>{
  'id': instance.id,
  'person_id': instance.personId,
  'role': _$UserRoleEnumMap[instance.role]!,
  'organization_id': ?instance.organizationId,
  'location_id': ?instance.locationId,
  'status': instance.status,
};

const _$UserRoleEnumMap = {
  UserRole.administrator: 'platform_admin',
  UserRole.coordinator: 'coordinator',
  UserRole.facilitator: 'facilitator',
  UserRole.member: 'member',
};
