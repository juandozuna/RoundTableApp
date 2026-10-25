import 'session_context.dart';

/// Holds the active role/context the app is navigating under.
abstract interface class SessionContextService {
  SessionContext? get current;

  /// Emits the current context first, then every change.
  Stream<SessionContext?> watch();

  Future<void> select(SessionContext context);

  Future<void> clear();
}
