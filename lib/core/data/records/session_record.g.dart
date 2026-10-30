// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SessionRecord _$SessionRecordFromJson(Map<String, dynamic> json) =>
    _SessionRecord(
      id: json['id'] as String,
      organizationId: json['organization_id'] as String,
      roundTableId: json['round_table_id'] as String,
      valueId: json['value_id'] as String,
      followUpValueId: json['follow_up_value_id'] as String?,
      status: $enumDecode(_$SessionStatusEnumMap, json['status']),
      stage: $enumDecode(_$SessionStageEnumMap, json['stage']),
      scheduledAt: DateTime.parse(json['scheduled_at'] as String),
      startedAt: json['started_at'] == null
          ? null
          : DateTime.parse(json['started_at'] as String),
      endedAt: json['ended_at'] == null
          ? null
          : DateTime.parse(json['ended_at'] as String),
      answersClosedAt: json['answers_closed_at'] == null
          ? null
          : DateTime.parse(json['answers_closed_at'] as String),
      cancelledReason: json['cancelled_reason'] as String?,
      completion: json['completion'] as String?,
      incompleteReason: json['incomplete_reason'] as String?,
      kind: json['kind'] as String? ?? 'regular',
      originalScheduledAt: json['original_scheduled_at'] == null
          ? null
          : DateTime.parse(json['original_scheduled_at'] as String),
      facilitatorPersonId: json['facilitator_person_id'] as String?,
      deviceModifiedAt: json['device_modified_at'] == null
          ? null
          : DateTime.parse(json['device_modified_at'] as String),
      archivedAt: json['archived_at'] == null
          ? null
          : DateTime.parse(json['archived_at'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$SessionRecordToJson(_SessionRecord instance) =>
    <String, dynamic>{
      'id': instance.id,
      'organization_id': instance.organizationId,
      'round_table_id': instance.roundTableId,
      'value_id': instance.valueId,
      'follow_up_value_id': ?instance.followUpValueId,
      'status': _$SessionStatusEnumMap[instance.status]!,
      'stage': _$SessionStageEnumMap[instance.stage]!,
      'scheduled_at': instance.scheduledAt.toIso8601String(),
      'started_at': ?instance.startedAt?.toIso8601String(),
      'ended_at': ?instance.endedAt?.toIso8601String(),
      'answers_closed_at': ?instance.answersClosedAt?.toIso8601String(),
      'cancelled_reason': ?instance.cancelledReason,
      'completion': ?instance.completion,
      'incomplete_reason': ?instance.incompleteReason,
      'kind': instance.kind,
      'original_scheduled_at': ?instance.originalScheduledAt?.toIso8601String(),
      'facilitator_person_id': ?instance.facilitatorPersonId,
      'device_modified_at': ?instance.deviceModifiedAt?.toIso8601String(),
      'archived_at': ?instance.archivedAt?.toIso8601String(),
      'created_at': ?instance.createdAt?.toIso8601String(),
      'updated_at': ?instance.updatedAt?.toIso8601String(),
    };

const _$SessionStatusEnumMap = {
  SessionStatus.scheduled: 'scheduled',
  SessionStatus.open: 'open',
  SessionStatus.closed: 'closed',
  SessionStatus.cancelled: 'cancelled',
};

const _$SessionStageEnumMap = {
  SessionStage.lobby: 'lobby',
  SessionStage.attendance: 'attendance',
  SessionStage.followUp: 'follow_up',
  SessionStage.value: 'value',
  SessionStage.commitment: 'commitment',
  SessionStage.closed: 'closed',
};
