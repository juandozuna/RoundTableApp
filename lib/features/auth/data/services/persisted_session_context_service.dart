import 'dart:async';
import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/services/logging/app_log.dart';
import '../../../../core/services/session_context/session_context.dart';
import '../../../../core/services/session_context/session_context_service.dart';

/// The app's [SessionContextService]: keeps the active context on this
/// device, so a restart (even offline) opens in the same role. The auth
/// feature's `AccessSessionService` validates it against the account and
/// clears it on sign-out.
@LazySingleton(as: SessionContextService)
class PersistedSessionContextService implements SessionContextService {
  PersistedSessionContextService(this._prefs) {
    unawaited(_restore());
  }

  static const String storageKey = 'session_context.v1';

  final SharedPreferencesAsync _prefs;
  final StreamController<SessionContext?> _changes =
      StreamController<SessionContext?>.broadcast();
  SessionContext? _current;
  bool _touched = false;

  @override
  SessionContext? get current => _current;

  @override
  Stream<SessionContext?> watch() {
    StreamSubscription<SessionContext?>? subscription;
    late final StreamController<SessionContext?> controller;
    controller = StreamController<SessionContext?>(
      onListen: () {
        controller.add(_current);
        subscription = _changes.stream.listen(controller.add);
      },
      onCancel: () => subscription?.cancel(),
    );
    return controller.stream;
  }

  @override
  Future<void> select(SessionContext context) async {
    _touched = true;
    if (context == _current) return;
    _current = context;
    _changes.add(context);
    await _prefs.setString(storageKey, jsonEncode(context.toJson()));
  }

  @override
  Future<void> clear() async {
    _touched = true;
    final hadContext = _current != null;
    _current = null;
    if (hadContext) _changes.add(null);
    await _prefs.remove(storageKey);
  }

  Future<void> _restore() async {
    try {
      final raw = await _prefs.getString(storageKey);
      if (raw == null || _touched) return;
      _current = SessionContext.fromJson(
        jsonDecode(raw) as Map<String, dynamic>,
      );
      _changes.add(_current);
    } on Object catch (error) {
      AppLog.warning('auth', 'Stored context is unreadable', error);
    }
  }
}
