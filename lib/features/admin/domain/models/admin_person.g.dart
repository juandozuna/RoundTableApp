// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminPersonRole _$AdminPersonRoleFromJson(Map<String, dynamic> json) =>
    _AdminPersonRole(
      id: json['id'] as String,
      role: json['role'] as String,
      organizationId: json['organization_id'] as String?,
    );

Map<String, dynamic> _$AdminPersonRoleToJson(_AdminPersonRole instance) =>
    <String, dynamic>{
      'id': instance.id,
      'role': instance.role,
      'organization_id': ?instance.organizationId,
    };

_AdminPersonTable _$AdminPersonTableFromJson(Map<String, dynamic> json) =>
    _AdminPersonTable(
      tableMemberId: json['table_member_id'] as String,
      roundTableId: json['round_table_id'] as String,
      roundTableName: json['round_table_name'] as String?,
      role:
          $enumDecodeNullable(
            _$MembershipRoleEnumMap,
            json['role'],
            unknownValue: MembershipRole.member,
          ) ??
          MembershipRole.member,
    );

Map<String, dynamic> _$AdminPersonTableToJson(_AdminPersonTable instance) =>
    <String, dynamic>{
      'table_member_id': instance.tableMemberId,
      'round_table_id': instance.roundTableId,
      'round_table_name': ?instance.roundTableName,
      'role': _$MembershipRoleEnumMap[instance.role]!,
    };

const _$MembershipRoleEnumMap = {
  MembershipRole.facilitator: 'facilitator',
  MembershipRole.member: 'member',
};

_AdminPerson _$AdminPersonFromJson(Map<String, dynamic> json) => _AdminPerson(
  id: json['id'] as String,
  organizationId: json['organization_id'] as String?,
  firstName: json['first_name'] as String,
  lastName: json['last_name'] as String,
  position: json['position'] as String?,
  email: json['email'] as String?,
  phone: json['phone'] as String?,
  status:
      $enumDecodeNullable(
        _$PersonStatusEnumMap,
        json['status'],
        unknownValue: PersonStatus.inactive,
      ) ??
      PersonStatus.active,
  linked: json['linked'] as bool? ?? false,
  roles:
      (json['roles'] as List<dynamic>?)
          ?.map((e) => AdminPersonRole.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  tables:
      (json['tables'] as List<dynamic>?)
          ?.map((e) => AdminPersonTable.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$AdminPersonToJson(_AdminPerson instance) =>
    <String, dynamic>{
      'id': instance.id,
      'organization_id': ?instance.organizationId,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'position': ?instance.position,
      'email': ?instance.email,
      'phone': ?instance.phone,
      'status': _$PersonStatusEnumMap[instance.status]!,
      'linked': instance.linked,
      'roles': instance.roles.map((e) => e.toJson()).toList(),
      'tables': instance.tables.map((e) => e.toJson()).toList(),
    };

const _$PersonStatusEnumMap = {
  PersonStatus.invited: 'invited',
  PersonStatus.active: 'active',
  PersonStatus.inactive: 'inactive',
};
