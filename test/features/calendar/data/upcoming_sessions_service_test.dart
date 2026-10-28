import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/models/user_role.dart';
import 'package:gold_roundtables/core/services/clock/clock_service.dart';
import 'package:gold_roundtables/core/services/session_context/session_context.dart';
import 'package:gold_roundtables/features/calendar/data/datasources/calendar_local_data_source.dart';
import 'package:gold_roundtables/features/calendar/data/datasources/calendar_remote_data_source.dart';
import 'package:gold_roundtables/features/calendar/data/models/upcoming_session_record.dart';
import 'package:gold_roundtables/features/calendar/data/services/table_wall_clock.dart';
import 'package:gold_roundtables/features/calendar/data/services/upcoming_sessions_service_impl.dart';
import 'package:gold_roundtables/features/calendar/domain/models/upcoming_session.dart';
import 'package:gold_roundtables/features/calendar/domain/models/upcoming_sessions.dart';
import 'package:mocktail/mocktail.dart';

class _MockLocal extends Mock implements CalendarLocalDataSource {}

class _MockRemote extends Mock implements CalendarRemoteDataSource {}

class _FixedClock implements ClockService {
  @override
  DateTime nowUtc() => DateTime.utc(2026, 10, 26, 12);
}

UpcomingSessionRecord _record({
  String id = 's1',
  String status = 'scheduled',
  DateTime? at,
  String timezone = 'America/Santo_Domingo',
  DateTime? original,
}) => UpcomingSessionRecord(
  id: id,
  roundTableId: 't1',
  tableName: 'Mesa Esperanza 03',
  status: status,
  scheduledAt: at ?? DateTime.utc(2026, 10, 29, 23),
  timezone: timezone,
  originalScheduledAt: original,
  locationId: 'l1',
  locationName: 'Sede Central',
  facilitatorId: 'f1',
  facilitatorName: 'Sofía Herrera',
);

void main() {
  const facilitator = SessionContext(
    role: UserRole.facilitator,
    tableId: 't1',
    organizationId: 'org-1',
  );
  const coordinator = SessionContext(
    role: UserRole.coordinator,
    organizationId: 'org-1',
  );
  final now = DateTime.utc(2026, 10, 26, 12);

  late _MockLocal local;
  late _MockRemote remote;
  late UpcomingSessionsServiceImpl service;

  setUp(() {
    local = _MockLocal();
    remote = _MockRemote();
    service = UpcomingSessionsServiceImpl(
      local,
      remote,
      _FixedClock(),
      TableWallClock(),
    );
  });

  test(
    'a facilitator reads the local database, in the table timezone',
    () async {
      when(() => local.watchTable('t1', now: now)).thenAnswer(
        (_) =>
            Stream.value([_record(original: DateTime.utc(2026, 10, 28, 23))]),
      );

      final result = await service.watch(facilitator).first;

      expect(result.scope, UpcomingScope.facilitator);
      final session = result.sessions.single;
      expect(session.localStart, DateTime(2026, 10, 29, 19));
      expect(session.rescheduledFromLocal, DateTime(2026, 10, 28, 19));
      expect(session.state, UpcomingSessionState.scheduled);
      verifyNever(
        () => remote.fetch(
          now: any(named: 'now'),
          organizationId: any(named: 'organizationId'),
          tableId: any(named: 'tableId'),
        ),
      );
    },
  );

  test('a table that has not synced yet is read online', () async {
    when(
      () => local.watchTable('t1', now: now),
    ).thenAnswer((_) => Stream.value(const []));
    when(
      () => remote.fetch(now: now, tableId: 't1'),
    ).thenAnswer((_) async => [_record()]);

    final result = await service.watch(facilitator).first;
    expect(result.sessions, hasLength(1));
  });

  test(
    'offline with nothing synced shows an empty list, not an error',
    () async {
      when(
        () => local.watchTable('t1', now: now),
      ).thenAnswer((_) => Stream.value(const []));
      when(
        () => remote.fetch(now: now, tableId: 't1'),
      ).thenThrow(Exception('offline'));

      final result = await service.watch(facilitator).first;
      expect(result.sessions, isEmpty);
      expect(result.scope, UpcomingScope.facilitator);
    },
  );

  test('a failing local database falls back to the server', () async {
    when(
      () => local.watchTable('t1', now: now),
    ).thenAnswer((_) => Stream.error(StateError('no schema')));
    when(
      () => remote.fetch(now: now, tableId: 't1'),
    ).thenAnswer((_) async => [_record()]);

    final result = await service.watch(facilitator).first;
    expect(result.sessions, hasLength(1));
  });

  test(
    'managers get the server list sorted soonest first, with markers',
    () async {
      when(() => remote.fetch(now: now, organizationId: 'org-1')).thenAnswer(
        (_) async => [
          _record(id: 'later', at: DateTime.utc(2026, 11, 5, 23)),
          _record(
            id: 'cancelled',
            status: 'cancelled',
            at: DateTime.utc(2026, 10, 30, 1),
          ),
          _record(
            id: 'open',
            status: 'open',
            at: DateTime.utc(2026, 10, 27, 23),
          ),
          _record(
            id: 'madrid',
            timezone: 'Europe/Madrid',
            at: DateTime.utc(2026, 11, 2, 23),
          ),
        ],
      );

      final result = await service.watch(coordinator).first;

      expect(result.scope, UpcomingScope.manager);
      expect(result.sessions.map((s) => s.id), [
        'open',
        'cancelled',
        'madrid',
        'later',
      ]);
      expect(result.sessions[0].isOpen, isTrue);
      expect(result.sessions[1].isCancelled, isTrue);
      // 23:00Z on Nov 2 is already Nov 3, 00:00 in Madrid.
      expect(result.sessions[2].localStart, DateTime(2026, 11, 3));
    },
  );

  test('a manager failure surfaces as a stream error', () async {
    when(
      () => remote.fetch(now: now, organizationId: 'org-1'),
    ).thenThrow(Exception('boom'));
    expect(service.watch(coordinator), emitsError(isA<Exception>()));
  });

  test('a member has no calendar', () async {
    final result = await service
        .watch(const SessionContext(role: UserRole.member, tableId: 't1'))
        .first;
    expect(result.scope, UpcomingScope.unavailable);
  });
}
