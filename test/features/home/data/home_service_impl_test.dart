import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/models/health_status.dart';
import 'package:gold_roundtables/core/models/user_role.dart';
import 'package:gold_roundtables/core/network/api_exception.dart';
import 'package:gold_roundtables/core/services/clock/clock_service.dart';
import 'package:gold_roundtables/core/services/session_context/session_context.dart';
import 'package:gold_roundtables/features/home/data/datasources/home_local_data_source.dart';
import 'package:gold_roundtables/features/home/data/datasources/home_remote_data_source.dart';
import 'package:gold_roundtables/features/home/data/models/home_records.dart';
import 'package:gold_roundtables/features/home/data/services/home_service_impl.dart';
import 'package:gold_roundtables/features/home/domain/models/home_kpi_summary.dart';
import 'package:gold_roundtables/features/home/domain/models/home_overview.dart';
import 'package:mocktail/mocktail.dart';

class _MockLocal extends Mock implements HomeLocalDataSource {}

class _MockRemote extends Mock implements HomeRemoteDataSource {}

class _FixedClock implements ClockService {
  @override
  DateTime nowUtc() => DateTime.utc(2026, 10, 26, 12);
}

void main() {
  const facilitator = SessionContext(
    role: UserRole.facilitator,
    tableId: 'table-1',
    organizationId: 'org-1',
  );
  const member = SessionContext(
    role: UserRole.member,
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

  late _MockLocal local;
  late _MockRemote remote;
  late HomeServiceImpl service;

  setUp(() {
    local = _MockLocal();
    remote = _MockRemote();
    service = HomeServiceImpl(local, remote, _FixedClock());
  });

  test(
    'facilitator home follows the local table and computes health',
    () async {
      when(
        () => local.watchFacilitatorTable('table-1'),
      ).thenAnswer((_) => Stream.value(record));

      final overview = await service.watchOverview(facilitator).first;

      final session = (overview as HomeFacilitator).session!;
      expect(session.id, 'session-4');
      expect(session.seatsTaken, 8);
      expect(session.valueSequence, 4);
      expect(session.followUpValueName, 'Honestidad');
      expect(session.health, HealthStatus.active);
      verifyNever(() => remote.fetchTable(any()));
    },
  );

  test('a table that has not synced yet is read online once', () async {
    when(
      () => local.watchFacilitatorTable('table-1'),
    ).thenAnswer((_) => Stream.value(null));
    when(() => remote.fetchTable('table-1')).thenAnswer((_) async => record);

    final overview = await service.watchOverview(facilitator).first;

    expect((overview as HomeFacilitator).session?.id, 'session-4');
  });

  test('offline first load shows the empty state, not an error', () async {
    when(
      () => local.watchFacilitatorTable('table-1'),
    ).thenAnswer((_) => Stream.value(null));
    when(
      () => remote.fetchTable('table-1'),
    ).thenThrow(const ApiException(kind: ApiErrorKind.network));

    final overview = await service.watchOverview(facilitator).first;

    expect((overview as HomeFacilitator).session, isNull);
  });

  test('falls back to PostgREST when the synced tables are missing', () async {
    when(
      () => local.watchFacilitatorTable('table-1'),
    ).thenAnswer((_) => Stream.error(StateError('no such table: sessions')));
    when(() => remote.fetchTable('table-1')).thenAnswer((_) async => record);

    final overview = await service.watchOverview(facilitator).first;

    expect(
      (overview as HomeFacilitator).session?.tableName,
      'Mesa Esperanza 03',
    );
  });

  test('server health wins over the local rule', () async {
    when(() => local.watchFacilitatorTable('table-1')).thenAnswer(
      (_) => Stream.value(
        HomeTableRecord(
          tableId: 'table-1',
          tableName: 'Mesa',
          tableIsActive: true,
          seats: 3,
          sessionId: 's',
          scheduledAt: upcoming,
          health: HealthStatus.delayed,
        ),
      ),
    );

    final overview = await service.watchOverview(facilitator).first;

    expect((overview as HomeFacilitator).session?.health, HealthStatus.delayed);
  });

  test('member home carries commitment and progress', () async {
    when(
      () => local.watchMember('table-1'),
    ).thenAnswer((_) => Stream.value(HomeMemberRecord(table: record)));

    final overview = await service.watchOverview(member).first;

    final home = overview as HomeMember;
    expect(home.session?.id, 'session-4');
    expect(home.lastCommitment, isNull);
    expect(home.progress.isEmpty, isTrue);
  });

  test('manager home loads KPIs and pending invites online', () async {
    when(
      () => remote.fetchKpis('org-1'),
    ).thenAnswer((_) async => const HomeKpiSummary(valuesCompleted: 115));
    when(() => remote.countPendingInvites('org-1')).thenAnswer((_) async => 2);

    final overview = await service.watchOverview(coordinator).first;

    final home = overview as HomeManager;
    expect(home.kpis?.valuesCompleted, 115);
    expect(home.pendingInvites, 2);
  });

  test('manager home surfaces offline as a stream error', () async {
    when(
      () => remote.fetchKpis(any()),
    ).thenThrow(const ApiException(kind: ApiErrorKind.network));

    expect(
      service.watchOverview(coordinator).first,
      throwsA(isA<ApiException>()),
    );
  });
}
