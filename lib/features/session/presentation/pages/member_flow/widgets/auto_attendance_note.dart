import 'package:flutter/material.dart';

import '../../../../../../core/extensions/build_context_x.dart';
import '../../../../../../core/theme/status_tone.dart';
import '../../../../../../core/widgets/app_message.dart';
import '../../../../domain/models/session_participant.dart';

/// Explains auto-attendance (ADR 0005) to a person marked Ausente: what will
/// happen, what happened, or that answering makes them Presente.
class AutoAttendanceNote extends StatelessWidget {
  const AutoAttendanceNote({super.key, required this.me});

  final SessionParticipant me;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    if (me.autoAttendancePending) {
      return AppMessage(
        tone: StatusTone.info,
        icon: Icons.person_rounded,
        title: l10n.sessionMemberAutoPendingTitle,
        detail: l10n.sessionMemberAutoPendingDetail,
      );
    }
    if (me.attendanceAuto) {
      return AppMessage(
        tone: StatusTone.ok,
        title: l10n.sessionMemberAutoDoneTitle,
        detail: l10n.sessionMemberAutoDoneDetail,
      );
    }
    return AppMessage(
      tone: StatusTone.info,
      title: l10n.sessionMemberAbsentInfo,
    );
  }

  /// Whether the note applies: a pending flip, a finished flip, or absent.
  static bool appliesTo(SessionParticipant me) =>
      me.autoAttendancePending || me.attendanceAuto || me.isAbsent;
}
