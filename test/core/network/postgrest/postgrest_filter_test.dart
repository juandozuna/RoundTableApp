import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/network/postgrest/postgrest.dart';

void main() {
  group('PostgrestFilter', () {
    test('builds comparison operators', () {
      expect(PostgrestFilter.eq('abc'), 'eq.abc');
      expect(PostgrestFilter.eq(7), 'eq.7');
      expect(PostgrestFilter.eq(true), 'eq.true');
      expect(PostgrestFilter.neq('closed'), 'neq.closed');
      expect(PostgrestFilter.gt(1), 'gt.1');
      expect(PostgrestFilter.gte(1), 'gte.1');
      expect(PostgrestFilter.lt(9), 'lt.9');
      expect(PostgrestFilter.lte(9), 'lte.9');
    });

    test('renders instants as UTC ISO-8601', () {
      final instant = DateTime.utc(2026, 10, 30, 14, 30);
      expect(PostgrestFilter.eq(instant), 'eq.2026-10-30T14:30:00.000Z');
      expect(PostgrestFilter.instant(instant), '2026-10-30T14:30:00.000Z');
    });

    test('builds null checks', () {
      expect(PostgrestFilter.isNull(), 'is.null');
      expect(PostgrestFilter.isNotNull(), 'not.is.null');
    });

    test('builds in lists', () {
      expect(PostgrestFilter.inList(['a', 'b', 'c']), 'in.(a,b,c)');
      expect(PostgrestFilter.inList(const <String>[]), 'in.()');
    });

    test('quotes list values holding reserved characters', () {
      expect(
        PostgrestFilter.inList(['a,b', 'c (d)', 'say "hi"']),
        r'in.("a,b","c (d)","say \"hi\"")',
      );
    });

    test('combines several filters on one column with and', () {
      expect(
        PostgrestFilter.and([
          (PostgrestColumns.scheduledAt, PostgrestFilter.gte('x')),
          (PostgrestColumns.scheduledAt, PostgrestFilter.lt('y')),
        ]),
        '(scheduled_at.gte.x,scheduled_at.lt.y)',
      );
    });
  });

  group('PostgrestQuery.of', () {
    test('assembles filters, select, order, limit and offset', () {
      final query = PostgrestQuery.of(
        filters: {
          PostgrestColumns.roundTableId: PostgrestFilter.eq('t1'),
          PostgrestColumns.archivedAt: PostgrestFilter.isNull(),
        },
        select: '*',
        order: [
          PostgrestOrder.desc(PostgrestColumns.scheduledAt),
          PostgrestOrder.asc(PostgrestColumns.id),
        ],
        limit: 20,
        offset: 40,
      );

      expect(query, {
        'round_table_id': 'eq.t1',
        'archived_at': 'is.null',
        'select': '*',
        'order': 'scheduled_at.desc,id.asc',
        'limit': '20',
        'offset': '40',
      });
    });

    test('omits the parameters that are not given', () {
      expect(PostgrestQuery.of(), isEmpty);
      expect(PostgrestQuery.of(select: 'id'), {'select': 'id'});
    });
  });
}
