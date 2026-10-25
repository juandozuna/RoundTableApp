import '../services/auth_session/auth_state_source.dart';
import '../services/auth_session/auth_status.dart';
import 'route_query_keys.dart';

/// Decides redirects from the sign-in state:
/// - signed out on a private location → sign-in, remembering `from`;
/// - signed in on the sign-in location → `from` or home;
/// - unknown state or no sign-in feature registered → no redirect.
class AuthRedirectGuard {
  const AuthRedirectGuard({
    required AuthStateSource auth,
    required String? signInLocation,
    required String homeLocation,
    required List<String> publicLocations,
  }) : _auth = auth,
       _signInLocation = signInLocation,
       _homeLocation = homeLocation,
       _publicLocations = publicLocations;

  final AuthStateSource _auth;
  final String? _signInLocation;
  final String _homeLocation;
  final List<String> _publicLocations;

  String? redirect(Uri uri) {
    final signIn = _signInLocation;
    if (signIn == null) return null;

    final path = uri.path.isEmpty ? '/' : uri.path;
    final onSignIn = _matches(path, signIn);
    switch (_auth.status) {
      case AuthStatus.unknown:
        return null;
      case AuthStatus.unauthenticated:
        if (onSignIn || _isPublic(path)) return null;
        return Uri(
          path: signIn,
          queryParameters: {RouteQueryKeys.from: uri.toString()},
        ).toString();
      case AuthStatus.authenticated:
        if (!onSignIn) return null;
        return _safeReturnLocation(uri.queryParameters[RouteQueryKeys.from]);
    }
  }

  bool _isPublic(String path) =>
      _publicLocations.any((location) => _matches(path, location));

  /// Only same-app absolute paths are honoured, never external URLs.
  String _safeReturnLocation(String? from) {
    if (from == null || !from.startsWith('/') || from.startsWith('//')) {
      return _homeLocation;
    }
    final signIn = _signInLocation;
    if (signIn != null && _matches(Uri.parse(from).path, signIn)) {
      return _homeLocation;
    }
    return from;
  }

  static bool _matches(String path, String location) {
    if (location == '/') return path == '/';
    return path == location || path.startsWith('$location/');
  }
}
