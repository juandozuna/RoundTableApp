import 'package:injectable/injectable.dart';

import '../../../../core/routing/route_query_keys.dart';
import '../../../../core/services/auth_session/auth_state_source.dart';
import '../../../../core/services/auth_session/auth_status.dart';
import '../../auth_routes.dart';
import '../../domain/models/access_state.dart';
import '../../domain/services/access_session_service.dart';

/// Sends a signed-in identity to where its [AccessState] says it belongs:
/// the loading/blocked page, the context picker, or the app. Runs after the
/// core sign-in guard (signed-out redirects are not its concern).
@lazySingleton
class AccessRedirectGuard {
  AccessRedirectGuard(this._auth, this._access);

  final AuthStateSource _auth;
  final AccessSessionService _access;

  Stream<Object?> get changes => _access.watch();

  String? redirect(Uri uri, {required String homeLocation}) {
    if (_auth.status != AuthStatus.authenticated) return null;
    final path = uri.path;
    if (_isExempt(path)) return null;

    // The session exists before the first account lookup starts.
    final status = _access.state.status == AccessStatus.signedOut
        ? AccessStatus.resolving
        : _access.state.status;
    switch (status) {
      case AccessStatus.signedOut:
        return null;
      case AccessStatus.resolving ||
          AccessStatus.failed ||
          AccessStatus.noRole ||
          AccessStatus.deactivated ||
          AccessStatus.unknownAccount:
        return path == AuthRoutes.access ? null : _to(AuthRoutes.access, uri);
      case AccessStatus.needsContext:
        return path == AuthRoutes.contextPicker
            ? null
            : _to(AuthRoutes.contextPicker, uri);
      case AccessStatus.ready:
        final onGate =
            path == AuthRoutes.access || path == AuthRoutes.contextPicker;
        return onGate
            ? _safeReturnLocation(
                uri.queryParameters[RouteQueryKeys.from],
                homeLocation,
              )
            : null;
    }
  }

  static bool _isExempt(String path) => AuthRoutes.exemptFromAccessGate.any(
    (prefix) => path == prefix || path.startsWith('$prefix/'),
  );

  static bool _isGatePath(String path) =>
      path == AuthRoutes.access ||
      path == AuthRoutes.contextPicker ||
      path == AuthRoutes.signIn;

  /// Keeps the location the person wanted, unless they are already on a gate
  /// page (then the gate page's own `from` is preserved).
  static String _to(String target, Uri uri) {
    final from = _isGatePath(uri.path)
        ? uri.queryParameters[RouteQueryKeys.from]
        : uri.toString();
    return Uri(
      path: target,
      queryParameters: from == null || from == '/'
          ? null
          : {RouteQueryKeys.from: from},
    ).toString();
  }

  static String _safeReturnLocation(String? from, String homeLocation) {
    if (from == null || !from.startsWith('/') || from.startsWith('//')) {
      return homeLocation;
    }
    return _isGatePath(Uri.parse(from).path) ? homeLocation : from;
  }
}
