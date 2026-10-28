import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:gold_roundtables/core/config/injection.dart';
import 'package:gold_roundtables/core/theme/app_theme.dart';
import 'package:gold_roundtables/features/auth/presentation/cubit/access_cubit.dart';
import 'package:gold_roundtables/features/auth/presentation/cubit/access_cubit_state.dart';
import 'package:gold_roundtables/features/calendar/domain/models/upcoming_filter.dart';
import 'package:gold_roundtables/features/calendar/domain/models/upcoming_session.dart';
import 'package:gold_roundtables/features/calendar/domain/models/upcoming_sessions.dart';
import 'package:gold_roundtables/features/calendar/presentation/pages/upcoming/cubit/upcoming_cubit.dart';
import 'package:gold_roundtables/features/calendar/presentation/pages/upcoming/cubit/upcoming_state.dart';
import 'package:gold_roundtables/features/calendar/presentation/pages/upcoming/upcoming_page.dart';
import 'package:gold_roundtables/features/shell/presentation/cubit/context_chip_cubit.dart';
import 'package:gold_roundtables/features/shell/presentation/cubit/context_chip_state.dart';
import 'package:gold_roundtables/l10n/gen/app_localizations.dart';
import 'package:mocktail/mocktail.dart';

import '../support/calendar_fixtures.dart';

class _MockCubit extends MockCubit<UpcomingState> implements UpcomingCubit {}

class _MockAccess extends MockCubit<AccessCubitState> implements AccessCubit {}

class _MockChip extends MockCubit<ContextChipState>
    implements ContextChipCubit {}

void main() {
  late _MockCubit cubit;
  String? pushed;

  setUp(() {
    cubit = _MockCubit();
    pushed = null;
    when(() => cubit.load()).thenAnswer((_) async {});
    getIt
      ..registerFactory<AccessCubit>(() {
        final mock = _MockAccess();
        when(() => mock.state).thenReturn(const AccessCubitState());
        return mock;
      })
      ..registerFactory<ContextChipCubit>(() {
        final mock = _MockChip();
        when(() => mock.state).thenReturn(const ContextChipState());
        return mock;
      });
  });

  tearDown(getIt.reset);

  Future<void> pumpPage(
    WidgetTester tester,
    UpcomingState state, {
    Size size = const Size(390, 1600),
  }) async {
    when(() => cubit.state).thenReturn(state);
    tester.view.physicalSize = size;
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    final router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (_, _) => BlocProvider<UpcomingCubit>.value(
            value: cubit,
            child: const UpcomingPage(),
          ),
        ),
        GoRoute(
          path: '/admin/mesas/:tableId',
          builder: (_, routeState) {
            pushed = routeState.uri.toString();
            return const Scaffold(body: Text('table detail'));
          },
        ),
      ],
    );
    await tester.pumpWidget(
      MaterialApp.router(
        theme: AppTheme.light,
        locale: const Locale('es'),
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        routerConfig: router,
      ),
    );
    await tester.pump();
  }

  UpcomingState manager(
    List<UpcomingSession> sessions, {
    UpcomingFilter filter = const UpcomingFilter(),
  }) => UpcomingState(
    status: UpcomingStatus.ready,
    sessions: UpcomingSessions(
      scope: UpcomingScope.manager,
      sessions: sessions,
    ),
    filter: filter,
  );

  testWidgets('shows the table-local time, place, facilitator and day', (
    tester,
  ) async {
    await pumpPage(tester, manager([upcomingSession()]));

    expect(find.text('Próximas sesiones'), findsWidgets);
    expect(find.text('1 sesión'), findsOneWidget);
    expect(find.text('Jueves 29/10'), findsOneWidget);
    expect(find.text('19:00'), findsOneWidget);
    expect(
      find.text('Hora de la mesa · America/Santo_Domingo'),
      findsOneWidget,
    );
    expect(find.text('Mesa Esperanza 03'), findsOneWidget);
    expect(find.text('Sede Central · Sofía Herrera'), findsOneWidget);
  });

  testWidgets('marks open, cancelled, extraordinary and rescheduled sessions', (
    tester,
  ) async {
    await pumpPage(
      tester,
      manager([
        upcomingSession(id: 'a', state: UpcomingSessionState.open),
        upcomingSession(
          id: 'b',
          tableId: 't2',
          state: UpcomingSessionState.cancelled,
        ),
        upcomingSession(id: 'c', tableId: 't3', isExtraordinary: true),
        upcomingSession(
          id: 'd',
          tableId: 't4',
          rescheduledFromLocal: DateTime(2026, 10, 28, 19),
        ),
        upcomingSession(id: 'e', tableId: 't5', facilitatorName: null),
      ]),
    );

    expect(find.text('En curso'), findsOneWidget);
    expect(find.text('Cancelada'), findsOneWidget);
    expect(find.text('Extraordinaria'), findsOneWidget);
    expect(find.text('Reprogramada · antes 28/10 19:00'), findsOneWidget);
    expect(find.text('Sede Central · Sin facilitador'), findsOneWidget);
  });

  testWidgets('groups sessions by the day on the table clock', (tester) async {
    await pumpPage(
      tester,
      manager([
        upcomingSession(id: 'a', localStart: DateTime(2026, 10, 29, 19)),
        upcomingSession(
          id: 'b',
          tableId: 't2',
          localStart: DateTime(2026, 10, 29, 20),
        ),
        upcomingSession(
          id: 'c',
          tableId: 't3',
          localStart: DateTime(2026, 10, 30, 8),
        ),
      ]),
    );

    expect(find.text('Jueves 29/10'), findsOneWidget);
    expect(find.text('Viernes 30/10'), findsOneWidget);
  });

  testWidgets('a manager can open the table of a session', (tester) async {
    await pumpPage(tester, manager([upcomingSession()]));
    await tester.tap(find.text('Mesa Esperanza 03'));
    await tester.pumpAndSettle();
    expect(pushed, '/admin/mesas/t1');
  });

  testWidgets('managers get the three filters and they drive the cubit', (
    tester,
  ) async {
    when(() => cubit.filterByLocation(any())).thenReturn(null);
    await pumpPage(
      tester,
      manager([
        upcomingSession(),
        upcomingSession(
          id: 'b',
          tableId: 't2',
          locationId: 'l2',
          locationName: 'Sede Norte',
        ),
      ]),
    );

    expect(find.text('Ubicación'), findsOneWidget);
    expect(find.text('Facilitador'), findsOneWidget);
    expect(find.text('Mesa'), findsOneWidget);

    await tester.tap(find.byType(FormBuilderDropdown<String>).first);
    await tester.pumpAndSettle();
    await tester.tap(find.text('Sede Norte').last);
    await tester.pumpAndSettle();
    verify(() => cubit.filterByLocation('l2')).called(1);
  });

  testWidgets('an active filter with no match explains it and can be cleared', (
    tester,
  ) async {
    when(() => cubit.clearFilter()).thenReturn(null);
    await pumpPage(
      tester,
      manager([
        upcomingSession(),
      ], filter: const UpcomingFilter(facilitatorId: 'nobody')),
    );
    // Selected option no longer exists: picker falls back to "Todos".
    expect(
      find.text('Ninguna sesión coincide con estos filtros.'),
      findsOneWidget,
    );
    await tester.tap(find.text('Limpiar filtros'));
    verify(() => cubit.clearFilter()).called(1);
  });

  testWidgets('a facilitator sees a plain list without filters or links', (
    tester,
  ) async {
    await pumpPage(
      tester,
      UpcomingState(
        status: UpcomingStatus.ready,
        sessions: UpcomingSessions(
          scope: UpcomingScope.facilitator,
          sessions: [upcomingSession()],
        ),
        online: false,
      ),
    );

    expect(find.text('Ubicación'), findsNothing);
    expect(find.text('Mesa Esperanza 03'), findsOneWidget);
    await tester.tap(find.text('Mesa Esperanza 03'));
    await tester.pumpAndSettle();
    expect(pushed, isNull);
  });

  testWidgets('empty list, loading, failure and unavailable states', (
    tester,
  ) async {
    await pumpPage(tester, manager(const []));
    expect(find.text('No hay sesiones próximas'), findsOneWidget);

    await pumpPage(
      tester,
      const UpcomingState(
        status: UpcomingStatus.ready,
        sessions: UpcomingSessions(scope: UpcomingScope.unavailable),
      ),
    );
    expect(find.text('Sin calendario para este rol'), findsOneWidget);

    when(() => cubit.load()).thenAnswer((_) async {});
    await pumpPage(tester, const UpcomingState(status: UpcomingStatus.failure));
    expect(
      find.text('No pudimos cargar las próximas sesiones.'),
      findsOneWidget,
    );
    await tester.tap(find.text('Reintentar'));
    verify(() => cubit.load()).called(1);
  });

  testWidgets('desktop lays cards out in a grid, phone in one column', (
    tester,
  ) async {
    final sessions = [
      for (var i = 0; i < 3; i++)
        upcomingSession(
          id: 's$i',
          tableId: 't$i',
          tableName: 'Mesa $i',
          localStart: DateTime(2026, 10, 29, 18 + i),
        ),
    ];
    await pumpPage(tester, manager(sessions), size: const Size(1400, 900));
    final desktop = [
      for (var i = 0; i < 3; i++) tester.getTopLeft(find.text('Mesa $i')),
    ];
    expect(desktop.map((p) => p.dy).toSet(), hasLength(1));

    await pumpPage(tester, manager(sessions));
    final phone = [
      for (var i = 0; i < 3; i++) tester.getTopLeft(find.text('Mesa $i')),
    ];
    expect(phone.map((p) => p.dy).toSet(), hasLength(3));
  });
}
