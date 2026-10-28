import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/models/attendance_status.dart';
import 'package:gold_roundtables/core/models/session_stage.dart';
import 'package:gold_roundtables/core/models/session_status.dart';
import 'package:gold_roundtables/core/network/api_exception.dart';
import 'package:gold_roundtables/core/services/connectivity/watch_connectivity_use_case.dart';
import 'package:gold_roundtables/core/sync/domain/sync_snapshot.dart';
import 'package:gold_roundtables/core/sync/domain/watch_sync_status_use_case.dart';
import 'package:gold_roundtables/features/session/domain/models/live_session.dart';
import 'package:gold_roundtables/features/session/domain/models/member_step.dart';
import 'package:gold_roundtables/features/session/domain/services/session_control_service.dart';
import 'package:gold_roundtables/features/session/domain/use_cases/control/close_answers_use_case.dart';
import 'package:gold_roundtables/features/session/domain/use_cases/control/close_session_use_case.dart';
import 'package:gold_roundtables/features/session/domain/use_cases/control/open_session_use_case.dart';
import 'package:gold_roundtables/features/session/domain/use_cases/control/set_session_stage_use_case.dart';
import 'package:gold_roundtables/features/session/domain/use_cases/live/watch_live_session_use_case.dart';
import 'package:gold_roundtables/features/session/domain/use_cases/sync/request_sync_use_case.dart';
import 'package:gold_roundtables/features/session/presentation/pages/session/cubit/session_cubit.dart';
import 'package:gold_roundtables/features/session/presentation/pages/session/cubit/session_state.dart';
import 'package:mocktail/mocktail.dart';

import '../support/live_session_builder.dart';

class _MockWatchSession extends Mock implements WatchLiveSessionUseCase {}

class _MockWatchConnectivity extends Mock implements WatchConnectivityUseCase {}

class _MockWatchSync extends Mock implements WatchSyncStatusUseCase {}

class _MockOpen extends Mock implements OpenSessionUseCase {}

class _MockSetStage extends Mock implements SetSessionStageUseCase {}

class _MockCloseAnswers extends Mock implements CloseAnswersUseCase {}

class _MockClose extends Mock implements CloseSessionUseCase {}

class _MockRequestSync extends Mock implements RequestSyncUseCase {}

void main() {
  late StreamController<LiveSession?> sessions;
  late StreamController<bool> connectivity;
  late StreamController<SyncSnapshot> sync;
  late _MockOpen open;
  late _MockSetStage setStage;
  late _MockCloseAnswers closeAnswers;
  late _MockClose close;
  late _MockRequestSync requestSync;
  late SessionCubit cubit;

  setUpAll(() => registerFallbackValue(SessionStage.lobby));

  setUp(() {
    sessions = StreamController<LiveSession?>.broadcast();
    connectivity = StreamController<bool>.broadcast();
    sync = StreamController<SyncSnapshot>.broadcast();
    final watchSession = _MockWatchSession();
    final watchConnectivity = _MockWatchConnectivity();
    final watchSync = _MockWatchSync();
    when(
      () => watchSession(tableId: any(named: 'tableId')),
    ).thenAnswer((_) => sessions.stream);
    when(watchConnectivity.call).thenAnswer((_) => connectivity.stream);
    when(watchSync.call).thenAnswer((_) => sync.stream);
    open = _MockOpen();
    setStage = _MockSetStage();
    closeAnswers = _MockCloseAnswers();
    close = _MockClose();
    requestSync = _MockRequestSync();
    when(() => requestSync()).thenAnswer((_) async {});
    cubit = SessionCubit(
      watchSession,
      watchConnectivity,
      watchSync,
      open,
      setStage,
      closeAnswers,
      close,
      requestSync,
    )..start();
  });

  tearDown(() async {
    await cubit.close();
    await sessions.close();
    await connectivity.close();
    await sync.close();
  });

  Future<void> pump() => Future<void>.delayed(Duration.zero);

  Future<SessionView> emit(LiveSession session) async {
    connectivity.add(true);
    sync.add(const SyncSnapshot(connection: SyncConnection.connected));
    sessions.add(session);
    await pump();
    return (cubit.state as SessionReady).view;
  }

  final sofia = person('sofia', facilitator: true, me: true);

  LiveSession table({
    SessionStatus status = SessionStatus.open,
    SessionStage stage = SessionStage.attendance,
    bool marked = true,
  }) => liveSession(
    status: status,
    stage: stage,
    participants: [
      marked
          ? person(
              'sofia',
              facilitator: true,
              me: true,
              attendance: AttendanceStatus.present,
            )
          : sofia,
      person('ana', attendance: marked ? AttendanceStatus.present : null),
      person('luis', attendance: marked ? AttendanceStatus.present : null),
    ],
  );

  test(
    'starts loading, then unavailable when the device has no session',
    () async {
      expect(cubit.state, isA<SessionLoading>());
      sessions.add(null);
      await pump();
      expect(cubit.state, isA<SessionUnavailable>());
    },
  );

  test('is live only when online and replicating', () async {
    var view = await emit(table());
    expect(view.isLive, isTrue);

    sync.add(const SyncSnapshot(connection: SyncConnection.offline));
    await pump();
    view = (cubit.state as SessionReady).view;
    expect(view.isLive, isFalse);
    expect(view.isOnline, isTrue);

    connectivity.add(false);
    await pump();
    expect((cubit.state as SessionReady).view.isOnline, isFalse);
  });

  group('facilitator controls', () {
    test(
      'opens the session and shows it at once until it replicates',
      () async {
        when(() => open(any())).thenAnswer((_) async => ControlDelivery.online);
        final scheduled = table(
          status: SessionStatus.scheduled,
          stage: SessionStage.lobby,
        );
        await emit(scheduled);

        await cubit.advance();

        verify(() => open('session-4')).called(1);
        var view = (cubit.state as SessionReady).view;
        expect(view.session.session.status, SessionStatus.open);
        expect(view.session.session.stage, SessionStage.attendance);

        // The synced row catches up: the override is dropped.
        sessions.add(table());
        await pump();
        view = (cubit.state as SessionReady).view;
        expect(view.session.session.stage, SessionStage.attendance);
      },
    );

    test('does not leave attendance while someone is unmarked', () async {
      await emit(table(marked: false));

      await cubit.advance();

      verifyNever(() => setStage(any(), any()));
      final problem = (cubit.state as SessionReady).view.problem;
      expect(problem, isA<AttendanceIncompleteProblem>());
      expect(
        (problem! as AttendanceIncompleteProblem).personIds,
        unorderedEquals(['ana', 'luis']),
      );
    });

    test(
      'moves from attendance to follow-up when everyone is marked',
      () async {
        when(
          () => setStage(any(), any()),
        ).thenAnswer((_) async => ControlDelivery.online);
        await emit(table());

        await cubit.advance();

        verify(() => setStage('session-4', SessionStage.followUp)).called(1);
      },
    );

    test('asks before opening Valor when members have not answered', () async {
      when(
        () => setStage(any(), any()),
      ).thenAnswer((_) async => ControlDelivery.online);
      await emit(table(stage: SessionStage.followUp));

      await cubit.advance();

      final prompt = (cubit.state as SessionReady).view.prompt;
      expect(prompt, isA<ConfirmAdvancePrompt>());
      expect(
        (prompt! as ConfirmAdvancePrompt).pendingNames,
        unorderedEquals(['Ana', 'Luis']),
      );
      verifyNever(() => setStage(any(), any()));

      await cubit.confirmPrompt();
      verify(() => setStage('session-4', SessionStage.value)).called(1);
    });

    test('goes straight on when everyone answered', () async {
      when(
        () => setStage(any(), any()),
      ).thenAnswer((_) async => ControlDelivery.online);
      await emit(
        liveSession(
          stage: SessionStage.followUp,
          participants: [
            person('sofia', facilitator: true, me: true, followUp: done()),
            person('ana', followUp: done()),
            person('luis', previous: false),
          ],
        ),
      );
      await cubit.advance();
      verify(() => setStage('session-4', SessionStage.value)).called(1);
    });

    test(
      'reminds the facilitator of their own missing answers even offline',
      () async {
        await emit(table(stage: SessionStage.value));
        connectivity.add(false);
        await pump();

        await cubit.advance();

        final prompt =
            (cubit.state as SessionReady).view.prompt! as ConfirmAdvancePrompt;

        expect(prompt.myMissingSteps, MemberStep.values);
        verifyNever(() => closeAnswers(any()));
      },
    );

    test('closes answers, then asks before closing the session', () async {
      when(
        () => closeAnswers(any()),
      ).thenAnswer((_) async => ControlDelivery.online);
      when(() => close(any())).thenAnswer((_) async => ControlDelivery.online);
      await emit(
        liveSession(
          stage: SessionStage.value,
          participants: [
            person(
              'sofia',
              facilitator: true,
              me: true,
              followUp: done(),
              reflection: done(),
              commitment: done(),
            ),
          ],
        ),
      );
      await cubit.advance();
      verify(() => closeAnswers('session-4')).called(1);

      await cubit.advance();
      expect(
        (cubit.state as SessionReady).view.prompt,
        isA<ConfirmClosePrompt>(),
      );
      verifyNever(() => close(any()));

      await cubit.confirmPrompt();
      verify(() => close('session-4')).called(1);
      final info = (cubit.state as SessionReady).view.session.session;
      expect(info.status, SessionStatus.closed);
    });

    test(
      'tells the facilitator when a control was saved on the phone',
      () async {
        when(
          () => open(any()),
        ).thenAnswer((_) async => ControlDelivery.savedOnDevice);
        await emit(
          table(status: SessionStatus.scheduled, stage: SessionStage.lobby),
        );
        await cubit.advance();
        expect(
          (cubit.state as SessionReady).view.notice,
          SessionNotice.savedOnDevice,
        );
        cubit.consumeNotice();
        expect((cubit.state as SessionReady).view.notice, isNull);
      },
    );

    test('reports a refused control', () async {
      when(() => open(any())).thenThrow(
        const ApiException(
          kind: ApiErrorKind.conflict,
          code: 'invalid_session_transition',
        ),
      );
      await emit(
        table(status: SessionStatus.scheduled, stage: SessionStage.lobby),
      );
      await cubit.advance();
      final view = (cubit.state as SessionReady).view;
      expect(view.problem, isA<ControlFailedProblem>());
      expect(view.isBusy, isFalse);
    });

    test('a member cannot run the controls', () async {
      await emit(
        liveSession(
          participants: [
            person('sofia', facilitator: true),
            person('ana', me: true),
          ],
        ),
      );
      await cubit.advance();
      verifyZeroInteractions(open);
      verifyZeroInteractions(setStage);
    });

    test('does not open a session that is not today', () async {
      await emit(
        liveSession(
          status: SessionStatus.scheduled,
          stage: SessionStage.lobby,
          isToday: false,
          participants: [sofia],
        ),
      );
      await cubit.advance();
      verifyZeroInteractions(open);
    });
  });

  test('reconnecting restarts sync and says so', () async {
    await emit(table());
    connectivity.add(false);
    await pump();
    connectivity.add(true);
    await pump();

    verify(() => requestSync()).called(1);
    expect(
      (cubit.state as SessionReady).view.notice,
      SessionNotice.reconnected,
    );
  });
}
