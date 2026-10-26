import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/extensions/build_context_x.dart';
import '../../../../../core/models/health_status.dart';
import '../../../../../core/network/api_error_messages.dart';
import '../../../../../core/network/api_exception.dart';
import '../../../../../core/sync/domain/sync_snapshot.dart';
import '../../../../../core/theme/app_spacing.dart';
import '../../../../../core/theme/status_tone.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_card.dart';
import '../../../../../core/widgets/app_scaffold.dart';
import '../../../../../core/widgets/empty_state.dart';
import '../../../../../core/widgets/offline_banner.dart';
import '../../../../../core/widgets/seat_pips.dart';
import '../../../../../core/widgets/skeleton.dart';
import '../../../../../core/widgets/status_pill.dart';
import '../../../../../core/widgets/sync_pill.dart';
import '../../../../auth/presentation/widgets/context_switcher.dart';
import '../../../../notifications/presentation/widgets/unsynced_data_banner.dart';
import '../../../domain/models/home_commitment.dart';
import '../../../domain/models/home_kpi_summary.dart';
import '../../../domain/models/home_overview.dart';
import '../../../domain/models/home_progress.dart';
import '../../../domain/models/home_session.dart';
import '../../../home_routes.dart';
import 'cubit/home_cubit.dart';
import 'cubit/home_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, this.showGalleryLink = false});

  /// Dev-only shortcut to the component gallery.
  final bool showGalleryLink;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) => AppScaffold(
        title: context.l10n.homeTitle,
        actions: const [ContextSwitcher()],
        maxContentWidth: AppSpacing.contentMaxWidth,
        banner: _buildBanner(context, state),
        body: switch (state.status) {
          HomeStatus.loading => _buildLoading(),
          HomeStatus.failure => _buildFailure(context, state),
          HomeStatus.ready => _buildContent(context, state),
        },
      ),
    );
  }

  Widget? _buildBanner(BuildContext context, HomeState state) {
    if (state.online) return null;
    final isManager = state.overview is HomeManager;
    return OfflineBanner(
      detail: isManager
          ? context.l10n.offlineDetailOnlineOnly
          : context.l10n.offlineDetailSavedLocally,
      onRetry: isManager ? context.read<HomeCubit>().load : null,
    );
  }

  Widget _buildLoading() {
    return const Padding(
      padding: EdgeInsets.only(top: AppSpacing.lg),
      child: SkeletonList(count: 3),
    );
  }

  Widget _buildFailure(BuildContext context, HomeState state) {
    final error = state.error;
    return ErrorState(
      message: error is ApiException
          ? error.userMessage(context.l10n)
          : context.l10n.errorGeneric,
      onRetry: context.read<HomeCubit>().load,
    );
  }

  Widget _buildContent(BuildContext context, HomeState state) {
    final l10n = context.l10n;
    final overview = state.overview;
    final cards = switch (overview) {
      HomeNoContext() => [
        EmptyState(
          icon: Icons.group_work_outlined,
          title: l10n.homeNoContextTitle,
          message: l10n.homeNoContextMessage,
        ),
      ],
      HomeFacilitator() => [
        _buildSessionCard(context, overview.session, isFacilitator: true),
      ],
      HomeMember() => [
        _buildSessionCard(context, overview.session, isFacilitator: false),
        _buildCommitmentCard(context, overview.lastCommitment),
        _buildProgressCard(context, overview.progress),
      ],
      HomeManager() => [
        _buildKpiCard(context, overview.kpis),
        _buildInvitesCard(context, overview.pendingInvites),
      ],
    };
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
      children: [
        const UnsyncedDataBanner(),
        for (final card in cards) ...[
          card,
          const SizedBox(height: AppSpacing.lg),
        ],
        if (overview is HomeFacilitator || overview is HomeMember) ...[
          _buildProgressLink(
            context,
            isFacilitator: overview is HomeFacilitator,
          ),
          const SizedBox(height: AppSpacing.lg),
        ],
        if (overview is! HomeManager && overview is! HomeNoContext)
          _buildSync(context, state.sync),
        if (showGalleryLink) ...[
          const SizedBox(height: AppSpacing.xl),
          AppButton(
            label: l10n.homeOpenGallery,
            icon: Icons.widgets_rounded,
            variant: AppButtonVariant.secondary,
            onPressed: () => context.push('/dev/galeria'),
          ),
        ],
      ],
    );
  }

  Widget _buildProgressLink(
    BuildContext context, {
    required bool isFacilitator,
  }) {
    final l10n = context.l10n;
    return AppButton(
      label: isFacilitator
          ? l10n.historyHomeLinkFacilitator
          : l10n.historyHomeLinkMember,
      icon: Icons.insights_rounded,
      variant: AppButtonVariant.secondary,
      onPressed: () => context.go(HomeRoutes.progress),
    );
  }

  Widget _buildSessionCard(
    BuildContext context,
    HomeSession? session, {
    required bool isFacilitator,
  }) {
    final l10n = context.l10n;
    if (session == null) {
      return AppCard(
        child: EmptyState(
          icon: Icons.event_busy_rounded,
          title: l10n.homeNoSessionTitle,
          message: l10n.homeNoSessionMessage,
        ),
      );
    }
    final local = session.scheduledAt.toLocal();
    final when = l10n.homeSessionWhen(
      l10n.homeSessionDay(local),
      MaterialLocalizations.of(context).formatTimeOfDay(
        TimeOfDay.fromDateTime(local),
        alwaysUse24HourFormat: true,
      ),
    );
    final actionLabel = session.isOpen
        ? (isFacilitator ? l10n.homeContinueSession : l10n.homeEnterSession)
        : (isFacilitator ? l10n.homeOpenSession : l10n.homeEnterSession);
    return AppCard(
      highlighted: session.isOpen,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  l10n.homeKickerNextSession.toUpperCase(),
                  style: context.textStyles.kicker,
                ),
              ),
              if (session.isOpen)
                StatusPill(tone: StatusTone.ok, label: l10n.homeSessionOpenNow),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            session.valueSequence == null || session.valueName == null
                ? (session.valueName ?? session.tableName)
                : l10n.homeValueLine(
                    session.valueSequence!,
                    session.valueName!,
                  ),
            style: context.textTheme.headlineMedium,
          ),
          if (session.followUpValueName != null) ...[
            const SizedBox(height: AppSpacing.xs),
            Text(
              l10n.homeFollowUpLine(session.followUpValueName!),
              style: context.textTheme.bodySmall,
            ),
          ],
          const SizedBox(height: AppSpacing.md),
          Text(session.tableName, style: context.textTheme.titleMedium),
          Text(when, style: context.textTheme.bodyMedium),
          const SizedBox(height: AppSpacing.md),
          SeatPips(taken: session.seatsTaken),
          if (isFacilitator && session.health != null) ...[
            const SizedBox(height: AppSpacing.md),
            _buildHealth(context, session.health!),
          ],
          const SizedBox(height: AppSpacing.lg),
          AppButton(
            label: actionLabel,
            icon: Icons.play_arrow_rounded,
            onPressed: () =>
                context.push(HomeRoutes.session(tableId: session.roundTableId)),
          ),
        ],
      ),
    );
  }

  Widget _buildHealth(BuildContext context, HealthStatus health) {
    final l10n = context.l10n;
    final (tone, label) = switch (health) {
      HealthStatus.active => (StatusTone.ok, l10n.healthOnTrack),
      HealthStatus.delayed => (StatusTone.late, l10n.healthOffTrack),
      HealthStatus.inactive => (StatusTone.offline, l10n.homeHealthInactive),
      HealthStatus.completed => (StatusTone.info, l10n.homeHealthCompleted),
    };
    return Align(
      alignment: Alignment.centerLeft,
      child: StatusPill(tone: tone, label: label),
    );
  }

  Widget _buildCommitmentCard(
    BuildContext context,
    HomeCommitment? commitment,
  ) {
    final l10n = context.l10n;
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.homeLastCommitmentKicker.toUpperCase(),
            style: context.textStyles.kicker,
          ),
          const SizedBox(height: AppSpacing.sm),
          if (commitment == null)
            Text(l10n.homeNoCommitment, style: context.textTheme.bodyMedium)
          else ...[
            Text(commitment.actionText, style: context.textTheme.titleMedium),
            if (commitment.measureText != null) ...[
              const SizedBox(height: AppSpacing.xs),
              Text(commitment.measureText!, style: context.textTheme.bodySmall),
            ],
            if (commitment.valueName != null) ...[
              const SizedBox(height: AppSpacing.xs),
              Text(commitment.valueName!, style: context.textTheme.bodySmall),
            ],
            const SizedBox(height: AppSpacing.md),
            _buildOutcome(context, commitment.outcome),
          ],
        ],
      ),
    );
  }

  Widget _buildOutcome(BuildContext context, CommitmentOutcome? outcome) {
    final l10n = context.l10n;
    final (tone, label) = switch (outcome) {
      CommitmentOutcome.kept => (StatusTone.ok, l10n.homeCommitmentKept),
      CommitmentOutcome.partial => (
        StatusTone.late,
        l10n.homeCommitmentPartial,
      ),
      CommitmentOutcome.notKept => (
        StatusTone.error,
        l10n.homeCommitmentNotKept,
      ),
      null => (StatusTone.pending, l10n.homeCommitmentToReview),
    };
    return Align(
      alignment: Alignment.centerLeft,
      child: StatusPill(tone: tone, label: label),
    );
  }

  Widget _buildProgressCard(BuildContext context, HomeProgress progress) {
    final l10n = context.l10n;
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.homeProgressKicker.toUpperCase(),
            style: context.textStyles.kicker,
          ),
          const SizedBox(height: AppSpacing.sm),
          if (progress.isEmpty)
            Text(l10n.homeProgressEmpty, style: context.textTheme.bodyMedium)
          else ...[
            Text(
              l10n.homeProgressValues(progress.completed, progress.total),
              style: context.textTheme.titleLarge,
            ),
            const SizedBox(height: AppSpacing.md),
            for (final module in progress.modules)
              _buildModuleRow(context, module),
          ],
        ],
      ),
    );
  }

  Widget _buildModuleRow(BuildContext context, ModuleProgress module) {
    final colors = context.colors;
    final fraction = module.total == 0 ? 0.0 : module.completed / module.total;
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.md),
      child: Semantics(
        label:
            '${context.l10n.homeModuleLabel(module.number, module.name)}, '
            '${context.l10n.homeProgressValues(module.completed, module.total)}',
        excludeSemantics: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    context.l10n.homeModuleLabel(module.number, module.name),
                    style: context.textTheme.labelLarge,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  '${module.completed}/${module.total}',
                  style: context.textTheme.labelLarge,
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.xs),
            ClipRRect(
              borderRadius: BorderRadius.circular(AppRadii.pill),
              child: LinearProgressIndicator(
                value: fraction,
                minHeight: 8,
                color: colors.accent,
                backgroundColor: colors.surfaceAlt,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildKpiCard(BuildContext context, HomeKpiSummary? kpis) {
    final l10n = context.l10n;
    final summary = kpis;
    return AppCard(
      onTap: () => context.push(HomeRoutes.adminDashboard),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.homeKpiKicker.toUpperCase(),
            style: context.textStyles.kicker,
          ),
          const SizedBox(height: AppSpacing.md),
          if (summary == null)
            Text(l10n.homeKpiEmpty, style: context.textTheme.bodyMedium)
          else
            Wrap(
              spacing: AppSpacing.xl,
              runSpacing: AppSpacing.md,
              children: [
                _buildKpi(
                  context,
                  l10n.homeKpiValues,
                  '${summary.valuesCompleted}',
                ),
                _buildKpi(
                  context,
                  l10n.homeKpiImprovement,
                  summary.improvementAvg == null
                      ? '—'
                      : '+${summary.improvementAvg!.toStringAsFixed(1)}',
                ),
                _buildKpi(
                  context,
                  l10n.homeKpiAttendance,
                  summary.attendancePct == null
                      ? '—'
                      : '${summary.attendancePct!.round()}%',
                ),
                _buildKpi(
                  context,
                  l10n.homeKpiTablesActive,
                  '${summary.tables.active}',
                ),
                _buildKpi(
                  context,
                  l10n.homeKpiTablesDelayed,
                  '${summary.tables.delayed}',
                ),
              ],
            ),
          const SizedBox(height: AppSpacing.lg),
          AppButton(
            label: l10n.homeKpiViewAll,
            icon: Icons.insights_rounded,
            variant: AppButtonVariant.secondary,
            onPressed: () => context.push(HomeRoutes.adminDashboard),
          ),
        ],
      ),
    );
  }

  Widget _buildKpi(BuildContext context, String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(value, style: context.textStyles.number),
        Text(label, style: context.textTheme.bodySmall),
      ],
    );
  }

  Widget _buildInvitesCard(BuildContext context, int pending) {
    final l10n = context.l10n;
    return AppCard(
      onTap: () => context.push(HomeRoutes.invites),
      child: Row(
        children: [
          Icon(Icons.mail_outline_rounded, color: context.colors.accent),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Text(
              l10n.homeInvitesPending(pending),
              style: context.textTheme.titleMedium,
            ),
          ),
          const Icon(Icons.chevron_right_rounded),
        ],
      ),
    );
  }

  Widget _buildSync(BuildContext context, SyncSnapshot sync) {
    final l10n = context.l10n;
    if (sync.connection == SyncConnection.unavailable &&
        sync.pendingCount == 0) {
      return Text(l10n.syncUnavailable, style: context.textTheme.bodySmall);
    }
    return SyncPill(
      state: sync.aggregateState,
      detail: sync.hasStalePending
          ? l10n.syncStaleWarning
          : l10n.syncPendingCount(sync.pendingCount),
    );
  }
}
