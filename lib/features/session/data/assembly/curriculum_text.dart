import '../../../../core/data/records/records.dart';

/// Shows curriculum text in the content language in use, with the Spanish
/// base text as fallback field by field; a blank translation counts as
/// missing (ADR 0017). Pure, so the rule is testable without a server.
class CurriculumText {
  CurriculumText(Iterable<CurriculumTranslationRecord> translations)
    : _byEntity = {for (final t in translations) t.entityId: t};

  static const String valueType = 'value';
  static const String questionType = 'question';

  final Map<String, CurriculumTranslationRecord> _byEntity;

  CurriculumValueRecord value(CurriculumValueRecord base) {
    final translation = _of(base.id, valueType);
    return base.copyWith(
      name: _text(translation?.name) ?? base.name,
      description: _text(translation?.description) ?? base.description,
    );
  }

  ValueQuestionRecord question(ValueQuestionRecord base) {
    final translation = _of(base.id, questionType);
    return base.copyWith(
      questionText: _text(translation?.questionText) ?? base.questionText,
    );
  }

  CurriculumTranslationRecord? _of(String id, String type) {
    final translation = _byEntity[id];
    return translation?.entityType == type ? translation : null;
  }

  static String? _text(String? text) {
    final trimmed = text?.trim();
    return trimmed == null || trimmed.isEmpty ? null : trimmed;
  }
}
