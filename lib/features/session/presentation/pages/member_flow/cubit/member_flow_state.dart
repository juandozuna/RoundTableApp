import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/models/commitment_follow_up_status.dart';
import '../../../../domain/models/member_step.dart';
import '../../../../domain/models/response_validation.dart';

part 'member_flow_state.freezed.dart';

/// Drafts and navigation of the person answering (members and the
/// facilitator's "Mis respuestas").
@freezed
abstract class MemberFlowState with _$MemberFlowState {
  const factory MemberFlowState({
    /// Step opened from the chips; null follows the session.
    MemberStep? chosenStep,

    /// The person saw "no tienes compromiso previo" and continued.
    @Default(false) bool noPreviousAcknowledged,

    // Follow-up draft.
    CommitmentFollowUpStatus? followUpStatus,
    @Default('') String followUpNote,
    int? followUpScore,
    @Default('') String followUpJustification,

    // Reflection draft: answers by question id.
    @Default({}) Map<String, String> answers,
    int? reflectionScore,
    @Default('') String reflectionJustification,

    // Commitment draft: qué / cuándo / cómo.
    @Default('') String commitmentWhat,
    String? commitmentWhen,
    String? commitmentHow,

    /// Validation errors by field key (see `ResponseValidator`).
    @Default({}) ResponseErrors errors,

    /// Step being saved.
    MemberStep? submitting,

    /// Set after a step is saved, for a toast; cleared by `consumeSaved`.
    MemberStep? justSaved,

    /// Set when saving failed unexpectedly.
    Object? failure,
  }) = _MemberFlowState;
}
