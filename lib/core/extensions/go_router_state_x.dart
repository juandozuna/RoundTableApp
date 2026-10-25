import 'package:go_router/go_router.dart';

extension GoRouterStateX on GoRouterState {
  /// The typed `extra` object, or `null` when absent or of another type
  /// (e.g. after a browser refresh, where extras are lost).
  T? extraAs<T>() {
    final value = extra;
    return value is T ? value : null;
  }
}
