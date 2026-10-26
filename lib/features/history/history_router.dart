import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../core/config/injection.dart';
import '../../core/models/user_role.dart';
import '../../core/routing/app_page_transitions.dart';
import '../../core/routing/feature_router.dart';
import 'history_routes.dart';
import 'presentation/pages/member_timeline/cubit/member_timeline_cubit.dart';
import 'presentation/pages/member_timeline/member_timeline_page.dart';
import 'presentation/pages/progress/cubit/progress_cubit.dart';
import 'presentation/pages/progress/progress_page.dart';

/// Progress and history for members and facilitators.
class HistoryFeatureRouter extends FeatureRouter {
  const HistoryFeatureRouter();

  @override
  List<RouteBase> get shellRoutes => [
    GoRoute(
      path: HistoryRoutes.progress,
      pageBuilder: (context, state) => AppPageTransitions.fade(
        state: state,
        child: BlocProvider(
          create: (_) => getIt<ProgressCubit>()..load(),
          child: const ProgressPage(),
        ),
      ),
    ),
    GoRoute(
      path: HistoryRoutes.memberTimeline,
      pageBuilder: (context, state) => AppPageTransitions.fade(
        state: state,
        child: BlocProvider(
          create: (_) => getIt<MemberTimelineCubit>()
            ..load(
              tableId: state.pathParameters[HistoryRoutes.tableIdParam]!,
              personId: state.pathParameters[HistoryRoutes.personIdParam]!,
            ),
          child: const MemberTimelinePage(),
        ),
      ),
    ),
  ];

  @override
  List<ShellDestination> get destinations => [
    ShellDestination(
      location: HistoryRoutes.progress,
      icon: Icons.insights_outlined,
      selectedIcon: Icons.insights_rounded,
      label: (l10n) => l10n.historyNavLabel,
      roles: const {UserRole.facilitator, UserRole.member},
      order: 15,
    ),
  ];
}
