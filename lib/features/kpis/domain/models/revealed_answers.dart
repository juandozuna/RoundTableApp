import 'package:freezed_annotation/freezed_annotation.dart';

part 'revealed_answers.freezed.dart';
part 'revealed_answers.g.dart';

@freezed
abstract class RevealedAssessment with _$RevealedAssessment {
  const factory RevealedAssessment({
    required String id,
    String? sessionId,
    String? valueId,
    String? valueName,
    required String kind,
    int? score,
    String? justification,
    @Default(false) bool syncedLate,
  }) = _RevealedAssessment;

  factory RevealedAssessment.fromJson(Map<String, dynamic> json) =>
      _$RevealedAssessmentFromJson(json);
}

@freezed
abstract class RevealedAnswer with _$RevealedAnswer {
  const factory RevealedAnswer({
    required String id,
    String? sessionId,
    String? valueId,
    String? questionId,
    String? questionText,
    String? answerText,
    @Default(false) bool syncedLate,
  }) = _RevealedAnswer;

  factory RevealedAnswer.fromJson(Map<String, dynamic> json) =>
      _$RevealedAnswerFromJson(json);
}

@freezed
abstract class RevealedCommitment with _$RevealedCommitment {
  const factory RevealedCommitment({
    required String id,
    String? sessionId,
    String? valueId,
    String? actionText,
    String? measureText,
    String? followUpStatus,
    String? followUpNote,
    @Default(false) bool syncedLate,
  }) = _RevealedCommitment;

  factory RevealedCommitment.fromJson(Map<String, dynamic> json) =>
      _$RevealedCommitmentFromJson(json);
}

@freezed
abstract class RevealedPerson with _$RevealedPerson {
  const factory RevealedPerson({
    required String personId,
    String? firstName,
    String? lastName,
    @Default([]) List<RevealedAssessment> assessments,
    @Default([]) List<RevealedAnswer> answers,
    @Default([]) List<RevealedCommitment> commitments,
  }) = _RevealedPerson;

  factory RevealedPerson.fromJson(Map<String, dynamic> json) =>
      _$RevealedPersonFromJson(json);
}

/// Response of `answers-reveal`; fetching it writes an audit event.
@freezed
abstract class RevealedAnswers with _$RevealedAnswers {
  const factory RevealedAnswers({
    required String roundTableId,
    DateTime? revealedAt,
    @Default([]) List<RevealedPerson> people,
  }) = _RevealedAnswers;

  factory RevealedAnswers.fromJson(Map<String, dynamic> json) =>
      _$RevealedAnswersFromJson(json);
}
