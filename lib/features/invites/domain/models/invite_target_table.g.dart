// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invite_target_table.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InviteTargetTable _$InviteTargetTableFromJson(Map<String, dynamic> json) =>
    _InviteTargetTable(
      id: json['id'] as String,
      organizationId: json['organization_id'] as String,
      organizationName: json['organization_name'] as String?,
      name: json['name'] as String,
      code: json['code'] as String?,
      status: json['status'] as String?,
      activePeople: (json['active_people'] as num?)?.toInt() ?? 0,
      maxPeople:
          (json['max_people'] as num?)?.toInt() ?? AppLimits.maxTableSeats,
      facilitatorPersonId: json['facilitator_person_id'] as String?,
      facilitatorName: json['facilitator_name'] as String?,
    );

Map<String, dynamic> _$InviteTargetTableToJson(_InviteTargetTable instance) =>
    <String, dynamic>{
      'id': instance.id,
      'organization_id': instance.organizationId,
      'organization_name': ?instance.organizationName,
      'name': instance.name,
      'code': ?instance.code,
      'status': ?instance.status,
      'active_people': instance.activePeople,
      'max_people': instance.maxPeople,
      'facilitator_person_id': ?instance.facilitatorPersonId,
      'facilitator_name': ?instance.facilitatorName,
    };
