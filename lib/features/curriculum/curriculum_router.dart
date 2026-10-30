import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../core/config/injection.dart';
import '../../core/models/user_role.dart';
import '../../core/routing/app_page_transitions.dart';
import '../../core/routing/feature_router.dart';
import 'curriculum_routes.dart';
import 'presentation/pages/curriculum/cubit/curriculum_cubit.dart';
import 'presentation/pages/curriculum/curriculum_page.dart';
import 'presentation/pages/curriculum_upload/cubit/curriculum_upload_cubit.dart';
import 'presentation/pages/curriculum_upload/curriculum_upload_page.dart';

/// Curriculum and content languages (platform administrators, online only).
class CurriculumFeatureRouter extends FeatureRouter {
  const CurriculumFeatureRouter();

  @override
  List<RouteBase> get shellRoutes => [
    GoRoute(
      path: CurriculumRoutes.curriculum,
      pageBuilder: (context, state) {
        final locale = state.uri.queryParameters[CurriculumRoutes.localeQuery];
        return AppPageTransitions.fade(
          state: state,
          child: BlocProvider(
            key: ValueKey('curriculum-$locale'),
            create: (_) => getIt<CurriculumCubit>()..load(locale: locale),
            child: const CurriculumPage(),
          ),
        );
      },
    ),
  ];

  @override
  List<RouteBase> get routes => [
    GoRoute(
      path: CurriculumRoutes.upload,
      pageBuilder: (context, state) {
        final locale = state.uri.queryParameters[CurriculumRoutes.localeQuery];
        return AppPageTransitions.slideUp(
          state: state,
          child: BlocProvider(
            create: (_) => getIt<CurriculumUploadCubit>(),
            child: CurriculumUploadPage(locale: locale),
          ),
        );
      },
    ),
  ];

  @override
  List<ShellDestination> get destinations => [
    ShellDestination(
      location: CurriculumRoutes.curriculum,
      icon: Icons.menu_book_outlined,
      selectedIcon: Icons.menu_book_rounded,
      label: (l10n) => l10n.curriculumNav,
      roles: const {UserRole.administrator},
      order: 24,
    ),
  ];
}
