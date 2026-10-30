import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/network/auth_token_provider.dart';
import '../../../../core/services/logging/app_log.dart';
import '../../domain/models/saved_explorer_view.dart';
import '../../domain/services/saved_views_service.dart';

/// Keeps saved views in shared preferences, one entry per signed-in user, so
/// another user on the same device never sees them and they are never
/// uploaded. With nobody signed in they live in memory only.
@LazySingleton(as: SavedViewsService)
class SavedViewsServiceImpl implements SavedViewsService {
  SavedViewsServiceImpl(this._prefs, this._auth);

  /// Every user's entry starts with this prefix.
  static const String keyPrefix = 'admin.saved_views.';

  static String keyFor(String userId) => '$keyPrefix$userId';

  final SharedPreferencesAsync _prefs;
  final AuthTokenProvider _auth;
  List<SavedExplorerView> _memory = const [];

  @override
  Future<List<SavedExplorerView>> load() async {
    final userId = _auth.userId;
    if (userId == null) return _memory;
    try {
      final raw = await _prefs.getString(keyFor(userId));
      if (raw == null) return _memory = const [];
      final decoded = jsonDecode(raw) as List<dynamic>;
      _memory = [
        for (final item in decoded)
          SavedExplorerView.fromJson(item as Map<String, dynamic>),
      ];
    } on Object catch (error) {
      AppLog.warning('saved_views', 'Could not read saved views', error);
    }
    return _memory;
  }

  @override
  Future<void> save(List<SavedExplorerView> views) async {
    _memory = List.unmodifiable(views);
    final userId = _auth.userId;
    if (userId == null) return;
    try {
      await _prefs.setString(
        keyFor(userId),
        jsonEncode([for (final v in views) v.toJson()]),
      );
    } on Object catch (error) {
      AppLog.warning('saved_views', 'Could not persist saved views', error);
    }
  }
}
