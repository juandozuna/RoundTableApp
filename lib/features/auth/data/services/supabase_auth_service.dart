import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

import '../../../../core/config/app_config.dart';
import '../../../../core/services/logging/app_log.dart';
import '../../domain/models/auth_failure.dart';
import '../../domain/models/auth_provider.dart';
import '../../domain/models/signed_in_user.dart';
import '../../domain/services/auth_service.dart';

/// [AuthService] over Supabase Auth OAuth (Google, Apple, Facebook).
///
/// Mobile returns through the `io.goldroundtables.app://login-callback`
/// deep link; web comes back to the app URL. Native Google/Apple SDK flows
/// would need extra plugins and are not wired; the browser flow works for
/// all three providers.
@LazySingleton(as: AuthService)
class SupabaseAuthService implements AuthService {
  SupabaseAuthService(this._config) {
    _initialFailure = _readReturnedError();
    if (_config.hasSupabase) {
      // Lives as long as the app (lazy singleton).
      // ignore: cancel_subscriptions
      _auth.onAuthStateChange.listen(
        (_) {},
        onError: (Object error) {
          AppLog.warning('auth', 'Auth state error', error);
          _failures.add(_failureFrom(error));
        },
      );
    }
  }

  static const String mobileRedirect =
      'io.goldroundtables.app://login-callback';

  final AppConfig _config;
  final StreamController<AuthFailure> _failures =
      StreamController<AuthFailure>.broadcast();
  AuthFailure? _initialFailure;

  supabase.GoTrueClient get _auth {
    if (!_config.hasSupabase) {
      throw const AuthFailure(AuthFailureKind.notConfigured);
    }
    return supabase.Supabase.instance.client.auth;
  }

  @override
  SignedInUser? get currentUser =>
      _config.hasSupabase ? _toUser(_auth.currentUser) : null;

  @override
  Stream<SignedInUser?> watchUser() {
    if (!_config.hasSupabase) return Stream.value(null);
    StreamSubscription<supabase.AuthState>? subscription;
    late final StreamController<SignedInUser?> controller;
    controller = StreamController<SignedInUser?>(
      onListen: () {
        controller.add(currentUser);
        subscription = _auth.onAuthStateChange.listen(
          (state) => controller.add(_toUser(state.session?.user)),
          onError: (Object _) {},
        );
      },
      onCancel: () => subscription?.cancel(),
    );
    return controller.stream;
  }

  @override
  Stream<AuthFailure> get failures async* {
    final initial = _initialFailure;
    _initialFailure = null;
    if (initial != null) yield initial;
    yield* _failures.stream;
  }

  @override
  Future<void> signInWithProvider(
    AuthProvider provider, {
    String? returnPath,
  }) async {
    final auth = _auth;
    try {
      final launched = await auth.signInWithOAuth(
        _oauthProvider(provider),
        redirectTo: _redirectTo(returnPath),
        authScreenLaunchMode: kIsWeb
            ? supabase.LaunchMode.platformDefault
            : supabase.LaunchMode.externalApplication,
      );
      if (!launched) throw const AuthFailure(AuthFailureKind.unknown);
    } on supabase.AuthException catch (error) {
      throw _failureFrom(error);
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } on supabase.AuthException catch (error) {
      throw _failureFrom(error);
    }
  }

  String _redirectTo(String? returnPath) {
    if (!kIsWeb) return mobileRedirect;
    final path = returnPath ?? '/';
    return '${Uri.base.origin}/#$path';
  }

  static supabase.OAuthProvider _oauthProvider(AuthProvider provider) =>
      switch (provider) {
        AuthProvider.google => supabase.OAuthProvider.google,
        AuthProvider.apple => supabase.OAuthProvider.apple,
        AuthProvider.facebook => supabase.OAuthProvider.facebook,
      };

  static SignedInUser? _toUser(supabase.User? user) {
    if (user == null) return null;
    final meta = user.userMetadata ?? const {};
    final full = (meta['full_name'] ?? meta['name']) as String?;
    final parts = full?.trim().split(RegExp(r'\s+')) ?? const <String>[];
    final given = (meta['given_name'] ?? meta['first_name']) as String?;
    final family = (meta['family_name'] ?? meta['last_name']) as String?;
    return SignedInUser(
      id: user.id,
      email: user.email,
      provider: AuthProvider.tryParse(user.appMetadata['provider'] as String?),
      firstName: given ?? (parts.isEmpty ? null : parts.first),
      lastName: family ?? (parts.length > 1 ? parts.skip(1).join(' ') : null),
    );
  }

  static AuthFailure _failureFrom(Object error) {
    final text = error is supabase.AuthException
        ? '${error.message} ${error.code ?? ''}'.toLowerCase()
        : error.toString().toLowerCase();
    if (text.contains('access_denied') ||
        text.contains('cancel') ||
        text.contains('denied')) {
      return AuthFailure(AuthFailureKind.cancelled, message: '$error');
    }
    if (text.contains('socket') ||
        text.contains('network') ||
        text.contains('failed host lookup')) {
      return AuthFailure(AuthFailureKind.offline, message: '$error');
    }
    return AuthFailure(AuthFailureKind.unknown, message: '$error');
  }

  /// On web, a provider that was cancelled sends the person back with
  /// `?error=access_denied` in the URL.
  static AuthFailure? _readReturnedError() {
    if (!kIsWeb) return null;
    final params = {...Uri.base.queryParameters};
    final fragment = Uri.base.fragment;
    final query = fragment.contains('?')
        ? fragment.substring(fragment.indexOf('?') + 1)
        : fragment;
    if (query.contains('=')) {
      try {
        params.addAll(Uri.splitQueryString(query));
      } on FormatException {
        // The fragment is a route, not a query string.
      }
    }
    final error = params['error'];
    if (error == null) return null;
    return _failureFrom(
      supabase.AuthException(params['error_description'] ?? error, code: error),
    );
  }
}
