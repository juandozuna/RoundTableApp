import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../core/config/injection.dart';
import '../../core/routing/app_page_transitions.dart';
import '../../core/routing/feature_router.dart';
import 'auth_routes.dart';
import 'presentation/cubit/access_cubit.dart';
import 'presentation/pages/access/access_page.dart';
import 'presentation/pages/account/account_page.dart';
import 'presentation/pages/context_picker/context_picker_page.dart';
import 'presentation/pages/sign_in/cubit/sign_in_cubit.dart';
import 'presentation/pages/sign_in/sign_in_page.dart';
import 'presentation/routing/access_redirect_guard.dart';

/// Sign-in gate, access states, context picker and account page. The only
/// feature that declares [signInLocation].
class AuthFeatureRouter extends FeatureRouter {
  const AuthFeatureRouter({required this.homeLocation});

  final String homeLocation;

  @override
  String? get signInLocation => AuthRoutes.signIn;

  @override
  List<String> get publicLocations => [AuthRoutes.signIn];

  @override
  String? redirect(Uri uri) =>
      getIt<AccessRedirectGuard>().redirect(uri, homeLocation: homeLocation);

  @override
  List<Stream<Object?>> get redirectRefreshStreams => [
    getIt<AccessRedirectGuard>().changes,
  ];

  @override
  List<RouteBase> get routes => [
    GoRoute(
      path: AuthRoutes.signIn,
      pageBuilder: (context, state) => AppPageTransitions.fade(
        state: state,
        child: BlocProvider(
          create: (_) => getIt<SignInCubit>(),
          child: const SignInPage(),
        ),
      ),
    ),
    GoRoute(
      path: AuthRoutes.access,
      pageBuilder: (context, state) => AppPageTransitions.fade(
        state: state,
        child: BlocProvider(
          create: (_) => getIt<AccessCubit>(),
          child: const AccessPage(),
        ),
      ),
    ),
    GoRoute(
      path: AuthRoutes.contextPicker,
      pageBuilder: (context, state) => AppPageTransitions.fade(
        state: state,
        child: BlocProvider(
          create: (_) => getIt<AccessCubit>(),
          child: const ContextPickerPage(),
        ),
      ),
    ),
  ];

  @override
  List<RouteBase> get shellRoutes => [
    GoRoute(
      path: AuthRoutes.account,
      pageBuilder: (context, state) => AppPageTransitions.fade(
        state: state,
        child: BlocProvider(
          create: (_) => getIt<AccessCubit>(),
          child: const AccountPage(),
        ),
      ),
    ),
  ];
}
