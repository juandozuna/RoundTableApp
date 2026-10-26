import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/models/session_stage.dart';
import 'session_status.dart';

part 'session_info.freezed.dart';

/// The session being run today (or the one that just closed).
@freezed
abstract class SessionInfo with _$SessionInfo {
  const factory SessionInfo({
    required String id,
    required String tableId,
    required SessionStatus status,
    required SessionStage stage,
    required DateTime scheduledAt,
    required String valueId,

    /// Value whose commitment is reviewed today; null for a table's first
    /// session.
    String? followUpValueId,
    DateTime? startedAt,
    DateTime? endedAt,
    DateTime? answersClosedAt,
  }) = _SessionInfo;

  const SessionInfo._();

  bool get isOpen => status == SessionStatus.open;
  bool get isClosed => status == SessionStatus.closed;
  bool get isCancelled => status == SessionStatus.cancelled;
  bool get isFinal => status.isFinal;
  bool get hasFollowUp => followUpValueId != null;
  bool get answersClosed => answersClosedAt != null;
}
