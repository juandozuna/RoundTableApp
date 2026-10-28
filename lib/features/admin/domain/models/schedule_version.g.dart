// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_version.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ScheduleVersion _$ScheduleVersionFromJson(Map<String, dynamic> json) =>
    _ScheduleVersion(
      id: json['id'] as String,
      weekday: (json['weekday'] as num).toInt(),
      startTime: json['start_time'] as String,
      timezone: json['timezone'] as String,
      durationMinutes: (json['duration_minutes'] as num).toInt(),
      effectiveFrom: DateTime.parse(json['effective_from'] as String),
    );

Map<String, dynamic> _$ScheduleVersionToJson(_ScheduleVersion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'weekday': instance.weekday,
      'start_time': instance.startTime,
      'timezone': instance.timezone,
      'duration_minutes': instance.durationMinutes,
      'effective_from': instance.effectiveFrom.toIso8601String(),
    };
