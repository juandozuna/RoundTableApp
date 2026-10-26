import 'package:flutter/material.dart';

import '../../../../../../core/extensions/build_context_x.dart';
import '../../../../../../core/models/sync_state.dart';
import '../../../../../../core/theme/app_spacing.dart';
import '../../../../../../core/theme/status_tone.dart';
import '../../../../../../core/widgets/app_button.dart';
import '../../../../../../core/widgets/app_message.dart';
import '../../../../../../core/widgets/sync_pill.dart';
import '../../../../domain/models/session_participant.dart';
import '../../session/cubit/session_state.dart';

/// What the person needs to know about their captured answers: the stale
/// (>24 h) warning, the sync state of this phone's rows, refused uploads and
/// the offline notice.
class MemberSyncBlock extends StatelessWidget {
  const MemberSyncBlock({super.key, required this.view, this.onSyncNow});

  final SessionView view;

  /// Called by "Sincronizar ahora".
  final VoidCallback? onSyncNow;

  SessionParticipant get _me => view.session.me;

  /// Worst state across the person's captured steps, null if nothing yet.
  SyncState? get _aggregate {
    final states = [
      for (final progress in [_me.followUp, _me.reflection, _me.commitment])
        if (progress.isDone) progress.syncState,
    ];
    for (final state in [
      SyncState.syncing,
      SyncState.pending,
      SyncState.syncedLate,
      SyncState.synced,
    ]) {
      if (states.contains(state)) return state;
    }
    return null;
  }

  bool get _showsStaleWarning => view.sync.hasStalePending;
  bool get _showsSyncNow => _aggregate == SyncState.pending && view.isLive;
  bool get _showsOfflineNotice => _aggregate == null && !view.isLive;
  List<String> get _rejections => view.session.rejectedMessages;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (_showsStaleWarning) _spaced(_buildStaleWarning(context)),
        if (_aggregate != null) _spaced(_buildSyncPill(context)),
        if (_showsOfflineNotice) _spaced(_buildOfflineNotice(context)),
        if (_rejections.isNotEmpty) _spaced(_buildRejections(context)),
      ],
    );
  }

  Widget _spaced(Widget child) => Padding(
    padding: const EdgeInsets.only(top: AppSpacing.md),
    child: child,
  );

  Widget _buildStaleWarning(BuildContext context) {
    final since = view.sync.pendingSince;
    final hours = since == null
        ? 24
        : DateTime.now().toUtc().difference(since).inHours.clamp(24, 9999);
    return AppMessage(
      tone: StatusTone.pending,
      icon: Icons.warning_amber_rounded,
      title: context.l10n.sessionSharedStaleWarning(hours),
    );
  }

  Widget _buildSyncPill(BuildContext context) {
    final l10n = context.l10n;
    final state = _aggregate!;
    final detail = switch (state) {
      SyncState.pending =>
        view.isLive
            ? l10n.sessionSharedNoticeSavedOnDevice
            : '${l10n.sessionSharedNoticeSavedOnDevice}. '
                  '${l10n.sessionMemberSyncPendingDetailOffline}',
      SyncState.syncing => null,
      SyncState.synced => l10n.sessionMemberSyncSyncedDetail,
      SyncState.syncedLate => l10n.sessionMemberSyncLateDetail,
    };
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SyncPill(state: state, detail: detail),
        if (_showsSyncNow) ...[
          const SizedBox(height: AppSpacing.sm),
          AppButton(
            label: l10n.sessionSharedSyncNow,
            icon: Icons.sync_rounded,
            variant: AppButtonVariant.secondary,
            size: AppButtonSize.small,
            fullWidth: false,
            onPressed: onSyncNow,
          ),
        ],
      ],
    );
  }

  Widget _buildOfflineNotice(BuildContext context) {
    final l10n = context.l10n;
    return AppMessage(
      tone: StatusTone.offline,
      title: l10n.sessionMemberSyncOfflineTitle,
      detail: _me.isFacilitator
          ? l10n.sessionMemberSyncOfflineFacilitator
          : l10n.sessionMemberSyncOfflineMember,
    );
  }

  Widget _buildRejections(BuildContext context) => AppMessage(
    tone: StatusTone.error,
    title: context.l10n.sessionSharedRejectedTitle,
    detail: _rejections.join('\n'),
  );
}
