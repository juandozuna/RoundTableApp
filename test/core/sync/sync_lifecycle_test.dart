import 'dart:async';

import 'package:drift/drift.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/services/auth_session/auth_state_source.dart';
import 'package:gold_roundtables/core/services/auth_session/auth_status.dart';
import 'package:gold_roundtables/core/services/clock/clock_service.dart';
import 'package:gold_roundtables/core/sync/data/pending_since_tracker.dart';
import 'package:gold_roundtables/core/sync/data/sync_database.dart';
import 'package:gold_roundtables/core/sync/data/sync_lifecycle.dart';
import 'package:powersync/powersync.dart';

class FakeAuth implements AuthStateSource {
  FakeAuth(this.status);

  final StreamController<AuthStatus> controller = StreamController.broadcast();

  @override
  AuthStatus status;

  @override
  Stream<AuthStatus> get statusChanges => controller.stream;

  void emit(AuthStatus next) {
    status = next;
    controller.add(next);
  }
}

class RecordingDatabase implements SyncDatabase {
  RecordingDatabase({this.failOpen = false});

  final bool failOpen;
  final List<String> calls = [];

  @override
  bool get isOpen => false;

  @override
  Future<void> open() async {
    calls.add('open');
    if (failOpen) throw StateError('worker missing');
  }

  @override
  Future<void> connect() async => calls.add('connect');

  @override
  Future<void> disconnect({required bool clearLocalData}) async =>
      calls.add('disconnect(clear: $clearLocalData)');

  @override
  PowerSyncDatabase get powerSync => throw UnimplementedError();

  @override
  DatabaseConnection createDriftConnection() => throw UnimplementedError();
}

class SystemClock implements ClockService {
  @override
  DateTime nowUtc() => DateTime.now().toUtc();
}

void main() {
  SyncLifecycle lifecycle(RecordingDatabase db, FakeAuth auth) =>
      SyncLifecycle(db, PendingSinceTracker(db, SystemClock()), auth);

  test('connects when signed in and keeps data on sign-out', () async {
    final db = RecordingDatabase();
    final auth = FakeAuth(AuthStatus.authenticated);
    await lifecycle(db, auth).start();

    auth.emit(AuthStatus.unauthenticated);
    await Future<void>.delayed(Duration.zero);
    auth.emit(AuthStatus.authenticated);
    await Future<void>.delayed(Duration.zero);

    expect(db.calls, [
      'open',
      'connect',
      'disconnect(clear: false)',
      'connect',
    ]);
  });

  test('a database that fails to open never blocks startup', () async {
    final db = RecordingDatabase(failOpen: true);
    await expectLater(
      lifecycle(db, FakeAuth(AuthStatus.authenticated)).start(),
      completes,
    );
    expect(db.calls, ['open']);
  });
}
