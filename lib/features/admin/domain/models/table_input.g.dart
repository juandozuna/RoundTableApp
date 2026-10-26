// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TableInput _$TableInputFromJson(Map<String, dynamic> json) => _TableInput(
  locationId: json['location_id'] as String?,
  name: json['name'] as String?,
  code: json['code'] as String?,
  weekday: (json['weekday'] as num?)?.toInt(),
  startTime: json['start_time'] as String?,
  timezone: json['timezone'] as String?,
  durationMinutes: (json['duration_minutes'] as num?)?.toInt(),
  status: $enumDecodeNullable(_$RoundTableStatusEnumMap, json['status']),
);

Map<String, dynamic> _$TableInputToJson(_TableInput instance) =>
    <String, dynamic>{
      'location_id': ?instance.locationId,
      'name': ?instance.name,
      'code': ?instance.code,
      'weekday': ?instance.weekday,
      'start_time': ?instance.startTime,
      'timezone': ?instance.timezone,
      'duration_minutes': ?instance.durationMinutes,
      'status': ?_$RoundTableStatusEnumMap[instance.status],
    };

const _$RoundTableStatusEnumMap = {
  RoundTableStatus.active: 'active',
  RoundTableStatus.paused: 'paused',
  RoundTableStatus.completed: 'completed',
  RoundTableStatus.closed: 'closed',
};
