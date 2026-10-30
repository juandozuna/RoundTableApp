import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

import '../../../../core/config/app_config.dart';
import '../../domain/models/auth_failure.dart';
import '../../domain/models/sign_up_outcome.dart';
import '../../domain/services/email_auth_service.dart';
import 'auth_failure_mapper.dart';
import 'auth_redirect.dart';

/// [EmailAuthService] over Supabase Auth email + password (ADR 0018).
///
/// Eager singleton: a recovery link that opens a running mobile app emits
/// `passwordRecovery` right away, so the listener must exist from startup.
/// (On web the link is consumed while Supabase initializes, before this
/// class exists; the emailed URL already points at the new-password route.)
@Singleton(as: EmailAuthService)
class SupabaseEmailAuthService implements EmailAuthService {
  SupabaseEmailAuthService(this._config, {@ignoreParam this.authClient}) {
    if (_config.hasSupabase || authClient != null) {
      // Lives as long as the app (singleton).
      // ignore: cancel_subscriptions
      _auth.onAuthStateChange.listen(_onAuthState, onError: (Object _) {});
    }
  }

  final AppConfig _config;

  /// Replaces `Supabase.instance.client.auth` in tests.
  final supabase.GoTrueClient? authClient;
  final StreamController<bool> _recoveryChanges =
      StreamController<bool>.broadcast();
  bool _recoveryPending = false;

  supabase.GoTrueClient get _auth {
    final injected = authClient;
    if (injected != null) return injected;
    if (!_config.hasSupabase) {
      throw const AuthFailure(AuthFailureKind.notConfigured);
    }
    return supabase.Supabase.instance.client.auth;
  }

  @override
  bool get isPasswordRecoveryPending => _recoveryPending;

  @override
  Stream<bool> watchPasswordRecoveryPending() => _recoveryChanges.stream;

  @override
  Future<void> signIn(String email, String password) => _guard(
    () => _auth.signInWithPassword(email: email.trim(), password: password),
  );

  @override
  Future<SignUpOutcome> createAccount(String email, String password) async {
    final response = await _guard(
      () => _auth.signUp(email: email.trim(), password: password),
    );
    return response.session == null
        ? SignUpOutcome.confirmationPending
        : SignUpOutcome.signedIn;
  }

  @override
  Future<void> requestPasswordReset(
    String email, {
    required String returnPath,
  }) => _guard(
    () => _auth.resetPasswordForEmail(
      email.trim(),
      redirectTo: AuthRedirect.to(returnPath),
    ),
  );

  @override
  Future<void> updatePassword(String newPassword) async {
    await _guard(
      () => _auth.updateUser(supabase.UserAttributes(password: newPassword)),
    );
    _setRecoveryPending(false);
  }

  void _onAuthState(supabase.AuthState state) {
    switch (state.event) {
      case supabase.AuthChangeEvent.passwordRecovery:
        _setRecoveryPending(true);
      case supabase.AuthChangeEvent.signedOut:
        _setRecoveryPending(false);
      default:
        break;
    }
  }

  void _setRecoveryPending(bool value) {
    if (_recoveryPending == value) return;
    _recoveryPending = value;
    _recoveryChanges.add(value);
  }

  Future<T> _guard<T>(Future<T> Function() action) async {
    try {
      return await action();
    } on AuthFailure {
      rethrow;
    } on Exception catch (error) {
      throw AuthFailureMapper.from(error);
    }
  }
}
