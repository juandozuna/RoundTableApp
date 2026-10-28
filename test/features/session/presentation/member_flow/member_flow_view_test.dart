import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/models/attendance_status.dart';
import 'package:gold_roundtables/core/models/session_stage.dart';
import 'package:gold_roundtables/core/models/session_status.dart';
import 'package:gold_roundtables/core/sync/domain/sync_snapshot.dart';
import 'package:gold_roundtables/core/widgets/app_button.dart';
import 'package:gold_roundtables/core/widgets/app_scaffold.dart';
import 'package:gold_roundtables/features/session/domain/models/member_flow.dart';
import 'package:gold_roundtables/features/session/domain/models/response_validation.dart';
import 'package:gold_roundtables/features/session/presentation/pages/member_flow/cubit/member_flow_state.dart';
import 'package:gold_roundtables/features/session/presentation/pages/member_flow/member_flow_view.dart';
import 'package:gold_roundtables/features/session/presentation/pages/member_flow/widgets/member_room_header.dart';
import 'package:mocktail/mocktail.dart';

import 'member_flow_fixtures.dart';

Future<void> tapVisible(WidgetTester tester, String text) =>
    tapFinder(tester, find.text(text));

Future<void> tapFinder(WidgetTester tester, Finder finder) async {
  await tester.ensureVisible(finder);
  await tester.pump();
  await tester.tap(finder);
}

void main() {
  late MockMemberFlowCubit flowCubit;

  setUpAll(() {
    registerFallbackValue(MemberFlow(buildSession(), live: true));
  });

  setUp(() {
    flowCubit = MockMemberFlowCubit();
    when(
      () => flowCubit.restoreDraft(
        sessionId: any(named: 'sessionId'),
        personId: any(named: 'personId'),
      ),
    ).thenAnswer((_) async {});
    when(() => flowCubit.submitFollowUp(any())).thenAnswer((_) async {});
    when(() => flowCubit.submitReflection(any())).thenAnswer((_) async {});
    when(() => flowCubit.submitCommitment(any())).thenAnswer((_) async {});
  });

  group('follow-up', () {
    testWidgets('shows what to answer, errors from the draft, and submits', (
      tester,
    ) async {
      await pumpMemberFlow(
        tester,
        view: buildView(buildSession()),
        flowCubit: flowCubit,
        state: const MemberFlowState(
          errors: {
            'followUpStatus': ResponseError.required,
            'followUpScore': ResponseError.required,
          },
        ),
      );

      expect(find.text('Llamar a mi mamá 3 veces'), findsOneWidget);
      expect(find.text('Lo cumplí'), findsOneWidget);
      expect(find.text('Cumplí una parte'), findsOneWidget);
      expect(find.text('No pude cumplirlo'), findsOneWidget);
      expect(find.text('Elige cómo te fue con tu compromiso.'), findsOneWidget);
      expect(
        find.text('Elige tu puntaje de 1 a 10 (el 5 no se puede).'),
        findsOneWidget,
      );

      await tester.tap(find.text('Enviar seguimiento'));
      verify(() => flowCubit.submitFollowUp(any())).called(1);
    });

    testWidgets('choices and score go to the cubit; 5 is locked', (
      tester,
    ) async {
      await pumpMemberFlow(
        tester,
        view: buildView(buildSession()),
        flowCubit: flowCubit,
      );

      await tester.tap(find.text('Cumplí una parte'));
      await tapFinder(tester, find.byKey(const ValueKey('score-7')));
      verify(() => flowCubit.setFollowUpScore(7)).called(1);

      expect(find.byKey(const ValueKey('score-locked')), findsOneWidget);
      await tapFinder(tester, find.byKey(const ValueKey('score-locked')));
      await tester.pump();
      verifyNever(() => flowCubit.setFollowUpScore(5));
      expect(find.textContaining('El 5 no se permite'), findsWidgets);
    });

    testWidgets('no previous commitment shows the gentle card and continues', (
      tester,
    ) async {
      when(() => flowCubit.acknowledgeNoPrevious()).thenReturn(null);
      await pumpMemberFlow(
        tester,
        view: buildView(buildSession(hasPreviousCommitment: false)),
        flowCubit: flowCubit,
      );

      expect(find.text('No tienes compromiso previo'), findsOneWidget);
      await tester.tap(find.text('Seguir'));
      verify(() => flowCubit.acknowledgeNoPrevious()).called(1);
    });

    testWidgets('first session of the table says so', (tester) async {
      await pumpMemberFlow(
        tester,
        view: buildView(
          buildSession(hasPreviousCommitment: false, hasFollowUpValue: false),
        ),
        flowCubit: flowCubit,
      );
      expect(find.text('Es la primera sesión de tu mesa'), findsOneWidget);
    });

    testWidgets('answers closed before sending shows the lock card', (
      tester,
    ) async {
      await pumpMemberFlow(
        tester,
        // Offline the screen stays on the first unanswered step.
        view: buildView(
          buildSession(answersClosedAt: DateTime.utc(2026, 10, 29, 23, 40)),
          online: false,
          connection: SyncConnection.offline,
        ),
        flowCubit: flowCubit,
      );

      expect(find.text('Etapa cerrada'), findsOneWidget);
      expect(
        find.text('Tu facilitador ya cerró las respuestas.'),
        findsOneWidget,
      );
      final dock = tester.widget<AppButton>(
        find.widgetWithText(AppButton, 'Cerrado'),
      );
      expect(dock.onPressed, isNull);
    });
  });

  group('current value', () {
    testWidgets('reflection lists the questions with the locked 5', (
      tester,
    ) async {
      await pumpMemberFlow(
        tester,
        view: buildView(
          buildSession(stage: SessionStage.value, followUp: doneSynced),
        ),
        flowCubit: flowCubit,
      );

      expect(find.text('¿Quién es para ti un ejemplo?'), findsOneWidget);
      expect(find.text('¿Por qué te diste ese puntaje?'), findsOneWidget);
      expect(find.byKey(const ValueKey('score-locked')), findsOneWidget);
      await tester.tap(find.text('Enviar y seguir al compromiso'));
      verify(() => flowCubit.submitReflection(any())).called(1);
    });

    testWidgets('the score steps ask "¿Por qué ese puntaje?" (optional)', (
      tester,
    ) async {
      when(() => flowCubit.setReflectionJustification(any())).thenReturn(null);
      when(() => flowCubit.setFollowUpJustification(any())).thenReturn(null);
      await pumpMemberFlow(
        tester,
        view: buildView(
          buildSession(stage: SessionStage.value, followUp: doneSynced),
        ),
        flowCubit: flowCubit,
        state: const MemberFlowState(reflectionJustification: 'Me esfuerzo'),
      );

      expect(find.text('¿Por qué ese puntaje?'), findsOneWidget);
      expect(find.text('Me esfuerzo'), findsOneWidget);
      await tester.enterText(
        find.byKey(const ValueKey('reflection-justification')),
        'Porque cumplo',
      );
      verify(
        () => flowCubit.setReflectionJustification('Porque cumplo'),
      ).called(1);
    });

    testWidgets('the follow-up step has the same optional field', (
      tester,
    ) async {
      when(() => flowCubit.setFollowUpJustification(any())).thenReturn(null);
      await pumpMemberFlow(
        tester,
        view: buildView(buildSession()),
        flowCubit: flowCubit,
      );

      expect(find.text('¿Por qué ese puntaje?'), findsOneWidget);
      await tester.enterText(
        find.byKey(const ValueKey('follow-up-justification')),
        'Casi siempre',
      );
      verify(
        () => flowCubit.setFollowUpJustification('Casi siempre'),
      ).called(1);
    });

    testWidgets('commitment chips feed qué / cuándo / cómo and submit', (
      tester,
    ) async {
      when(() => flowCubit.setCommitmentWhat(any())).thenReturn(null);
      when(() => flowCubit.setCommitmentWhen(any())).thenReturn(null);
      when(() => flowCubit.setCommitmentHow(any())).thenReturn(null);
      await pumpMemberFlow(
        tester,
        view: buildView(
          buildSession(
            stage: SessionStage.value,
            followUp: doneSynced,
            reflection: doneSynced,
          ),
        ),
        flowCubit: flowCubit,
      );

      expect(find.text('Tu compromiso de esta semana'), findsOneWidget);
      await tapVisible(tester, 'Llamar a mi abuela 2 veces');
      verify(
        () => flowCubit.setCommitmentWhat('Llamar a mi abuela 2 veces'),
      ).called(1);
      await tapVisible(tester, 'Todos los días');
      verify(() => flowCubit.setCommitmentWhen('Todos los días')).called(1);
      await tapVisible(tester, 'Cuántas veces lo hice');
      verify(
        () => flowCubit.setCommitmentHow('Cuántas veces lo hice'),
      ).called(1);

      await tester.tap(find.text('Enviar mi compromiso'));
      verify(() => flowCubit.submitCommitment(any())).called(1);
    });

    testWidgets('commitment errors name the missing part', (tester) async {
      await pumpMemberFlow(
        tester,
        view: buildView(
          buildSession(
            stage: SessionStage.value,
            followUp: doneSynced,
            reflection: doneSynced,
          ),
        ),
        flowCubit: flowCubit,
        state: const MemberFlowState(
          errors: {
            'commitmentWhat': ResponseError.required,
            'commitmentWhen': ResponseError.required,
            'commitmentHow': ResponseError.required,
          },
        ),
      );
      expect(
        find.text('Escribe una acción concreta para esta semana.'),
        findsOneWidget,
      );
      expect(find.text('Elige cuándo lo harás.'), findsOneWidget);
      expect(find.text('Elige cómo lo vas a medir.'), findsOneWidget);
    });
  });

  group('room', () {
    testWidgets('lobby waits for the facilitator', (tester) async {
      await pumpMemberFlow(
        tester,
        view: buildView(
          buildSession(
            status: SessionStatus.scheduled,
            stage: SessionStage.lobby,
            attendance: null,
          ),
        ),
        flowCubit: flowCubit,
      );
      expect(find.text('Esperando a tu facilitador'), findsOneWidget);
      expect(find.textContaining('La mesa está en:'), findsOneWidget);
    });

    testWidgets('the facilitator sees their own lobby copy', (tester) async {
      await pumpMemberFlow(
        tester,
        view: buildView(
          buildSession(
            facilitator: true,
            status: SessionStatus.scheduled,
            stage: SessionStage.lobby,
            attendance: null,
          ),
        ),
        flowCubit: flowCubit,
      );
      expect(find.text('Aún no abres la sesión'), findsOneWidget);
    });

    testWidgets('attendance shows the persons mark and the absent hint', (
      tester,
    ) async {
      await pumpMemberFlow(
        tester,
        view: buildView(
          buildSession(
            stage: SessionStage.attendance,
            attendance: AttendanceStatus.absent,
          ),
        ),
        flowCubit: flowCubit,
      );
      expect(find.text('Ausente'), findsOneWidget);
      expect(
        find.text(
          'Si respondes igualmente, pasarás a Presente al sincronizar.',
        ),
        findsOneWidget,
      );
    });

    testWidgets('offline self-paced says A tu ritmo with the offline notice', (
      tester,
    ) async {
      await pumpMemberFlow(
        tester,
        view: buildView(
          buildSession(),
          online: false,
          connection: SyncConnection.offline,
        ),
        flowCubit: flowCubit,
      );
      expect(find.text('A tu ritmo'), findsOneWidget);
      expect(find.textContaining('La mesa está en:'), findsNothing);
      expect(
        find.text('Sin internet · todo se guarda en este teléfono'),
        findsOneWidget,
      );
      expect(find.text('Sin internet'), findsWidgets);
    });

    testWidgets('closed session shows the thanks summary', (tester) async {
      await pumpMemberFlow(
        tester,
        view: buildView(
          buildSession(
            status: SessionStatus.closed,
            stage: SessionStage.closed,
            followUp: doneSynced,
          ),
        ),
        flowCubit: flowCubit,
      );
      expect(find.text('Gracias, Ana Lucía'), findsOneWidget);
      expect(find.text('Tu asistencia'.toUpperCase()), findsOneWidget);
      expect(
        find.text(
          'Quedaron etapas sin responder. Ya no se pueden enviar desde la mesa en vivo.',
        ),
        findsOneWidget,
      );
    });
  });

  group('sync', () {
    testWidgets('warns after 24 hours without syncing', (tester) async {
      await pumpMemberFlow(
        tester,
        view: buildView(
          buildSession(),
          sync: SyncSnapshot(
            connection: SyncConnection.connected,
            pendingCount: 2,
            pendingSince: DateTime.now().toUtc().subtract(
              const Duration(hours: 31),
            ),
            hasStalePending: true,
          ),
        ),
        flowCubit: flowCubit,
      );
      expect(
        find.textContaining('Llevas 31 h sin sincronizar'),
        findsOneWidget,
      );
    });

    testWidgets('shows refused uploads', (tester) async {
      await pumpMemberFlow(
        tester,
        view: buildView(
          buildSession(rejectedMessages: const ['La sesión ya se cerró.']),
        ),
        flowCubit: flowCubit,
      );
      expect(
        find.text('Algunas respuestas no se pudieron enviar'),
        findsOneWidget,
      );
      expect(find.textContaining('La sesión ya se cerró.'), findsOneWidget);
    });
  });

  testWidgets('embedded renders without page chrome', (tester) async {
    await pumpMemberFlow(
      tester,
      view: buildView(buildSession(facilitator: true)),
      flowCubit: flowCubit,
      embedded: true,
    );
    expect(find.byType(AppScaffold), findsNothing);
    expect(find.text('Enviar seguimiento'), findsOneWidget);
    expect(find.text('La mesa está en:'), findsNothing);
  });

  testWidgets('keeps a readable column on tablets', (tester) async {
    await pumpMemberFlow(
      tester,
      view: buildView(buildSession()),
      flowCubit: flowCubit,
      size: const Size(1024, 900),
    );
    final width = tester.getSize(find.byType(MemberRoomHeader)).width;
    expect(width, lessThanOrEqualTo(MemberFlowView.maxContentWidth));
  });
}
