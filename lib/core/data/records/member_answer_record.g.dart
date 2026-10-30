// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_answer_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MemberAnswerRecord _$MemberAnswerRecordFromJson(Map<String, dynamic> json) =>
    _MemberAnswerRecord(
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
      questionId: json['question_id'] as String,
      answerText: json['answer_text'] as String,
      answerPersonId: json['answer_person_id'] as String?,
    );

Map<String, dynamic> _$MemberAnswerRecordToJson(_MemberAnswerRecord instance) =>
    <String, dynamic>{
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
      'question_id': instance.questionId,
      'answer_text': instance.answerText,
      'answer_person_id': ?instance.answerPersonId,
    };
