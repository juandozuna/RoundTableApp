import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/services/logging/app_log.dart';
import '../../domain/models/session_draft.dart';
import '../../domain/services/session_draft_service.dart';

@LazySingleton(as: SessionDraftService)
class SharedPrefsSessionDraftService implements SessionDraftService {
  SharedPrefsSessionDraftService(this._prefs);

  final SharedPreferencesAsync _prefs;

  static String _key(String sessionId, String personId) =>
      'session.draft.$sessionId.$personId';

  @override
  Future<SessionDraft?> load({
    required String sessionId,
    required String personId,
  }) async {
    final raw = await _prefs.getString(_key(sessionId, personId));
    if (raw == null) return null;
    try {
      return SessionDraft.fromJson(jsonDecode(raw) as Map<String, dynamic>);
    } on Object catch (error) {
      AppLog.warning('session', 'Stored draft is unreadable', error);
      return null;
    }
  }

  @override
  Future<void> save({
    required String sessionId,
    required String personId,
    required SessionDraft draft,
  }) {
    final key = _key(sessionId, personId);
    if (draft.isEmpty) return _prefs.remove(key);
    return _prefs.setString(key, jsonEncode(draft.toJson()));
  }
}
