import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../core/config/injection.dart';
import '../../core/routing/app_page_transitions.dart';
import '../../core/routing/feature_router.dart';
import 'presentation/pages/profile_edit/cubit/profile_edit_cubit.dart';
import 'presentation/pages/profile_edit/profile_edit_page.dart';
import 'presentation/pages/settings/cubit/settings_cubit.dart';
import 'presentation/pages/settings/settings_page.dart';
import 'settings_routes.dart';

class SettingsFeatureRouter extends FeatureRouter {
  const SettingsFeatureRouter();

  @override
  List<RouteBase> get shellRoutes => [
    GoRoute(
      path: SettingsRoutes.settings,
      pageBuilder: (context, state) => AppPageTransitions.fade(
        state: state,
        child: BlocProvider(
          create: (_) => getIt<SettingsCubit>()..load(),
          child: const SettingsPage(),
        ),
      ),
    ),
  ];

  @override
  List<RouteBase> get routes => [
    GoRoute(
      path: SettingsRoutes.profile,
      pageBuilder: (context, state) => AppPageTransitions.slideUp(
        state: state,
        child: BlocProvider(
          create: (_) => getIt<ProfileEditCubit>()..load(),
          child: const ProfileEditPage(),
        ),
      ),
    ),
  ];

  @override
  List<ShellDestination> get destinations => [
    ShellDestination(
      location: SettingsRoutes.settings,
      icon: Icons.settings_outlined,
      selectedIcon: Icons.settings_rounded,
      label: (l10n) => l10n.navSettings,
      order: 90,
    ),
  ];
}
