import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../l10n/gen/app_localizations.dart';
import '../models/user_role.dart';

/// A navigation entry shown by the app shell (bottom bar, rail, sidebar).
class ShellDestination {
  const ShellDestination({
    required this.location,
    required this.icon,
    required this.selectedIcon,
    required this.label,
    this.roles = const {},
    this.order = 100,
  });

  /// Route location the entry opens; also matched as a prefix to highlight.
  final String location;
  final IconData icon;
  final IconData selectedIcon;
  final String Function(AppLocalizations l10n) label;

  /// Roles that see the entry; empty means everyone.
  final Set<UserRole> roles;

  /// Lower values appear first.
  final int order;

  bool isVisibleFor(UserRole? role) =>
      roles.isEmpty || (role != null && roles.contains(role));
}

/// What a feature contributes to the app router. Each feature exposes one
/// subclass in `<feature>_router.dart` and adds it to
/// `lib/app/feature_registry.dart`.
abstract class FeatureRouter {
  const FeatureRouter();

  /// Routes rendered inside the shell, with app navigation.
  List<RouteBase> get shellRoutes => const [];

  /// Full-screen routes outside the shell (sign-in, live session, flows).
  List<RouteBase> get routes => const [];

  List<ShellDestination> get destinations => const [];

  /// Locations reachable while signed out. Matches the exact path and its
  /// sub-paths ("/invitacion" also allows "/invitacion/ABC123").
  List<String> get publicLocations => const [];

  /// Where signed-out users are sent. Exactly one feature (auth) sets it;
  /// until then the guard lets every location through.
  String? get signInLocation => null;

  /// Extra redirect applied after the sign-in guard, e.g. the auth feature
  /// sends signed-in users without an active context to the picker. Return
  /// `null` to leave [uri] untouched.
  String? redirect(Uri uri) => null;

  /// Streams that should re-run [redirect] when they emit.
  List<Stream<Object?>> get redirectRefreshStreams => const [];
}

/// All feature routers plus the home location, provided by the composition
/// root.
class FeatureRouterRegistry {
  const FeatureRouterRegistry({
    required this.routers,
    required this.homeLocation,
  });

  final List<FeatureRouter> routers;
  final String homeLocation;

  List<RouteBase> get shellRoutes => [
    for (final router in routers) ...router.shellRoutes,
  ];

  List<RouteBase> get routes => [
    for (final router in routers) ...router.routes,
  ];

  List<ShellDestination> get destinations =>
      [for (final router in routers) ...router.destinations]
        ..sort((a, b) => a.order.compareTo(b.order));

  List<String> get publicLocations => [
    for (final router in routers) ...router.publicLocations,
  ];

  /// First non-null feature redirect for [uri].
  String? redirect(Uri uri) {
    for (final router in routers) {
      final target = router.redirect(uri);
      if (target != null) return target;
    }
    return null;
  }

  List<Stream<Object?>> get redirectRefreshStreams => [
    for (final router in routers) ...router.redirectRefreshStreams,
  ];

  String? get signInLocation {
    final declared = [
      for (final router in routers)
        if (router.signInLocation != null) router.signInLocation!,
    ];
    if (declared.length > 1) {
      throw StateError('More than one FeatureRouter declares signInLocation');
    }
    return declared.firstOrNull;
  }
}
