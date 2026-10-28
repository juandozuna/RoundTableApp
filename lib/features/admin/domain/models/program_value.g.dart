// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'program_value.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProgramModule _$ProgramModuleFromJson(Map<String, dynamic> json) =>
    _ProgramModule(
      number: (json['number'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$ProgramModuleToJson(_ProgramModule instance) =>
    <String, dynamic>{'number': instance.number, 'name': instance.name};

_ProgramValue _$ProgramValueFromJson(Map<String, dynamic> json) =>
    _ProgramValue(
      id: json['id'] as String,
      sequence: (json['sequence'] as num).toInt(),
      numberInModule: (json['number_in_module'] as num).toInt(),
      name: json['name'] as String,
      module: ProgramModule.fromJson(json['module'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProgramValueToJson(_ProgramValue instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sequence': instance.sequence,
      'number_in_module': instance.numberInModule,
      'name': instance.name,
      'module': instance.module.toJson(),
    };
