// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_kpi_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HomeTableHealthCounts _$HomeTableHealthCountsFromJson(
  Map<String, dynamic> json,
) => _HomeTableHealthCounts(
  total: (json['total'] as num?)?.toInt() ?? 0,
  active: (json['active'] as num?)?.toInt() ?? 0,
  delayed: (json['delayed'] as num?)?.toInt() ?? 0,
  inactive: (json['inactive'] as num?)?.toInt() ?? 0,
  completed: (json['completed'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$HomeTableHealthCountsToJson(
  _HomeTableHealthCounts instance,
) => <String, dynamic>{
  'total': instance.total,
  'active': instance.active,
  'delayed': instance.delayed,
  'inactive': instance.inactive,
  'completed': instance.completed,
};

_HomeKpiSummary _$HomeKpiSummaryFromJson(Map<String, dynamic> json) =>
    _HomeKpiSummary(
      valuesCompleted: (json['values_completed'] as num?)?.toInt() ?? 0,
      attendancePct: (json['attendance_pct'] as num?)?.toDouble(),
      improvementAvg: (json['improvement_avg'] as num?)?.toDouble(),
      syncedLateRows: (json['synced_late_rows'] as num?)?.toInt() ?? 0,
      tables: json['tables'] == null
          ? const HomeTableHealthCounts()
          : HomeTableHealthCounts.fromJson(
              json['tables'] as Map<String, dynamic>,
            ),
      computedAt: json['computed_at'] == null
          ? null
          : DateTime.parse(json['computed_at'] as String),
    );

Map<String, dynamic> _$HomeKpiSummaryToJson(_HomeKpiSummary instance) =>
    <String, dynamic>{
      'values_completed': instance.valuesCompleted,
      'attendance_pct': ?instance.attendancePct,
      'improvement_avg': ?instance.improvementAvg,
      'synced_late_rows': instance.syncedLateRows,
      'tables': instance.tables.toJson(),
      'computed_at': ?instance.computedAt?.toIso8601String(),
    };
