// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'round_table_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RoundTableRecord _$RoundTableRecordFromJson(Map<String, dynamic> json) =>
    _RoundTableRecord(
      id: json['id'] as String,
      organizationId: json['organization_id'] as String,
      locationId: json['location_id'] as String,
      name: json['name'] as String,
      code: json['code'] as String,
      weekday: (json['weekday'] as num).toInt(),
      startTime: json['start_time'] as String,
      timezone: json['timezone'] as String,
      durationMinutes: (json['duration_minutes'] as num).toInt(),
      status: json['status'] as String,
      currentValueId: json['current_value_id'] as String?,
    );

Map<String, dynamic> _$RoundTableRecordToJson(_RoundTableRecord instance) =>
    <String, dynamic>{
      'id': instance.id,
      'organization_id': instance.organizationId,
      'location_id': instance.locationId,
      'name': instance.name,
      'code': instance.code,
      'weekday': instance.weekday,
      'start_time': instance.startTime,
      'timezone': instance.timezone,
      'duration_minutes': instance.durationMinutes,
      'status': instance.status,
      'current_value_id': ?instance.currentValueId,
    };
