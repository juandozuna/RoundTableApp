import 'package:injectable/injectable.dart';

import '../../models/invalid_response_exception.dart';
import '../../models/response_submissions.dart';
import '../../models/response_validation.dart';
import '../../services/responses_service.dart';

@injectable
class SubmitReflectionUseCase {
  const SubmitReflectionUseCase(this._responses);

  final ResponsesService _responses;

  Future<void> call(ReflectionSubmission submission) {
    final errors = ResponseValidator.reflection(
      answers: submission.answers,
      questionIds: submission.answers.keys,
      score: submission.score,
    );
    if (errors.isNotEmpty) throw InvalidResponseException(errors);
    return _responses.submitReflection(submission);
  }
}
