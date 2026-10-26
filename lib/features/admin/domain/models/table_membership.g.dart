// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table_membership.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TableMembership _$TableMembershipFromJson(Map<String, dynamic> json) =>
    _TableMembership(
      id: json['id'] as String,
      personId: json['person_id'] as String,
      role:
          $enumDecodeNullable(
            _$MembershipRoleEnumMap,
            json['role'],
            unknownValue: MembershipRole.member,
          ) ??
          MembershipRole.member,
      joinedAt: json['joined_at'] == null
          ? null
          : DateTime.parse(json['joined_at'] as String),
      leftAt: json['left_at'] == null
          ? null
          : DateTime.parse(json['left_at'] as String),
      leftReason: json['left_reason'] as String?,
      movedToRoundTableId: json['moved_to_round_table_id'] as String?,
      status:
          $enumDecodeNullable(
            _$RecordStatusEnumMap,
            json['status'],
            unknownValue: RecordStatus.inactive,
          ) ??
          RecordStatus.active,
      firstName: json['first_name'] as String? ?? '',
      lastName: json['last_name'] as String? ?? '',
    );

Map<String, dynamic> _$TableMembershipToJson(_TableMembership instance) =>
    <String, dynamic>{
      'id': instance.id,
      'person_id': instance.personId,
      'role': _$MembershipRoleEnumMap[instance.role]!,
      'joined_at': ?instance.joinedAt?.toIso8601String(),
      'left_at': ?instance.leftAt?.toIso8601String(),
      'left_reason': ?instance.leftReason,
      'moved_to_round_table_id': ?instance.movedToRoundTableId,
      'status': _$RecordStatusEnumMap[instance.status]!,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
    };

const _$MembershipRoleEnumMap = {
  MembershipRole.facilitator: 'facilitator',
  MembershipRole.member: 'member',
};

const _$RecordStatusEnumMap = {
  RecordStatus.active: 'active',
  RecordStatus.inactive: 'inactive',
};
