// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kpi_table_row.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_KpiTableRow _$KpiTableRowFromJson(Map<String, dynamic> json) => _KpiTableRow(
  roundTableId: json['round_table_id'] as String,
  code: json['code'] as String,
  name: json['name'] as String,
  organizationId: json['organization_id'] as String,
  organizationName: json['organization_name'] as String,
  countryCode: json['country_code'] as String?,
  locationId: json['location_id'] as String?,
  locationName: json['location_name'] as String?,
  facilitatorPersonId: json['facilitator_person_id'] as String?,
  facilitatorName: json['facilitator_name'] as String?,
  status: json['status'] as String?,
  health:
      $enumDecodeNullable(
        _$HealthStatusEnumMap,
        json['health'],
        unknownValue: HealthStatus.inactive,
      ) ??
      HealthStatus.active,
  activePeople: (json['active_people'] as num?)?.toInt() ?? 0,
  valuesCompleted: (json['values_completed'] as num?)?.toInt() ?? 0,
  currentValueId: json['current_value_id'] as String?,
  currentValueLabel: json['current_value_label'] as String?,
  attendancePct: (json['attendance_pct'] as num?)?.toDouble(),
  improvementAvg: (json['improvement_avg'] as num?)?.toDouble(),
  syncedLateRows: (json['synced_late_rows'] as num?)?.toInt() ?? 0,
  lastSessionAt: json['last_session_at'] == null
      ? null
      : DateTime.parse(json['last_session_at'] as String),
  pendingSessionAt: json['pending_session_at'] == null
      ? null
      : DateTime.parse(json['pending_session_at'] as String),
);

Map<String, dynamic> _$KpiTableRowToJson(_KpiTableRow instance) =>
    <String, dynamic>{
      'round_table_id': instance.roundTableId,
      'code': instance.code,
      'name': instance.name,
      'organization_id': instance.organizationId,
      'organization_name': instance.organizationName,
      'country_code': ?instance.countryCode,
      'location_id': ?instance.locationId,
      'location_name': ?instance.locationName,
      'facilitator_person_id': ?instance.facilitatorPersonId,
      'facilitator_name': ?instance.facilitatorName,
      'status': ?instance.status,
      'health': _$HealthStatusEnumMap[instance.health]!,
      'active_people': instance.activePeople,
      'values_completed': instance.valuesCompleted,
      'current_value_id': ?instance.currentValueId,
      'current_value_label': ?instance.currentValueLabel,
      'attendance_pct': ?instance.attendancePct,
      'improvement_avg': ?instance.improvementAvg,
      'synced_late_rows': instance.syncedLateRows,
      'last_session_at': ?instance.lastSessionAt?.toIso8601String(),
      'pending_session_at': ?instance.pendingSessionAt?.toIso8601String(),
    };

const _$HealthStatusEnumMap = {
  HealthStatus.active: 'active',
  HealthStatus.delayed: 'delayed',
  HealthStatus.inactive: 'inactive',
  HealthStatus.completed: 'completed',
};
