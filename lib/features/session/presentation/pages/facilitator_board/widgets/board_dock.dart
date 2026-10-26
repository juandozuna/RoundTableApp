import 'package:flutter/material.dart';

import '../../../../../../core/extensions/build_context_x.dart';
import '../../../../../../core/theme/app_spacing.dart';
import '../../../../../../core/widgets/app_button.dart';
import '../../../../../../core/widgets/app_icon_button.dart';
import '../../../../domain/models/facilitator_stage.dart';
import '../../../widgets/session_formatters.dart';
import '../../session/cubit/session_state.dart';

/// Bottom action area of the board: the one button that opens the next stage
/// (or "Anunciar: …" when offline), plus the shortcuts that belong to the
/// current stage.
class BoardDock extends StatelessWidget {
  const BoardDock({
    super.key,
    required this.view,
    required this.myMissingStepCount,
    required this.onAdvance,
    required this.onMarkEveryonePresent,
    required this.onOpenMyAnswers,
    required this.onSync,
  });

  final SessionView view;

  /// Steps of the facilitator's own answers that are open and still empty.
  final int myMissingStepCount;
  final VoidCallback onAdvance;
  final VoidCallback onMarkEveryonePresent;
  final VoidCallback onOpenMyAnswers;
  final VoidCallback onSync;

  bool get _isClosed => view.session.session.isFinal;

  /// Offline controls are guidance: each phone goes at its own pace.
  bool get _isVerbal => !view.isOnline;

  bool get _showSync => view.sync.pendingCount > 0;

  bool get _waitsForTime =>
      view.stage == FacilitatorStage.open && !view.session.isToday;

  bool get _showMarkEveryone => view.stage == FacilitatorStage.attendance;

  bool get _showMyAnswers =>
      !_showMarkEveryone &&
      view.stage.index >= FacilitatorStage.followUp.index &&
      myMissingStepCount > 0;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (_showMarkEveryone && !_isClosed)
          Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.sm),
            child: AppButton(
              label: l10n.sessionBoardMarkEveryonePresent,
              icon: Icons.done_all_rounded,
              variant: AppButtonVariant.secondary,
              onPressed: onMarkEveryonePresent,
            ),
          ),
        if (_showMyAnswers && !_isClosed)
          Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.sm),
            child: AppButton(
              label: l10n.sessionBoardAnswerMyself(myMissingStepCount),
              icon: Icons.person_rounded,
              variant: AppButtonVariant.secondary,
              onPressed: onOpenMyAnswers,
            ),
          ),
        Row(
          children: [
            if (_showSync) ...[
              AppIconButton(
                icon: view.sync.uploading
                    ? Icons.sync_rounded
                    : Icons.cloud_upload_outlined,
                tooltip: l10n.sessionSharedSyncNow,
                variant: AppIconButtonVariant.filled,
                onPressed: view.isOnline ? onSync : null,
              ),
              const SizedBox(width: AppSpacing.sm),
            ],
            Expanded(child: _buildMainAction(context)),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: AppSpacing.sm),
          child: Text(
            _hint(context),
            textAlign: TextAlign.center,
            style: context.textTheme.bodySmall,
          ),
        ),
      ],
    );
  }

  Widget _buildMainAction(BuildContext context) {
    final l10n = context.l10n;
    if (_isClosed) {
      return AppButton(
        label: l10n.sessionBoardSessionClosed,
        icon: Icons.lock_rounded,
        variant: AppButtonVariant.secondary,
        onPressed: null,
      );
    }
    final stage = view.stage;
    final label = switch (stage) {
      FacilitatorStage.open =>
        _isVerbal
            ? l10n.sessionBoardDockAnnounceOpen
            : l10n.sessionBoardDockOpen,
      FacilitatorStage.attendance =>
        _isVerbal
            ? l10n.sessionBoardDockAnnounceFollowUp
            : l10n.sessionBoardDockFollowUp,
      FacilitatorStage.followUp =>
        _isVerbal
            ? l10n.sessionBoardDockAnnounceValue
            : l10n.sessionBoardDockValue,
      FacilitatorStage.value =>
        _isVerbal
            ? l10n.sessionBoardDockAnnounceCloseAnswers
            : l10n.sessionBoardDockCloseAnswers,
      FacilitatorStage.closing => l10n.sessionBoardDockCloseSession,
    };
    return AppButton(
      label: label,
      icon: stage == FacilitatorStage.closing
          ? Icons.lock_rounded
          : Icons.bolt_rounded,
      variant: _isVerbal && stage != FacilitatorStage.closing
          ? AppButtonVariant.offline
          : AppButtonVariant.primary,
      loading: view.isBusy,
      onPressed: _waitsForTime ? null : onAdvance,
    );
  }

  String _hint(BuildContext context) {
    final l10n = context.l10n;
    if (_isClosed) {
      return view.session.controlChangesPending
          ? l10n.sessionBoardHintClosedPending
          : l10n.sessionBoardHintClosedSynced;
    }
    if (_waitsForTime) {
      return l10n.sessionBoardHintNotYet(
        SessionFormatters.when(context, view.session.session.scheduledAt),
      );
    }
    if (_isVerbal) return l10n.sessionBoardHintVerbal;
    return switch (view.stage) {
      FacilitatorStage.open => l10n.sessionBoardHintOpen,
      FacilitatorStage.attendance => l10n.sessionBoardHintAttendance,
      FacilitatorStage.followUp => l10n.sessionBoardHintFollowUp,
      FacilitatorStage.value => l10n.sessionBoardHintValue,
      FacilitatorStage.closing => l10n.sessionBoardHintClosing,
    };
  }
}
