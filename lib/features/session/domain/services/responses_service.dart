import '../models/response_submissions.dart';

/// Captures a person's answers. Each call sends its changes to the server at
/// once; when they cannot be delivered it fails with `SessionWriteFailure`
/// and nothing is kept (ADR 0019).
abstract interface class ResponsesService {
  Future<void> submitFollowUp(FollowUpSubmission submission);

  Future<void> submitReflection(ReflectionSubmission submission);

  Future<void> submitCommitment(CommitmentSubmission submission);
}
