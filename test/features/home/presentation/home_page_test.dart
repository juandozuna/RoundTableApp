import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:gold_roundtables/core/config/injection.dart';
import 'package:gold_roundtables/core/models/health_status.dart';
import 'package:gold_roundtables/core/models/user_role.dart';
import 'package:gold_roundtables/core/network/api_exception.dart';
import 'package:gold_roundtables/core/services/session_context/session_context.dart';
import 'package:gold_roundtables/core/theme/app_theme.dart';
import 'package:gold_roundtables/features/auth/presentation/cubit/access_cubit.dart';
import 'package:gold_roundtables/features/auth/presentation/cubit/access_cubit_state.dart';
import 'package:gold_roundtables/features/home/domain/models/home_commitment.dart';
import 'package:gold_roundtables/features/home/domain/models/home_kpi_summary.dart';
import 'package:gold_roundtables/features/home/domain/models/home_overview.dart';
import 'package:gold_roundtables/features/home/domain/models/home_progress.dart';
import 'package:gold_roundtables/features/home/domain/models/home_session.dart';
import 'package:gold_roundtables/features/home/presentation/pages/home/cubit/home_cubit.dart';
import 'package:gold_roundtables/features/home/presentation/pages/home/cubit/home_state.dart';
import 'package:gold_roundtables/features/home/presentation/pages/home/home_page.dart';
import 'package:gold_roundtables/features/notifications/domain/models/unsynced_alert.dart';
import 'package:gold_roundtables/features/notifications/presentation/cubit/unsynced_alert_cubit.dart';
import 'package:gold_roundtables/features/shell/presentation/cubit/context_chip_cubit.dart';
import 'package:gold_roundtables/features/shell/presentation/cubit/context_chip_state.dart';
import 'package:gold_roundtables/l10n/gen/app_localizations.dart';
import 'package:mocktail/mocktail.dart';

class _MockHomeCubit extends MockCubit<HomeState> implements HomeCubit {}

class _MockUnsynced extends MockCubit<UnsyncedAlert?>
    implements UnsyncedAlertCubit {}

class _MockAccess extends MockCubit<AccessCubitState> implements AccessCubit {}

class _MockChip extends MockCubit<ContextChipState>
    implements ContextChipCubit {}

void main() {
  const facilitatorContext = SessionContext(
    role: UserRole.facilitator,
    tableId: 't1',
    tableName: 'Mesa Esperanza 03',
  );
  final session = HomeSession(
    id: 's4',
    roundTableId: 't1',
    tableName: 'Mesa Esperanza 03',
    scheduledAt: DateTime.utc(2026, 10, 26, 23),
    isOpen: false,
    seatsTaken: 8,
    valueName: 'Responsabilidad',
    valueSequence: 4,
    followUpValueName: 'Honestidad',
    health: HealthStatus.active,
  );

  late _MockHomeCubit cubit;
  late String? pushed;

  setUp(() {
    cubit = _MockHomeCubit();
    pushed = null;
    when(() => cubit.load()).thenAnswer((_) async {});
    getIt
      ..registerFactory<UnsyncedAlertCubit>(() {
        final mock = _MockUnsynced();
        when(() => mock.state).thenReturn(null);
        return mock;
      })
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

  Future<void> pumpPage(WidgetTester tester, HomeState state) async {
    when(() => cubit.state).thenReturn(state);
    tester.view.physicalSize = const Size(390, 1400);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    final router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (_, _) => BlocProvider<HomeCubit>.value(
            value: cubit,
            child: const HomePage(),
          ),
        ),
        GoRoute(
          path: '/progreso',
          builder: (_, routeState) {
            pushed = routeState.uri.toString();
            return const Scaffold(body: Text('progress'));
          },
        ),
        GoRoute(
          path: '/mesas/:tableId/sesion',
          builder: (_, routeState) {
            pushed = routeState.uri.toString();
            return const Scaffold(body: Text('session'));
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

  testWidgets('facilitator sees the next session and opens it', (tester) async {
    await pumpPage(
      tester,
      HomeState(
        status: HomeStatus.ready,
        overview: HomeOverview.facilitator(
          context: facilitatorContext,
          session: session,
        ),
      ),
    );

    expect(find.text('Valor 4 · Responsabilidad'), findsOneWidget);
    expect(find.text('Seguimiento de: Honestidad'), findsOneWidget);
    expect(find.text('Mesa Esperanza 03'), findsOneWidget);
    expect(find.text('Al día'), findsOneWidget);

    await tester.tap(find.text('Abrir sesión'));
    await tester.pumpAndSettle();
    expect(pushed, '/mesas/t1/sesion');
  });

  testWidgets('facilitator and member link to their progress', (tester) async {
    await pumpPage(
      tester,
      HomeState(
        status: HomeStatus.ready,
        overview: HomeOverview.facilitator(
          context: facilitatorContext,
          session: session,
        ),
      ),
    );
    expect(find.text('Ver el progreso de la mesa'), findsOneWidget);
    await tester.ensureVisible(find.text('Ver el progreso de la mesa'));
    await tester.pump();
    await tester.tap(find.text('Ver el progreso de la mesa'));
    await tester.pumpAndSettle();
    expect(pushed, '/progreso');
  });

  testWidgets('an open session offers to continue it', (tester) async {
    await pumpPage(
      tester,
      HomeState(
        status: HomeStatus.ready,
        overview: HomeOverview.facilitator(
          context: facilitatorContext,
          session: session.copyWith(isOpen: true),
        ),
      ),
    );

    expect(find.text('Continuar sesión'), findsOneWidget);
    expect(find.text('En curso'), findsOneWidget);
  });

  testWidgets('no session shows the empty state', (tester) async {
    await pumpPage(
      tester,
      const HomeState(
        status: HomeStatus.ready,
        overview: HomeOverview.facilitator(context: facilitatorContext),
      ),
    );

    expect(find.text('No hay una sesión programada'), findsOneWidget);
    expect(find.text('Abrir sesión'), findsNothing);
  });

  testWidgets('member sees commitment and progress by module', (tester) async {
    await pumpPage(
      tester,
      HomeState(
        status: HomeStatus.ready,
        overview: HomeOverview.member(
          context: const SessionContext(role: UserRole.member, tableId: 't1'),
          session: session,
          lastCommitment: const HomeCommitment(
            actionText: 'Llegar puntual a mi trabajo',
            valueName: 'Honestidad',
          ),
          progress: const HomeProgress(
            modules: [
              ModuleProgress(
                number: 1,
                name: 'Carácter',
                completed: 3,
                total: 10,
              ),
              ModuleProgress(
                number: 2,
                name: 'Familia',
                completed: 0,
                total: 10,
              ),
            ],
          ),
        ),
      ),
    );

    expect(find.text('Llegar puntual a mi trabajo'), findsOneWidget);
    expect(find.text('Se revisa en la próxima sesión'), findsOneWidget);
    expect(find.text('3 de 20 valores'), findsOneWidget);
    expect(find.text('Módulo 1 · Carácter'), findsOneWidget);
    expect(find.text('Entrar a la sesión'), findsOneWidget);
  });

  testWidgets('coordinator sees the KPI strip and pending invites', (
    tester,
  ) async {
    await pumpPage(
      tester,
      const HomeState(
        status: HomeStatus.ready,
        overview: HomeOverview.manager(
          context: SessionContext(role: UserRole.coordinator),
          kpis: HomeKpiSummary(
            valuesCompleted: 115,
            attendancePct: 86.1,
            improvementAvg: 0.7,
            tables: HomeTableHealthCounts(active: 12, delayed: 3),
          ),
          pendingInvites: 2,
        ),
      ),
    );

    expect(find.text('115'), findsOneWidget);
    expect(find.text('+0.7'), findsOneWidget);
    expect(find.text('86%'), findsOneWidget);
    expect(find.text('2 invitaciones pendientes'), findsOneWidget);
  });

  testWidgets('a manager offline sees the banner and a retry', (tester) async {
    await pumpPage(
      tester,
      const HomeState(
        status: HomeStatus.failure,
        online: false,
        error: ApiException(kind: ApiErrorKind.network),
        overview: HomeOverview.manager(
          context: SessionContext(role: UserRole.administrator),
        ),
      ),
    );

    expect(find.textContaining('Sin conexión'), findsWidgets);
    expect(find.text('No pudimos cargar esto'), findsOneWidget);
    await tester.tap(find.text('Reintentar').last);
    verify(() => cubit.load()).called(1);
  });

  testWidgets('no context explains what to do', (tester) async {
    await pumpPage(tester, const HomeState(status: HomeStatus.ready));

    expect(find.text('Elige cómo quieres entrar'), findsOneWidget);
  });
}
