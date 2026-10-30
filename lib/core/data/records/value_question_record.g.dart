// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'value_question_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ValueQuestionRecord _$ValueQuestionRecordFromJson(Map<String, dynamic> json) =>
    _ValueQuestionRecord(
      id: json['id'] as String,
      valueId: json['value_id'] as String,
      questionCode: json['question_code'] as String,
      questionText: json['question_text'] as String,
      sortOrder: (json['sort_order'] as num).toInt(),
      responseType: json['response_type'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$ValueQuestionRecordToJson(
  _ValueQuestionRecord instance,
) => <String, dynamic>{
  'id': instance.id,
  'value_id': instance.valueId,
  'question_code': instance.questionCode,
  'question_text': instance.questionText,
  'sort_order': instance.sortOrder,
  'response_type': instance.responseType,
  'status': instance.status,
};
