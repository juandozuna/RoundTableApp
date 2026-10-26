import 'package:freezed_annotation/freezed_annotation.dart';

part 'previous_commitment.freezed.dart';

/// The person's commitment from the previous session, reviewed in today's
/// follow-up.
@freezed
abstract class PreviousCommitment with _$PreviousCommitment {
  const factory PreviousCommitment({
    required String id,
    required String actionText,
    String? measureText,
  }) = _PreviousCommitment;
}
