// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'curriculum_view.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CurriculumText _$CurriculumTextFromJson(Map<String, dynamic> json) =>
    _CurriculumText(
      name: json['name'] as String?,
      description: json['description'] as String?,
      text: json['text'] as String?,
    );

Map<String, dynamic> _$CurriculumTextToJson(_CurriculumText instance) =>
    <String, dynamic>{
      'name': ?instance.name,
      'description': ?instance.description,
      'text': ?instance.text,
    };

_LocaleCompleteness _$LocaleCompletenessFromJson(Map<String, dynamic> json) =>
    _LocaleCompleteness(
      total: (json['total'] as num?)?.toInt() ?? 0,
      translated: (json['translated'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$LocaleCompletenessToJson(_LocaleCompleteness instance) =>
    <String, dynamic>{
      'total': instance.total,
      'translated': instance.translated,
    };

_ContentLocale _$ContentLocaleFromJson(Map<String, dynamic> json) =>
    _ContentLocale(
      code: json['code'] as String,
      name: json['name'] as String,
      isDefault: json['is_default'] as bool? ?? false,
      status:
          $enumDecodeNullable(
            _$RecordStatusEnumMap,
            json['status'],
            unknownValue: RecordStatus.inactive,
          ) ??
          RecordStatus.active,
      completeness: json['completeness'] == null
          ? null
          : LocaleCompleteness.fromJson(
              json['completeness'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$ContentLocaleToJson(_ContentLocale instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'is_default': instance.isDefault,
      'status': _$RecordStatusEnumMap[instance.status]!,
      'completeness': ?instance.completeness?.toJson(),
    };

const _$RecordStatusEnumMap = {
  RecordStatus.active: 'active',
  RecordStatus.inactive: 'inactive',
};

_CurriculumQuestionItem _$CurriculumQuestionItemFromJson(
  Map<String, dynamic> json,
) => _CurriculumQuestionItem(
  id: json['id'] as String,
  code: json['code'] as String,
  text: json['text'] as String,
  sortOrder: (json['sort_order'] as num?)?.toInt() ?? 1,
  responseType:
      $enumDecodeNullable(
        _$QuestionResponseTypeEnumMap,
        json['response_type'],
        unknownValue: QuestionResponseType.text,
      ) ??
      QuestionResponseType.text,
  status:
      $enumDecodeNullable(
        _$RecordStatusEnumMap,
        json['status'],
        unknownValue: RecordStatus.inactive,
      ) ??
      RecordStatus.active,
  answered: json['answered'] as bool? ?? false,
  translation: json['translation'] == null
      ? null
      : CurriculumText.fromJson(json['translation'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CurriculumQuestionItemToJson(
  _CurriculumQuestionItem instance,
) => <String, dynamic>{
  'id': instance.id,
  'code': instance.code,
  'text': instance.text,
  'sort_order': instance.sortOrder,
  'response_type': _$QuestionResponseTypeEnumMap[instance.responseType]!,
  'status': _$RecordStatusEnumMap[instance.status]!,
  'answered': instance.answered,
  'translation': ?instance.translation?.toJson(),
};

const _$QuestionResponseTypeEnumMap = {
  QuestionResponseType.text: 'text',
  QuestionResponseType.person: 'person',
};

_CurriculumValueItem _$CurriculumValueItemFromJson(Map<String, dynamic> json) =>
    _CurriculumValueItem(
      id: json['id'] as String,
      number: (json['number'] as num).toInt(),
      numberInModule: (json['number_in_module'] as num?)?.toInt() ?? 1,
      name: json['name'] as String,
      description: json['description'] as String?,
      bookletReference: json['booklet_reference'] as String?,
      status:
          $enumDecodeNullable(
            _$RecordStatusEnumMap,
            json['status'],
            unknownValue: RecordStatus.inactive,
          ) ??
          RecordStatus.active,
      usedByClosedSessions: json['used_by_closed_sessions'] as bool? ?? false,
      translation: json['translation'] == null
          ? null
          : CurriculumText.fromJson(
              json['translation'] as Map<String, dynamic>,
            ),
      questions:
          (json['questions'] as List<dynamic>?)
              ?.map(
                (e) =>
                    CurriculumQuestionItem.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
    );

Map<String, dynamic> _$CurriculumValueItemToJson(
  _CurriculumValueItem instance,
) => <String, dynamic>{
  'id': instance.id,
  'number': instance.number,
  'number_in_module': instance.numberInModule,
  'name': instance.name,
  'description': ?instance.description,
  'booklet_reference': ?instance.bookletReference,
  'status': _$RecordStatusEnumMap[instance.status]!,
  'used_by_closed_sessions': instance.usedByClosedSessions,
  'translation': ?instance.translation?.toJson(),
  'questions': instance.questions.map((e) => e.toJson()).toList(),
};

_CurriculumModuleItem _$CurriculumModuleItemFromJson(
  Map<String, dynamic> json,
) => _CurriculumModuleItem(
  id: json['id'] as String,
  number: (json['number'] as num).toInt(),
  name: json['name'] as String,
  description: json['description'] as String?,
  status:
      $enumDecodeNullable(
        _$RecordStatusEnumMap,
        json['status'],
        unknownValue: RecordStatus.inactive,
      ) ??
      RecordStatus.active,
  translation: json['translation'] == null
      ? null
      : CurriculumText.fromJson(json['translation'] as Map<String, dynamic>),
  values:
      (json['values'] as List<dynamic>?)
          ?.map((e) => CurriculumValueItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$CurriculumModuleItemToJson(
  _CurriculumModuleItem instance,
) => <String, dynamic>{
  'id': instance.id,
  'number': instance.number,
  'name': instance.name,
  'description': ?instance.description,
  'status': _$RecordStatusEnumMap[instance.status]!,
  'translation': ?instance.translation?.toJson(),
  'values': instance.values.map((e) => e.toJson()).toList(),
};

_CurriculumView _$CurriculumViewFromJson(Map<String, dynamic> json) =>
    _CurriculumView(
      locale: json['locale'] as String?,
      locales:
          (json['locales'] as List<dynamic>?)
              ?.map((e) => ContentLocale.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      modules:
          (json['modules'] as List<dynamic>?)
              ?.map(
                (e) => CurriculumModuleItem.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
    );

Map<String, dynamic> _$CurriculumViewToJson(_CurriculumView instance) =>
    <String, dynamic>{
      'locale': ?instance.locale,
      'locales': instance.locales.map((e) => e.toJson()).toList(),
      'modules': instance.modules.map((e) => e.toJson()).toList(),
    };
