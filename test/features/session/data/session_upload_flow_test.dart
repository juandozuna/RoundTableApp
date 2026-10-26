import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/models/sync_state.dart';
import 'package:gold_roundtables/core/network/api_exception.dart';
import 'package:gold_roundtables/core/sync/data/supabase_powersync_connector.dart';
import 'package:gold_roundtables/core/sync/data/sync_upload_batch.dart';
import 'package:gold_roundtables/core/sync/data/sync_uploader.dart';
import 'package:gold_roundtables/core/sync/domain/sync_snapshot.dart';
import 'package:gold_roundtables/core/sync/domain/sync_status_service.dart';
import 'package:gold_roundtables/features/session/data/datasources/session_local_data_source.dart';
import 'package:gold_roundtables/features/session/data/services/live_session_service_impl.dart';
import 'package:gold_roundtables/features/session/data/services/responses_service_impl.dart';
import 'package:gold_roundtables/features/session/domain/models/live_session.dart';
import 'package:gold_roundtables/features/session/domain/models/response_submissions.dart';

import '../support/counter_id_generator.dart';
import '../support/session_fixture.dart';
import '../support/session_test_database.dart';

class _Idle implements SyncStatusService {
  @override
  Stream<SyncSnapshot> watch() =>
      Stream.value(const SyncSnapshot(connection: SyncConnection.connected));
}

class _ScriptedUploader implements SyncUploader {
  _ScriptedUploader(this.behaviour);

  final Future<void> Function(SyncUploadBatch batch) behaviour;
  final List<SyncUploadBatch> batches = [];

  @override
  Future<void> upload(SyncUploadBatch batch) {
    batches.add(batch);
    return behaviour(batch);
  }
}

/// The offline-first loop end to end on a real PowerSync database: capture
/// offline -> pending -> upload through the connector -> synced, with the
/// permanent-rejection and retry paths of api-contract.md §4.
void main() {
  late SessionTestDatabase db;
  late SessionLocalDataSource local;
  late LiveSessionServiceImpl live;
  late ResponsesServiceImpl responses;
  late FixedClock clock;

  setUp(() async {
    db = await SessionTestDatabase.open();
    await SessionFixture.seed(db);
    clock = FixedClock(DateTime.utc(2026, 10, 29, 22, 30));
    local = SessionLocalDataSource(db.drift, db.sync);
    live = LiveSessionServiceImpl(
      local,
      _Idle(),
      clock,
    );
    responses = ResponsesServiceImpl(local, clock, CounterIdGenerator());
  });

  tearDown(() => db.close());

  Future<LiveSession> current() async =>
      (await live.watch().firstWhere((s) => s != null))!;

  Future<void> captureOffline() async {
    await responses.submitCommitment(
      const CommitmentSubmission(
        sessionId: Ids.session,
        what: 'Entregar mis tareas',
        when: 'Cada viernes',
        how: 'Cuántas veces',
      ),
    );
    await responses.submitReflection(
      const ReflectionSubmission(
        sessionId: Ids.session,
        answers: {Ids.q1: 'Mi abuelo', Ids.q2: 'Cumplo casi siempre'},
        score: 8,
      ),
    );
  }

  SupabasePowerSyncConnector connector(SyncUploader uploader) =>
      SupabasePowerSyncConnector(
        endpoint: 'http://localhost',
        tokens: FakeTokens(),
        uploader: uploader,
      );

  test(
    'captured offline, pending, then synced once the upload commits',
    () async {
      await captureOffline();
      expect((await current()).me.commitment.syncState, SyncState.pending);
      final queuedBefore = await db.queuedChanges();
      expect(queuedBefore, greaterThan(0));

      final uploader = _ScriptedUploader((_) async {});
      final c = connector(uploader);
      // One local transaction per upload; drain them all.
      while (await db.queuedChanges() > 0) {
        await c.uploadData(db.sync.powerSync);
      }

      expect(uploader.batches, isNotEmpty);
      final sent = uploader.batches.expand((b) => b.operations).toList();
      expect(sent.map((o) => o.table).toSet(), {
        'member_commitments',
        'member_answers',
        'member_assessments',
      });
      expect(sent.every((o) => o.type == SyncOperationType.put), isTrue);
      expect(await db.queuedChanges(), 0);
      final session = await current();
      expect(session.me.commitment.syncState, SyncState.synced);
      expect(session.me.reflection.syncState, SyncState.synced);
    },
  );

  test(
    'a transient failure keeps the changes queued for the next try',
    () async {
      await captureOffline();
      final before = await db.queuedChanges();
      final c = connector(
        _ScriptedUploader(
          (_) async => throw const ApiException(kind: ApiErrorKind.network),
        ),
      );

      await expectLater(
        c.uploadData(db.sync.powerSync),
        throwsA(isA<ApiException>()),
      );

      expect(await db.queuedChanges(), before);
      expect((await current()).me.commitment.syncState, SyncState.pending);
    },
  );

  test(
    'a permanent rejection is dropped, recorded and shown to the person',
    () async {
      await captureOffline();
      final c = connector(
        _ScriptedUploader(
          (batch) async => throw SyncUploadRejected(
            'refused',
            rejections: [
              for (final o in batch.operations)
                SyncRejection(
                  table: o.table,
                  id: o.id,
                  code: 'session_closed',
                  message:
                      'La sesión ya se cerró; no se pueden registrar respuestas nuevas.',
                ),
            ],
          ),
        ),
      );

      while (await db.queuedChanges() > 0) {
        await c.uploadData(db.sync.powerSync);
      }

      expect(await db.queuedChanges(), 0);
      // The connector stamps the rejection with the real clock.
      clock.now = DateTime.now().toUtc();
      final session = await current();
      expect(session.rejectedMessages, [
        'La sesión ya se cerró; no se pueden registrar respuestas nuevas.',
      ]);
    },
  );

  test('a late-flagged server copy replaces the pending state', () async {
    await captureOffline();
    final commitment = (await db.queuedEntries()).firstWhere(
      (e) => e['type'] == 'member_commitments',
    );
    await db.sync.powerSync.execute('DELETE FROM ps_crud');
    await db.seedSynced('member_commitments', commitment['id'] as String, {
      'round_table_id': Ids.table,
      'session_id': Ids.session,
      'person_id': Ids.ana,
      'value_id': Ids.value4,
      'action_text': 'Entregar mis tareas · Cada viernes',
      'synced_late': 1,
    });

    expect((await current()).me.commitment.syncState, SyncState.syncedLate);
  });
}
