import 'package:injectable/injectable.dart';

import '../../models/invalid_response_exception.dart';
import '../../models/response_submissions.dart';
import '../../models/response_validation.dart';
import '../../services/responses_service.dart';

@injectable
class SubmitFollowUpUseCase {
  const SubmitFollowUpUseCase(this._responses);

  final ResponsesService _responses;

  Future<void> call(FollowUpSubmission submission) {
    final errors = ResponseValidator.followUp(
      status: submission.status,
      score: submission.score,
    );
    if (errors.isNotEmpty) throw InvalidResponseException(errors);
    return _responses.submitFollowUp(submission);
  }
}
