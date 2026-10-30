import 'package:fake_async/fake_async.dart'; // ignore: depend_on_referenced_packages
import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/data/data_scope.dart';
import 'package:gold_roundtables/core/data/remote_watch.dart';
import 'package:gold_roundtables/core/models/user_role.dart';
import 'package:gold_roundtables/core/services/clock/clock_service.dart';
import 'package:gold_roundtables/core/services/session_context/session_context.dart';
import 'package:gold_roundtables/features/calendar/data/datasources/calendar_remote_data_source.dart';
import 'package:gold_roundtables/features/calendar/data/models/upcoming_session_record.dart';
import 'package:gold_roundtables/features/calendar/data/services/table_wall_clock.dart';
import 'package:gold_roundtables/features/calendar/data/services/upcoming_sessions_service_impl.dart';
import 'package:gold_roundtables/features/calendar/domain/models/upcoming_session.dart';
import 'package:gold_roundtables/features/calendar/domain/models/upcoming_sessions.dart';
import 'package:mocktail/mocktail.dart';

import '../../../core/data/support/online_data_stubs.dart';
import '../../support/spy_remote_watch.dart';

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

  late _MockRemote remote;
  late WatchHarness harness;
  late UpcomingSessionsServiceImpl service;

  setUp(() {
    remote = _MockRemote();
    harness = WatchHarness();
    service = UpcomingSessionsServiceImpl(
      remote,
      _FixedClock(),
      TableWallClock(),
      harness.watch,
    );
  });

  test('a facilitator reads the table in its own timezone', () async {
    when(() => remote.fetch(now: now, tableId: 't1')).thenAnswer(
      (_) async => [_record(original: DateTime.utc(2026, 10, 28, 23))],
    );

    final result = await service.watch(facilitator).first;

    expect(result.scope, UpcomingScope.facilitator);
    final session = result.sessions.single;
    expect(session.localStart, DateTime(2026, 10, 29, 19));
    expect(session.rescheduledFromLocal, DateTime(2026, 10, 28, 19));
    expect(session.state, UpcomingSessionState.scheduled);
  });

  test('a facilitator without a table has an empty calendar', () async {
    final result = await service
        .watch(const SessionContext(role: UserRole.facilitator))
        .first;

    expect(result.scope, UpcomingScope.facilitator);
    expect(result.sessions, isEmpty);
    verifyZeroInteractions(remote);
  });

  test('a facilitator failure surfaces as a stream error', () async {
    when(
      () => remote.fetch(now: now, tableId: 't1'),
    ).thenAnswer((_) => Future.error(Exception('offline')));

    await expectLater(service.watch(facilitator), emitsError(isA<Exception>()));
  });

  test('managers get the list sorted soonest first, with markers', () async {
    when(() => remote.fetch(now: now, organizationId: 'org-1')).thenAnswer(
      (_) async => [
        _record(id: 'later', at: DateTime.utc(2026, 11, 5, 23)),
        _record(
          id: 'cancelled',
          status: 'cancelled',
          at: DateTime.utc(2026, 10, 30, 1),
        ),
        _record(id: 'open', status: 'open', at: DateTime.utc(2026, 10, 27, 23)),
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
  });

  test('a manager failure surfaces as a stream error', () async {
    when(
      () => remote.fetch(now: now, organizationId: 'org-1'),
    ).thenAnswer((_) => Future.error(Exception('boom')));

    await expectLater(service.watch(coordinator), emitsError(isA<Exception>()));
  });

  group('refresh', () {
    Future<int> refreshesAfter(DataScope scope) async {
      var reads = 0;
      when(() => remote.fetch(now: now, tableId: 't1')).thenAnswer((_) async {
        reads++;
        return [_record()];
      });
      final sub = service.watch(facilitator).listen((_) {});
      await pumpEventQueue();
      harness.signal.notify(scope);
      await pumpEventQueue();
      await sub.cancel();
      return reads;
    }

    test('a schedule, session or admin change refetches', () async {
      for (final scope in [
        DataScope.calendar,
        DataScope.session,
        DataScope.admin,
      ]) {
        expect(await refreshesAfter(scope), 2, reason: '$scope');
      }
    });

    test('a history-only change does not', () async {
      expect(await refreshesAfter(DataScope.history), 1);
    });
  });

  group('polling', () {
    UpcomingSessionsServiceImpl withSpy(SpyRemoteWatch spy) =>
        UpcomingSessionsServiceImpl(
          remote,
          _FixedClock(),
          TableWallClock(),
          spy,
        );

    test('facilitator and manager calendars poll every 30 seconds', () {
      final spy = SpyRemoteWatch(harness.signal, harness.lifecycle);
      final polling = withSpy(spy);

      polling.watch(facilitator);
      polling.watch(coordinator);

      expect(spy.pollIntervals, [slowPollInterval, slowPollInterval]);
      expect(slowPollInterval, const Duration(seconds: 30));
    });

    test('a 30 second tick refetches other people\'s changes', () {
      fakeAsync((async) {
        var reads = 0;
        when(() => remote.fetch(now: now, tableId: 't1')).thenAnswer((_) async {
          reads++;
          return [_record()];
        });
        final sub = service.watch(facilitator).listen((_) {});
        async.flushMicrotasks();
        expect(reads, 1);

        async.elapse(slowPollInterval);
        expect(reads, 2);
        sub.cancel();
      });
    });
  });

  test('a member has no calendar', () async {
    final result = await service
        .watch(const SessionContext(role: UserRole.member, tableId: 't1'))
        .first;
    expect(result.scope, UpcomingScope.unavailable);
  });
}
