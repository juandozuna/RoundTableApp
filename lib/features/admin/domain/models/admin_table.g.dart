// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_table.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminTable _$AdminTableFromJson(Map<String, dynamic> json) => _AdminTable(
  id: json['id'] as String,
  organizationId: json['organization_id'] as String,
  organizationName: json['organization_name'] as String,
  locationId: json['location_id'] as String?,
  locationName: json['location_name'] as String?,
  name: json['name'] as String,
  code: json['code'] as String,
  weekday: (json['weekday'] as num?)?.toInt() ?? 1,
  startTime: json['start_time'] as String? ?? '00:00:00',
  timezone: json['timezone'] as String? ?? 'UTC',
  durationMinutes: (json['duration_minutes'] as num?)?.toInt() ?? 30,
  status:
      $enumDecodeNullable(
        _$RoundTableStatusEnumMap,
        json['status'],
        unknownValue: RoundTableStatus.closed,
      ) ??
      RoundTableStatus.active,
  currentValueId: json['current_value_id'] as String?,
  currentValueSequence: (json['current_value_sequence'] as num?)?.toInt(),
  currentValueName: json['current_value_name'] as String?,
  facilitatorPersonId: json['facilitator_person_id'] as String?,
  facilitatorName: json['facilitator_name'] as String?,
  activePeople: (json['active_people'] as num?)?.toInt() ?? 0,
  maxPeople: (json['max_people'] as num?)?.toInt() ?? AppLimits.maxTableSeats,
  pendingSessionId: json['pending_session_id'] as String?,
  pendingSessionStatus: json['pending_session_status'] as String?,
  pendingSessionAt: json['pending_session_at'] == null
      ? null
      : DateTime.parse(json['pending_session_at'] as String),
);

Map<String, dynamic> _$AdminTableToJson(_AdminTable instance) =>
    <String, dynamic>{
      'id': instance.id,
      'organization_id': instance.organizationId,
      'organization_name': instance.organizationName,
      'location_id': ?instance.locationId,
      'location_name': ?instance.locationName,
      'name': instance.name,
      'code': instance.code,
      'weekday': instance.weekday,
      'start_time': instance.startTime,
      'timezone': instance.timezone,
      'duration_minutes': instance.durationMinutes,
      'status': _$RoundTableStatusEnumMap[instance.status]!,
      'current_value_id': ?instance.currentValueId,
      'current_value_sequence': ?instance.currentValueSequence,
      'current_value_name': ?instance.currentValueName,
      'facilitator_person_id': ?instance.facilitatorPersonId,
      'facilitator_name': ?instance.facilitatorName,
      'active_people': instance.activePeople,
      'max_people': instance.maxPeople,
      'pending_session_id': ?instance.pendingSessionId,
      'pending_session_status': ?instance.pendingSessionStatus,
      'pending_session_at': ?instance.pendingSessionAt?.toIso8601String(),
    };

const _$RoundTableStatusEnumMap = {
  RoundTableStatus.active: 'active',
  RoundTableStatus.paused: 'paused',
  RoundTableStatus.completed: 'completed',
  RoundTableStatus.closed: 'closed',
};
