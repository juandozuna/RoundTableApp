import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/extensions/build_context_x.dart';
import '../../../../../core/widgets/app_scaffold.dart';
import '../../../../../core/widgets/empty_state.dart';
import '../../../../../core/widgets/skeleton.dart';
import '../../../session_routes.dart';
import '../facilitator_board/facilitator_session_view.dart';
import '../member_flow/member_flow_view.dart';
import 'cubit/session_cubit.dart';
import 'cubit/session_state.dart';

/// Entry of the live session. Picks the facilitator board or the member
/// flow from the person's role at the table.
class SessionPage extends StatelessWidget {
  const SessionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SessionCubit, SessionState>(
      builder: (context, state) => switch (state) {
        SessionLoading() => _buildStatus(context, const SkeletonList(count: 3)),
        SessionUnavailable() => _buildStatus(
          context,
          EmptyState(
            icon: Icons.groups_outlined,
            title: context.l10n.sessionSharedUnavailableTitle,
            message: context.l10n.sessionSharedUnavailableMessage,
          ),
        ),
        SessionFailure() => _buildStatus(
          context,
          ErrorState(onRetry: context.read<SessionCubit>().retry),
        ),
        SessionReady(:final view) =>
          view.session.iAmFacilitator
              ? FacilitatorSessionView(view: view)
              : MemberFlowView(view: view),
      },
    );
  }

  Widget _buildStatus(BuildContext context, Widget body) => AppScaffold(
    title: context.l10n.sessionSharedNavLabel,
    backFallbackLocation: SessionRoutes.backFallback,
    body: body,
  );
}
