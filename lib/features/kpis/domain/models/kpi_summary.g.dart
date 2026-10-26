// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kpi_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_KpiTableCounts _$KpiTableCountsFromJson(Map<String, dynamic> json) =>
    _KpiTableCounts(
      total: (json['total'] as num?)?.toInt() ?? 0,
      active: (json['active'] as num?)?.toInt() ?? 0,
      delayed: (json['delayed'] as num?)?.toInt() ?? 0,
      inactive: (json['inactive'] as num?)?.toInt() ?? 0,
      completed: (json['completed'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$KpiTableCountsToJson(_KpiTableCounts instance) =>
    <String, dynamic>{
      'total': instance.total,
      'active': instance.active,
      'delayed': instance.delayed,
      'inactive': instance.inactive,
      'completed': instance.completed,
    };

_KpiSummary _$KpiSummaryFromJson(Map<String, dynamic> json) => _KpiSummary(
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
  syncedLateSessions: (json['synced_late_sessions'] as num?)?.toInt() ?? 0,
  tables: json['tables'] == null
      ? const KpiTableCounts()
      : KpiTableCounts.fromJson(json['tables'] as Map<String, dynamic>),
  peopleActive: (json['people_active'] as num?)?.toInt() ?? 0,
  programProgressPct: (json['program_progress_pct'] as num?)?.toDouble(),
  computedAt: json['computed_at'] == null
      ? null
      : DateTime.parse(json['computed_at'] as String),
);

Map<String, dynamic> _$KpiSummaryToJson(_KpiSummary instance) =>
    <String, dynamic>{
      'sessions_closed': instance.sessionsClosed,
      'values_completed': instance.valuesCompleted,
      'member_values_completed': instance.memberValuesCompleted,
      'attendance_pct': ?instance.attendancePct,
      'initial_avg': ?instance.initialAvg,
      'follow_up_avg': ?instance.followUpAvg,
      'improvement_avg': ?instance.improvementAvg,
      'improvement_pairs': instance.improvementPairs,
      'synced_late_rows': instance.syncedLateRows,
      'synced_late_sessions': instance.syncedLateSessions,
      'tables': instance.tables.toJson(),
      'people_active': instance.peopleActive,
      'program_progress_pct': ?instance.programProgressPct,
      'computed_at': ?instance.computedAt?.toIso8601String(),
    };
