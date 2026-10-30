// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'curriculum_value_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CurriculumValueRecord _$CurriculumValueRecordFromJson(
  Map<String, dynamic> json,
) => _CurriculumValueRecord(
  id: json['id'] as String,
  moduleId: json['module_id'] as String,
  numberInModule: (json['number_in_module'] as num).toInt(),
  sequence: (json['sequence'] as num).toInt(),
  name: json['name'] as String,
  description: json['description'] as String?,
  bookletReference: json['booklet_reference'] as String?,
  status: json['status'] as String,
);

Map<String, dynamic> _$CurriculumValueRecordToJson(
  _CurriculumValueRecord instance,
) => <String, dynamic>{
  'id': instance.id,
  'module_id': instance.moduleId,
  'number_in_module': instance.numberInModule,
  'sequence': instance.sequence,
  'name': instance.name,
  'description': ?instance.description,
  'booklet_reference': ?instance.bookletReference,
  'status': instance.status,
};
