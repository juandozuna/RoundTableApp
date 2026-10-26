import '../models/auth_failure.dart';
import '../models/auth_provider.dart';
import '../models/signed_in_user.dart';

/// Signing in and out with Google, Apple or Facebook (ADR 0007). Hides the
/// auth SDK from the rest of the app.
abstract interface class AuthService {
  SignedInUser? get currentUser;

  /// Emits the current user first, then every change (`null` = signed out).
  Stream<SignedInUser?> watchUser();

  /// Provider-side failures that happen after [signInWithProvider] returned,
  /// e.g. the person denied access on the provider's screen.
  Stream<AuthFailure> get failures;

  /// Starts the provider flow. On web the page navigates away and the session
  /// arrives when the app reloads; on mobile the future completes once the
  /// provider screen opened and the session arrives through [watchUser].
  /// [returnPath] is the in-app location (e.g. `/invitacion/ABC234`) to come
  /// back to. Throws [AuthFailure].
  Future<void> signInWithProvider(AuthProvider provider, {String? returnPath});

  Future<void> signOut();
}
