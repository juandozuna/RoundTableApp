import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/extensions/build_context_x.dart';
import '../../../../../core/services/clock/clock_service.dart';
import '../../../../../core/services/clock/system_clock_service.dart';
import '../../../../../core/theme/app_spacing.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_scaffold.dart';
import '../../../../../core/widgets/app_toast.dart';
import '../../../../../core/widgets/offline_banner.dart';
import '../../../domain/models/facilitator_stage.dart';
import '../../../domain/models/member_flow.dart';
import '../../../domain/models/member_step.dart';
import '../../../session_routes.dart';
import '../../widgets/session_formatters.dart';
import '../session/cubit/session_cubit.dart';
import '../session/cubit/session_state.dart';
import 'cubit/member_flow_cubit.dart';
import 'cubit/member_flow_state.dart';
import 'widgets/auto_attendance_note.dart';
import 'widgets/commitment_panel.dart';
import 'widgets/follow_up_panel.dart';
import 'widgets/member_attendance_panel.dart';
import 'widgets/member_lobby_panel.dart';
import 'widgets/member_notice_panel.dart';
import 'widgets/member_recap_panel.dart';
import 'widgets/member_room_header.dart';
import 'widgets/member_step_chips.dart';
import 'widgets/member_summary_panel.dart';
import 'widgets/member_sync_block.dart';
import 'widgets/reflection_panel.dart';

/// The member experience for every stage of the session. The facilitator also
/// lives here for their own answers ("Mis respuestas", ADR 0014), with
/// [embedded] set so the host supplies the page chrome.
class MemberFlowView extends StatefulWidget {
  const MemberFlowView({
    super.key,
    required this.view,
    this.embedded = false,
    this.clock = const SystemClockService(),
  });

  final SessionView view;

  /// Source of "now" for the elapsed-time timer; replaced in tests.
  final ClockService clock;

  /// Rendered inside the facilitator's tab: no scaffold, no room header.
  final bool embedded;

  /// Readable width of the single column on tablets and desktop.
  static const double maxContentWidth = 560;

  @override
  State<MemberFlowView> createState() => _MemberFlowViewState();
}

class _MemberFlowViewState extends State<MemberFlowView> {
  @override
  void initState() {
    super.initState();
    _restoreDraft();
  }

  @override
  void didUpdateWidget(MemberFlowView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.view.session.session.id != widget.view.session.session.id) {
      _restoreDraft();
    }
  }

  /// Brings back what this person had typed (and not yet sent) in this
  /// session before the app was closed.
  void _restoreDraft() {
    final session = widget.view.session;
    context.read<MemberFlowCubit>().restoreDraft(
      sessionId: session.session.id,
      personId: session.myPersonId,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MemberFlowCubit, MemberFlowState>(
      listenWhen: (previous, current) =>
          (current.justSaved != null &&
              current.justSaved != previous.justSaved) ||
          (current.failure != null && current.failure != previous.failure),
      listener: _onStateChanged,
      builder: (context, state) {
        final flow = MemberFlow(
          widget.view.session,
          live: widget.view.isLive,
          noPreviousAcknowledged: state.noPreviousAcknowledged,
        );
        final screen = flow.screen(chosen: state.chosenStep);
        final content = _buildContent(context, flow, screen, state);
        final dock = _buildDock(context, flow, screen, state);
        return widget.embedded
            ? _buildEmbedded(content, dock)
            : _buildPage(context, content, dock);
      },
    );
  }

  void _onStateChanged(BuildContext context, MemberFlowState state) {
    final l10n = context.l10n;
    final cubit = context.read<MemberFlowCubit>();
    if (state.failure != null) {
      AppToast.show(
        context,
        l10n.sessionMemberToastFailed,
        kind: AppToastKind.error,
      );
    } else if (state.justSaved != null) {
      AppToast.show(
        context,
        widget.view.isLive
            ? l10n.sessionMemberToastSent
            : l10n.sessionSharedNoticeSavedOnDevice,
        kind: AppToastKind.success,
      );
    }
    cubit.consumeSaved();
  }

  // ------------------------------------------------------------- layout

  Widget _buildPage(BuildContext context, Widget content, Widget? dock) {
    final table = widget.view.session.table;
    return BlocListener<SessionCubit, SessionState>(
      listenWhen: (previous, current) =>
          current is SessionReady && current.view.notice != null,
      listener: _onNotice,
      child: AppScaffold(
        title: table.name,
        backFallbackLocation: SessionRoutes.backFallback,
        maxContentWidth: MemberFlowView.maxContentWidth,
        banner: widget.view.isOnline
            ? null
            : OfflineBanner(
                detail: context.l10n.sessionMemberOfflineBannerDetail,
              ),
        bottomBar: dock == null ? null : _constrain(dock),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: AppSpacing.sm),
              child: MemberRoomHeader(view: widget.view, clock: widget.clock),
            ),
            const SizedBox(height: AppSpacing.sm),
            Expanded(child: SingleChildScrollView(child: content)),
          ],
        ),
      ),
    );
  }

  Widget _buildEmbedded(Widget content, Widget? dock) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: MemberFlowView.maxContentWidth,
                ),
                child: content,
              ),
            ),
          ),
        ),
        if (dock != null) _constrain(dock),
      ],
    );
  }

  Widget _constrain(Widget dock) => Center(
    heightFactor: 1,
    child: ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: MemberFlowView.maxContentWidth,
      ),
      child: dock,
    ),
  );

  void _onNotice(BuildContext context, SessionState state) {
    if (state is! SessionReady) return;
    final l10n = context.l10n;
    final notice = state.view.notice;
    if (notice == null) return;
    AppToast.show(context, switch (notice) {
      SessionNotice.savedOnDevice => l10n.sessionSharedNoticeSavedOnDevice,
      SessionNotice.reconnected => l10n.sessionSharedNoticeReconnected,
    });
    context.read<SessionCubit>().consumeNotice();
  }

  // ------------------------------------------------------------ content

  bool _showsStepChips(MemberScreen screen) {
    final isStepScreen = const {
      MemberScreen.followUp,
      MemberScreen.reflection,
      MemberScreen.commitment,
      MemberScreen.recap,
    }.contains(screen);
    final stageReached =
        !widget.view.isLive && !widget.view.session.iAmFacilitator ||
        widget.view.stage.index >= FacilitatorStage.followUp.index;
    return isStepScreen && stageReached;
  }

  bool _showsAutoAttendance(MemberScreen screen) =>
      AutoAttendanceNote.appliesTo(widget.view.session.me) &&
      const {
        MemberScreen.followUp,
        MemberScreen.reflection,
        MemberScreen.commitment,
        MemberScreen.recap,
      }.contains(screen);

  MemberStep? _stepOf(MemberScreen screen) => switch (screen) {
    MemberScreen.followUp => MemberStep.followUp,
    MemberScreen.reflection => MemberStep.reflection,
    MemberScreen.commitment => MemberStep.commitment,
    _ => null,
  };

  Widget _buildContent(
    BuildContext context,
    MemberFlow flow,
    MemberScreen screen,
    MemberFlowState state,
  ) {
    final cubit = context.read<MemberFlowCubit>();
    return Padding(
      padding: EdgeInsets.only(
        top: widget.embedded ? AppSpacing.sm : 0,
        bottom: AppSpacing.xl,
        left: widget.embedded ? AppSpacing.pagePhone : 0,
        right: widget.embedded ? AppSpacing.pagePhone : 0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (_showsStepChips(screen))
            MemberStepChips(
              flow: flow,
              currentStep: _stepOf(screen),
              onSelected: cubit.chooseStep,
            ),
          MemberSyncBlock(view: widget.view, onSyncNow: _syncNow(context)),
          if (_showsAutoAttendance(screen))
            Padding(
              padding: const EdgeInsets.only(top: AppSpacing.md),
              child: AutoAttendanceNote(me: widget.view.session.me),
            ),
          _buildPanel(context, flow, screen, state),
        ],
      ),
    );
  }

  VoidCallback _syncNow(BuildContext context) =>
      () => context.read<SessionCubit>().syncNow();

  Widget _buildPanel(
    BuildContext context,
    MemberFlow flow,
    MemberScreen screen,
    MemberFlowState state,
  ) {
    final session = widget.view.session;
    final l10n = context.l10n;
    return switch (screen) {
      MemberScreen.lobby => MemberLobbyPanel(me: session.me),
      MemberScreen.attendance => MemberAttendancePanel(me: session.me),
      MemberScreen.followUp => FollowUpPanel(flow: flow, state: state),
      MemberScreen.reflection => ReflectionPanel(flow: flow, state: state),
      MemberScreen.commitment => CommitmentPanel(flow: flow, state: state),
      MemberScreen.recap => MemberRecapPanel(
        flow: flow,
        answersClosed: session.session.answersClosed,
      ),
      MemberScreen.summary => MemberSummaryPanel(flow: flow),
      MemberScreen.notToday => MemberNoticePanel(
        leading: const Icon(Icons.event_rounded, size: 40),
        title: l10n.sessionSharedNotTodayTitle,
        message: l10n.sessionSharedNotTodayMessage(
          SessionFormatters.when(context, session.session.scheduledAt),
        ),
      ),
      MemberScreen.cancelled => MemberNoticePanel(
        leading: const Icon(Icons.event_busy_rounded, size: 40),
        title: l10n.sessionSharedCancelledTitle,
        message: l10n.sessionSharedCancelledMessage,
      ),
    };
  }

  // --------------------------------------------------------------- dock

  Widget? _buildDock(
    BuildContext context,
    MemberFlow flow,
    MemberScreen screen,
    MemberFlowState state,
  ) {
    final step = _stepOf(screen);
    if (step == null) return null;
    final l10n = context.l10n;
    final cubit = context.read<MemberFlowCubit>();
    final session = widget.view.session;

    String? disabledLabel;
    VoidCallback? onPressed;
    String? label;
    IconData? icon;
    if (!flow.applies(step)) {
      if (state.noPreviousAcknowledged) {
        disabledLabel = l10n.sessionMemberDockReadyWaiting;
      } else {
        label = l10n.sessionMemberDockContinue;
        onPressed = cubit.acknowledgeNoPrevious;
      }
    } else {
      switch (flow.accessOf(step)) {
        case StepAccess.done:
          disabledLabel = flow.isLive && !session.iAmFacilitator
              ? l10n.sessionMemberDockSentWaiting
              : l10n.sessionMemberDockSaved;
        case StepAccess.closed:
        case StepAccess.notYet:
        case StepAccess.skipped:
          disabledLabel = l10n.sessionMemberDockClosed;
        case StepAccess.open:
          icon = Icons.send_rounded;
          (label, onPressed) = switch (step) {
            MemberStep.followUp => (
              l10n.sessionMemberFollowUpSend,
              () => cubit.submitFollowUp(flow),
            ),
            MemberStep.reflection => (
              l10n.sessionMemberReflectionSend,
              () => cubit.submitReflection(flow),
            ),
            MemberStep.commitment => (
              l10n.sessionMemberCommitmentSend,
              () => cubit.submitCommitment(flow),
            ),
          };
      }
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.pagePhone,
        AppSpacing.sm,
        AppSpacing.pagePhone,
        AppSpacing.lg,
      ),
      child: AppButton(
        label: disabledLabel ?? label!,
        icon: icon,
        onPressed: disabledLabel != null ? null : onPressed,
        loading: state.submitting == step,
      ),
    );
  }
}
