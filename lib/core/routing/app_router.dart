import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

import '../services/auth_session/auth_state_source.dart';
import '../widgets/not_found_page.dart';
import 'app_shell/app_shell.dart';
import 'app_shell/cubit/app_shell_cubit.dart';
import 'auth_redirect_guard.dart';
import 'feature_router.dart';
import 'stream_listenable.dart';

/// Composes every feature's routes into one [GoRouter].
@lazySingleton
class AppRouter {
  AppRouter(this._auth, this._registry);

  final AuthStateSource _auth;
  final FeatureRouterRegistry _registry;

  late final GoRouter config = _build();

  GoRouter _build() {
    // `context.push` also updates the browser URL, so the address bar, the
    // back button and `context.go` to the page below always agree.
    GoRouter.optionURLReflectsImperativeAPIs = true;
    final guard = AuthRedirectGuard(
      auth: _auth,
      signInLocation: _registry.signInLocation,
      homeLocation: _registry.homeLocation,
      publicLocations: _registry.publicLocations,
    );
    final shellRoutes = _registry.shellRoutes;
    final destinations = _registry.destinations;

    return GoRouter(
      initialLocation: _registry.homeLocation,
      refreshListenable: Listenable.merge([
        StreamListenable(_auth.statusChanges),
        for (final stream in _registry.redirectRefreshStreams)
          StreamListenable(stream),
      ]),
      redirect: (context, state) =>
          guard.redirect(state.uri) ?? _registry.redirect(state.uri),
      errorBuilder: (context, state) =>
          NotFoundPage(homeLocation: _registry.homeLocation),
      routes: [
        if (shellRoutes.isNotEmpty)
          ShellRoute(
            builder: (context, state, child) => BlocProvider(
              create: (_) => GetIt.instance<AppShellCubit>(),
              child: AppShell(
                destinations: destinations,
                location: state.uri.path,
                child: child,
              ),
            ),
            routes: shellRoutes,
          ),
        ..._registry.routes,
      ],
    );
  }
}
