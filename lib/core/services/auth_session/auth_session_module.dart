import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../config/app_config.dart';
import '../../network/auth_token_provider.dart';
import 'auth_state_source.dart';
import 'supabase_auth_session.dart';

/// Registers the Supabase session under its two contracts.
@module
abstract class AuthSessionModule {
  /// Requires `Supabase.initialize` to have run (see `lib/app/bootstrap.dart`).
  @lazySingleton
  SupabaseClient supabaseClient(AppConfig config) {
    if (!config.hasSupabase) {
      throw StateError(
        'Supabase is not configured. Pass --dart-define=SUPABASE_URL=... '
        'and --dart-define=SUPABASE_ANON_KEY=...',
      );
    }
    return Supabase.instance.client;
  }

  @lazySingleton
  SupabaseAuthSession supabaseAuthSession(AppConfig config) =>
      SupabaseAuthSession(
        config.hasSupabase ? Supabase.instance.client.auth : null,
      );

  @lazySingleton
  AuthStateSource authStateSource(SupabaseAuthSession session) => session;

  @lazySingleton
  AuthTokenProvider authTokenProvider(SupabaseAuthSession session) => session;
}
