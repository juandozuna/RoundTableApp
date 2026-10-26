// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kpi_member_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_KpiMemberScore _$KpiMemberScoreFromJson(Map<String, dynamic> json) =>
    _KpiMemberScore(
      valueId: json['value_id'] as String,
      valueLabel: json['value_label'] as String,
      sequence: (json['sequence'] as num?)?.toInt() ?? 0,
      initialScore: (json['initial_score'] as num?)?.toInt(),
      followUpScore: (json['follow_up_score'] as num?)?.toInt(),
      delta: (json['delta'] as num?)?.toInt(),
      syncedLate: json['synced_late'] as bool? ?? false,
    );

Map<String, dynamic> _$KpiMemberScoreToJson(_KpiMemberScore instance) =>
    <String, dynamic>{
      'value_id': instance.valueId,
      'value_label': instance.valueLabel,
      'sequence': instance.sequence,
      'initial_score': ?instance.initialScore,
      'follow_up_score': ?instance.followUpScore,
      'delta': ?instance.delta,
      'synced_late': instance.syncedLate,
    };

_KpiMemberDetail _$KpiMemberDetailFromJson(Map<String, dynamic> json) =>
    _KpiMemberDetail(
      personId: json['person_id'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      role: json['role'] as String?,
      membershipStatus: json['membership_status'] as String?,
      sessionsExpected: (json['sessions_expected'] as num?)?.toInt() ?? 0,
      sessionsPresent: (json['sessions_present'] as num?)?.toInt() ?? 0,
      attendancePct: (json['attendance_pct'] as num?)?.toDouble(),
      valuesCompleted: (json['values_completed'] as num?)?.toInt() ?? 0,
      improvementAvg: (json['improvement_avg'] as num?)?.toDouble(),
      syncedLateSessions: (json['synced_late_sessions'] as num?)?.toInt() ?? 0,
      scores:
          (json['scores'] as List<dynamic>?)
              ?.map((e) => KpiMemberScore.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$KpiMemberDetailToJson(_KpiMemberDetail instance) =>
    <String, dynamic>{
      'person_id': instance.personId,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'role': ?instance.role,
      'membership_status': ?instance.membershipStatus,
      'sessions_expected': instance.sessionsExpected,
      'sessions_present': instance.sessionsPresent,
      'attendance_pct': ?instance.attendancePct,
      'values_completed': instance.valuesCompleted,
      'improvement_avg': ?instance.improvementAvg,
      'synced_late_sessions': instance.syncedLateSessions,
      'scores': instance.scores.map((e) => e.toJson()).toList(),
    };
