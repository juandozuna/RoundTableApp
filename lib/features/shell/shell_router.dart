import 'package:go_router/go_router.dart';

import '../../core/routing/feature_router.dart';
import 'presentation/pages/component_gallery/component_gallery_page.dart';
import 'shell_routes.dart';

/// Hosts the dev-only component gallery. Navigation destinations are
/// contributed by the feature routers; the shell chrome itself lives in
/// `core/routing/app_shell`.
class ShellFeatureRouter extends FeatureRouter {
  const ShellFeatureRouter({required this.includeComponentGallery});

  final bool includeComponentGallery;

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
  List<String> get publicLocations => [
    if (includeComponentGallery) ShellRoutes.componentGallery,
  ];
}
