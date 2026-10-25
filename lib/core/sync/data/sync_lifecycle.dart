import 'dart:async';

import 'package:injectable/injectable.dart';

import '../../services/auth_session/auth_state_source.dart';
import '../../services/auth_session/auth_status.dart';
import '../../services/logging/app_log.dart';
import 'pending_since_tracker.dart';
import 'sync_database.dart';

/// Opens the local database at startup and ties replication to sign-in
/// (ADR 0004):
/// - authenticated → connect (clearing the device first if another user's
///   data is on it);
/// - signed out → disconnect but keep local data, so answers captured
///   offline are never lost to an expired or revoked session. Explicit
///   "remove my data" flows call `SyncDatabase.disconnect(clearLocalData:
///   true)` through a use case.
@lazySingleton
class SyncLifecycle {
  SyncLifecycle(this._database, this._tracker, this._auth);

  /// Startup never waits longer than this for the local database.
  static const Duration openTimeout = Duration(seconds: 20);

  final SyncDatabase _database;
  final PendingSinceTracker _tracker;
  final AuthStateSource _auth;
  StreamSubscription<AuthStatus>? _subscription;

  /// Never throws: a database that fails to open leaves sync unavailable
  /// while online-only features keep working.
  Future<void> start() async {
    if (_subscription != null) return;
    try {
      await _database.open().timeout(openTimeout);
      _tracker.start();
    } on Object catch (error, stackTrace) {
      AppLog.error('sync', 'Local database failed to open', error, stackTrace);
      return;
    }
    _subscription = _auth.statusChanges.listen(_onAuthChanged);
    await _onAuthChanged(_auth.status);
  }

  Future<void> _onAuthChanged(AuthStatus status) async {
    try {
      switch (status) {
        case AuthStatus.authenticated:
          await _database.connect();
        case AuthStatus.unauthenticated:
          await _database.disconnect(clearLocalData: false);
        case AuthStatus.unknown:
          break;
      }
    } on Object catch (error, stackTrace) {
      AppLog.error('sync', 'Sync lifecycle change failed', error, stackTrace);
    }
  }

  @disposeMethod
  Future<void> stop() async {
    await _subscription?.cancel();
    _subscription = null;
  }
}
