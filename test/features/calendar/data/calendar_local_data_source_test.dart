import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/features/calendar/data/datasources/calendar_local_data_source.dart';

import '../../session/support/session_fixture.dart';
import '../../session/support/session_test_database.dart';

/// The facilitator's calendar read from a real PowerSync database.
void main() {
  late SessionTestDatabase db;
  late CalendarLocalDataSource source;
  final now = DateTime.utc(2026, 10, 26, 12);

  setUp(() async {
    db = await SessionTestDatabase.open();
    await SessionFixture.seed(db, asFacilitator: true);
    await db.seedSynced('locations', 'loc-central', {
      'organization_id': Ids.org,
      'name': 'Sede Central',
      'status': 'active',
    });
    await db.seedSynced('round_tables', Ids.table, {
      'organization_id': Ids.org,
      'location_id': 'loc-central',
      'name': 'Mesa Esperanza 03',
      'code': 'LUZ-03',
      'timezone': 'America/Santo_Domingo',
      'status': 'active',
    });
    source = CalendarLocalDataSource(db.sync);
  });

  tearDown(() => db.close());

  Future<void> seedSession(
    String id,
    String status,
    DateTime at, {
    String? kind,
    String? original,
    String? reason,
    String? archivedAt,
  }) => db.seedSynced('sessions', id, {
    'organization_id': Ids.org,
    'round_table_id': Ids.table,
    'status': status,
    'scheduled_at': at.toIso8601String(),
    'kind': kind ?? 'regular',
    'original_scheduled_at': original,
    'cancelled_reason': reason,
    'archived_at': archivedAt,
  });

  test('lists the pending session with table, place and facilitator', () async {
    final records = await source.watchTable(Ids.table, now: now).first;

    expect(records, hasLength(1));
    final record = records.single;
    expect(record.id, Ids.session);
    expect(record.status, 'scheduled');
    expect(record.scheduledAt, scheduledAt);
    expect(record.timezone, 'America/Santo_Domingo');
    expect(record.locationName, 'Sede Central');
    expect(record.facilitatorId, Ids.sofia);
    expect(record.facilitatorName, 'Sofía Herrera');
  });

  test('carries the extraordinary and rescheduled markers', () async {
    await db.sync.powerSync.execute('DELETE FROM ps_data__sessions');
    await seedSession(
      's-extra',
      'scheduled',
      DateTime.utc(2026, 10, 28, 23),
      kind: 'extraordinary',
      original: '2026-10-27T23:00:00.000Z',
    );
    final record = (await source.watchTable(Ids.table, now: now).first).single;

    expect(record.isExtraordinary, isTrue);
    expect(record.originalScheduledAt, DateTime.utc(2026, 10, 27, 23));
  });

  test(
    'lists a future cancelled meeting, not past, table-closed or archived ones',
    () async {
      await seedSession(
        'c-future',
        'cancelled',
        DateTime.utc(2026, 11, 5, 23),
        reason: 'Feriado',
      );
      await seedSession(
        'c-past',
        'cancelled',
        DateTime.utc(2026, 10, 20, 23),
        reason: 'Feriado',
      );
      await seedSession(
        'c-table',
        'cancelled',
        DateTime.utc(2026, 11, 12, 23),
        reason: 'table_closed',
      );
      await seedSession(
        'c-archived',
        'cancelled',
        DateTime.utc(2026, 11, 19, 23),
        reason: 'Feriado',
        archivedAt: '2026-10-25T00:00:00Z',
      );
      await seedSession('closed', 'closed', DateTime.utc(2026, 11, 26, 23));

      final records = await source.watchTable(Ids.table, now: now).first;

      expect(records.map((r) => r.id), [Ids.session, 'c-future']);
      expect(records.last.status, 'cancelled');
    },
  );

  test(
    'is empty for a table that has not synced and re-emits on change',
    () async {
      final emissions = <int>[];
      final subscription = source
          .watchTable('unknown', now: now)
          .listen((records) => emissions.add(records.length));
      await Future<void>.delayed(const Duration(milliseconds: 400));
      expect(emissions, [0]);

      final live = source.watchTable(Ids.table, now: now);
      final counts = <int>[];
      final liveSubscription = live.listen((r) => counts.add(r.length));
      await Future<void>.delayed(const Duration(milliseconds: 400));
      await seedSession('later', 'scheduled', DateTime.utc(2026, 11, 5, 23));
      await Future<void>.delayed(const Duration(milliseconds: 400));
      expect(counts.first, 1);
      expect(counts.last, 2);

      await subscription.cancel();
      await liveSubscription.cancel();
    },
  );
}
