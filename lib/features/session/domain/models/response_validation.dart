import '../../../../core/constants/app_constants.dart';
import '../../../../core/models/commitment_follow_up_status.dart';
import '../../../../core/models/score_rules.dart';

/// Fields a person fills in, used to attach validation errors to controls.
enum ResponseField {
  followUpStatus,
  followUpScore,
  reflectionScore,
  commitmentWhat,
  commitmentWhen,
  commitmentHow,
  // Reflection answers are keyed by question id through [answerField].
}

enum ResponseError { required, tooShort, scoreNotAllowed }

/// Validation result: errors by field key (a [ResponseField] name or an
/// `answer:<questionId>` key). Empty means valid.
typedef ResponseErrors = Map<String, ResponseError>;

/// Domain rules for answers, shared by Cubits and use cases.
abstract final class ResponseValidator {
  static const int commitmentMinLength = 8;

  static String answerField(String questionId) => 'answer:$questionId';

  static String fieldKey(ResponseField field) => field.name;

  static ResponseError? _score(int? score) {
    if (score == null) return ResponseError.required;
    return ScoreRules.isAllowed(score) ? null : ResponseError.scoreNotAllowed;
  }

  static ResponseErrors followUp({
    required CommitmentFollowUpStatus? status,
    required int? score,
  }) {
    final errors = <String, ResponseError>{};
    if (status == null) {
      errors[fieldKey(ResponseField.followUpStatus)] = ResponseError.required;
    }
    final scoreError = _score(score);
    if (scoreError != null) {
      errors[fieldKey(ResponseField.followUpScore)] = scoreError;
    }
    return errors;
  }

  /// [answers] maps question id to the typed text.
  static ResponseErrors reflection({
    required Map<String, String> answers,
    required Iterable<String> questionIds,
    required int? score,
  }) {
    final errors = <String, ResponseError>{};
    for (final id in questionIds) {
      final text = (answers[id] ?? '').trim();
      if (text.isEmpty) {
        errors[answerField(id)] = ResponseError.required;
      } else if (text.length < AppLimits.shortTextMinLength) {
        errors[answerField(id)] = ResponseError.tooShort;
      }
    }
    final scoreError = _score(score);
    if (scoreError != null) {
      errors[fieldKey(ResponseField.reflectionScore)] = scoreError;
    }
    return errors;
  }

  static ResponseErrors commitment({
    required String what,
    required String? when,
    required String? how,
  }) {
    final errors = <String, ResponseError>{};
    final text = what.trim();
    if (text.isEmpty) {
      errors[fieldKey(ResponseField.commitmentWhat)] = ResponseError.required;
    } else if (text.length < commitmentMinLength) {
      errors[fieldKey(ResponseField.commitmentWhat)] = ResponseError.tooShort;
    }
    if ((when ?? '').trim().isEmpty) {
      errors[fieldKey(ResponseField.commitmentWhen)] = ResponseError.required;
    }
    if ((how ?? '').trim().isEmpty) {
      errors[fieldKey(ResponseField.commitmentHow)] = ResponseError.required;
    }
    return errors;
  }
}
