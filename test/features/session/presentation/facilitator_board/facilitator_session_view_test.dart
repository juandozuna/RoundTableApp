import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/models/attendance_status.dart';
import 'package:gold_roundtables/core/models/session_stage.dart';
import 'package:gold_roundtables/core/sync/domain/sync_snapshot.dart';
import 'package:gold_roundtables/core/theme/app_theme.dart';
import 'package:gold_roundtables/core/widgets/app_button.dart';
import 'package:gold_roundtables/features/session/domain/models/live_session.dart';
import 'package:gold_roundtables/features/session/domain/models/session_status.dart';
import 'package:gold_roundtables/features/session/domain/use_cases/attendance/mark_attendance_use_case.dart';
import 'package:gold_roundtables/features/session/domain/use_cases/attendance/mark_everyone_present_use_case.dart';
import 'package:gold_roundtables/features/session/presentation/pages/facilitator_board/cubit/facilitator_board_cubit.dart';
import 'package:gold_roundtables/features/session/presentation/pages/facilitator_board/facilitator_session_view.dart';
import 'package:gold_roundtables/features/session/presentation/pages/member_flow/cubit/member_flow_cubit.dart';
import 'package:gold_roundtables/features/session/presentation/pages/member_flow/cubit/member_flow_state.dart';
import 'package:gold_roundtables/features/session/presentation/pages/session/cubit/session_cubit.dart';
import 'package:gold_roundtables/features/session/presentation/pages/session/cubit/session_state.dart';
import 'package:gold_roundtables/l10n/gen/app_localizations.dart';
import 'package:mocktail/mocktail.dart';

import '../../support/live_session_builder.dart';

class _MockSessionCubit extends MockCubit<SessionState>
    implements SessionCubit {}

class _MockMemberFlowCubit extends MockCubit<MemberFlowState>
    implements MemberFlowCubit {}

class _MockMark extends Mock implements MarkAttendanceUseCase {}

class _MockMarkAll extends Mock implements MarkEveryonePresentUseCase {}

SessionView viewOf(
  LiveSession session, {
  bool online = true,
  SyncSnapshot? sync,
  SessionProblem? problem,
}) => SessionView(
  session: session,
  isOnline: online,
  sync: sync ?? const SyncSnapshot(connection: SyncConnection.connected),
  problem: problem,
);

LiveSession tableOf(
  int seats, {
  SessionStatus status = SessionStatus.open,
  SessionStage stage = SessionStage.attendance,
  bool allMarked = false,
  DateTime? endedAt,
}) {
  final names = [
    'ana',
    'luis',
    'marta',
    'camila',
    'rodrigo',
    'isabela',
    'joaquin',
    'valentina',
  ];
  return liveSession(
    status: status,
    stage: stage,
    endedAt: endedAt,
    participants: [
      person(
        'sofia',
        facilitator: true,
        me: true,
        attendance: AttendanceStatus.present,
      ),
      for (final name in names.take(seats - 1))
        person(
          name,
          attendance: allMarked ? AttendanceStatus.present : null,
          previous: false,
        ),
    ],
  );
}

void main() {
  late _MockSessionCubit sessionCubit;
  late _MockMemberFlowCubit flowCubit;
  late FacilitatorBoardCubit boardCubit;

  setUp(() {
    sessionCubit = _MockSessionCubit();
    flowCubit = _MockMemberFlowCubit();
    boardCubit = FacilitatorBoardCubit(_MockMark(), _MockMarkAll());
    when(() => flowCubit.state).thenReturn(const MemberFlowState());
    when(
      () => flowCubit.restoreDraft(
        sessionId: any(named: 'sessionId'),
        personId: any(named: 'personId'),
      ),
    ).thenAnswer((_) async {});
    when(
      () => sessionCubit.advance(force: any(named: 'force')),
    ).thenAnswer((_) async {});
    when(() => sessionCubit.syncNow()).thenAnswer((_) async {});
  });

  tearDown(() => boardCubit.close());

  Future<void> pumpBoard(
    WidgetTester tester,
    SessionView view, {
    Size size = const Size(390, 844),
  }) async {
    tester.view.physicalSize = size;
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    when(() => sessionCubit.state).thenReturn(SessionState.ready(view));
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.dark,
        locale: const Locale('es'),
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        home: MultiBlocProvider(
          providers: [
            BlocProvider<SessionCubit>.value(value: sessionCubit),
            BlocProvider<MemberFlowCubit>.value(value: flowCubit),
            BlocProvider<FacilitatorBoardCubit>.value(value: boardCubit),
          ],
          child: FacilitatorSessionView(view: view),
        ),
      ),
    );
    await tester.pump(const Duration(milliseconds: 200));
  }

  testWidgets('before opening: stage 1, seats, and "Abrir sesión"', (
    tester,
  ) async {
    await pumpBoard(
      tester,
      viewOf(
        tableOf(5, status: SessionStatus.scheduled, stage: SessionStage.lobby),
      ),
      size: const Size(390, 2400),
    );

    expect(find.text('Apertura'), findsWidgets);
    expect(find.text('Abrir sesión'), findsOneWidget);
    expect(find.text('Dirigir la mesa'), findsOneWidget);
    expect(find.text('Mis respuestas'), findsOneWidget);
    expect(find.text('Sofia'), findsOneWidget);
    expect(find.text('Sesión de hoy'.toUpperCase()), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('the dock opens the next stage through the cubit', (
    tester,
  ) async {
    await pumpBoard(tester, viewOf(tableOf(5, allMarked: true)));

    await tester.tap(find.text('Abrir seguimiento'));

    verify(() => sessionCubit.advance(force: any(named: 'force'))).called(1);
  });

  testWidgets('names who is missing attendance and highlights the seats', (
    tester,
  ) async {
    final session = tableOf(4);
    await pumpBoard(
      tester,
      viewOf(
        session,
        problem: SessionProblem.attendanceIncomplete([
          for (final p in session.unmarkedParticipants) p.personId,
        ]),
      ),
    );

    expect(find.textContaining('Falta marcar asistencia'), findsOneWidget);
    expect(find.text('Marcar a todos Presente'), findsOneWidget);
  });

  testWidgets('offline the dock is verbal guidance and says so', (
    tester,
  ) async {
    await pumpBoard(tester, viewOf(tableOf(5, allMarked: true), online: false));

    expect(find.text('Anunciar: seguimiento'), findsOneWidget);
    expect(find.text('Guía verbal'.toUpperCase()), findsOneWidget);
    expect(find.textContaining('Sin conexión'), findsWidgets);
  });

  testWidgets('a session that is not today cannot be opened yet', (
    tester,
  ) async {
    final session = liveSession(
      status: SessionStatus.scheduled,
      stage: SessionStage.lobby,
      isToday: false,
      participants: [person('sofia', facilitator: true, me: true)],
    );
    await pumpBoard(tester, viewOf(session));

    final dock = tester.widget<AppButton>(
      find.widgetWithText(AppButton, 'Abrir sesión'),
    );
    expect(dock.onPressed, isNull);
  });

  testWidgets('a closed session shows the summary and a disabled button', (
    tester,
  ) async {
    await pumpBoard(
      tester,
      viewOf(
        tableOf(
          4,
          status: SessionStatus.closed,
          stage: SessionStage.closed,
          allMarked: true,
          endedAt: DateTime.utc(2026, 10, 30, 0, 20),
        ),
      ),
      size: const Size(390, 2400),
    );

    expect(find.text('Cerrada'), findsOneWidget);
    expect(find.text('Sesión cerrada'), findsOneWidget);
    expect(find.textContaining('Presentes'), findsOneWidget);
  });

  for (final seats in [3, 9]) {
    for (final size in [const Size(360, 740), const Size(1024, 800)]) {
      testWidgets('$seats seats fit at ${size.width.toInt()} px', (
        tester,
      ) async {
        await pumpBoard(tester, viewOf(tableOf(seats)), size: size);
        expect(tester.takeException(), isNull);
        expect(find.text('Sofia'), findsOneWidget);
      });
    }
  }

  testWidgets('tablets show the table and the side column together', (
    tester,
  ) async {
    await pumpBoard(
      tester,
      viewOf(
        tableOf(6, status: SessionStatus.scheduled, stage: SessionStage.lobby),
      ),
      size: const Size(1024, 800),
    );

    final table = tester.getTopLeft(find.text('Apertura').first);
    final side = tester.getTopLeft(find.text('SESIÓN DE HOY'));
    expect(side.dx, greaterThan(table.dx + 300));
  });
}
