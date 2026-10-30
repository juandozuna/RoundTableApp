import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/data/data_scope.dart';
import 'package:gold_roundtables/core/models/health_reason.dart';
import 'package:gold_roundtables/core/models/health_status.dart';
import 'package:gold_roundtables/core/models/user_role.dart';
import 'package:gold_roundtables/core/network/api_exception.dart';
import 'package:gold_roundtables/core/services/clock/clock_service.dart';
import 'package:gold_roundtables/core/services/session_context/session_context.dart';
import 'package:gold_roundtables/features/home/data/datasources/home_remote_data_source.dart';
import 'package:gold_roundtables/features/home/data/datasources/home_table_remote_data_source.dart';
import 'package:gold_roundtables/features/home/data/models/home_records.dart';
import 'package:gold_roundtables/features/home/data/services/home_service_impl.dart';
import 'package:gold_roundtables/features/home/domain/models/home_commitment.dart';
import 'package:gold_roundtables/features/home/domain/models/home_kpi_summary.dart';
import 'package:gold_roundtables/features/home/domain/models/home_overview.dart';
import 'package:gold_roundtables/features/home/domain/models/home_progress.dart';
import 'package:gold_roundtables/features/home/domain/models/home_table_alert.dart';
import 'package:mocktail/mocktail.dart';

import '../../../core/data/support/online_data_stubs.dart';
import '../../settings/support/stub_selected_language.dart';

class _MockTables extends Mock implements HomeTableRemoteDataSource {}

class _MockRemote extends Mock implements HomeRemoteDataSource {}

class _FixedClock implements ClockService {
  @override
  DateTime nowUtc() => DateTime.utc(2026, 10, 26, 12);
}

void main() {
  kpiJsonTests();

  const facilitator = SessionContext(
    role: UserRole.facilitator,
    tableId: 'table-1',
    organizationId: 'org-1',
  );
  const member = SessionContext(
    role: UserRole.member,
    personId: 'person-ana',
    tableId: 'table-1',
    organizationId: 'org-1',
  );
  const coordinator = SessionContext(
    role: UserRole.coordinator,
    organizationId: 'org-1',
  );

  final upcoming = DateTime.utc(2026, 10, 27, 1);
  final record = HomeTableRecord(
    tableId: 'table-1',
    tableName: 'Mesa Esperanza 03',
    tableIsActive: true,
    seats: 8,
    lastClosedAt: DateTime.utc(2026, 10, 20, 1),
    sessionId: 'session-4',
    scheduledAt: upcoming,
    valueName: 'Responsabilidad',
    valueSequence: 4,
    followUpValueName: 'Honestidad',
  );

  late _MockTables tables;
  late _MockRemote remote;
  late StubSelectedLanguage language;
  late WatchHarness harness;
  late HomeServiceImpl service;

  setUp(() {
    tables = _MockTables();
    remote = _MockRemote();
    language = StubSelectedLanguage();
    harness = WatchHarness();
    service = HomeServiceImpl(
      tables,
      remote,
      language,
      _FixedClock(),
      harness.watch,
    );
  });

  void tableIs(HomeTableRecord? table, {String? locale}) => when(
    () => tables.fetchTable('table-1', locale: locale),
  ).thenAnswer((_) async => table);

  test('facilitator home reads the table and computes health', () async {
    tableIs(record);

    final overview = await service.watchOverview(facilitator).first;

    final session = (overview as HomeFacilitator).session!;
    expect(session.id, 'session-4');
    expect(session.seatsTaken, 8);
    expect(session.valueSequence, 4);
    expect(session.followUpValueName, 'Honestidad');
    expect(session.health, HealthStatus.active);
  });

  test('a table RLS does not show leaves the home without a session', () async {
    tableIs(null);

    final overview = await service.watchOverview(facilitator).first;

    expect((overview as HomeFacilitator).session, isNull);
  });

  test('a facilitator without a table reads nothing', () async {
    final overview = await service
        .watchOverview(const SessionContext(role: UserRole.facilitator))
        .first;

    expect((overview as HomeFacilitator).session, isNull);
    verifyZeroInteractions(tables);
  });

  test('the chosen content language is passed to the read', () async {
    language.selected = 'en';
    tableIs(record, locale: 'en');

    final overview = await service.watchOverview(facilitator).first;

    expect((overview as HomeFacilitator).session?.id, 'session-4');
  });

  test('exceptions to the schedule reach the home session (RF-30)', () async {
    final regularSlot = DateTime.utc(2026, 10, 28, 1);
    final cancelled = DateTime.utc(2026, 10, 21, 1);
    tableIs(
      HomeTableRecord(
        tableId: 'table-1',
        tableName: 'Mesa',
        tableIsActive: true,
        seats: 3,
        sessionId: 's',
        scheduledAt: upcoming,
        sessionIsExtraordinary: true,
        rescheduledFrom: regularSlot,
        cancelledNoticeFor: cancelled,
      ),
    );

    final overview = await service.watchOverview(facilitator).first;

    final session = (overview as HomeFacilitator).session!;
    expect(session.isExtraordinary, isTrue);
    expect(session.rescheduledFrom, regularSlot);
    expect(session.cancelledNoticeFor, cancelled);
  });

  test('a regular session carries no exception markers', () async {
    tableIs(record);

    final overview = await service.watchOverview(facilitator).first;

    final session = (overview as HomeFacilitator).session!;
    expect(session.isExtraordinary, isFalse);
    expect(session.rescheduledFrom, isNull);
    expect(session.cancelledNoticeFor, isNull);
  });

  test(
    'health follows the table rule: an inactive table is inactive',
    () async {
      tableIs(
        HomeTableRecord(
          tableId: 'table-1',
          tableName: 'Mesa',
          tableIsActive: false,
          seats: 3,
          sessionId: 's',
          scheduledAt: upcoming,
        ),
      );

      final overview = await service.watchOverview(facilitator).first;

      expect(
        (overview as HomeFacilitator).session?.health,
        HealthStatus.inactive,
      );
    },
  );

  test('member home carries the commitment and progress', () async {
    when(
      () => tables.fetchMember('table-1', personId: 'person-ana', locale: null),
    ).thenAnswer(
      (_) async => HomeMemberRecord(
        table: record,
        commitment: const HomeCommitment(
          actionText: 'Hablar con ella',
          valueName: 'Honestidad',
          outcome: CommitmentOutcome.kept,
        ),
        progress: const HomeProgress(
          modules: [
            ModuleProgress(number: 1, name: 'Carácter', completed: 1, total: 2),
          ],
        ),
      ),
    );

    final overview = await service.watchOverview(member).first;

    final home = overview as HomeMember;
    expect(home.session?.id, 'session-4');
    expect(home.lastCommitment?.actionText, 'Hablar con ella');
    expect(home.progress.completed, 1);
  });

  test('manager home loads KPIs, alerts and pending invites', () async {
    when(
      () => remote.fetchKpis('org-1'),
    ).thenAnswer((_) async => const HomeKpiSummary(valuesCompleted: 115));
    when(() => remote.countPendingInvites('org-1')).thenAnswer((_) async => 2);
    when(() => remote.fetchTableAlerts('org-1')).thenAnswer(
      (_) async => const [
        HomeTableAlert(
          tableId: 't7',
          code: 'LUZ-07',
          name: 'Mesa Fe 07',
          reasons: [HealthReason.fewPeople],
        ),
      ],
    );

    final overview = await service.watchOverview(coordinator).first;

    final home = overview as HomeManager;
    expect(home.kpis?.valuesCompleted, 115);
    expect(home.pendingInvites, 2);
    expect(home.alerts.single.code, 'LUZ-07');
  });

  test('manager home surfaces offline as a stream error', () async {
    when(() => remote.fetchKpis(any())).thenAnswer(
      (_) => Future.error(const ApiException(kind: ApiErrorKind.network)),
    );
    when(() => remote.countPendingInvites(any())).thenAnswer((_) async => 0);
    when(
      () => remote.fetchTableAlerts(any()),
    ).thenAnswer((_) async => const []);

    expect(
      service.watchOverview(coordinator).first,
      throwsA(isA<ApiException>()),
    );
  });

  group('refresh', () {
    Future<int> refreshesAfter(DataScope scope) async {
      var reads = 0;
      when(() => tables.fetchTable('table-1', locale: null)).thenAnswer((
        _,
      ) async {
        reads++;
        return HomeTableRecord(
          tableId: 'table-1',
          tableName: 'Mesa',
          tableIsActive: true,
          seats: reads,
          sessionId: 's',
          scheduledAt: upcoming,
        );
      });
      final sub = service.watchOverview(facilitator).listen((_) {});
      await pumpEventQueue();
      harness.signal.notify(scope);
      await pumpEventQueue();
      await sub.cancel();
      return reads;
    }

    test('a session, schedule or admin change refetches', () async {
      for (final scope in [
        DataScope.home,
        DataScope.session,
        DataScope.calendar,
        DataScope.admin,
        DataScope.contentLanguage,
      ]) {
        expect(await refreshesAfter(scope), 2, reason: '$scope');
      }
    });

    test('a history-only change does not', () async {
      expect(await refreshesAfter(DataScope.history), 1);
    });
  });
}

void kpiJsonTests() {
  test('parses a real kpi_summary payload', () {
    final summary = HomeKpiSummary.fromJson({
      'tables': {
        'total': 8,
        'active': 6,
        'delayed': 1,
        'inactive': 1,
        'completed': 0,
      },
      'computed_at': '2026-10-26T00:09:44.769351+00:00',
      'initial_avg': 4.65,
      'attendance_pct': 85.8,
      'improvement_avg': 0.74,
      'sessions_closed': 45,
      'synced_late_rows': 17,
      'values_completed': 45,
    });
    expect(summary.valuesCompleted, 45);
    expect(summary.attendancePct, 85.8);
    expect(summary.tables.delayed, 1);
    expect(summary.computedAt, isNotNull);
  });
}
