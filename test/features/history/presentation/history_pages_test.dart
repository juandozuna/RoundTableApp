import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:gold_roundtables/core/theme/app_theme.dart';
import 'package:gold_roundtables/features/history/domain/models/history_builder.dart';
import 'package:gold_roundtables/features/history/domain/models/member_history.dart';
import 'package:gold_roundtables/features/history/history_routes.dart';
import 'package:gold_roundtables/features/history/presentation/pages/member_timeline/cubit/member_timeline_cubit.dart';
import 'package:gold_roundtables/features/history/presentation/pages/member_timeline/cubit/member_timeline_state.dart';
import 'package:gold_roundtables/features/history/presentation/pages/member_timeline/member_timeline_page.dart';
import 'package:gold_roundtables/features/history/presentation/pages/progress/cubit/progress_cubit.dart';
import 'package:gold_roundtables/features/history/presentation/pages/progress/cubit/progress_state.dart';
import 'package:gold_roundtables/features/history/presentation/pages/progress/progress_page.dart';
import 'package:gold_roundtables/l10n/gen/app_localizations.dart';
import 'package:mocktail/mocktail.dart';

import '../support/history_fixtures.dart';

class _MockProgressCubit extends MockCubit<ProgressState>
    implements ProgressCubit {}

class _MockTimelineCubit extends MockCubit<MemberTimelineState>
    implements MemberTimelineCubit {}

void main() {
  final snapshot = HistoryFixtures.snapshot();
  final ana = HistoryBuilder.member(snapshot, HistoryFixtures.ana);
  final table = HistoryBuilder.table(snapshot);

  late _MockProgressCubit progress;
  late _MockTimelineCubit timeline;

  setUp(() {
    progress = _MockProgressCubit();
    timeline = _MockTimelineCubit();
    when(() => progress.load()).thenAnswer((_) async {});
    when(() => timeline.retry()).thenAnswer((_) async {});
  });

  Future<void> pumpApp(
    WidgetTester tester, {
    required double width,
    ThemeData? theme,
    ProgressState? progressState,
    MemberTimelineState? timelineState,
    String initial = HistoryRoutes.progress,
  }) async {
    when(
      () => progress.state,
    ).thenReturn(progressState ?? const ProgressState());
    when(
      () => timeline.state,
    ).thenReturn(timelineState ?? const MemberTimelineState());
    tester.view.physicalSize = Size(width, 1600);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    final router = GoRouter(
      initialLocation: initial,
      routes: [
        GoRoute(
          path: HistoryRoutes.progress,
          builder: (_, _) => BlocProvider<ProgressCubit>.value(
            value: progress,
            child: const ProgressPage(),
          ),
        ),
        GoRoute(
          path: HistoryRoutes.memberTimeline,
          builder: (_, _) => BlocProvider<MemberTimelineCubit>.value(
            value: timeline,
            child: const MemberTimelinePage(),
          ),
        ),
      ],
    );
    await tester.pumpWidget(
      MaterialApp.router(
        theme: theme ?? AppTheme.light,
        locale: const Locale('es'),
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        routerConfig: router,
      ),
    );
    await tester.pump();
  }

  ProgressState memberState({bool online = true}) =>
      ProgressState(status: ProgressStatus.member, member: ana, online: online);

  for (final width in [390.0, 1024.0]) {
    group('at $width px', () {
      testWidgets('member sees stats, chart, values and sessions', (
        tester,
      ) async {
        await pumpApp(tester, width: width, progressState: memberState());

        expect(find.text('Mi progreso'), findsOneWidget);
        expect(find.textContaining('últimas 8 semanas'), findsOneWidget);
        expect(find.text('2 de 2'), findsOneWidget);
        expect(find.text('6,5'), findsOneWidget);
        expect(find.text('Inicial y seguimiento por valor'), findsOneWidget);
        expect(find.text('Módulo 1 · Carácter'), findsOneWidget);
        expect(find.text('Valor 3 · Honestidad'), findsWidgets);
        expect(
          find.textContaining('Me cuesta decir la verdad'),
          findsOneWidget,
        );
        expect(find.text('Llamar a mi mamá · esta semana'), findsOneWidget);
        expect(find.text('Lo cumplí'), findsOneWidget);
        expect(find.text('+2 · Mejoró 2'), findsOneWidget);
        expect(find.text('Enviado tarde'), findsWidgets);
        expect(find.text('Sesiones'), findsOneWidget);
        expect(find.byType(CustomPaint), findsWidgets);
        expect(
          find.bySemanticsLabel(RegExp('Gráfica de puntajes')),
          findsOneWidget,
        );
      });

      testWidgets('facilitator sees the table and opens a member', (
        tester,
      ) async {
        await pumpApp(
          tester,
          width: width,
          progressState: ProgressState(
            status: ProgressStatus.facilitator,
            table: table,
          ),
        );

        expect(find.text('Progreso de la mesa'), findsOneWidget);
        expect(find.text('Integrantes'), findsOneWidget);
        expect(find.text('Facilitador'), findsOneWidget);
        expect(find.text('Promedio de la mesa por valor'), findsOneWidget);
        expect(find.text('Marta Quiroz'), findsNothing);

        await tester.ensureVisible(find.text('Ana Méndez').first);
        await tester.pump();
        when(() => timeline.state).thenReturn(
          MemberTimelineState(status: MemberTimelineStatus.ready, history: ana),
        );
        await tester.tap(find.text('Ana Méndez').first);
        await tester.pumpAndSettle();

        expect(find.text('Recorrido de Ana Méndez'), findsOneWidget);
        expect(find.text('Valor 3 · Honestidad'), findsWidgets);
        // Exit behaviour: the back button returns to the table history.
        await tester.tap(find.byIcon(Icons.arrow_back_rounded));
        await tester.pumpAndSettle();
        expect(find.text('Progreso de la mesa'), findsOneWidget);
      });

      testWidgets('facilitator expands a session to see each member', (
        tester,
      ) async {
        await pumpApp(
          tester,
          width: width,
          progressState: ProgressState(
            status: ProgressStatus.facilitator,
            table: table,
          ),
        );

        final session = find.textContaining('Asistieron 2 de 3').first;
        await tester.ensureVisible(session);
        await tester.pump();
        await tester.tap(session);
        await tester.pumpAndSettle();

        expect(find.textContaining('Inicial 7 · Seguimiento 8'), findsWidgets);
        expect(find.text('Sin compromiso'), findsWidgets);
      });

      testWidgets('shows loading, empty, unavailable and error states', (
        tester,
      ) async {
        await pumpApp(tester, width: width);
        expect(find.bySemanticsLabel('Cargando…'), findsWidgets);

        await pumpApp(
          tester,
          width: width,
          progressState: const ProgressState(
            status: ProgressStatus.member,
            member: MemberHistory(personId: 'ana', name: 'Ana'),
          ),
        );
        expect(find.text('Todavía no hay historial'), findsOneWidget);

        await pumpApp(
          tester,
          width: width,
          progressState: const ProgressState(
            status: ProgressStatus.unavailable,
          ),
        );
        expect(find.text('Aquí verás tu progreso'), findsOneWidget);

        await pumpApp(
          tester,
          width: width,
          progressState: const ProgressState(status: ProgressStatus.failure),
        );
        expect(
          find.text('No pudimos leer tu historial en este dispositivo.'),
          findsOneWidget,
        );
        await tester.tap(find.text('Reintentar'));
        verify(() => progress.load()).called(1);
      });

      testWidgets('offline keeps the history and says so', (tester) async {
        await pumpApp(
          tester,
          width: width,
          progressState: memberState(online: false),
        );

        expect(find.textContaining('Sin conexión'), findsOneWidget);
        expect(find.text('Valor 3 · Honestidad'), findsWidgets);
      });

      testWidgets('renders in the dark theme', (tester) async {
        await pumpApp(
          tester,
          width: width,
          theme: AppTheme.dark,
          progressState: memberState(),
        );

        expect(find.text('Valor 3 · Honestidad'), findsWidgets);
        expect(tester.takeException(), isNull);
      });
    });
  }
}
