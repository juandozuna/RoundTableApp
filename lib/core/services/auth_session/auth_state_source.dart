import 'auth_status.dart';

/// Observable sign-in state, independent of the auth SDK.
abstract interface class AuthStateSource {
  AuthStatus get status;

  /// Emits every change after subscription (not the current value).
  Stream<AuthStatus> get statusChanges;
}
