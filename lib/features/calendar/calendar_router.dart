import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../core/config/injection.dart';
import '../../core/models/user_role.dart';
import '../../core/routing/app_page_transitions.dart';
import '../../core/routing/feature_router.dart';
import 'calendar_routes.dart';
import 'presentation/pages/upcoming/cubit/upcoming_cubit.dart';
import 'presentation/pages/upcoming/upcoming_page.dart';

/// Upcoming sessions for coordinators, administrators and facilitators.
class CalendarFeatureRouter extends FeatureRouter {
  const CalendarFeatureRouter();

  @override
  List<RouteBase> get shellRoutes => [
    GoRoute(
      path: CalendarRoutes.upcoming,
      pageBuilder: (context, state) => AppPageTransitions.fade(
        state: state,
        child: BlocProvider(
          create: (_) => getIt<UpcomingCubit>()..load(),
          child: const UpcomingPage(),
        ),
      ),
    ),
  ];

  @override
  List<ShellDestination> get destinations => [
    ShellDestination(
      location: CalendarRoutes.upcoming,
      icon: Icons.calendar_month_outlined,
      selectedIcon: Icons.calendar_month_rounded,
      label: (l10n) => l10n.calendarNavLabel,
      roles: const {
        UserRole.administrator,
        UserRole.coordinator,
        UserRole.facilitator,
      },
      order: 12,
    ),
  ];
}
