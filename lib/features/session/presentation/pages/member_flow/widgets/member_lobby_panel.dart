import 'package:flutter/material.dart';

import '../../../../../../core/extensions/build_context_x.dart';
import '../../../../../../core/theme/status_tone.dart';
import '../../../../../../core/widgets/app_avatar.dart';
import '../../../../domain/models/session_participant.dart';
import 'member_notice_panel.dart';

/// "Esperando a tu facilitador" until the session opens.
class MemberLobbyPanel extends StatelessWidget {
  const MemberLobbyPanel({super.key, required this.me});

  final SessionParticipant me;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return MemberNoticePanel(
      leading: AppAvatar(
        name: me.fullName,
        size: 96,
        ringTone: StatusTone.syncing,
      ),
      title: me.isFacilitator
          ? l10n.sessionMemberLobbyFacilitatorTitle
          : l10n.sessionMemberLobbyTitle,
      message: me.isFacilitator
          ? l10n.sessionMemberLobbyFacilitatorMessage
          : l10n.sessionMemberLobbyMessage,
    );
  }
}
