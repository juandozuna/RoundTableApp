// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'curriculum_translation_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CurriculumTranslationRecord _$CurriculumTranslationRecordFromJson(
  Map<String, dynamic> json,
) => _CurriculumTranslationRecord(
  id: json['id'] as String,
  locale: json['locale'] as String,
  entityType: json['entity_type'] as String,
  entityId: json['entity_id'] as String,
  name: json['name'] as String?,
  description: json['description'] as String?,
  questionText: json['question_text'] as String?,
);

Map<String, dynamic> _$CurriculumTranslationRecordToJson(
  _CurriculumTranslationRecord instance,
) => <String, dynamic>{
  'id': instance.id,
  'locale': instance.locale,
  'entity_type': instance.entityType,
  'entity_id': instance.entityId,
  'name': ?instance.name,
  'description': ?instance.description,
  'question_text': ?instance.questionText,
};
