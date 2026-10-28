import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/features/calendar/domain/models/upcoming_filter.dart';
import 'package:gold_roundtables/features/calendar/domain/models/upcoming_sessions.dart';

import '../support/calendar_fixtures.dart';

void main() {
  final central = upcomingSession(id: 'a');
  final norte = upcomingSession(
    id: 'b',
    tableId: 't2',
    tableName: 'Mesa Norte',
    locationId: 'l2',
    locationName: 'Sede Norte',
    facilitatorId: 'f2',
    facilitatorName: 'Pedro Paz',
  );
  final unled = upcomingSession(
    id: 'c',
    tableId: 't3',
    tableName: 'Mesa Sin Líder',
    facilitatorId: null,
    facilitatorName: null,
  );
  final all = [central, norte, unled];

  group('UpcomingFilter', () {
    test('an empty filter keeps every session and is inactive', () {
      const filter = UpcomingFilter();
      expect(filter.isActive, isFalse);
      expect(filter.apply(all), all);
    });

    test('filters by location, facilitator and table, combined with AND', () {
      expect(
        const UpcomingFilter(locationId: 'l2').apply(all).map((s) => s.id),
        ['b'],
      );
      expect(
        const UpcomingFilter(facilitatorId: 'f1').apply(all).map((s) => s.id),
        ['a'],
      );
      expect(
        const UpcomingFilter(roundTableId: 't3').apply(all).map((s) => s.id),
        ['c'],
      );
      expect(
        const UpcomingFilter(locationId: 'l1', facilitatorId: 'f2').apply(all),
        isEmpty,
      );
    });
  });

  group('UpcomingSessions options', () {
    final sessions = UpcomingSessions(
      scope: UpcomingScope.manager,
      sessions: [norte, central, unled],
    );

    test('are distinct, labelled and sorted by name', () {
      expect(sessions.locations.map((o) => o.label), [
        'Sede Central',
        'Sede Norte',
      ]);
      expect(sessions.tables.map((o) => o.label), [
        'Mesa Esperanza 03',
        'Mesa Norte',
        'Mesa Sin Líder',
      ]);
    });

    test('skip sessions without a facilitator', () {
      expect(sessions.facilitators.map((o) => o.id), ['f2', 'f1']);
    });

    test('only managers can filter', () {
      expect(sessions.canFilter, isTrue);
      expect(
        const UpcomingSessions(scope: UpcomingScope.facilitator).canFilter,
        isFalse,
      );
    });
  });
}
