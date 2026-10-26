import '../../../../../../l10n/gen/app_localizations.dart';
import '../../../../domain/models/commitment_follow_up_status.dart';

extension FollowUpStatusLabel on CommitmentFollowUpStatus {
  String label(AppLocalizations l10n) => switch (this) {
    CommitmentFollowUpStatus.kept => l10n.sessionMemberStatusKept,
    CommitmentFollowUpStatus.partial => l10n.sessionMemberStatusPartial,
    CommitmentFollowUpStatus.notKept => l10n.sessionMemberStatusNotKept,
  };
}
