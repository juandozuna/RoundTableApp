import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/data/data_change_signal.dart';
import 'package:gold_roundtables/core/data/data_scope.dart';
import 'package:gold_roundtables/core/models/assessment_kind.dart';
import 'package:gold_roundtables/core/models/attendance_status.dart';
import 'package:gold_roundtables/core/models/commitment_follow_up_status.dart';
import 'package:gold_roundtables/features/session/data/datasources/session_remote_data_source.dart';
import 'package:gold_roundtables/features/session/data/models/sync_upload_response.dart';
import 'package:gold_roundtables/features/session/data/services/attendance_service_impl.dart';
import 'package:gold_roundtables/features/session/data/services/responses_service_impl.dart';
import 'package:gold_roundtables/features/session/data/services/session_sync_service_impl.dart';
import 'package:gold_roundtables/features/session/data/services/session_write_gateway.dart';
import 'package:gold_roundtables/features/session/domain/models/response_submissions.dart';
import 'package:gold_roundtables/features/session/domain/models/session_write_failure.dart';
import 'package:mocktail/mocktail.dart';

import '../support/counter_id_generator.dart';
import '../support/fake_connectivity.dart';
import '../support/fake_session_reads.dart';
import '../support/fixed_clock.dart';
import '../support/session_fixture.dart';

class _MockRemote extends Mock implements SessionRemoteDataSource {}

typedef _Op = Map<String, Object?>;

/// What the person's writes send to `sync-upload`: the UUID-keyed operations,
/// sent at once, with nothing kept when they cannot be delivered.
void main() {
  late FakeSessionReads reads;
  late _MockRemote remote;
  late FakeConnectivity connectivity;
  late DataChangeSignal signal;
  late List<DataScope> notified;
  late FixedClock clock;
  late SessionWriteGateway gateway;
  late List<_Op> sent;

  setUp(() {
    reads = SessionFixture.seed(FakeSessionReads());
    remote = _MockRemote();
    connectivity = FakeConnectivity();
    signal = DataChangeSignal();
    notified = [];
    signal.changes.listen(notified.add);
    clock = FixedClock(DateTime.utc(2026, 10, 29, 22, 30));
    gateway = SessionWriteGateway(remote, connectivity, signal);
    sent = [];
    when(() => remote.uploadBatch(any())).thenAnswer((invocation) async {
      final batch = invocation.positionalArguments.first as List<_Op>;
      sent.addAll(batch);
      return SyncUploadResponse(
        applied: batch.length,
        results: [
          for (final _ in batch) const SyncUploadResult(status: 'applied'),
        ],
      );
    });
  });

  tearDown(() => signal.dispose());

  ResponsesServiceImpl responses() =>
      ResponsesServiceImpl(reads, gateway, clock, CounterIdGenerator());

  String nowIso() => clock.now.toIso8601String();

  group('as a member', () {
    test(
      'sends the follow-up as a review of the commitment and a score',
      () async {
        await responses().submitFollowUp(
          const FollowUpSubmission(
            sessionId: Ids.session,
            previousCommitmentId: Ids.anaPrevious,
            status: CommitmentFollowUpStatus.partial,
            score: 7,
            note: ' Llamé dos veces. ',
          ),
        );
        await pumpEventQueue();

        expect(sent, [
          {
            'op': 'PATCH',
            'type': 'member_commitments',
            'id': Ids.anaPrevious,
            'opData': {
              'follow_up_session_id': Ids.session,
              'follow_up_status': 'partial',
              'follow_up_note': 'Llamé dos veces.',
              'follow_up_device_at': nowIso(),
              'device_modified_at': nowIso(),
            },
          },
          {
            'op': 'PUT',
            'type': 'member_assessments',
            'id': 'id-1',
            'opData': {
              'session_id': Ids.session,
              'person_id': Ids.ana,
              'kind': 'follow_up',
              'score': 7,
              'justification': null,
              'device_created_at': nowIso(),
            },
          },
        ]);
        expect(notified, [DataScope.session]);
      },
    );

    test('stores a picked person next to the name', () async {
      await responses().submitReflection(
        const ReflectionSubmission(
          sessionId: Ids.session,
          answers: {Ids.q1: ' Luis Prueba ', Ids.q2: 'Cumplo casi siempre'},
          answerPersonIds: {Ids.q1: Ids.luis},
          score: 8,
          justification: 'Casi siempre',
        ),
      );

      final answers = sent.where((o) => o['type'] == 'member_answers').toList();
      expect(answers.every((o) => o['op'] == 'PUT'), isTrue);
      final picked = answers
          .map((o) => o['opData']! as _Op)
          .singleWhere((d) => d['question_id'] == Ids.q1);
      expect(picked['answer_text'], 'Luis Prueba');
      expect(picked['answer_person_id'], Ids.luis);
      final free = answers
          .map((o) => o['opData']! as _Op)
          .singleWhere((d) => d['question_id'] == Ids.q2);
      expect(free['answer_person_id'], isNull);
      final score = sent.last['opData']! as _Op;
      expect(sent.last['type'], 'member_assessments');
      expect(score['kind'], 'initial');
      expect(score['score'], 8);
      expect(score['justification'], 'Casi siempre');
      expect(sent.map((o) => o['id']).toSet(), hasLength(3));
    });

    test(
      'submitting again edits the same rows instead of duplicating',
      () async {
        reads.answerRows.addAll([
          SessionFixture.answer(Ids.ana, Ids.q1, 'Mi abuelo', id: 'ans-1'),
          SessionFixture.answer(Ids.ana, Ids.q2, 'Cumplo', id: 'ans-2'),
        ]);
        reads.assessmentRows.add(
          SessionFixture.assessment(
            Ids.ana,
            AssessmentKind.initial,
            8,
            id: 'as-1',
          ),
        );

        await responses().submitReflection(
          const ReflectionSubmission(
            sessionId: Ids.session,
            answers: {Ids.q1: 'Mi tía Rosa', Ids.q2: 'Cumplo'},
            score: 9,
          ),
        );

        expect(sent.map((o) => '${o['op']} ${o['id']}'), [
          'PATCH ans-1',
          'PATCH ans-2',
          'PATCH as-1',
        ]);
        final first = sent.first['opData']! as _Op;
        expect(first['answer_text'], 'Mi tía Rosa');
        // Switching to a typed name clears the person picked before.
        expect(first.containsKey('answer_person_id'), isTrue);
        expect(first['answer_person_id'], isNull);
        expect((sent.last['opData']! as _Op)['score'], 9);
      },
    );

    test('sends the commitment, then edits it', () async {
      const submission = CommitmentSubmission(
        sessionId: Ids.session,
        what: 'Entregar mis tareas',
        when: 'Cada viernes',
        how: 'Cuántas veces',
      );
      await responses().submitCommitment(submission);

      expect(sent.single, {
        'op': 'PUT',
        'type': 'member_commitments',
        'id': 'id-1',
        'opData': {
          'session_id': Ids.session,
          'person_id': Ids.ana,
          'action_text': 'Entregar mis tareas · Cada viernes',
          'measure_text': 'Cuántas veces',
          'device_created_at': nowIso(),
        },
      });

      sent.clear();
      reads.commitmentRows.add(
        SessionFixture.commitment(
          'cm-1',
          Ids.session,
          Ids.ana,
          Ids.value4,
          'Entregar mis tareas · Cada viernes',
        ),
      );
      await responses().submitCommitment(submission);
      expect(sent.single['op'], 'PATCH');
      expect(sent.single['id'], 'cm-1');
    });

    test(
      'offline: the form fails with the offline failure and nothing is sent',
      () async {
        connectivity.online = false;

        await expectLater(
          responses().submitCommitment(
            const CommitmentSubmission(
              sessionId: Ids.session,
              what: 'Entregar mis tareas',
              when: 'Cada viernes',
              how: 'Cuántas veces',
            ),
          ),
          throwsA(
            isA<SessionWriteFailure>().having(
              (e) => e.isOffline,
              'offline',
              true,
            ),
          ),
        );
        verifyNever(() => remote.uploadBatch(any()));
        expect(notified, isEmpty);
      },
    );

    test('a session that is not readable is a programming error', () async {
      await expectLater(
        responses().submitCommitment(
          const CommitmentSubmission(
            sessionId: 'unknown',
            what: 'a',
            when: 'b',
            how: 'c',
          ),
        ),
        throwsStateError,
      );
    });
  });

  group('as the facilitator', () {
    setUp(
      () =>
          SessionFixture.seed(reads = FakeSessionReads(), asFacilitator: true),
    );

    AttendanceServiceImpl attendance() =>
        AttendanceServiceImpl(reads, gateway, clock, CounterIdGenerator());

    test('marks attendance with one new row per person', () async {
      await attendance().markPresent(
        sessionId: Ids.session,
        personIds: [Ids.sofia, Ids.ana, Ids.luis],
      );

      expect(sent.map((o) => '${o['op']} ${o['type']}'), [
        'PUT session_attendance',
        'PUT session_attendance',
        'PUT session_attendance',
      ]);
      expect((sent.first['opData']! as _Op), {
        'session_id': Ids.session,
        'person_id': Ids.sofia,
        'status': 'present',
        'device_created_at': nowIso(),
      });
      await pumpEventQueue();
      expect(notified, [DataScope.session]);
    });

    test('edits an existing mark instead of duplicating it', () async {
      reads.attendanceRows.add(
        SessionFixture.attendance(
          Ids.ana,
          AttendanceStatus.present,
          id: 'att-1',
        ),
      );

      await attendance().mark(
        sessionId: Ids.session,
        personId: Ids.ana,
        status: AttendanceStatus.late,
      );

      expect(sent.single['op'], 'PATCH');
      expect(sent.single['id'], 'att-1');
      expect((sent.single['opData']! as _Op)['status'], 'late');
    });

    test('leaves marks that already say the same thing alone', () async {
      reads.attendanceRows.add(
        SessionFixture.attendance(Ids.ana, AttendanceStatus.present),
      );

      await attendance().markPresent(
        sessionId: Ids.session,
        personIds: [Ids.ana],
      );

      expect(sent, isEmpty);
      verifyNever(() => remote.uploadBatch(any()));
    });

    test('offline: attendance fails with the offline failure', () async {
      connectivity.online = false;
      await expectLater(
        attendance().mark(
          sessionId: Ids.session,
          personId: Ids.ana,
          status: AttendanceStatus.present,
        ),
        throwsA(isA<SessionWriteFailure>()),
      );
    });
  });

  test('asking to sync refreshes the live session', () async {
    await SessionSyncServiceImpl(signal).requestSync();
    await pumpEventQueue();
    expect(notified, [DataScope.session]);
  });
}
