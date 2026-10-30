import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/models/session_stage.dart';
import 'package:gold_roundtables/core/theme/app_theme.dart';
import 'package:gold_roundtables/features/session/domain/models/member_flow.dart';
import 'package:gold_roundtables/features/session/presentation/pages/member_flow/cubit/member_flow_cubit.dart';
import 'package:gold_roundtables/features/session/presentation/pages/member_flow/cubit/member_flow_state.dart';
import 'package:gold_roundtables/features/session/presentation/pages/member_flow/widgets/reflection_panel.dart';
import 'package:gold_roundtables/l10n/gen/app_localizations.dart';
import 'package:mocktail/mocktail.dart';

import 'member_flow_fixtures.dart';

/// The `person` question (RF-54) in the reflection step, without the room
/// header around it.
void main() {
  late MockMemberFlowCubit flowCubit;

  setUp(() {
    flowCubit = MockMemberFlowCubit();
    when(
      () => flowCubit.pickAnswerPerson(any(), any(), any()),
    ).thenReturn(null);
    when(() => flowCubit.setAnswer(any(), any())).thenReturn(null);
  });

  Future<void> pumpPanel(
    WidgetTester tester, {
    bool personQuestion = true,
    MemberFlowState state = const MemberFlowState(),
  }) async {
    whenListen(
      flowCubit,
      const Stream<MemberFlowState>.empty(),
      initialState: state,
    );
    tester.view.physicalSize = const Size(390, 1400);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    final flow = MemberFlow(
      buildSession(
        stage: SessionStage.value,
        followUp: doneSynced,
        personQuestion: personQuestion,
      ),
      live: true,
    );
    await tester.pumpWidget(
      BlocProvider<MemberFlowCubit>.value(
        value: flowCubit,
        child: MaterialApp(
          theme: AppTheme.light,
          locale: const Locale('es'),
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          home: Scaffold(
            body: SingleChildScrollView(
              child: ReflectionPanel(flow: flow, state: state),
            ),
          ),
        ),
      ),
    );
    await tester.pump();
  }

  testWidgets(
    'offers the table\'s people but not myself, plus "otra persona"',
    (tester) async {
      await pumpPanel(tester);

      expect(find.text('¿Quién es para ti un ejemplo?'), findsOneWidget);
      expect(find.text('Luis Ferrer'), findsOneWidget);
      expect(find.text('Ana Lucía Méndez'), findsNothing);
      expect(find.text('Otra persona'), findsOneWidget);
      expect(find.text('¿Por qué te diste ese puntaje?'), findsOneWidget);
    },
  );

  testWidgets('picking a person and typing another name go to the cubit', (
    tester,
  ) async {
    await pumpPanel(tester);

    await tester.tap(find.byKey(const ValueKey('person-luis')));
    verify(
      () => flowCubit.pickAnswerPerson('q1', 'luis', 'Luis Ferrer'),
    ).called(1);

    await tester.enterText(
      find.byKey(const ValueKey('person-other')),
      'Mi tía Rosa',
    );
    verify(() => flowCubit.setAnswer('q1', 'Mi tía Rosa')).called(1);
  });

  testWidgets('the picked person is selected and its name fills the box', (
    tester,
  ) async {
    await pumpPanel(
      tester,
      state: const MemberFlowState(
        answers: {'q1': 'Luis Ferrer'},
        answerPersonIds: {'q1': 'luis'},
      ),
    );

    expect(
      tester.getSemantics(find.byKey(const ValueKey('person-luis'))),
      isSemantics(isSelected: true),
    );
    final box = tester.widget<EditableText>(
      find.descendant(
        of: find.byKey(const ValueKey('person-other')),
        matching: find.byType(EditableText),
      ),
    );
    expect(box.controller.text, 'Luis Ferrer');
  });

  testWidgets('a text question stays a plain text field', (tester) async {
    await pumpPanel(tester, personQuestion: false);

    expect(find.byKey(const ValueKey('person-luis')), findsNothing);
    expect(find.text('Otra persona'), findsNothing);
    expect(find.text('¿Quién es para ti un ejemplo?'), findsOneWidget);
  });
}
