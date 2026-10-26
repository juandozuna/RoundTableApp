import 'package:flutter/material.dart';

import '../../../../../../core/extensions/build_context_x.dart';
import '../../../../../../core/theme/app_spacing.dart';
import '../../../../../../core/theme/status_tone.dart';
import '../../../../../../core/widgets/app_message.dart';
import '../../../../../../l10n/gen/app_localizations.dart';
import '../../../../domain/models/member_flow.dart';
import 'member_results.dart';
import 'member_section_title.dart';

/// Everything sent (or still owed) while the room waits for the close.
class MemberRecapPanel extends StatelessWidget {
  const MemberRecapPanel({
    super.key,
    required this.flow,
    required this.answersClosed,
  });

  final MemberFlow flow;
  final bool answersClosed;

  bool get _isFacilitator => flow.session.iAmFacilitator;
  bool get _showsOfflineInfo => flow.isFinished && !flow.isLive;
  bool get _showsClosedInfo =>
      flow.isFinished && flow.isLive && answersClosed && !_isFacilitator;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MemberSectionTitle(
          kicker: flow.isFinished
              ? l10n.sessionMemberRecapKickerFinished
              : l10n.sessionMemberRecapKickerPending,
          title: _title(l10n),
        ),
        const SizedBox(height: AppSpacing.md),
        MemberResults(session: flow.session),
        if (_showsOfflineInfo) ...[
          const SizedBox(height: AppSpacing.md),
          AppMessage(
            tone: StatusTone.info,
            title: l10n.sessionMemberRecapOfflineInfo,
          ),
        ],
        if (_showsClosedInfo) ...[
          const SizedBox(height: AppSpacing.md),
          AppMessage(
            tone: StatusTone.info,
            icon: Icons.lock_rounded,
            title: l10n.sessionMemberRecapAnswersClosed,
          ),
        ],
      ],
    );
  }

  String _title(AppLocalizations l10n) {
    if (!flow.isFinished) return l10n.sessionMemberRecapTitlePending;
    if (_isFacilitator) return l10n.sessionMemberRecapTitleFacilitator;
    return flow.isLive
        ? l10n.sessionMemberRecapTitleLive
        : l10n.sessionMemberRecapTitleOffline;
  }
}
