import 'dart:async';

import 'package:supabase_flutter/supabase_flutter.dart';

import '../../network/auth_token_provider.dart';
import '../logging/app_log.dart';
import 'auth_state_source.dart';
import 'auth_status.dart';
import 'session_verification_source.dart';

/// Exposes the Supabase Auth session as [AuthStateSource] and
/// [AuthTokenProvider]. Sign-in flows live in the auth feature; this class
/// only observes the session they create (ADR 0008).
///
/// With no Supabase configuration ([auth] is `null`) it reports
/// [AuthStatus.unauthenticated] so the app still starts.
class SupabaseAuthSession
    implements AuthStateSource, AuthTokenProvider, SessionVerificationSource {
  SupabaseAuthSession(this._auth) {
    _subscription = _auth?.onAuthStateChange.listen(
      (state) {
        if (state.event == AuthChangeEvent.signedIn ||
            state.event == AuthChangeEvent.tokenRefreshed) {
          _verifications.add(null);
        }
        _emit(
          state.session == null
              ? AuthStatus.unauthenticated
              : AuthStatus.authenticated,
        );
      },
      onError: (Object error) =>
          AppLog.warning('auth', 'Auth state stream failed', error),
    );
  }

  final GoTrueClient? _auth;
  final StreamController<AuthStatus> _changes =
      StreamController<AuthStatus>.broadcast();
  final StreamController<void> _verifications =
      StreamController<void>.broadcast();
  StreamSubscription<AuthState>? _subscription;
  AuthStatus? _last;

  @override
  AuthStatus get status => _auth?.currentSession == null
      ? AuthStatus.unauthenticated
      : AuthStatus.authenticated;

  @override
  Stream<AuthStatus> get statusChanges => _changes.stream;

  @override
  Stream<void> get verifications => _verifications.stream;

  @override
  String? get accessToken => _auth?.currentSession?.accessToken;

  @override
  String? get userId => _auth?.currentUser?.id;

  @override
  Future<String?> refreshAccessToken() async {
    final auth = _auth;
    if (auth == null || auth.currentSession == null) return null;
    final response = await auth.refreshSession();
    return response.session?.accessToken;
  }

  void _emit(AuthStatus next) {
    if (next == _last) return;
    _last = next;
    _changes.add(next);
  }

  Future<void> dispose() async {
    await _subscription?.cancel();
    await _changes.close();
    await _verifications.close();
  }
}
