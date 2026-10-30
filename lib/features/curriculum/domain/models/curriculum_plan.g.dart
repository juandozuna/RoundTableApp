// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'curriculum_plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FieldChange _$FieldChangeFromJson(Map<String, dynamic> json) =>
    _FieldChange(from: json['from'] as String?, to: json['to'] as String?);

Map<String, dynamic> _$FieldChangeToJson(_FieldChange instance) =>
    <String, dynamic>{'from': ?instance.from, 'to': ?instance.to};

_CurriculumChange _$CurriculumChangeFromJson(Map<String, dynamic> json) =>
    _CurriculumChange(
      entity: $enumDecode(
        _$CurriculumEntityEnumMap,
        json['entity'],
        unknownValue: CurriculumEntity.value,
      ),
      key: json['key'] as String,
      label: json['label'] as String? ?? '',
      action: $enumDecode(
        _$CurriculumChangeActionEnumMap,
        json['action'],
        unknownValue: CurriculumChangeAction.update,
      ),
      fields:
          (json['fields'] as Map<String, dynamic>?)?.map(
            (k, e) =>
                MapEntry(k, FieldChange.fromJson(e as Map<String, dynamic>)),
          ) ??
          const {},
      answered: json['answered'] as bool? ?? false,
    );

Map<String, dynamic> _$CurriculumChangeToJson(_CurriculumChange instance) =>
    <String, dynamic>{
      'entity': _$CurriculumEntityEnumMap[instance.entity]!,
      'key': instance.key,
      'label': instance.label,
      'action': _$CurriculumChangeActionEnumMap[instance.action]!,
      'fields': instance.fields.map((k, e) => MapEntry(k, e.toJson())),
      'answered': instance.answered,
    };

const _$CurriculumEntityEnumMap = {
  CurriculumEntity.module: 'module',
  CurriculumEntity.value: 'value',
  CurriculumEntity.question: 'question',
};

const _$CurriculumChangeActionEnumMap = {
  CurriculumChangeAction.create: 'create',
  CurriculumChangeAction.update: 'update',
  CurriculumChangeAction.reactivate: 'reactivate',
  CurriculumChangeAction.deactivate: 'deactivate',
  CurriculumChangeAction.delete: 'delete',
};

_CurriculumRefusal _$CurriculumRefusalFromJson(Map<String, dynamic> json) =>
    _CurriculumRefusal(
      key: json['key'] as String,
      label: json['label'] as String? ?? '',
      message: json['message'] as String? ?? '',
    );

Map<String, dynamic> _$CurriculumRefusalToJson(_CurriculumRefusal instance) =>
    <String, dynamic>{
      'key': instance.key,
      'label': instance.label,
      'message': instance.message,
    };

_CurriculumPlan _$CurriculumPlanFromJson(Map<String, dynamic> json) =>
    _CurriculumPlan(
      dryRun: json['dry_run'] as bool? ?? true,
      applied: json['applied'] as bool? ?? false,
      changes:
          (json['changes'] as List<dynamic>?)
              ?.map((e) => CurriculumChange.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      refused:
          (json['refused'] as List<dynamic>?)
              ?.map(
                (e) => CurriculumRefusal.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
    );

Map<String, dynamic> _$CurriculumPlanToJson(_CurriculumPlan instance) =>
    <String, dynamic>{
      'dry_run': instance.dryRun,
      'applied': instance.applied,
      'changes': instance.changes.map((e) => e.toJson()).toList(),
      'refused': instance.refused.map((e) => e.toJson()).toList(),
    };
