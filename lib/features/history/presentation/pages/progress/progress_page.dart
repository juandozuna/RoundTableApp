import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/extensions/build_context_x.dart';
import '../../../../../core/theme/app_spacing.dart';
import '../../../../../core/widgets/app_scaffold.dart';
import '../../../../../core/widgets/empty_state.dart';
import '../../../../../core/widgets/offline_banner.dart';
import '../../../../../core/widgets/skeleton.dart';
import '../../widgets/member_history_view.dart';
import '../../widgets/table_history_view.dart';
import 'cubit/progress_cubit.dart';
import 'cubit/progress_state.dart';

/// "Progreso": the member's own history, or the facilitator's table history.
class ProgressPage extends StatelessWidget {
  const ProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProgressCubit, ProgressState>(
      builder: (context, state) => AppScaffold(
        title: _title(context, state),
        maxContentWidth: 1040,
        banner: state.online
            ? null
            : OfflineBanner(detail: context.l10n.historyOfflineDetail),
        body: _buildBody(context, state),
      ),
    );
  }

  String _title(BuildContext context, ProgressState state) =>
      state.status == ProgressStatus.facilitator
      ? context.l10n.historyTableTitle
      : context.l10n.historyMemberTitle;

  Widget _buildBody(BuildContext context, ProgressState state) {
    final l10n = context.l10n;
    final member = state.member;
    final table = state.table;
    return switch (state.status) {
      ProgressStatus.loading => const Padding(
        padding: EdgeInsets.only(top: AppSpacing.lg),
        child: SkeletonList(count: 3),
      ),
      ProgressStatus.unavailable => EmptyState(
        icon: Icons.timeline_rounded,
        title: l10n.historyUnavailableTitle,
        message: l10n.historyUnavailableMessage,
      ),
      ProgressStatus.failure => ErrorState(
        message: l10n.historyLoadError,
        onRetry: context.read<ProgressCubit>().load,
      ),
      ProgressStatus.member when member != null => _scroll(
        MemberHistoryView(history: member),
      ),
      ProgressStatus.facilitator when table != null => _scroll(
        TableHistoryView(history: table),
      ),
      _ => const SizedBox.shrink(),
    };
  }

  Widget _scroll(Widget child) => ListView(
    padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
    children: [child],
  );
}
