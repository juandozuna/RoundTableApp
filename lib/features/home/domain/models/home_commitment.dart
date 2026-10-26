import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_commitment.freezed.dart';

/// Result the member reported for last week's commitment.
enum CommitmentOutcome {
  kept,
  partial,
  notKept;

  /// Parses `commitment_follow_up_status` (kept | partial | not_kept).
  static CommitmentOutcome? tryParse(String? raw) => switch (raw) {
    'kept' => kept,
    'partial' => partial,
    'not_kept' => notKept,
    _ => null,
  };
}

/// The member's most recent commitment, shown on their home.
@freezed
abstract class HomeCommitment with _$HomeCommitment {
  const factory HomeCommitment({
    required String actionText,
    String? measureText,
    String? valueName,
    CommitmentOutcome? outcome,
  }) = _HomeCommitment;
}
