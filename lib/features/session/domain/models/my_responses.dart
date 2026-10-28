import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/models/commitment_follow_up_status.dart';

part 'my_responses.freezed.dart';

/// What the signed-in person has captured today.
@freezed
abstract class MyResponses with _$MyResponses {
  const factory MyResponses({
    FollowUpResponse? followUp,
    ReflectionResponse? reflection,
    CommitmentResponse? commitment,
  }) = _MyResponses;
}

@freezed
abstract class FollowUpResponse with _$FollowUpResponse {
  const factory FollowUpResponse({
    required CommitmentFollowUpStatus status,
    required int score,
    String? note,
  }) = _FollowUpResponse;
}

@freezed
abstract class ReflectionResponse with _$ReflectionResponse {
  const factory ReflectionResponse({
    /// Answer text by question id.
    required Map<String, String> answers,
    required int score,
  }) = _ReflectionResponse;
}

@freezed
abstract class CommitmentResponse with _$CommitmentResponse {
  const factory CommitmentResponse({
    required String actionText,
    String? measureText,
  }) = _CommitmentResponse;
}
