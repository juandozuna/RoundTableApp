import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/models/invite.dart';
import '../../../../domain/models/invite_problem.dart';

part 'share_state.freezed.dart';

enum ShareFeedbackKind { linkCopied, codeCopied, whatsappUnavailable }

@freezed
abstract class ShareFeedback with _$ShareFeedback {
  const factory ShareFeedback({
    required ShareFeedbackKind kind,
    required int serial,
  }) = _ShareFeedback;
}

@freezed
abstract class ShareState with _$ShareState {
  const factory ShareState({
    Invite? invite,
    @Default(true) bool loading,
    InviteProblem? problem,

    /// The invite no longer exists (or is not visible to this person).
    @Default(false) bool missing,
    ShareFeedback? feedback,
  }) = _ShareState;
}
