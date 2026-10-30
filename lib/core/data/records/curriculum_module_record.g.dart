// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'curriculum_module_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CurriculumModuleRecord _$CurriculumModuleRecordFromJson(
  Map<String, dynamic> json,
) => _CurriculumModuleRecord(
  id: json['id'] as String,
  number: (json['number'] as num).toInt(),
  name: json['name'] as String,
  description: json['description'] as String?,
  valueCount: (json['value_count'] as num).toInt(),
  status: json['status'] as String,
);

Map<String, dynamic> _$CurriculumModuleRecordToJson(
  _CurriculumModuleRecord instance,
) => <String, dynamic>{
  'id': instance.id,
  'number': instance.number,
  'name': instance.name,
  'description': ?instance.description,
  'value_count': instance.valueCount,
  'status': instance.status,
};
