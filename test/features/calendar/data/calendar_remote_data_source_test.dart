import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/models/session_status.dart';
import 'package:gold_roundtables/core/models/user_role.dart';
import 'package:gold_roundtables/core/network/postgrest/postgrest.dart';
import 'package:gold_roundtables/features/calendar/data/datasources/calendar_remote_data_source.dart';

import '../../../core/data/support/record_builders.dart';
import '../../../core/data/support/recording_table_reads_client.dart';

/// The calendar's upcoming sessions as built from server rows.
void main() {
  final now = DateTime.utc(2026, 10, 26, 12);

  late RecordingTableReadsClient client;
  late CalendarRemoteDataSource source;

  setUp(() {
    client = RecordingTableReadsClient()
      ..seed(PostgrestTables.roundTables, [RecordBuilders.table()])
      ..seed(PostgrestTables.locations, [RecordBuilders.location()])
      ..seed(PostgrestTables.tableMembers, [
        RecordBuilders.member(
          'f1',
          first: 'Sofía',
          last: 'Herrera',
          role: UserRole.facilitator,
        ),
      ])
      ..seed(PostgrestTables.sessions, [
        RecordBuilders.session(
          's1',
          status: SessionStatus.scheduled,
          at: DateTime.utc(2026, 10, 29, 23),
        ),
      ]);
    source = CalendarRemoteDataSource(client);
  });

  test('asks for the active tables of the organization, current rows '
      'only', () async {
    await source.fetch(now: now, organizationId: 'org-1');

    final tables = client.readsOf(PostgrestTables.roundTables).single;
    expect(tables.filter(PostgrestColumns.status), 'eq.active');
    expect(tables.filter(PostgrestColumns.organizationId), 'eq.org-1');
    expect(tables.filter(PostgrestColumns.id), isNull);
    final locations = client.readsOf(PostgrestTables.locations).single;
    expect(locations.filter(PostgrestColumns.organizationId), 'eq.org-1');
    final facilitators = client.readsOf(PostgrestTables.tableMembers).single;
    expect(facilitators.filter(PostgrestColumns.organizationId), 'eq.org-1');
    expect(facilitators.filter(PostgrestColumns.role), 'eq.facilitator');
    expect(facilitators.filter(PostgrestColumns.status), 'eq.active');
    for (final read in client.readsOf(PostgrestTables.sessions)) {
      expect(read.filter(PostgrestColumns.organizationId), 'eq.org-1');
      expect(read.filter(PostgrestColumns.archivedAt), 'is.null');
    }
  });

  test('pending and cancelled sessions are separate reads', () async {
    await source.fetch(now: now, organizationId: 'org-1');

    final reads = client.readsOf(PostgrestTables.sessions);
    expect(reads, hasLength(2));
    expect(reads[0].filter(PostgrestColumns.status), 'in.(scheduled,open)');
    expect(reads[0].filter(PostgrestColumns.scheduledAt), isNull);
    expect(reads[1].filter(PostgrestColumns.status), 'eq.cancelled');
    expect(
      reads[1].filter(PostgrestColumns.scheduledAt),
      'gte.2026-10-26T12:00:00.000Z',
    );
  });

  test('narrows every read to one table', () async {
    await source.fetch(now: now, tableId: 'table-1');

    expect(
      client
          .readsOf(PostgrestTables.roundTables)
          .single
          .filter(PostgrestColumns.id),
      'eq.table-1',
    );
    expect(
      client
          .readsOf(PostgrestTables.tableMembers)
          .single
          .filter(PostgrestColumns.roundTableId),
      'eq.table-1',
    );
    for (final read in client.readsOf(PostgrestTables.sessions)) {
      expect(read.filter(PostgrestColumns.roundTableId), 'eq.table-1');
    }
    expect(
      client
          .readsOf(PostgrestTables.locations)
          .single
          .filter(PostgrestColumns.id),
      'in.(loc-1)',
    );
  });

  test('five reads per refresh, none when there is no active table', () async {
    await source.fetch(now: now, organizationId: 'org-1');
    expect(client.reads, hasLength(5));

    client
      ..reads.clear()
      ..seed(PostgrestTables.roundTables, const []);
    expect(await source.fetch(now: now, organizationId: 'org-1'), isEmpty);
    expect(client.reads, hasLength(1));
  });

  test('maps a pending session with its table, location and facilitator '
      'and markers', () async {
    client.seed(PostgrestTables.sessions, [
      RecordBuilders.session(
        's1',
        status: SessionStatus.open,
        at: DateTime.utc(2026, 10, 29, 23),
        kind: 'extraordinary',
        originalAt: DateTime.utc(2026, 10, 28, 23),
      ),
    ]);

    final record = (await source.fetch(now: now, tableId: 'table-1')).single;

    expect(record.id, 's1');
    expect(record.roundTableId, 'table-1');
    expect(record.tableName, 'Mesa Esperanza 03');
    expect(record.status, 'open');
    expect(record.scheduledAt, DateTime.utc(2026, 10, 29, 23));
    expect(record.timezone, 'America/Santo_Domingo');
    expect(record.isExtraordinary, isTrue);
    expect(record.originalScheduledAt, DateTime.utc(2026, 10, 28, 23));
    expect(record.locationId, 'loc-1');
    expect(record.locationName, 'Sede Central');
    expect(record.facilitatorId, 'f1');
    expect(record.facilitatorName, 'Sofía Herrera');
  });

  test('a table without an active facilitator has no facilitator', () async {
    client.seed(PostgrestTables.tableMembers, const []);

    final record = (await source.fetch(now: now, tableId: 'table-1')).single;

    expect(record.facilitatorId, isNull);
    expect(record.facilitatorName, isNull);
  });

  test('sessions of tables that are not active are not listed', () async {
    client.seed(PostgrestTables.sessions, [
      RecordBuilders.session(
        'other',
        status: SessionStatus.scheduled,
        at: DateTime.utc(2026, 10, 30, 23),
        tableId: 'table-closed',
      ),
    ]);

    expect(await source.fetch(now: now, organizationId: 'org-1'), isEmpty);
  });

  test('lists cancelled meetings but not those of a closed table', () async {
    // The fake serves the same rows to both session reads, so only the
    // cancelled ones are seeded here and the pending read returns them too;
    // what matters is the table-closure filter.
    client.seed(PostgrestTables.sessions, [
      RecordBuilders.session(
        'c1',
        status: SessionStatus.cancelled,
        at: DateTime.utc(2026, 11, 5, 23),
        cancelledReason: 'Feriado',
      ),
      RecordBuilders.session(
        'c2',
        status: SessionStatus.cancelled,
        at: DateTime.utc(2026, 11, 12, 23),
        cancelledReason: 'table_closed',
      ),
    ]);

    final records = await source.fetch(now: now, tableId: 'table-1');

    expect(records.map((r) => r.id), everyElement('c1'));
    expect(records.every((r) => r.status == 'cancelled'), isTrue);
  });
}
