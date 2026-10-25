import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../core/config/injection.dart';
import '../../core/routing/app_page_transitions.dart';
import '../../core/routing/feature_router.dart';
import 'presentation/pages/component_gallery/component_gallery_page.dart';
import 'presentation/pages/home/cubit/home_cubit.dart';
import 'presentation/pages/home/home_page.dart';
import 'shell_routes.dart';

/// Placeholder feature proving router + DI + theme + l10n wiring. The home
/// feature replaces the home route later.
class ShellFeatureRouter extends FeatureRouter {
  const ShellFeatureRouter({required this.includeComponentGallery});

  final bool includeComponentGallery;

  @override
  List<RouteBase> get shellRoutes => [
    GoRoute(
      path: ShellRoutes.home,
      pageBuilder: (context, state) => AppPageTransitions.fade(
        state: state,
        child: BlocProvider(
          create: (_) => getIt<HomeCubit>(),
          child: HomePage(showGalleryLink: includeComponentGallery),
        ),
      ),
    ),
  ];

  @override
  List<RouteBase> get routes => [
    if (includeComponentGallery)
      GoRoute(
        path: ShellRoutes.componentGallery,
        builder: (context, state) => ComponentGalleryPage(
          initialDark:
              state.uri.queryParameters[ShellRoutes.themeQueryKey] ==
              ShellRoutes.themeDark,
          initialLight:
              state.uri.queryParameters[ShellRoutes.themeQueryKey] ==
              ShellRoutes.themeLight,
        ),
      ),
  ];

  @override
  List<ShellDestination> get destinations => [
    ShellDestination(
      location: ShellRoutes.home,
      icon: Icons.home_outlined,
      selectedIcon: Icons.home_rounded,
      label: (l10n) => l10n.navHome,
      order: 0,
    ),
  ];

  @override
  List<String> get publicLocations => [
    if (includeComponentGallery) ShellRoutes.componentGallery,
  ];
}
