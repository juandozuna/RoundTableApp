import 'package:freezed_annotation/freezed_annotation.dart';

part 'curriculum_translation_record.freezed.dart';
part 'curriculum_translation_record.g.dart';

/// Row of `curriculum_translations`. `entityType` is `module`, `value` or
/// `question`; `entityId` points at the matching curriculum row.
@freezed
abstract class CurriculumTranslationRecord with _$CurriculumTranslationRecord {
  const factory CurriculumTranslationRecord({
    required String id,
    required String locale,
    required String entityType,
    required String entityId,
    String? name,
    String? description,
    String? questionText,
  }) = _CurriculumTranslationRecord;

  factory CurriculumTranslationRecord.fromJson(Map<String, dynamic> json) =>
      _$CurriculumTranslationRecordFromJson(json);
}
