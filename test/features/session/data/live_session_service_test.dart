import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/models/attendance_status.dart';
import 'package:gold_roundtables/core/models/commitment_follow_up_status.dart';
import 'package:gold_roundtables/core/models/sync_state.dart';
import 'package:gold_roundtables/core/sync/domain/sync_snapshot.dart';
import 'package:gold_roundtables/core/sync/domain/sync_status_service.dart';
import 'package:gold_roundtables/features/session/data/datasources/session_local_data_source.dart';
import 'package:gold_roundtables/features/session/data/services/attendance_service_impl.dart';
import 'package:gold_roundtables/features/session/data/services/live_session_service_impl.dart';
import 'package:gold_roundtables/features/session/data/services/responses_service_impl.dart';
import 'package:gold_roundtables/features/session/domain/models/live_session.dart';
import 'package:gold_roundtables/features/session/domain/models/response_submissions.dart';

import '../support/counter_id_generator.dart';
import '../support/session_fixture.dart';
import '../support/session_test_database.dart';

class _StaticStatus implements SyncStatusService {
  SyncSnapshot snapshot = const SyncSnapshot(
    connection: SyncConnection.connected,
  );

  @override
  Stream<SyncSnapshot> watch() => Stream.value(snapshot);
}

void main() {
  late SessionTestDatabase db;
  late FixedClock clock;
  late CounterIdGenerator ids;
  late SessionLocalDataSource local;
  late LiveSessionServiceImpl live;

  setUp(() async {
    db = await SessionTestDatabase.open();
    clock = FixedClock(DateTime.utc(2026, 10, 29, 22, 30));
    ids = CounterIdGenerator();
    local = SessionLocalDataSource(db.drift, db.sync);
    live = LiveSessionServiceImpl(local, _StaticStatus(), clock);
  });

  tearDown(() => db.close());

  Future<LiveSession> current() async {
    final session = await live.watch().firstWhere((s) => s != null);
    return session!;
  }

  test('emits null until the device holds a table and a session', () async {
    expect(await live.watch().first, isNull);
  });

  group('as a member', () {
    setUp(() => SessionFixture.seed(db));

    test(
      'assembles the table, value, roster and previous commitment',
      () async {
        final session = await current();

        expect(session.table.name, 'Mesa Esperanza 03');
        expect(session.table.organizationName, 'Fundación Luz');
        expect(session.value.name, 'Responsabilidad');
        expect(session.followUpValue?.name, 'Honestidad');
        expect(session.questions.map((q) => q.id), [Ids.q1, Ids.q2]);
        expect(session.participants.first.isFacilitator, isTrue);
        expect(session.seatCount, 4);
        expect(session.me.personId, Ids.ana);
        expect(session.isToday, isTrue);
        expect(session.previousCommitment?.id, Ids.anaPrevious);
        expect(session.iAmFacilitator, isFalse);
      },
    );

    test('a session days away is not today', () async {
      clock.now = DateTime.utc(2026, 10, 25, 12);
      expect((await current()).isToday, isFalse);
    });

    test('saves the follow-up on the device and queues it', () async {
      final service = ResponsesServiceImpl(local, clock, ids);
      await service.submitFollowUp(
        const FollowUpSubmission(
          sessionId: Ids.session,
          previousCommitmentId: Ids.anaPrevious,
          status: CommitmentFollowUpStatus.partial,
          score: 7,
          note: 'Llamé dos veces.',
        ),
      );

      final session = await current();
      expect(session.me.followUp.isDone, isTrue);
      expect(session.me.followUp.syncState, SyncState.pending);
      expect(session.myResponses.followUp?.score, 7);
      expect(
        session.myResponses.followUp?.status,
        CommitmentFollowUpStatus.partial,
      );

      final queued = await db.queuedEntries();
      expect(queued.map((e) => '${e['op']} ${e['type']}'), [
        'PATCH member_commitments',
        'PUT member_assessments',
      ]);
      final patch = queued.first['data'] as Map<String, dynamic>;
      expect(patch['follow_up_status'], 'partial');
      expect(patch['follow_up_session_id'], Ids.session);
      expect(patch['follow_up_device_at'], isNotNull);
      final put = queued.last['data'] as Map<String, dynamic>;
      expect(put['kind'], 'follow_up');
      expect(put['score'], 7);
      expect(put['session_id'], Ids.session);
      expect(put['round_table_id'], Ids.table);
      expect(put['device_created_at'], clock.now.toIso8601String());
    });

    test('saves reflection and commitment with device ids', () async {
      final service = ResponsesServiceImpl(local, clock, ids);
      await service.submitReflection(
        const ReflectionSubmission(
          sessionId: Ids.session,
          answers: {Ids.q1: 'Mi abuelo', Ids.q2: 'Cumplo casi siempre'},
          score: 8,
        ),
      );
      await service.submitCommitment(
        const CommitmentSubmission(
          sessionId: Ids.session,
          what: 'Entregar mis tareas',
          when: 'Cada viernes',
          how: 'Cuántas veces',
        ),
      );

      final session = await current();
      expect(session.me.reflection.isDone, isTrue);
      expect(session.me.commitment.isDone, isTrue);
      expect(session.myResponses.reflection?.answers[Ids.q1], 'Mi abuelo');
      expect(
        session.myResponses.commitment?.actionText,
        'Entregar mis tareas · Cada viernes',
      );
      expect(await db.queuedChanges(), 4);
      expect(await db.rowCount('member_answers'), 2);
    });

    test(
      'submitting twice edits the same rows instead of duplicating',
      () async {
        final service = ResponsesServiceImpl(local, clock, ids);
        const first = ReflectionSubmission(
          sessionId: Ids.session,
          answers: {Ids.q1: 'Mi abuelo', Ids.q2: 'Cumplo'},
          score: 8,
        );
        await service.submitReflection(first);
        await service.submitReflection(first.copyWith(score: 9));

        expect(await db.rowCount('member_answers'), 2);
        expect(await db.rowCount('member_assessments'), 1);
        expect((await current()).myResponses.reflection?.score, 9);
      },
    );

    test(
      'a pending row turns synced after upload and synced late when flagged',
      () async {
        final service = ResponsesServiceImpl(local, clock, ids);
        await service.submitCommitment(
          const CommitmentSubmission(
            sessionId: Ids.session,
            what: 'Entregar mis tareas',
            when: 'Cada viernes',
            how: 'Cuántas veces',
          ),
        );
        final id = (await db.queuedEntries()).single['id'] as String;

        // Upload completes: the queue empties, the server copy syncs down.
        await db.sync.powerSync.execute('DELETE FROM ps_crud');
        expect((await current()).me.commitment.syncState, SyncState.synced);

        await db.seedSynced('member_commitments', id, {
          'organization_id': Ids.org,
          'round_table_id': Ids.table,
          'session_id': Ids.session,
          'person_id': Ids.ana,
          'value_id': Ids.value4,
          'action_text': 'Entregar mis tareas · Cada viernes',
          'synced_late': 1,
        });
        final late = await live.watch().firstWhere(
          (s) => s?.me.commitment.syncState == SyncState.syncedLate,
        );
        expect(late, isNotNull);
      },
    );

    test('shows syncing while a batch uploads', () async {
      final status = _StaticStatus()
        ..snapshot = const SyncSnapshot(
          connection: SyncConnection.connected,
          uploading: true,
        );
      final service = ResponsesServiceImpl(local, clock, ids);
      await service.submitCommitment(
        const CommitmentSubmission(
          sessionId: Ids.session,
          what: 'Entregar mis tareas',
          when: 'Cada viernes',
          how: 'Cuántas veces',
        ),
      );
      final session = await LiveSessionServiceImpl(
        local,
        status,
        clock,
      ).watch().firstWhere((s) => s != null);
      expect(session!.me.commitment.syncState, SyncState.syncing);
    });

    test(
      'a server copy under another id does not duplicate attendance',
      () async {
        await db.seedSynced('session_attendance', 'att-server', {
          'session_id': Ids.session,
          'person_id': Ids.ana,
          'status': 'absent',
          'source': 'facilitator',
        });
        await db.seedSynced('session_attendance', 'att-server-2', {
          'session_id': Ids.session,
          'person_id': Ids.ana,
          'status': 'present',
          'source': 'auto_submission',
          'device_created_at': '2026-10-29T23:40:00Z',
        });
        final session = await current();
        expect(session.me.attendance, AttendanceStatus.present);
        expect(session.me.attendanceAuto, isTrue);
      },
    );

    test(
      'marks the auto-attendance as pending when absent but answered',
      () async {
        await db.seedSynced('session_attendance', 'att-1', {
          'session_id': Ids.session,
          'person_id': Ids.ana,
          'status': 'absent',
          'source': 'facilitator',
        });
        await ResponsesServiceImpl(local, clock, ids).submitCommitment(
          const CommitmentSubmission(
            sessionId: Ids.session,
            what: 'Entregar mis tareas',
            when: 'Cada viernes',
            how: 'Cuántas veces',
          ),
        );
        expect((await current()).me.autoAttendancePending, isTrue);
      },
    );

    test('hides upload rejections after 48 hours', () async {
      await db.sync.powerSync.execute(
        'INSERT INTO sync_upload_rejections '
        '(id, table_name, row_id, code, message, rejected_at) '
        'VALUES (?, ?, ?, ?, ?, ?)',
        [
          'r1',
          'member_answers',
          'x',
          'session_closed',
          'La sesión ya se cerró.',
          '2026-10-29T20:00:00Z',
        ],
      );
      expect((await current()).rejectedMessages, ['La sesión ya se cerró.']);
      clock.now = DateTime.utc(2026, 11, 2);
      final later = await live.watch().first;
      expect(later?.rejectedMessages, isEmpty);
    });
  });

  group('as the facilitator', () {
    setUp(() => SessionFixture.seed(db, asFacilitator: true));

    test('marks attendance offline, editing instead of duplicating', () async {
      final attendance = AttendanceServiceImpl(local, clock, ids);
      await attendance.markPresent(
        sessionId: Ids.session,
        personIds: [Ids.sofia, Ids.ana, Ids.luis],
      );
      await attendance.mark(
        sessionId: Ids.session,
        personId: Ids.ana,
        status: AttendanceStatus.late,
      );

      final session = await current();
      expect(session.iAmFacilitator, isTrue);
      expect(session.me.attendance, AttendanceStatus.present);
      expect(
        session.participants
            .firstWhere((p) => p.personId == Ids.ana)
            .attendance,
        AttendanceStatus.late,
      );
      expect(session.unmarkedParticipants.map((p) => p.personId), [Ids.marta]);
      expect(await db.rowCount('session_attendance'), 3);
      final ops = (await db.queuedEntries()).map((e) => e['op']).toList();
      expect(ops, ['PUT', 'PUT', 'PUT', 'PATCH']);
    });

    test(
      'sees every participant progress and who has nothing to review',
      () async {
        for (final (id, person, kind) in [
          ('a1', Ids.luis, 'follow_up'),
          ('a2', Ids.luis, 'initial'),
        ]) {
          await db.seedSynced('member_assessments', id, {
            'round_table_id': Ids.table,
            'session_id': Ids.session,
            'person_id': person,
            'kind': kind,
            'score': 7,
            'synced_late': kind == 'initial' ? 1 : 0,
            'device_created_at': '2026-10-29T23:10:00Z',
          });
        }
        final session = await current();
        final luis = session.participants.firstWhere(
          (p) => p.personId == Ids.luis,
        );
        final marta = session.participants.firstWhere(
          (p) => p.personId == Ids.marta,
        );

        expect(luis.followUp.syncState, SyncState.synced);
        expect(luis.reflection.syncState, SyncState.syncedLate);
        expect(luis.hasPreviousCommitment, isTrue);
        expect(marta.hasPreviousCommitment, isFalse);
        expect(session.activity, hasLength(2));
      },
    );
  });
}
