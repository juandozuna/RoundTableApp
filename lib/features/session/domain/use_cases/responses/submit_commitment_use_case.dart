import 'package:injectable/injectable.dart';

import '../../models/invalid_response_exception.dart';
import '../../models/response_submissions.dart';
import '../../models/response_validation.dart';
import '../../services/responses_service.dart';

@injectable
class SubmitCommitmentUseCase {
  const SubmitCommitmentUseCase(this._responses);

  final ResponsesService _responses;

  Future<void> call(CommitmentSubmission submission) {
    final errors = ResponseValidator.commitment(
      what: submission.what,
      when: submission.when,
      how: submission.how,
    );
    if (errors.isNotEmpty) throw InvalidResponseException(errors);
    return _responses.submitCommitment(submission);
  }
}
