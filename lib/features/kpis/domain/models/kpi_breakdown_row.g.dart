// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kpi_breakdown_row.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_KpiBreakdownRow _$KpiBreakdownRowFromJson(Map<String, dynamic> json) =>
    _KpiBreakdownRow(
      key: json['key'] as String,
      label: json['label'] as String,
      sessionsClosed: (json['sessions_closed'] as num?)?.toInt() ?? 0,
      valuesCompleted: (json['values_completed'] as num?)?.toInt() ?? 0,
      memberValuesCompleted:
          (json['member_values_completed'] as num?)?.toInt() ?? 0,
      attendancePct: (json['attendance_pct'] as num?)?.toDouble(),
      initialAvg: (json['initial_avg'] as num?)?.toDouble(),
      followUpAvg: (json['follow_up_avg'] as num?)?.toDouble(),
      improvementAvg: (json['improvement_avg'] as num?)?.toDouble(),
      improvementPairs: (json['improvement_pairs'] as num?)?.toInt() ?? 0,
      syncedLateRows: (json['synced_late_rows'] as num?)?.toInt() ?? 0,
      tablesTotal: (json['tables_total'] as num?)?.toInt(),
      tablesActive: (json['tables_active'] as num?)?.toInt(),
      tablesDelayed: (json['tables_delayed'] as num?)?.toInt(),
      tablesInactive: (json['tables_inactive'] as num?)?.toInt(),
    );

Map<String, dynamic> _$KpiBreakdownRowToJson(_KpiBreakdownRow instance) =>
    <String, dynamic>{
      'key': instance.key,
      'label': instance.label,
      'sessions_closed': instance.sessionsClosed,
      'values_completed': instance.valuesCompleted,
      'member_values_completed': instance.memberValuesCompleted,
      'attendance_pct': ?instance.attendancePct,
      'initial_avg': ?instance.initialAvg,
      'follow_up_avg': ?instance.followUpAvg,
      'improvement_avg': ?instance.improvementAvg,
      'improvement_pairs': instance.improvementPairs,
      'synced_late_rows': instance.syncedLateRows,
      'tables_total': ?instance.tablesTotal,
      'tables_active': ?instance.tablesActive,
      'tables_delayed': ?instance.tablesDelayed,
      'tables_inactive': ?instance.tablesInactive,
    };
