import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../core/config/injection.dart';
import '../../core/routing/app_page_transitions.dart';
import '../../core/routing/feature_router.dart';
import 'home_routes.dart';
import 'presentation/pages/home/cubit/home_cubit.dart';
import 'presentation/pages/home/home_page.dart';

class HomeFeatureRouter extends FeatureRouter {
  const HomeFeatureRouter({required this.includeComponentGallery});

  final bool includeComponentGallery;

  @override
  List<RouteBase> get shellRoutes => [
    GoRoute(
      path: HomeRoutes.home,
      pageBuilder: (context, state) => AppPageTransitions.fade(
        state: state,
        child: BlocProvider(
          create: (_) => getIt<HomeCubit>()..load(),
          child: HomePage(showGalleryLink: includeComponentGallery),
        ),
      ),
    ),
  ];

  @override
  List<ShellDestination> get destinations => [
    ShellDestination(
      location: HomeRoutes.home,
      icon: Icons.home_outlined,
      selectedIcon: Icons.home_rounded,
      label: (l10n) => l10n.navHome,
      order: 0,
    ),
  ];
}
