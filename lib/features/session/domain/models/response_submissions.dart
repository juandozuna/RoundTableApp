import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/models/commitment_follow_up_status.dart';

part 'response_submissions.freezed.dart';

/// Review of last week's commitment plus the follow-up score.
@freezed
abstract class FollowUpSubmission with _$FollowUpSubmission {
  const factory FollowUpSubmission({
    required String sessionId,
    required String previousCommitmentId,
    required CommitmentFollowUpStatus status,
    required int score,
    String? note,

    /// Optional "¿Por qué ese puntaje?" (RF-52).
    String? justification,
  }) = _FollowUpSubmission;
}

/// Reflection answers plus the current-value (initial) score.
@freezed
abstract class ReflectionSubmission with _$ReflectionSubmission {
  const factory ReflectionSubmission({
    required String sessionId,

    /// Answer text by question id. A picked person's answer is their name.
    required Map<String, String> answers,
    required int score,

    /// Person picked for a `person` question, by question id (RF-54). A
    /// question missing here was answered with free text.
    @Default({}) Map<String, String> answerPersonIds,

    /// Optional "¿Por qué ese puntaje?" (RF-52).
    String? justification,
  }) = _ReflectionSubmission;
}

/// The one concrete action for the coming week.
@freezed
abstract class CommitmentSubmission with _$CommitmentSubmission {
  const factory CommitmentSubmission({
    required String sessionId,
    required String what,
    required String when,
    required String how,
  }) = _CommitmentSubmission;

  const CommitmentSubmission._();

  /// Stored in `action_text`: what and when read as one sentence.
  String get actionText => '${what.trim()} · ${when.trim()}';

  /// Stored in `measure_text`.
  String get measureText => how.trim();
}
