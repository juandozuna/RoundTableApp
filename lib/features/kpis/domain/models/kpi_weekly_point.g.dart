// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kpi_weekly_point.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_KpiWeeklyPoint _$KpiWeeklyPointFromJson(Map<String, dynamic> json) =>
    _KpiWeeklyPoint(
      weekStart: DateTime.parse(json['week_start'] as String),
      sessionsClosed: (json['sessions_closed'] as num?)?.toInt() ?? 0,
      valuesCompleted: (json['values_completed'] as num?)?.toInt() ?? 0,
      attendancePct: (json['attendance_pct'] as num?)?.toDouble(),
      initialAvg: (json['initial_avg'] as num?)?.toDouble(),
      improvementAvg: (json['improvement_avg'] as num?)?.toDouble(),
      syncedLateRows: (json['synced_late_rows'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$KpiWeeklyPointToJson(_KpiWeeklyPoint instance) =>
    <String, dynamic>{
      'week_start': instance.weekStart.toIso8601String(),
      'sessions_closed': instance.sessionsClosed,
      'values_completed': instance.valuesCompleted,
      'attendance_pct': ?instance.attendancePct,
      'initial_avg': ?instance.initialAvg,
      'improvement_avg': ?instance.improvementAvg,
      'synced_late_rows': instance.syncedLateRows,
    };
