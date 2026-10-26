import '../models/response_submissions.dart';

/// Captures a person's answers. Each call saves on the device in one
/// transaction; upload happens later (ADR 0003).
abstract interface class ResponsesService {
  Future<void> submitFollowUp(FollowUpSubmission submission);

  Future<void> submitReflection(ReflectionSubmission submission);

  Future<void> submitCommitment(CommitmentSubmission submission);
}
