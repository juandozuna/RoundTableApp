import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/data/data_scope.dart';
import 'package:gold_roundtables/core/models/assessment_kind.dart';
import 'package:gold_roundtables/core/models/attendance_status.dart';
import 'package:gold_roundtables/core/models/session_stage.dart';
import 'package:gold_roundtables/core/models/session_status.dart';
import 'package:gold_roundtables/core/models/sync_state.dart';
import 'package:gold_roundtables/features/session/data/services/live_session_service_impl.dart';
import 'package:gold_roundtables/features/session/domain/models/live_session.dart';
import 'package:gold_roundtables/features/session/domain/models/value_question.dart';

import '../../../core/data/support/online_data_stubs.dart';
import '../support/fake_session_reads.dart';
import '../support/fixed_clock.dart';
import '../support/session_fixture.dart';

void main() {
  late FakeSessionReads reads;
  late FixedClock clock;
  late WatchHarness harness;
  late LiveSessionServiceImpl live;

  setUp(() {
    reads = FakeSessionReads();
    clock = FixedClock(DateTime.utc(2026, 10, 29, 22, 30));
    harness = WatchHarness();
    live = LiveSessionServiceImpl(
      reads,
      StubContentLanguageService(),
      harness.watch,
      clock,
    );
  });

  Future<LiveSession> current() async =>
      (await live.watch().firstWhere((s) => s != null))!;

  test('polls every five seconds', () {
    expect(LiveSessionServiceImpl.pollInterval, const Duration(seconds: 5));
  });

  test('emits null while the person has no seat', () async {
    expect(await live.watch().first, isNull);
  });

  test('emits null while the table has no session yet', () async {
    SessionFixture.seed(reads);
    reads.sessions.clear();
    expect(await live.watch().first, isNull);
  });

  group('as a member', () {
    setUp(() => SessionFixture.seed(reads));

    test('exposes the response type of each question', () async {
      final session = await current();
      expect(session.questions.map((q) => q.responseType), [
        QuestionResponseType.person,
        QuestionResponseType.text,
      ]);
    });

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

    test('a member who left the table is not a participant', () async {
      final index = reads.members.indexWhere((m) => m.personId == Ids.marta);
      reads.members[index] = reads.members[index].copyWith(
        leftAt: DateTime.utc(2026, 10, 1),
      );
      expect((await current()).seatCount, 3);
    });

    test('every row read from the server is synced, or synced late', () async {
      reads.commitmentRows.add(
        SessionFixture.commitment(
          'cm-ana',
          Ids.session,
          Ids.ana,
          Ids.value4,
          'Entregar mis tareas · Cada viernes',
        ),
      );
      var session = await current();
      expect(session.me.commitment.syncState, SyncState.synced);
      expect(session.controlChangesPending, isFalse);
      expect(session.rejectedMessages, isEmpty);

      reads.commitmentRows
        ..clear()
        ..add(
          SessionFixture.commitment(
            'cm-ana',
            Ids.session,
            Ids.ana,
            Ids.value4,
            'Entregar mis tareas · Cada viernes',
            syncedLate: true,
          ),
        );
      session = await current();
      expect(session.me.commitment.syncState, SyncState.syncedLate);
    });

    test('my own answers come back as my responses', () async {
      reads.assessmentRows.addAll([
        SessionFixture.assessment(Ids.ana, AssessmentKind.initial, 8),
        SessionFixture.assessment(Ids.ana, AssessmentKind.followUp, 7),
      ]);
      reads.answerRows.add(SessionFixture.answer(Ids.ana, Ids.q1, 'Mi abuelo'));
      final session = await current();
      expect(session.myResponses.reflection?.score, 8);
      expect(session.myResponses.reflection?.answers[Ids.q1], 'Mi abuelo');
      expect(session.me.reflection.isDone, isTrue);
      expect(session.me.followUp.score, 7);
    });

    test('the latest of two attendance rows wins', () async {
      reads.attendanceRows.addAll([
        SessionFixture.attendance(
          Ids.ana,
          AttendanceStatus.absent,
          id: 'att-a',
          at: DateTime.utc(2026, 10, 29, 23, 0),
        ),
        SessionFixture.attendance(
          Ids.ana,
          AttendanceStatus.present,
          id: 'att-b',
          source: 'auto_submission',
          at: DateTime.utc(2026, 10, 29, 23, 40),
        ),
      ]);
      final session = await current();
      expect(session.me.attendance, AttendanceStatus.present);
      expect(session.me.attendanceAuto, isTrue);
    });

    test('absent but answered is an auto-attendance still to come', () async {
      reads.attendanceRows.add(
        SessionFixture.attendance(Ids.ana, AttendanceStatus.absent),
      );
      reads.commitmentRows.add(
        SessionFixture.commitment(
          'cm-ana',
          Ids.session,
          Ids.ana,
          Ids.value4,
          'Entregar mis tareas · Cada viernes',
        ),
      );
      expect((await current()).me.autoAttendancePending, isTrue);
    });

    test('an own write refetches at once through the change signal', () async {
      final emitted = <LiveSession?>[];
      final subscription = live.watch().listen(emitted.add);
      await pumpEventQueue(times: 100);
      expect(emitted.last?.me.commitment.isDone, isFalse);

      reads.commitmentRows.add(
        SessionFixture.commitment(
          'cm-ana',
          Ids.session,
          Ids.ana,
          Ids.value4,
          'Entregar mis tareas · Cada viernes',
        ),
      );
      harness.signal.notify(DataScope.session);
      await pumpEventQueue(times: 100);

      expect(emitted.last?.me.commitment.isDone, isTrue);
      await subscription.cancel();
    });

    test('a failed read is a stream error and the watch recovers', () async {
      final events = <Object?>[];
      final subscription = live.watch().listen(events.add, onError: events.add);
      await pumpEventQueue(times: 100);
      expect(events.last, isA<LiveSession>());

      reads.failure = StateError('offline');
      harness.signal.notify(DataScope.session);
      await pumpEventQueue(times: 100);
      expect(events.last, isA<StateError>());

      // The watch keeps going: the next change goes through.
      reads.failure = null;
      reads.attendanceRows.add(
        SessionFixture.attendance(Ids.ana, AttendanceStatus.present),
      );
      harness.signal.notify(DataScope.session);
      await pumpEventQueue(times: 100);
      expect((events.last as LiveSession?)?.me.attendance, isNotNull);
      await subscription.cancel();
    });
  });

  group('which session is shown', () {
    setUp(() => SessionFixture.seed(reads));

    test('an open session is shown without reading the closed one', () async {
      reads.sessions
        ..clear()
        ..add(
          SessionFixture.session(
            status: SessionStatus.open,
            stage: SessionStage.attendance,
          ),
        );
      final session = await current();
      expect(session.session.status, SessionStatus.open);
      expect(reads.lastClosedReads, 0);
    });

    test(
      'right after closing, the closed session stays as the summary',
      () async {
        reads.sessions
          ..clear()
          ..addAll([
            SessionFixture.session(
              id: 'session-5',
              at: DateTime.utc(2026, 11, 5, 23),
            ),
            SessionFixture.session(
              status: SessionStatus.closed,
              stage: SessionStage.closed,
              endedAt: DateTime.utc(2026, 10, 29, 22, 0),
            ),
          ]);
        final session = await current();
        expect(session.session.id, Ids.session);
        expect(session.session.isClosed, isTrue);
        expect(session.isToday, isTrue);
      },
    );
  });

  group('as the facilitator', () {
    setUp(() => SessionFixture.seed(reads, asFacilitator: true));

    test(
      'sees every participant progress and who has nothing to review',
      () async {
        reads.assessmentRows.addAll([
          SessionFixture.assessment(Ids.luis, AssessmentKind.followUp, 7),
          SessionFixture.assessment(
            Ids.luis,
            AssessmentKind.initial,
            7,
            syncedLate: true,
          ),
        ]);
        final session = await current();
        final luis = session.participants.firstWhere(
          (p) => p.personId == Ids.luis,
        );
        final marta = session.participants.firstWhere(
          (p) => p.personId == Ids.marta,
        );

        expect(session.iAmFacilitator, isTrue);
        expect(luis.followUp.syncState, SyncState.synced);
        expect(luis.reflection.syncState, SyncState.syncedLate);
        expect(luis.hasPreviousCommitment, isTrue);
        expect(marta.hasPreviousCommitment, isFalse);
        expect(session.activity, hasLength(2));
      },
    );

    test('picks up another member write on the next refetch', () async {
      final emitted = <LiveSession?>[];
      final subscription = live.watch().listen(emitted.add);
      await pumpEventQueue(times: 100);
      expect(
        emitted.last!.participants
            .firstWhere((p) => p.personId == Ids.luis)
            .reflection
            .isDone,
        isFalse,
      );

      reads.assessmentRows.add(
        SessionFixture.assessment(Ids.luis, AssessmentKind.initial, 9),
      );
      harness.signal.notify(DataScope.session); // what a poll tick does
      await pumpEventQueue(times: 100);

      expect(
        emitted.last!.participants
            .firstWhere((p) => p.personId == Ids.luis)
            .reflection
            .score,
        9,
      );
      await subscription.cancel();
    });
  });
}
