import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/config/app_config.dart';
import '../../domain/services/sign_out_service.dart';

/// Default sign-out over Supabase Auth. The auth feature may replace it with
/// its own `AuthService`-backed implementation. Without Supabase configured
/// nobody is signed in, so there is nothing to end.
@LazySingleton(as: SignOutService)
class SupabaseSignOutService implements SignOutService {
  SupabaseSignOutService(this._config);

  final AppConfig _config;

  @override
  Future<void> signOut() async {
    if (!_config.hasSupabase) return;
    await Supabase.instance.client.auth.signOut();
  }
}
