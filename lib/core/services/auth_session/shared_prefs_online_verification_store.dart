import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'online_verification_store.dart';

@LazySingleton(as: OnlineVerificationStore)
class SharedPrefsOnlineVerificationStore implements OnlineVerificationStore {
  SharedPrefsOnlineVerificationStore(this._prefs);

  final SharedPreferencesAsync _prefs;

  static String _key(String userId) => 'auth.verified.$userId';

  @override
  Future<DateTime?> readLastVerifiedAt(String userId) async {
    final raw = await _prefs.getString(_key(userId));
    return raw == null ? null : DateTime.tryParse(raw)?.toUtc();
  }

  @override
  Future<void> saveLastVerifiedAt(String userId, DateTime at) =>
      _prefs.setString(_key(userId), at.toUtc().toIso8601String());
}
