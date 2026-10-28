import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/extensions/build_context_x.dart';
import '../../../../../core/theme/app_spacing.dart';
import '../../../../../core/widgets/app_scaffold.dart';
import '../../../../../core/widgets/empty_state.dart';
import '../../../../../core/widgets/offline_banner.dart';
import '../../../../../core/widgets/skeleton.dart';
import '../../../../admin/admin_routes.dart';
import '../../../../auth/presentation/widgets/context_switcher.dart';
import '../../../domain/models/upcoming_session.dart';
import '../../calendar_format.dart';
import 'cubit/upcoming_cubit.dart';
import 'cubit/upcoming_state.dart';
import 'widgets/upcoming_filter_bar.dart';
import 'widgets/upcoming_session_card.dart';

/// Upcoming sessions: coordinators and administrators see every table they
/// manage and can filter by location, facilitator and table; a facilitator
/// sees their own table's, also offline. Phones get a column of cards,
/// wider screens a grid.
class UpcomingPage extends StatelessWidget {
  const UpcomingPage({super.key});

  static const double _cardMinWidth = 300;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpcomingCubit, UpcomingState>(
      builder: (context, state) => AppScaffold(
        title: context.l10n.calendarTitle,
        actions: const [ContextSwitcher()],
        banner: _buildBanner(context, state),
        body: switch (state.status) {
          UpcomingStatus.loading => const Padding(
            padding: EdgeInsets.only(top: AppSpacing.lg),
            child: SkeletonList(count: 3),
          ),
          UpcomingStatus.failure => ErrorState(
            message: context.l10n.calendarLoadError,
            onRetry: context.read<UpcomingCubit>().load,
          ),
          UpcomingStatus.ready => _buildContent(context, state),
        },
      ),
    );
  }

  Widget? _buildBanner(BuildContext context, UpcomingState state) {
    if (state.online) return null;
    return OfflineBanner(
      detail: state.isManager
          ? context.l10n.offlineDetailOnlineOnly
          : context.l10n.offlineDetailSavedLocally,
      onRetry: state.isManager ? context.read<UpcomingCubit>().load : null,
    );
  }

  Widget _buildContent(BuildContext context, UpcomingState state) {
    final l10n = context.l10n;
    final sessions = state.sessions!;
    if (state.isUnavailable) {
      return EmptyState(
        icon: Icons.event_busy_rounded,
        title: l10n.calendarUnavailableTitle,
        message: l10n.calendarUnavailableMessage,
      );
    }
    final cubit = context.read<UpcomingCubit>();
    final visible = state.visible;
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
      children: [
        if (sessions.canFilter) ...[
          UpcomingFilterBar(
            sessions: sessions,
            filter: state.filter,
            onLocation: cubit.filterByLocation,
            onFacilitator: cubit.filterByFacilitator,
            onTable: cubit.filterByTable,
            onClear: cubit.clearFilter,
          ),
          const SizedBox(height: AppSpacing.lg),
        ],
        if (visible.isEmpty)
          _buildEmpty(context, state)
        else ...[
          Text(
            l10n.calendarCount(visible.length),
            style: context.textTheme.labelLarge,
          ),
          const SizedBox(height: AppSpacing.md),
          ..._buildDays(context, visible, canOpenTable: state.isManager),
        ],
      ],
    );
  }

  Widget _buildEmpty(BuildContext context, UpcomingState state) {
    final l10n = context.l10n;
    return EmptyState(
      icon: Icons.event_available_rounded,
      title: l10n.calendarEmptyTitle,
      message: state.filter.isActive
          ? l10n.calendarEmptyFilteredMessage
          : l10n.calendarEmptyMessage,
    );
  }

  List<Widget> _buildDays(
    BuildContext context,
    List<UpcomingSession> sessions, {
    required bool canOpenTable,
  }) {
    final days = <DateTime, List<UpcomingSession>>{};
    for (final session in sessions) {
      days
          .putIfAbsent(CalendarFormat.day(session.localStart), () => [])
          .add(session);
    }
    return [
      for (final day in days.entries) ...[
        Padding(
          padding: const EdgeInsets.only(bottom: AppSpacing.sm),
          child: Text(
            CalendarFormat.dayHeading(context.l10n, day.key),
            style: context.textTheme.titleMedium,
          ),
        ),
        _buildDay(context, day.value, canOpenTable: canOpenTable),
        const SizedBox(height: AppSpacing.lg),
      ],
    ];
  }

  Widget _buildDay(
    BuildContext context,
    List<UpcomingSession> sessions, {
    required bool canOpenTable,
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final columns = (constraints.maxWidth / _cardMinWidth).floor().clamp(
          1,
          3,
        );
        final width =
            (constraints.maxWidth - AppSpacing.md * (columns - 1)) / columns;
        return Wrap(
          spacing: AppSpacing.md,
          runSpacing: AppSpacing.md,
          children: [
            for (final session in sessions)
              SizedBox(
                width: width,
                child: UpcomingSessionCard(
                  session: session,
                  onTap: canOpenTable
                      ? () => context.push(
                          AdminRoutes.tablePath(session.roundTableId),
                        )
                      : null,
                ),
              ),
          ],
        );
      },
    );
  }
}
