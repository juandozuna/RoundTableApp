import '../models/access_state.dart';
import '../models/account_context.dart';

/// Resolves a signed-in identity into an active context (or the reason it
/// cannot enter) and keeps `SessionContextService` in step with it.
///
/// Listens to the auth session by itself: signing in starts resolving,
/// signing out clears the active context.
abstract interface class AccessSessionService {
  AccessState get state;

  /// Emits the current state first, then every change.
  Stream<AccessState> watch();

  /// Reloads people and contexts. [preferPersonId] selects the context of
  /// that person when several exist (used right after redeeming an invite).
  Future<void> refresh({String? preferPersonId});

  /// Makes [context] active and remembers it for this identity on this device.
  Future<void> selectContext(AccountContext context);
}
