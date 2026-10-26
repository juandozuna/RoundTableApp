import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/app_constants.dart';
import '../../../../../core/extensions/build_context_x.dart';
import '../../../../../core/models/attendance_status.dart';
import '../../../../../core/network/api_error_messages.dart';
import '../../../../../core/network/api_exception.dart';
import '../../../../../core/theme/app_spacing.dart';
import '../../../../../core/theme/status_tone.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_dialogs.dart';
import '../../../../../core/widgets/app_message.dart';
import '../../../../../core/widgets/app_scaffold.dart';
import '../../../../../core/widgets/app_toast.dart';
import '../../../../../core/widgets/offline_banner.dart';
import '../../../domain/models/facilitator_stage.dart';
import '../../../domain/models/live_session.dart';
import '../../../domain/models/member_flow.dart';
import '../../../domain/models/member_step.dart';
import '../../../domain/models/session_participant.dart';
import '../../../session_routes.dart';
import '../../widgets/session_connection_pill.dart';
import '../../widgets/session_timer.dart';
import '../member_flow/member_flow_view.dart';
import '../session/cubit/session_cubit.dart';
import '../session/cubit/session_state.dart';
import 'board_progress.dart';
import 'board_texts.dart';
import 'cubit/facilitator_board_cubit.dart';
import 'cubit/facilitator_board_state.dart';
import 'widgets/activity_feed.dart';
import 'widgets/attendance_sheet.dart';
import 'widgets/board_dock.dart';
import 'widgets/board_legend.dart';
import 'widgets/closing_summary.dart';
import 'widgets/confirm_advance_sheet.dart';
import 'widgets/confirm_close_sheet.dart';
import 'widgets/participant_sheet.dart';
import 'widgets/round_table_board.dart';
import 'widgets/session_info_card.dart';
import 'widgets/stage_bar.dart';
import 'widgets/verbal_guide.dart';

/// The facilitator's phone or tablet: "Dirigir la mesa" (round table, stage
/// bar, dock) and "Mis respuestas" (the member screens, ADR 0014).
class FacilitatorSessionView extends StatelessWidget {
  const FacilitatorSessionView({super.key, required this.view});

  final SessionView view;

  LiveSession get _session => view.session;

  /// Another person's answers are only known while connected.
  bool get _canSeeOthers => view.isOnline;

  /// Steps of the facilitator's own answers that can be answered now.
  int get _myMissingStepCount {
    final flow = MemberFlow(_session, live: view.isLive);
    return MemberStep.values
        .where((s) => flow.accessOf(s) == StepAccess.open)
        .length;
  }

  bool get _needsSelfMark =>
      view.stage == FacilitatorStage.attendance &&
      !_session.session.isFinal &&
      !_session.me.hasAttendance;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<SessionCubit, SessionState>(
          listenWhen: (previous, current) =>
              current is SessionReady &&
              (previous is! SessionReady ||
                  previous.view.notice != current.view.notice ||
                  previous.view.problem != current.view.problem ||
                  previous.view.prompt != current.view.prompt),
          listener: _onSessionChange,
        ),
        BlocListener<SessionCubit, SessionState>(
          listenWhen: (previous, current) =>
              previous is SessionReady &&
              current is SessionReady &&
              previous.view.stage != current.view.stage,
          listener: (context, _) =>
              context.read<FacilitatorBoardCubit>().followCurrentStage(),
        ),
        BlocListener<SessionCubit, SessionState>(
          listenWhen: (_, current) =>
              current is SessionReady && _selfMarkNeeded(current.view),
          listener: (context, state) => _markSelf(context),
        ),
      ],
      child: _SelfMarkOnStart(
        onStart: _needsSelfMark ? () => _markSelf(context) : null,
        child: BlocBuilder<FacilitatorBoardCubit, FacilitatorBoardState>(
          builder: (context, board) => AppScaffold(
            title: _session.table.name,
            backFallbackLocation: SessionRoutes.backFallback,
            padBody: false,
            banner: view.isOnline
                ? null
                : OfflineBanner(
                    detail: context.l10n.offlineDetailSavedLocally,
                    onRetry: context.read<SessionCubit>().syncNow,
                  ),
            actions: [SessionConnectionPill(view: view)],
            bottomBar: board.tab == FacilitatorTab.board
                ? _buildDock(context)
                : null,
            body: _buildBody(context, board),
          ),
        ),
      ),
    );
  }

  static bool _selfMarkNeeded(SessionView view) =>
      view.stage == FacilitatorStage.attendance &&
      !view.session.session.isFinal &&
      !view.session.me.hasAttendance;

  void _markSelf(BuildContext context) {
    context.read<FacilitatorBoardCubit>().ensureSelfPresent(
      sessionId: _session.session.id,
      personId: _session.myPersonId,
    );
  }

  // ------------------------------------------------------------- listeners

  Future<void> _onSessionChange(
    BuildContext context,
    SessionState state,
  ) async {
    final current = (state as SessionReady).view;
    final cubit = context.read<SessionCubit>();
    final l10n = context.l10n;
    final notice = current.notice;
    if (notice != null) {
      AppToast.show(context, switch (notice) {
        SessionNotice.savedOnDevice => l10n.sessionSharedNoticeSavedOnDevice,
        SessionNotice.reconnected => l10n.sessionSharedNoticeReconnected,
      });
      cubit.consumeNotice();
    }
    final problem = current.problem;
    if (problem is ControlFailedProblem) {
      AppToast.show(
        context,
        _controlErrorText(context, problem.error),
        kind: AppToastKind.error,
      );
      cubit.dismissProblem();
    }
    final prompt = current.prompt;
    if (prompt != null) await _showPrompt(context, cubit, prompt);
  }

  String _controlErrorText(BuildContext context, Object error) {
    final l10n = context.l10n;
    if (error is! ApiException) return l10n.errorGeneric;
    return switch (error.code) {
      'invalid_session_transition' => l10n.sessionBoardErrorTransition,
      'session_finalized' ||
      'session_closed' => l10n.sessionBoardErrorFinalized,
      'forbidden' => l10n.sessionBoardErrorNotFacilitator,
      _ => error.userMessage(l10n),
    };
  }

  Future<void> _showPrompt(
    BuildContext context,
    SessionCubit cubit,
    SessionPrompt prompt,
  ) async {
    final l10n = context.l10n;
    final board = context.read<FacilitatorBoardCubit>();
    await AppDialogs.showSheet<void>(
      context,
      title: switch (prompt) {
        ConfirmAdvancePrompt(:final next) =>
          next == FacilitatorStage.closing
              ? l10n.sessionBoardConfirmCloseAnswersTitle
              : l10n.sessionBoardConfirmOpenValueTitle,
        ConfirmClosePrompt() => l10n.sessionBoardConfirmCloseTitle,
      },
      builder: (sheetContext) => switch (prompt) {
        ConfirmAdvancePrompt() => ConfirmAdvanceSheet(
          closingAnswers: prompt.next == FacilitatorStage.closing,
          pendingNames: prompt.pendingNames,
          myMissingSteps: prompt.myMissingSteps,
          onWait: () => Navigator.of(sheetContext).pop(),
          onConfirm: () {
            Navigator.of(sheetContext).pop();
            cubit.confirmPrompt();
          },
          onAnswerMyself: () {
            Navigator.of(sheetContext).pop();
            board.selectTab(FacilitatorTab.myAnswers);
          },
        ),
        ConfirmClosePrompt() => ConfirmCloseSheet(
          incomplete: prompt.incomplete,
          onBack: () => Navigator.of(sheetContext).pop(),
          onConfirm: () {
            Navigator.of(sheetContext).pop();
            cubit.confirmPrompt();
          },
        ),
      },
    );
    cubit.dismissPrompt();
  }

  // ------------------------------------------------------------------ body

  Widget _buildBody(BuildContext context, FacilitatorBoardState board) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final wide = constraints.maxWidth >= 720;
        return Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: wide ? 960 : 560),
            child: board.tab == FacilitatorTab.board
                ? _buildBoardTab(context, board, wide, constraints.maxWidth)
                : _buildMyAnswersTab(context, board),
          ),
        );
      },
    );
  }

  Widget _buildBoardTab(
    BuildContext context,
    FacilitatorBoardState board,
    bool wide,
    double availableWidth,
  ) {
    final viewing = board.viewing ?? view.stage;
    final tableWidth = wide
        ? (_session.seatCount >= 8 ? 330.0 : 380.0)
        : (availableWidth - 2 * AppSpacing.pagePhone).clamp(280.0, 360.0);
    final main = <Widget>[
      _buildStageBar(context, board),
      const SizedBox(height: AppSpacing.md),
      _buildHeadline(context, viewing),
      if (viewing != view.stage && !_isClosed)
        _buildViewingRibbon(context, viewing),
      ?_buildAttendanceError(context),
      if (!view.isOnline && !_isClosed) ...[
        const SizedBox(height: AppSpacing.sm),
        VerbalGuide(
          stage: view.stage,
          previousValue: _session.followUpValue?.name,
          currentValue: _session.value.name,
        ),
      ],
      const SizedBox(height: AppSpacing.sm),
      Center(child: _buildTable(context, viewing, tableWidth)),
      BoardLegend(stage: viewing),
    ];
    final side = <Widget>[
      _buildValueChips(context),
      const SizedBox(height: AppSpacing.md),
      if (view.stage == FacilitatorStage.open && !_isClosed) ...[
        SessionInfoCard(session: _session),
        const SizedBox(height: AppSpacing.md),
      ],
      if (_isClosed) ...[
        ClosingSummary(session: _session),
        const SizedBox(height: AppSpacing.md),
      ],
      if (view.sync.hasStalePending) ...[
        AppMessage(
          tone: StatusTone.pending,
          title: context.l10n.syncStaleWarning,
        ),
        const SizedBox(height: AppSpacing.md),
      ],
      for (final message in _session.rejectedMessages)
        Padding(
          padding: const EdgeInsets.only(bottom: AppSpacing.sm),
          child: AppMessage(
            tone: StatusTone.error,
            title: context.l10n.sessionSharedRejectedTitle,
            detail: message,
          ),
        ),
      ActivityFeed(activity: _session.activity, limit: wide ? 7 : 3),
    ];
    final tabs = _buildTabs(context, board);
    if (wide) {
      return ListView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        children: [
          _buildHeader(context),
          tabs,
          const SizedBox(height: AppSpacing.md),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: main,
                ),
              ),
              const SizedBox(width: AppSpacing.lg),
              SizedBox(
                width: 330,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: side,
                ),
              ),
            ],
          ),
        ],
      );
    }
    return ListView(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.pagePhone,
        AppSpacing.sm,
        AppSpacing.pagePhone,
        AppSpacing.lg,
      ),
      children: [
        _buildHeader(context),
        tabs,
        const SizedBox(height: AppSpacing.md),
        ...main,
        const SizedBox(height: AppSpacing.lg),
        ...side,
      ],
    );
  }

  bool get _isClosed => _session.session.isFinal;

  Widget _buildHeader(BuildContext context) {
    final l10n = context.l10n;
    final facilitator = _session.me;
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.xs),
      child: Text(
        '${_session.table.organizationName} · ${facilitator.firstName} '
        '(${l10n.sessionBoardFacilitatorLabel.toLowerCase()})',
        style: context.textTheme.bodySmall,
      ),
    );
  }

  Widget _buildTabs(BuildContext context, FacilitatorBoardState board) {
    final l10n = context.l10n;
    final missing = _myMissingStepCount;
    Widget tab(FacilitatorTab value, Widget label) {
      final selected = board.tab == value;
      return Expanded(
        child: Semantics(
          button: true,
          selected: selected,
          child: Material(
            color: selected ? context.colors.accentStrong : Colors.transparent,
            borderRadius: BorderRadius.circular(AppRadii.md),
            child: InkWell(
              borderRadius: BorderRadius.circular(AppRadii.md),
              onTap: () =>
                  context.read<FacilitatorBoardCubit>().selectTab(value),
              child: SizedBox(
                height: 46,
                child: DefaultTextStyle.merge(
                  style: context.textTheme.titleSmall!.copyWith(
                    color: selected
                        ? context.colors.onAccent
                        : context.colors.muted,
                  ),
                  child: IconTheme.merge(
                    data: IconThemeData(
                      color: selected
                          ? context.colors.onAccent
                          : context.colors.muted,
                      size: 16,
                    ),
                    child: Center(child: label),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.all(AppSpacing.xs),
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.circular(AppRadii.lg + 2),
        border: Border.all(color: context.colors.line, width: 1.5),
      ),
      child: Row(
        children: [
          tab(
            FacilitatorTab.board,
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.workspace_premium_rounded),
                const SizedBox(width: AppSpacing.xs + 2),
                Text(l10n.sessionBoardTabBoard),
              ],
            ),
          ),
          tab(
            FacilitatorTab.myAnswers,
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(l10n.sessionBoardTabMyAnswers),
                if (missing > 0) ...[
                  const SizedBox(width: AppSpacing.xs + 2),
                  Semantics(
                    label: l10n.sessionBoardTabMissing(missing),
                    child: Container(
                      constraints: const BoxConstraints(minWidth: 20),
                      height: 20,
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: context.statusColors.pending,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        '$missing',
                        style: context.textTheme.labelSmall!.copyWith(
                          color: context.statusColors.onStatus,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStageBar(BuildContext context, FacilitatorBoardState board) {
    return Padding(
      padding: const EdgeInsets.only(top: AppSpacing.sm),
      child: StageBar(
        current: view.stage,
        viewing: board.viewing ?? view.stage,
        isClosed: _isClosed,
        isVerbal: !view.isOnline,
        onSelect: (stage) {
          if (stage.index > view.stage.index && !_isClosed) {
            AppToast.show(context, context.l10n.sessionBoardStageNotYet);
            return;
          }
          context.read<FacilitatorBoardCubit>().view(
            stage,
            current: view.stage,
          );
        },
      ),
    );
  }

  Widget _buildHeadline(BuildContext context, FacilitatorStage viewing) {
    final l10n = context.l10n;
    final progress = BoardProgress.of(_session, viewing);
    final subtitle = _subtitle(context, viewing, progress);
    final info = _session.session;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                (_isClosed
                        ? l10n.sessionBoardKickerSession
                        : l10n.sessionBoardKickerTableIsAt)
                    .toUpperCase(),
                style: context.textStyles.kicker,
              ),
              Text(
                _isClosed
                    ? l10n.sessionBoardClosedTitle
                    : view.stage.title(l10n),
                style: context.textTheme.displaySmall,
              ),
              Text(
                viewing != view.stage && !_isClosed
                    ? l10n.sessionBoardViewingPrefix(
                        viewing.title(l10n),
                        subtitle,
                      )
                    : subtitle,
                style: context.textTheme.bodyMedium!.copyWith(
                  color: context.colors.muted,
                ),
              ),
            ],
          ),
        ),
        SessionTimer(
          startedAt: info.startedAt,
          endedAt: info.endedAt,
          limitMinutes: _session.table.durationMinutes,
        ),
      ],
    );
  }

  String _subtitle(
    BuildContext context,
    FacilitatorStage viewing,
    BoardProgress progress,
  ) {
    final l10n = context.l10n;
    if (!view.isOnline && viewing.index >= FacilitatorStage.followUp.index) {
      return l10n.sessionBoardOfflineSubtitle;
    }
    return switch (viewing) {
      FacilitatorStage.open => l10n.sessionBoardSubtitleOpen(
        _session.seatCount,
        AppLimits.maxTableSeats,
      ),
      FacilitatorStage.attendance => l10n.sessionBoardSubtitleAttendance(
        progress.done,
        progress.total,
      ),
      FacilitatorStage.followUp => l10n.sessionBoardSubtitleFollowUp(
        progress.done,
        progress.total,
        progress.noPrevious,
      ),
      FacilitatorStage.value => l10n.sessionBoardSubtitleValue(
        progress.done,
        progress.total,
        progress.withPendingCommitment,
      ),
      FacilitatorStage.closing =>
        _isClosed
            ? l10n.sessionBoardSubtitleClosed(progress.done, progress.total)
            : l10n.sessionBoardSubtitleAnswersClosed(
                progress.done,
                progress.total,
              ),
    };
  }

  Widget _buildViewingRibbon(BuildContext context, FacilitatorStage viewing) {
    return Padding(
      padding: const EdgeInsets.only(top: AppSpacing.sm),
      child: AppButton(
        label: context.l10n.sessionBoardBackToCurrent(
          viewing.title(context.l10n),
        ),
        variant: AppButtonVariant.secondary,
        size: AppButtonSize.small,
        onPressed: () => context.read<FacilitatorBoardCubit>().view(
          view.stage,
          current: view.stage,
        ),
      ),
    );
  }

  Widget? _buildAttendanceError(BuildContext context) {
    final problem = view.problem;
    if (problem is! AttendanceIncompleteProblem) return null;
    final names = [
      for (final p in _session.participants)
        if (problem.personIds.contains(p.personId)) p.firstName,
    ];
    return Padding(
      padding: const EdgeInsets.only(top: AppSpacing.sm),
      child: AppMessage(
        tone: StatusTone.error,
        title: context.l10n.sessionBoardAttendanceMissing(names.join(', ')),
      ),
    );
  }

  Widget _buildTable(
    BuildContext context,
    FacilitatorStage viewing,
    double width,
  ) {
    final problem = view.problem;
    final highlighted = problem is AttendanceIncompleteProblem
        ? problem.personIds.toSet()
        : const <String>{};
    return RoundTableBoard(
      session: _session,
      viewing: viewing,
      canSeeOthers: _canSeeOthers,
      width: width,
      highlightedIds: highlighted,
      onSeatTap: (participant) => _onSeatTap(context, participant, viewing),
    );
  }

  Widget _buildValueChips(BuildContext context) {
    final l10n = context.l10n;
    Widget chip(String label, String value) => Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md - 2,
        vertical: AppSpacing.xs + 1,
      ),
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.circular(AppRadii.pill),
        border: Border.all(color: context.colors.line),
      ),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(text: '$label: ', style: context.textTheme.bodySmall),
            TextSpan(
              text: value,
              style: context.textTheme.labelMedium!.copyWith(
                color: context.colors.accent,
              ),
            ),
          ],
        ),
      ),
    );
    final value = _session.value;
    final previous = _session.followUpValue;
    return Wrap(
      spacing: AppSpacing.sm - 2,
      runSpacing: AppSpacing.sm - 2,
      children: [
        chip(
          l10n.sessionBoardChipCurrent,
          l10n.sessionSharedValueLabel(value.sequence, value.name),
        ),
        if (previous != null)
          chip(
            l10n.sessionBoardChipPrevious,
            l10n.sessionSharedValueLabel(previous.sequence, previous.name),
          ),
      ],
    );
  }

  // ----------------------------------------------------------------- sheets

  void _onSeatTap(
    BuildContext context,
    SessionParticipant participant,
    FacilitatorStage viewing,
  ) {
    final l10n = context.l10n;
    final board = context.read<FacilitatorBoardCubit>();
    final canMark =
        viewing == FacilitatorStage.attendance &&
        view.stage == FacilitatorStage.attendance &&
        !_isClosed &&
        !participant.isMe;
    if (canMark) {
      AppDialogs.showSheet<void>(
        context,
        title: l10n.sessionBoardAttendanceTitle(participant.fullName),
        builder: (sheetContext) => AttendanceSheet(
          participant: participant,
          onCancel: () => Navigator.of(sheetContext).pop(),
          onPick: (AttendanceStatus status) {
            Navigator.of(sheetContext).pop();
            board.mark(
              sessionId: _session.session.id,
              personId: participant.personId,
              status: status,
            );
          },
        ),
      );
      return;
    }
    AppDialogs.showSheet<void>(
      context,
      title: participant.fullName,
      builder: (sheetContext) => ParticipantSheet(
        session: _session,
        participant: participant,
        canSeeOthers: _canSeeOthers,
        showStaleWarning: view.sync.hasStalePending,
        onClose: () => Navigator.of(sheetContext).pop(),
        onOpenMyAnswers: participant.isMe
            ? () {
                Navigator.of(sheetContext).pop();
                board.selectTab(FacilitatorTab.myAnswers);
              }
            : null,
      ),
    );
  }

  // ------------------------------------------------------------------ dock

  Widget _buildDock(BuildContext context) {
    final board = context.read<FacilitatorBoardCubit>();
    final session = context.read<SessionCubit>();
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.pagePhone,
        AppSpacing.sm,
        AppSpacing.pagePhone,
        AppSpacing.md,
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        heightFactor: 1,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 560),
          child: BoardDock(
            view: view,
            myMissingStepCount: _myMissingStepCount,
            onAdvance: session.advance,
            onMarkEveryonePresent: () => board.markEveryonePresent(
              sessionId: _session.session.id,
              personIds: [
                for (final p in _session.unmarkedParticipants) p.personId,
              ],
            ),
            onOpenMyAnswers: () => board.selectTab(FacilitatorTab.myAnswers),
            onSync: session.syncNow,
          ),
        ),
      ),
    );
  }

  // -------------------------------------------------------- "Mis respuestas"

  Widget _buildMyAnswersTab(BuildContext context, FacilitatorBoardState board) {
    final l10n = context.l10n;
    final progress = BoardProgress.of(
      _session,
      view.stage.index < FacilitatorStage.followUp.index
          ? FacilitatorStage.followUp
          : view.stage,
    );
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.pagePhone,
        AppSpacing.sm,
        AppSpacing.pagePhone,
        0,
      ),
      child: Column(
        children: [
          _buildTabs(context, board),
          const SizedBox(height: AppSpacing.sm),
          Container(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.md,
              AppSpacing.xs,
              AppSpacing.xs,
              AppSpacing.xs,
            ),
            decoration: BoxDecoration(
              color: context.colors.accent.withValues(alpha: 0.14),
              borderRadius: BorderRadius.circular(AppRadii.lg),
              border: Border.all(color: context.colors.accent, width: 1.5),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    view.stage.index >= FacilitatorStage.followUp.index
                        ? l10n.sessionBoardMiniStageWithCount(
                            view.stage.title(l10n),
                            progress.done,
                            progress.total,
                          )
                        : l10n.sessionBoardMiniStage(view.stage.title(l10n)),
                    style: context.textTheme.labelMedium,
                  ),
                ),
                AppButton(
                  label: l10n.sessionBoardGoToTable,
                  variant: AppButtonVariant.secondary,
                  size: AppButtonSize.small,
                  fullWidth: false,
                  onPressed: () => context
                      .read<FacilitatorBoardCubit>()
                      .selectTab(FacilitatorTab.board),
                ),
              ],
            ),
          ),
          Expanded(child: MemberFlowView(view: view, embedded: true)),
        ],
      ),
    );
  }
}

/// Runs [onStart] once after the first frame (the board opened already in
/// the attendance stage, so no state change will trigger the listener).
class _SelfMarkOnStart extends StatefulWidget {
  const _SelfMarkOnStart({required this.onStart, required this.child});

  final VoidCallback? onStart;
  final Widget child;

  @override
  State<_SelfMarkOnStart> createState() => _SelfMarkOnStartState();
}

class _SelfMarkOnStartState extends State<_SelfMarkOnStart> {
  @override
  void initState() {
    super.initState();
    final onStart = widget.onStart;
    if (onStart != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) => onStart());
    }
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
