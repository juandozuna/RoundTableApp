import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../core/config/injection.dart';
import '../../core/routing/app_page_transitions.dart';
import '../../core/routing/feature_router.dart';
import 'notifications_routes.dart';
import 'presentation/pages/notification_preferences/cubit/notification_preferences_cubit.dart';
import 'presentation/pages/notification_preferences/notification_preferences_page.dart';

class NotificationsFeatureRouter extends FeatureRouter {
  const NotificationsFeatureRouter();

  @override
  List<RouteBase> get routes => [
    GoRoute(
      path: NotificationsRoutes.preferences,
      pageBuilder: (context, state) => AppPageTransitions.slideUp(
        state: state,
        child: BlocProvider(
          create: (_) => getIt<NotificationPreferencesCubit>()..load(),
          child: const NotificationPreferencesPage(),
        ),
      ),
    ),
  ];
}
