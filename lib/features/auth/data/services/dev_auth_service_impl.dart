import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

import '../../../../core/config/app_config.dart';
import '../../domain/models/auth_failure.dart';
import '../../domain/models/dev_users.dart';
import '../../domain/services/dev_auth_service.dart';

@LazySingleton(as: DevAuthService)
class DevAuthServiceImpl implements DevAuthService {
  DevAuthServiceImpl(this._config);

  final AppConfig _config;

  @override
  bool get isAvailable => AppConfig.devAuthCompiledIn;

  supabase.GoTrueClient get _auth {
    if (!AppConfig.devAuthCompiledIn) {
      throw StateError('Dev sign-in is not compiled into this build');
    }
    if (!_config.hasSupabase) {
      throw const AuthFailure(AuthFailureKind.notConfigured);
    }
    return supabase.Supabase.instance.client.auth;
  }

  @override
  Future<void> signIn(String email, String password) async {
    try {
      await _auth.signInWithPassword(email: email.trim(), password: password);
    } on supabase.AuthException catch (error) {
      throw AuthFailure(
        error.statusCode == '400'
            ? AuthFailureKind.invalidCredentials
            : AuthFailureKind.unknown,
        message: error.message,
      );
    }
  }

  @override
  Future<String> createAccount() async {
    final email = 'nuevo.${DateTime.now().millisecondsSinceEpoch}@dev.local';
    try {
      await _auth.signUp(email: email, password: DevUsers.password);
    } on supabase.AuthException catch (error) {
      throw AuthFailure(AuthFailureKind.unknown, message: error.message);
    }
    return email;
  }
}
