import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/services/logging/app_log.dart';
import '../../domain/models/account.dart';
import '../../domain/services/access_store.dart';

@LazySingleton(as: AccessStore)
class SharedPrefsAccessStore implements AccessStore {
  SharedPrefsAccessStore(this._prefs);

  final SharedPreferencesAsync _prefs;

  static String _selectedKey(String userId) => 'access.selected.$userId';
  static String _accountKey(String userId) => 'access.account.$userId';

  @override
  Future<String?> readSelectedContextKey(String userId) =>
      _prefs.getString(_selectedKey(userId));

  @override
  Future<void> saveSelectedContextKey(String userId, String contextKey) =>
      _prefs.setString(_selectedKey(userId), contextKey);

  @override
  Future<Account?> readAccount(String userId) async {
    final raw = await _prefs.getString(_accountKey(userId));
    if (raw == null) return null;
    try {
      return Account.fromJson(jsonDecode(raw) as Map<String, dynamic>);
    } on Object catch (error) {
      AppLog.warning('auth', 'Cached account is unreadable', error);
      return null;
    }
  }

  @override
  Future<void> saveAccount(String userId, Account account) =>
      _prefs.setString(_accountKey(userId), jsonEncode(account.toJson()));
}
