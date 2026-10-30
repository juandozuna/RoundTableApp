import 'package:freezed_annotation/freezed_annotation.dart';

part 'value_question_record.freezed.dart';
part 'value_question_record.g.dart';

/// Row of `value_questions`. `responseType` is `text` or `person`.
@freezed
abstract class ValueQuestionRecord with _$ValueQuestionRecord {
  const factory ValueQuestionRecord({
    required String id,
    required String valueId,
    required String questionCode,
    required String questionText,
    required int sortOrder,
    required String responseType,
    required String status,
  }) = _ValueQuestionRecord;

  factory ValueQuestionRecord.fromJson(Map<String, dynamic> json) =>
      _$ValueQuestionRecordFromJson(json);
}
