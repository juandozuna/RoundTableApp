import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../core/config/injection.dart';
import '../../core/models/user_role.dart';
import '../../core/routing/app_page_transitions.dart';
import '../../core/routing/feature_router.dart';
import 'presentation/pages/facilitator_board/cubit/facilitator_board_cubit.dart';
import 'presentation/pages/member_flow/cubit/member_flow_cubit.dart';
import 'presentation/pages/session/cubit/session_cubit.dart';
import 'presentation/pages/session/session_page.dart';
import 'session_routes.dart';

/// The live session: full-screen, outside the app shell.
class SessionFeatureRouter extends FeatureRouter {
  const SessionFeatureRouter();

  @override
  List<RouteBase> get routes => [
    GoRoute(
      path: SessionRoutes.live,
      pageBuilder: (context, state) =>
          AppPageTransitions.slideUp(state: state, child: _page(null)),
    ),
    GoRoute(
      path: SessionRoutes.liveForTable,
      pageBuilder: (context, state) => AppPageTransitions.slideUp(
        state: state,
        child: _page(state.pathParameters[SessionRoutes.tableIdParam]),
      ),
    ),
  ];

  @override
  List<ShellDestination> get destinations => [
    ShellDestination(
      location: SessionRoutes.live,
      icon: Icons.groups_outlined,
      selectedIcon: Icons.groups_rounded,
      label: (l10n) => l10n.sessionSharedNavLabel,
      roles: const {UserRole.facilitator, UserRole.member},
      order: 10,
    ),
  ];

  static Widget _page(String? tableId) => MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => getIt<SessionCubit>()..start(tableId: tableId),
      ),
      BlocProvider(create: (_) => getIt<MemberFlowCubit>()),
      BlocProvider(create: (_) => getIt<FacilitatorBoardCubit>()),
    ],
    child: const SessionPage(),
  );
}
