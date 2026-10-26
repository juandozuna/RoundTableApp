import 'package:freezed_annotation/freezed_annotation.dart';

import 'member_step.dart';

part 'session_activity.freezed.dart';

enum SessionActivityKind { attendance, followUp, reflection, commitment }

/// One line of the facilitator's "En vivo · actividad" feed, derived from
/// synced rows.
@freezed
abstract class SessionActivity with _$SessionActivity {
  const factory SessionActivity({
    required String personName,
    required SessionActivityKind kind,
    required DateTime at,
    @Default(false) bool syncedLate,
    @Default(false) bool autoAttendance,
  }) = _SessionActivity;

  const SessionActivity._();

  static SessionActivityKind kindOf(MemberStep step) => switch (step) {
    MemberStep.followUp => SessionActivityKind.followUp,
    MemberStep.reflection => SessionActivityKind.reflection,
    MemberStep.commitment => SessionActivityKind.commitment,
  };
}
