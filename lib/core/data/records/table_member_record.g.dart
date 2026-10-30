// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table_member_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TableMemberRecord _$TableMemberRecordFromJson(Map<String, dynamic> json) =>
    _TableMemberRecord(
      id: json['id'] as String,
      organizationId: json['organization_id'] as String,
      roundTableId: json['round_table_id'] as String,
      personId: json['person_id'] as String,
      role: $enumDecode(_$UserRoleEnumMap, json['role']),
      joinedAt: DateTime.parse(json['joined_at'] as String),
      leftAt: json['left_at'] == null
          ? null
          : DateTime.parse(json['left_at'] as String),
      leftReason: json['left_reason'] as String?,
      status: json['status'] as String,
      firstName: json['first_name'] as String? ?? '',
      lastName: json['last_name'] as String? ?? '',
    );

Map<String, dynamic> _$TableMemberRecordToJson(_TableMemberRecord instance) =>
    <String, dynamic>{
      'id': instance.id,
      'organization_id': instance.organizationId,
      'round_table_id': instance.roundTableId,
      'person_id': instance.personId,
      'role': _$UserRoleEnumMap[instance.role]!,
      'joined_at': instance.joinedAt.toIso8601String(),
      'left_at': ?instance.leftAt?.toIso8601String(),
      'left_reason': ?instance.leftReason,
      'status': instance.status,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
    };

const _$UserRoleEnumMap = {
  UserRole.administrator: 'platform_admin',
  UserRole.coordinator: 'coordinator',
  UserRole.facilitator: 'facilitator',
  UserRole.member: 'member',
};
