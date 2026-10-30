import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../admin/domain/models/record_status.dart';

part 'curriculum_view.freezed.dart';
part 'curriculum_view.g.dart';

enum QuestionResponseType {
  @JsonValue('text')
  text,
  @JsonValue('person')
  person,
}

/// Translated text of one module, value or question in the viewed language.
@freezed
abstract class CurriculumText with _$CurriculumText {
  const CurriculumText._();

  const factory CurriculumText({
    String? name,
    String? description,
    String? text,
  }) = _CurriculumText;

  factory CurriculumText.fromJson(Map<String, dynamic> json) =>
      _$CurriculumTextFromJson(json);
}

/// How much of the Spanish text exists in a language.
@freezed
abstract class LocaleCompleteness with _$LocaleCompleteness {
  const LocaleCompleteness._();

  const factory LocaleCompleteness({
    @Default(0) int total,
    @Default(0) int translated,
  }) = _LocaleCompleteness;

  factory LocaleCompleteness.fromJson(Map<String, dynamic> json) =>
      _$LocaleCompletenessFromJson(json);

  double get ratio => total == 0 ? 0 : translated / total;

  int get percent => (ratio * 100).floor();
}

@freezed
abstract class ContentLocale with _$ContentLocale {
  const factory ContentLocale({
    required String code,
    required String name,
    @Default(false) bool isDefault,
    @JsonKey(unknownEnumValue: RecordStatus.inactive)
    @Default(RecordStatus.active)
    RecordStatus status,
    LocaleCompleteness? completeness,
  }) = _ContentLocale;

  factory ContentLocale.fromJson(Map<String, dynamic> json) =>
      _$ContentLocaleFromJson(json);
}

@freezed
abstract class CurriculumQuestionItem with _$CurriculumQuestionItem {
  const CurriculumQuestionItem._();

  const factory CurriculumQuestionItem({
    required String id,
    required String code,
    required String text,
    @Default(1) int sortOrder,
    @JsonKey(unknownEnumValue: QuestionResponseType.text)
    @Default(QuestionResponseType.text)
    QuestionResponseType responseType,
    @JsonKey(unknownEnumValue: RecordStatus.inactive)
    @Default(RecordStatus.active)
    RecordStatus status,

    /// Someone has already answered it: its answer type cannot change.
    @Default(false) bool answered,
    CurriculumText? translation,
  }) = _CurriculumQuestionItem;

  factory CurriculumQuestionItem.fromJson(Map<String, dynamic> json) =>
      _$CurriculumQuestionItemFromJson(json);

  bool get isActive => status == RecordStatus.active;
}

@freezed
abstract class CurriculumValueItem with _$CurriculumValueItem {
  const CurriculumValueItem._();

  const factory CurriculumValueItem({
    required String id,
    required int number,
    @Default(1) int numberInModule,
    required String name,
    String? description,
    String? bookletReference,
    @JsonKey(unknownEnumValue: RecordStatus.inactive)
    @Default(RecordStatus.active)
    RecordStatus status,

    /// A closed session worked this value: only its text can change.
    @Default(false) bool usedByClosedSessions,
    CurriculumText? translation,
    @Default([]) List<CurriculumQuestionItem> questions,
  }) = _CurriculumValueItem;

  factory CurriculumValueItem.fromJson(Map<String, dynamic> json) =>
      _$CurriculumValueItemFromJson(json);

  List<CurriculumQuestionItem> get activeQuestions => [
    for (final question in questions)
      if (question.isActive) question,
  ];
}

@freezed
abstract class CurriculumModuleItem with _$CurriculumModuleItem {
  const factory CurriculumModuleItem({
    required String id,
    required int number,
    required String name,
    String? description,
    @JsonKey(unknownEnumValue: RecordStatus.inactive)
    @Default(RecordStatus.active)
    RecordStatus status,
    CurriculumText? translation,
    @Default([]) List<CurriculumValueItem> values,
  }) = _CurriculumModuleItem;

  factory CurriculumModuleItem.fromJson(Map<String, dynamic> json) =>
      _$CurriculumModuleItemFromJson(json);
}

/// The whole curriculum with the text of one language (Spanish when
/// [locale] is null) and the completeness of every language.
@freezed
abstract class CurriculumView with _$CurriculumView {
  const CurriculumView._();

  const factory CurriculumView({
    String? locale,
    @Default([]) List<ContentLocale> locales,
    @Default([]) List<CurriculumModuleItem> modules,
  }) = _CurriculumView;

  factory CurriculumView.fromJson(Map<String, dynamic> json) =>
      _$CurriculumViewFromJson(json);

  ContentLocale? get selectedLocale {
    for (final candidate in locales) {
      if (candidate.code == locale) return candidate;
    }
    return null;
  }
}
