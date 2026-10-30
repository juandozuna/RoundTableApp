import 'package:freezed_annotation/freezed_annotation.dart';

part 'value_question.freezed.dart';

/// How a question is answered (`value_questions.response_type`).
enum QuestionResponseType {
  /// Free text.
  text,

  /// A person of the member's table, or another name typed in (RF-54).
  person;

  static QuestionResponseType parse(String? raw) =>
      raw == 'person' ? person : text;
}

/// A reflection question of a value. The booklet holds the content; the app
/// only captures the answer.
@freezed
abstract class ValueQuestion with _$ValueQuestion {
  const factory ValueQuestion({
    required String id,
    required String text,
    required int sortOrder,
    @Default(QuestionResponseType.text) QuestionResponseType responseType,
  }) = _ValueQuestion;
}
