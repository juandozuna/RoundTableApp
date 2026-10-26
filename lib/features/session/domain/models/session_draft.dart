import 'package:freezed_annotation/freezed_annotation.dart';

import 'commitment_follow_up_status.dart';

part 'session_draft.freezed.dart';
part 'session_draft.g.dart';

/// What a person has typed in the session and not sent yet. Kept on the
/// device so it survives closing the app (answers sent are already in the
/// local database).
@freezed
abstract class SessionDraft with _$SessionDraft {
  const factory SessionDraft({
    CommitmentFollowUpStatus? followUpStatus,
    @Default('') String followUpNote,
    int? followUpScore,
    @Default('') String followUpJustification,
    @Default({}) Map<String, String> answers,
    int? reflectionScore,
    @Default('') String reflectionJustification,
    @Default('') String commitmentWhat,
    String? commitmentWhen,
    String? commitmentHow,
  }) = _SessionDraft;

  const SessionDraft._();

  factory SessionDraft.fromJson(Map<String, dynamic> json) =>
      _$SessionDraftFromJson(json);

  bool get isEmpty =>
      followUpStatus == null &&
      followUpNote.isEmpty &&
      followUpScore == null &&
      followUpJustification.isEmpty &&
      answers.values.every((text) => text.isEmpty) &&
      reflectionScore == null &&
      reflectionJustification.isEmpty &&
      commitmentWhat.isEmpty &&
      commitmentWhen == null &&
      commitmentHow == null;
}
