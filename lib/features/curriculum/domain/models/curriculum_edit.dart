import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../admin/domain/models/record_status.dart';
import 'curriculum_plan.dart';
import 'curriculum_view.dart';

part 'curriculum_edit.freezed.dart';

/// A text edit of one module, value or question. Only the non-null fields
/// are sent; an empty string clears an optional field. With a [locale] the
/// text fields edit that language's translation.
@freezed
abstract class CurriculumEdit with _$CurriculumEdit {
  const factory CurriculumEdit({
    required CurriculumEntity entity,
    required String id,
    String? locale,
    String? name,
    String? description,
    String? bookletReference,
    String? text,
    QuestionResponseType? responseType,
    RecordStatus? status,
  }) = _CurriculumEdit;
}

/// A new question for a value.
@freezed
abstract class NewQuestion with _$NewQuestion {
  const factory NewQuestion({
    required String valueId,
    required String code,
    required String text,
    @Default(QuestionResponseType.text) QuestionResponseType responseType,
  }) = _NewQuestion;
}
