// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_commitment_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MemberCommitmentRecord _$MemberCommitmentRecordFromJson(
  Map<String, dynamic> json,
) => _MemberCommitmentRecord(
  id: json['id'] as String,
  organizationId: json['organization_id'] as String,
  roundTableId: json['round_table_id'] as String,
  deviceCreatedAt: json['device_created_at'] == null
      ? null
      : DateTime.parse(json['device_created_at'] as String),
  deviceModifiedAt: json['device_modified_at'] == null
      ? null
      : DateTime.parse(json['device_modified_at'] as String),
  receivedAt: json['received_at'] == null
      ? null
      : DateTime.parse(json['received_at'] as String),
  syncedLate: json['synced_late'] as bool? ?? false,
  archivedAt: json['archived_at'] == null
      ? null
      : DateTime.parse(json['archived_at'] as String),
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
  sessionId: json['session_id'] as String,
  personId: json['person_id'] as String,
  valueId: json['value_id'] as String,
  actionText: json['action_text'] as String,
  measureText: json['measure_text'] as String?,
  followUpSessionId: json['follow_up_session_id'] as String?,
  followUpStatus: $enumDecodeNullable(
    _$CommitmentFollowUpStatusEnumMap,
    json['follow_up_status'],
  ),
  followUpNote: json['follow_up_note'] as String?,
  followUpDeviceAt: json['follow_up_device_at'] == null
      ? null
      : DateTime.parse(json['follow_up_device_at'] as String),
  followUpReceivedAt: json['follow_up_received_at'] == null
      ? null
      : DateTime.parse(json['follow_up_received_at'] as String),
  followUpSyncedLate: json['follow_up_synced_late'] as bool? ?? false,
);

Map<String, dynamic> _$MemberCommitmentRecordToJson(
  _MemberCommitmentRecord instance,
) => <String, dynamic>{
  'id': instance.id,
  'organization_id': instance.organizationId,
  'round_table_id': instance.roundTableId,
  'device_created_at': ?instance.deviceCreatedAt?.toIso8601String(),
  'device_modified_at': ?instance.deviceModifiedAt?.toIso8601String(),
  'received_at': ?instance.receivedAt?.toIso8601String(),
  'synced_late': instance.syncedLate,
  'archived_at': ?instance.archivedAt?.toIso8601String(),
  'created_at': ?instance.createdAt?.toIso8601String(),
  'updated_at': ?instance.updatedAt?.toIso8601String(),
  'session_id': instance.sessionId,
  'person_id': instance.personId,
  'value_id': instance.valueId,
  'action_text': instance.actionText,
  'measure_text': ?instance.measureText,
  'follow_up_session_id': ?instance.followUpSessionId,
  'follow_up_status':
      ?_$CommitmentFollowUpStatusEnumMap[instance.followUpStatus],
  'follow_up_note': ?instance.followUpNote,
  'follow_up_device_at': ?instance.followUpDeviceAt?.toIso8601String(),
  'follow_up_received_at': ?instance.followUpReceivedAt?.toIso8601String(),
  'follow_up_synced_late': instance.followUpSyncedLate,
};

const _$CommitmentFollowUpStatusEnumMap = {
  CommitmentFollowUpStatus.kept: 'kept',
  CommitmentFollowUpStatus.partial: 'partial',
  CommitmentFollowUpStatus.notKept: 'not_kept',
};
