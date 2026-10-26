import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/extensions/build_context_x.dart';
import '../../../../../core/theme/app_spacing.dart';
import '../../../../../core/widgets/app_scaffold.dart';
import '../../../../../core/widgets/empty_state.dart';
import '../../../../../core/widgets/offline_banner.dart';
import '../../../../../core/widgets/skeleton.dart';
import '../../../history_routes.dart';
import '../../widgets/member_history_view.dart';
import 'cubit/member_timeline_cubit.dart';
import 'cubit/member_timeline_state.dart';

/// One member's timeline for the table's facilitator.
class MemberTimelinePage extends StatelessWidget {
  const MemberTimelinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MemberTimelineCubit, MemberTimelineState>(
      builder: (context, state) {
        final name = state.history?.name ?? '';
        return AppScaffold(
          title: name.isEmpty
              ? context.l10n.historyMemberTitle
              : context.l10n.historyTimelineTitle(name),
          backFallbackLocation: HistoryRoutes.progress,
          maxContentWidth: 1040,
          banner: state.online
              ? null
              : OfflineBanner(detail: context.l10n.historyOfflineDetail),
          body: _buildBody(context, state),
        );
      },
    );
  }

  Widget _buildBody(BuildContext context, MemberTimelineState state) {
    final history = state.history;
    return switch (state.status) {
      MemberTimelineStatus.loading => const Padding(
        padding: EdgeInsets.only(top: AppSpacing.lg),
        child: SkeletonList(count: 3),
      ),
      MemberTimelineStatus.failure => ErrorState(
        message: context.l10n.historyLoadError,
        onRetry: context.read<MemberTimelineCubit>().retry,
      ),
      MemberTimelineStatus.ready when history != null => ListView(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
        children: [MemberHistoryView(history: history)],
      ),
      _ => const SizedBox.shrink(),
    };
  }
}
